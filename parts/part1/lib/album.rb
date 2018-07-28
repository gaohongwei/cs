require_relative './string_tool.rb'

class Album
  def self.print_out(options)
    new(options).print_out
  end
  def initialize(options)
    @options = options
    @fname = options[:file]
    @albums = []
  end

  def print_out
    return 1 unless check_file == 0
    return 1 unless parse_file == 0
    sorted = @options[:asc] ? @albums.sort { |x,y| x[:seconds] <=> y[:seconds] } : @albums.sort { |x,y| y[:seconds] <=> x[:seconds] }
    pivot_type = @options[:pivot]

    len = sorted.size
    total_time = sorted.inject(0){|sum,x| sum + x[:seconds]}
    average = total_time/len
    median_points = len.odd? ? [len/2] : [(len-1)/2, len/2]
    median = median_points.size < 2 ? sorted[median_points[0]][:seconds] : ( sorted[median_points[0]][:seconds] + sorted[median_points[1]][:seconds])/2

    pivot = nil
    case pivot_type
    when 'median'
      pivot = median
    when 'average'
      pivot = average
    when 'none'
      pivot = nil
    else
      pivot = median
      pivot_type = 'median'
    end

    selected = pivot.nil? ? sorted : sorted.select{|x| x[:seconds] <= pivot}

    count = selected.size

    if @options[:header]
      puts "\n=========== Meta Data ============"
      puts "Total length: #{total_time.pretty_duration}, i.e #{total_time} seconds"
      puts "Total count: #{len}"
      puts "Selected Counts: #{count}"
      puts "Median index: #{median_points}"
      puts "Median: #{median.pretty_duration}, i.e #{median} seconds"
      puts "Average: #{average.pretty_duration}, i.e #{average} seconds"
      if pivot.nil?
        puts "\n=========== All data is selected in #{@options[:asc] ? 'asc' : 'desc'} order ==========="
      else
        puts "Pivot: #{pivot_type}(#{pivot}) "
        puts "\nSongs less than or equal to the #{pivot_type}(#{pivot}) song in terms of length"
        puts "=========== Selected songs in #{@options[:asc] ? 'asc' : 'desc'} order ============"
      end
    end

    selected.each_with_index do |album,index|
      puts "#{index+1}. #{album[:artist]} - #{album[:album]} - #{album[:year]} - #{album[:song]} - #{album[:elapse]}"
    end
    selected_total = selected.inject(0){|sum,x| sum + x[:seconds]}
    puts "Total Time: #{selected_total.pretty_duration}"
    puts "\nDone!\n".green if @options[:header]
    0
  end
  def check_file
    unless @fname
      puts "\nError: \nPlease specify a data file name".red
      return 1
    end
    unless File.exist?(@fname)
      puts "\nError: \nFile '#{@fname}' does not exist".red
      return 1
    end
    0
  end
  def parse_file
    line_no = 0
    error_lines =[]
    artist, album, year = '', '', ''
    File.open(@fname, "r") do |f|
      f.each_line do |line|
        line_no += 1
        line.chomp!
        next if line.empty?
        next if line.start_with?("#")
        if match = line.match(%r{\A(.+)\s*/(.+)\s*/\s*(\d{4})\s*\z})
          artist, album, year = match.captures
        elsif match = line.match(%r{\A(.*)-\s*(\d{1,2}:\d{1,2})\s*\z})
          song, elapse = match.captures
          #puts "#{artist}, #{album}, #{year}, #{song}, #{elapse}"
          @albums << {
            artist: artist.strip,
            album: album.strip,
            year: year.strip,
            song: song.strip,
            elapse: elapse,
            seconds: elapse.to_second
          }
        else
          error_lines << "line #{line_no}: #{line}"
        end
      end
    end
    unless error_lines.size < 1
      puts 'Process Stopped.'.red
      puts 'Data format errors:'.red
      puts error_lines.join("\n").red
      return 1
    end
    return 0
  end
end

