#!/usr/bin/ruby
require 'rubygems'
require 'trollop'
require 'fileutils'


######################################################################
# Menu options and program flow
######################################################################
opts = Trollop::options do    
    opt :scan_dir, 'The directory to scan.',
        :short => 's', :type => String
        
    opt :colorize, 'Colorizes output',
        :short => 'c'
        
    opt :config_file, 'Path to the config file',
        :short => 'o'
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
# If a configuration file was specified, load it. Otherwise, load the 
# defaults.
if opts[:config_file_given]
	if File.exists? opts[:config_file]
		require opts[:config_file]
	end
else
	payloads = %w[
		assert\(		base64_decode\(		base64_encode\(		create_function\(
		curl_exec\(		curl_init\(			eval\(				exec\(
		fclose\(		file\(				file_get_contents\(	file_put_contents\(
		fopen\(			fread\(				fsockopen\(			include\(
		include_once\(	mail\(				ob_get_contents\(	passthru\(
		pfsockopen\(	popen\(				proc_open\(			readfile\(
		require\(		require_once\(		shell_exec\(		system\(
		unserialize\(	`
		
		\$_GET		\$_POST		\$_SESSION
		\$_SERVER	\$_COOKIE	\$_REQUEST
		\$GLOBALS	\$_FILES
	]
end

# verify that the directory to scan actually exists
unless File.exists? opts[:scan_dir]
	puts 'The specified directory to scan does not exist.'
	exit
end


######################################################################
# Start the scan
######################################################################
puts 'Scanning...'
# search the target directories for the payloads
payloads.each do | payload |
    # suppress ack's own color usage unless --colorize was specified
    if opts[:colorize_given]
		result = `cd #{opts[:scan_dir]}; ack-grep '#{payload}' --color`
    else
		result = `cd #{opts[:scan_dir]}; ack-grep '#{payload}' --nocolor`
    end
    
    # display the matches
	unless result.strip.empty?
		puts " -- Searching for: #{payload}".colorize( :cyan )

		# iterate over the ack results
        result.each_line do | line | 
            # parse the result string into components
            first_colon_pos  = line.index(':')
            second_colon_pos = line.index(':', first_colon_pos + 1)
            
            # parse out the important information
            file_name        = line.slice(0..(first_colon_pos - 1)) 
            line_num         = line.slice((first_colon_pos + 1)..(second_colon_pos - 1)) 
            snippet          = line.slice((second_colon_pos +1), line.length).strip

            # output the scandata
			puts file_name.colorize( :cyan ) + " (" + line_num.colorize( :yellow ) + ")"
			puts snippet + "\n\n" 
        end
        puts "\n\n"
	end
end
