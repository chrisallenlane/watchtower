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
        
    opt :colorize, 'Colorizes output',
        :short 		=> 'c'
        
    opt :config_file, 'Path to the config file',
        :type 		=> :string,
        :required 	=> :true,
        :short 		=> 'o'
end

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
#for performance
if opts[:colorize_given] 
	vulnscanner.points_of_interest.each do |point| puts point.colorize + "\n\n"	end
else
	vulnscanner.points_of_interest.each do |point| puts point + "\n\n"end
end
