require_relative "./data_service"
require_relative "./common_data"
require_relative "./sorted_array"
require 'byebug'


class QuakeData
  include CommonData
  attr_reader :features, :metadata, :bbox, :type

  URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'
  SELECTED_PROPERTIES = %w(mag place time)

  def self.print_out(condition)
    new.print_out(condition)
  end
  def initialize
    # We may use redis here for caching    
    response = DataService.new(URL).retrieve_data
    @status = response[:status]
    @errors = response[:errors]

    @type = response[:data]["type"]
    @metadata = response[:data]["metadata"]
    @features = response[:data]["features"]
    @bbox = response[:data]["bbox"]
    @list = nil
  end

  def selected_by_state(state_name=nil)
    @list ||= get_selected_by_state(state_name)
  end  

  def get_selected_by_state(state_name)
    selected_data = []
    @features.each do |feature|
      one_data ={}
      SELECTED_PROPERTIES.each do |key|
        one_data[key] = feature["properties"][key]       
      end
      address = feature["properties"]['place']
      one_data['state'] = get_state(address)      
      next unless in_state?(address, state_name)
      time = one_data['time'] 
      one_data['time'] = Time.at(time.to_f / 1000) unless time.nil?

      selected_data << one_data
    end
    selected_data
  end

  def print_out(condition)
    top_number = condition[:top].to_i
    selected_data = selected_by_state(condition[:state]).select{|item|item["mag"]}
    sorting_engine = SortedArray.new{|x,y| x["mag"] <=> y["mag"] }
    sorted_data = sorting_engine.max_n(selected_data, top_number)
    puts "MAG\tTIME\t\t\t\tPLACE"
    sorted_data.each do |item|
      puts "#{item['mag']}\t#{item['time']}\t#{item['place']}"
    end
  end
end