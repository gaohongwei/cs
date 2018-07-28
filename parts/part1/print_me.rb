#!/usr/bin/env ruby
require_relative './lib/album.rb'

require 'optparse'

def print_file_format
  puts "\nData file format:"
  puts(<<-EOT)
    <Artist> / <Album> / <Year>
    <Song 1> - <Song 1 length in m:ss>
    <Song 2> - <Song 2 length in m:ss>
    ...
    <Song N> - <Song N length in m:ss>

    <Artist> / <Album> / <Year>
    <Song 1> - <Song 1 length in m:ss>
    <Song 2> - <Song 2 length in m:ss>
    ...
    <Song N> - <Song N length in m:ss>

    <Artist> / <Album> / <Year>
    <Song 1> - <Song 1 length in m:ss>
    <Song 2> - <Song 2 length in m:ss>
    ...
    <Song N> - <Song N length in m:ss>
  EOT
end

def normalize(options)
  options[:header] ||= 'off'
  options[:sort] ||= 'asc'
  options[:pivot] ||= 'median'
  options[:header] = %w(on yes).include?(options[:header].downcase)
  options[:asc] = %w(asc).include?(options[:sort].downcase)
  options[:pivot] = options[:pivot].downcase
  options
end
options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "\nUsage: print_album [Arguments]"
  opt.separator  ""
  opt.separator  "Arguments:"

  opt.on("-f","--file file name","The input file name, required") do |value|
    options[:file] = value
  end

  opt.on("-p","--pivot pivot","The pivot point: average|median|none, default: median") do |value|
    options[:pivot] = value
  end

  opt.on("-s","--sort asc|desc","The sort order, default: asc") do |value|
    options[:sort] = value
  end

  opt.on("-H","--header [on|off]","Print the header or not, default: off") do |value|
    options[:header] = value
  end

  opt.on("-h","--help","help") do
    puts opt_parser
    print_file_format
    exit 0
  end
end

begin
  opt_parser.parse!
  if options.empty?
    puts opt_parser
    exit 0
  end
  if options[:file].nil?
    puts "\nError: \nFile name not defined".red
    puts opt_parser
    exit 1
  end
  exit Album.print_out(normalize(options))
rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
  puts "\nError:".red
  puts e.to_s.red
  puts opt_parser
  exit 1
end

