#!/usr/bin/env ruby
#######################################################################
# webapp-vulnscan - a webapp-vulnscanner, obviously
#
# Chris Lane
# chris@chris-allen-lane.com
# http://chris-allen-lane.com
# http://twitter.com/chrisallenlane
#######################################################################

require 'rubygems'		# is this bad?
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
			'"html", "txt", "xml"',
			:default	=> 'txt',
			:short 		=> 'o'

	opt :colorize, 'Colorizes command-line output',
			:short 		=> 'c'

	opt :config_file, 'Path to the config file.',
			:type 		=> :string,
			:default	=> './config.rb',
			:short 		=> 'f'
			
	# report name?
end
	

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
# sort the payload hashes here?

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
if opts[:colorize_given] and opts[:output_format].eql? 'txt'
	require 'colorize' 
	vulnscanner.points_of_interest.each {|point| point.colorize}
end

# output in the requested format
case opts[:output_format]
	when 'csv'
		vulnscanner.points_of_interest.each {|point| puts point.csv}
		
	when 'html'
		require 'erb'
		include ERB::Util
		require 'digest'
		
		# pass page variables into the erb
		dochead = {
			:stylesheet_1 => File.read('./views/jquery-ui-1.8.19.custom.css'),
			:stylesheet_2 => File.read('./views/main.css'),
			#:jquery       = File.read('./views/report.html.erb'),
			#:jquery_ui    = File.read('./views/report.html.erb'),
		}

		erb = ERB.new(File.read('./views/report.html.erb'), 0, '<>', 'buffer')
		puts erb.result(binding)
	
	when 'xml'
		puts '<points_of_interest>'
		vulnscanner.points_of_interest.each {|point| puts point.xml}
		puts '</points_of_interest>'
	
	else
		vulnscanner.points_of_interest.each {|point| puts point + "\n\n"}
end
