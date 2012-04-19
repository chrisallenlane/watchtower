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

	opt :output_format, 'Specify the output format. Default "text" VALID ARE ...',
        :short 		=> 'r'

	opt :project_name, 'Specify the title for the report',
        :short 		=> 'p'
        
    opt :colorize, 'Colorizes command-line output',
        :short 		=> 'c'
        
    opt :config_file, 'Path to the config file',
        :type 		=> :string,
        :required 	=> :true,
        :short 		=> 'o'
end

# support exporting to html, xml, yaml, csv, text, json

# only include the colorize gem if it is required
require 'colorize' if opts[:colorize_given]
	

#######################################################################
# Config and Payloads
#######################################################################
# Load the configuration file
unless File.exists? opts[:config_file]
	puts 'The specified config file does not exist.'
	exit
end
require opts[:config_file]

# Verify that the directory to scan actually exists
unless File.exists? opts[:scan_dir]
	puts 'The specified directory to scan does not exist.'
	exit
end


#######################################################################
# Start the scan
#######################################################################
vulnscanner = VulnScanner.new({:payloads => $payloads, :scan_dir => opts[:scan_dir]})
vulnscanner.scan

# Display the output. Leave the conditional `if` outside the loop
# for performance
if opts[:colorize_given] 
	vulnscanner.points_of_interest.each {|point| puts point.colorize + "\n\n"} 
else
	vulnscanner.points_of_interest.each {|point| puts point + "\n\n"}
end
