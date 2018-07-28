require 'optparse'
require 'ostruct'

require_relative "./common_data"

class Argument
  STATE_FULL_NAME_OPTIONS = CommonData::STATES.map{|k,v|"--" + v.downcase}
  STATE_SHORT_NAME_OPTIONS = CommonData::STATES.map{|k,v|"--" + k} +  
    CommonData::STATES.map{|k,v|"--" + k.downcase}  


  # Normalize the arguments
  # --top5 => --top 5
  # --california => --state california
  def self.normalize(argv)
    args =[]
    argv.each do |arg|
      case arg
      when *STATE_FULL_NAME_OPTIONS # california => California
        words = arg[2..-1].split(' ')
        state = words.map{|word|word.capitalize}.join(' ')
        args << '--state'  
        args << state
      when *STATE_SHORT_NAME_OPTIONS # ca, CA => CA
        state_abbrevation = arg[2..-1].upcase
        args << '--state'  
        args << state_abbrevation
      else
        parts = arg.match(/^--top(\d+)$/)
        if parts
          args << '--top'
          args << parts[1]
        else
          args << arg
        end
      end
    end
    args
  end

  #
  # Return a structure describing the options.
  #  
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.top = 25

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: quakes [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("--top", "--top [number]; or --top[number]", "Top number, default: 25") do |top|
        options.top = top unless top.nil?
      end

      opts.on("--state", "--state [name]; or --state_name", "State Name, default: all state") do |state|
        options.state = state
      end

      opts.separator ""
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts    
        exit
      end
    end

    begin
      opt_parser.parse!(normalize(args))
      options
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
      puts "\nError:".red
      puts e.to_s.red
      puts opt_parser
      exit 1
    end    
  end  # parse()
end  # class Argument