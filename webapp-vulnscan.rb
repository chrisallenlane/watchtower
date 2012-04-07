#!/usr/bin/ruby
require 'rubygems'
require 'trollop'
require 'fileutils'
require 'shellwords'
require 'models/poi'
require 'models/vulnscanner'


######################################################################
# Menu options and program flow
######################################################################
opts = Trollop::options do    
    opt :scan_dir, 'The directory to scan',
        :short => 's',
        :type => :string
        
    opt :colorize, 'Colorizes output',
        :short => 'c'
        
    opt :config_file, 'Path to the config file',
        :short => 'o',
        :type => :string
end

# If --colorize was specified, include the colorize gem. Otherwise,
# monkey-patch String.colorize so that it does nothing. This will save
# us from having to do some tedious if/else switching further down in
# the program
if opts[:colorize_given]
	require 'colorize'
else
	class String
		def colorize params
			return self
		end
	end
end


######################################################################
# Config and Payloads
######################################################################
# If a configuration file was specified, load it. Otherwise, load some
# sensible defaults.
if opts[:config_file_given]
	if File.exists? opts[:config_file]
		require opts[:config_file]
	end
else
	puts 'The specified config file does not exist.'
	exit
end

# verify that the directory to scan actually exists
unless File.exists? opts[:scan_dir]
	puts 'The specified directory to scan does not exist.'
	exit
end


######################################################################
# Start the scan
######################################################################
vulnscanner = VulnScanner.new({:payloads => $payloads,:scan_dir	=> opts[:scan_dir]})
vulnscanner.scan

# display the output
vulnscanner.points_of_interest.each do |point|
	puts point.get(true) + "\n\n"
end
