#!/usr/bin/env ruby
#######################################################################
# webapp-vulnscan - a webapp-vulnscanner, obviously
#
# Chris Lane
# chris@chris-allen-lane.com
# http://chris-allen-lane.com
# http://twitter.com/chrisallenlane
#######################################################################

require 'rubygems'
require 'trollop'
require 'fileutils'
require 'shellwords'
require 'models/poi'
require 'models/vulnscanner'


#######################################################################
# Menu options and program flow
#######################################################################
opts = Trollop::options do    
	opt :scan_dir, 'The directory to scan',
			:type 		=> :string,
			:required	=> :true,
			:short 		=> 's'

	opt :output_format, 'Specify the output format. Valid options are "csv", ' + 
			'"html", "json", "txt", "xml", "yaml"',
			:default	=> 'txt',
			:short 		=> 'o'

	opt :colorize, 'Colorizes command-line output',
			:short 		=> 'c'

	opt :config_file, 'Path to the config file.',
			:type 		=> :string,
			:default	=> './config.rb',
			:short 		=> 'f'
end

# support exporting to html, xml, yaml, csv, text, json

# only include the colorize gem if it is required
require 'colorize' if opts[:colorize_given]
	

#######################################################################
# Config and Payloads
#######################################################################
# Load the configuration file
unless File.exists? opts[:config_file]
	warn 'The specified config file does not exist.'
	exit
end
require opts[:config_file]

# Verify that the directory to scan actually exists
unless File.exists? opts[:scan_dir]
	warn 'The specified directory to scan does not exist.'
	exit
end


#######################################################################
# Scan
#######################################################################
vulnscanner = VulnScanner.new({:payloads => $payloads, :scan_dir => opts[:scan_dir]})
vulnscanner.scan

#puts $payloads.to_yaml
#exit


#######################################################################
# Display
#######################################################################
# If color was requested, colorize all of the points. It's probably a bit
# less efficient to make another pass through the loop just to do this, 
# but I'm happy to spend a bit of Moore's dividend here to keep the code
# cleaner. (We would need to do some irritating branching later
# on otherwise.)
vulnscanner.points_of_interest.each {|point| point.colorize} if opts[:colorize_given]

case opts[:output_format]
	when 'csv'
		vulnscanner.points_of_interest.each {|point| puts point.csv}
	when 'html'
		# load a view here
	when 'json'
		vulnscanner.points_of_interest.each {|point| puts point.json}
	when 'xml'
		puts '<points_of_interest>'
		vulnscanner.points_of_interest.each {|point| puts point.xml}
		puts '</points_of_interest>'
	when 'yaml'
		puts 'points_of_interest:'
		vulnscanner.points_of_interest.each {|point| puts point.yaml}
	else
		vulnscanner.points_of_interest.each {|point| puts point + "\n\n"}
end
