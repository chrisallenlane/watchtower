# This class encapsulates the main functionality of the application -
# the scanning of a codebase for potential points of interest as specified
# in the user-provided signatures.
class VulnScanner

	attr_accessor :signatures, :points_of_interest, :points_of_interest_sorted, :scan_dir, :before_context, :after_context
	
	# Initializes the VulnScanner instance. Accepts a hash containing
	# the following keys:
	#
	# <tt>:signatures</tt>:: A hash of signature strings for which to scan
	# <tt>:scan_dir</tt>  :: The project directory to scan
	#
	# Usage:
	#	data = {
	#		:signatures     => signatures,
	#		:scan_dir       => '/path/to/scan',
	#		:before_context => 1,
	#		:after_context  => 1,
	#	}
	#
	def initialize data
		@signatures	                = data[:signatures]
		@scan_dir 	                = data[:scan_dir]
		@before_context				= data[:before_context]
		@after_context				= data[:after_context]
		@points_of_interest         = []
		@points_of_interest_sorted  = {}
	end
	
	# Performs a scan against the specified project directory.
	#
	# Usage:
	#	vulnscanner.scan
	#
	def scan
		@signatures.each do |file_type, signature_groups|
			# cast the file_type symbol into a string
			ftype = file_type.to_s	
			# iterate over the signature groups
			signature_groups.each do |signature_group, signatures|
			
				# iterate over each signature
				signatures.each do |signature|				
					# assemble a list of directories to ignore
					exclude_files = ''
					unless $configs[:exclude_files].empty?
						$configs[:exclude_files].each do |file|
							exclude_files += " --exclude='#{file}'"
						end
					end
					
                    # assemble a list of directories to ignore
					exclude_dirs = ''
					unless $configs[:exclude_dirs].empty?
						$configs[:exclude_dirs].each do |dir|
							exclude_dirs += " --exclude-dir='#{dir}'"
						end
					end
                    
                    # map filetypes to possible file extensions
                    include_filetypes = ''
                    $configs[:ftype_ext][file_type].each do |ext|
                        include_filetypes += " --include='*.#{ext}'"
                    end
                    
                    # build the --before-context and --after-context flags
                    bc = " -B #{@before_context}"
                    ac = " -A #{@after_context}"
                    
					# do a grep scan
					if signature.regex.to_s.empty?
						result          = `cd #{@scan_dir}; grep -RHnZ #{bc} #{ac} '#{signature.literal.chomp}' #{include_filetypes} #{exclude_files} #{exclude_dirs} .`
						match    = signature.literal
					else
						result          = `cd #{@scan_dir}; grep -ERHnZ #{bc} #{ac} '#{signature.regex.chomp}' #{include_filetypes} #{exclude_files} #{exclude_dirs} .`
						match    = nil
					end
                    
					# display the matches
					unless result.strip.empty?
                        # parse the grep output into blocks
                        grep_blocks = result.split(/^--$/)
                        
						## iterate over the grep results
						grep_blocks.each do |grep_block|                         
                            # Discard the first (empty) line.
                            # See: http://stackoverflow.com/questions/1469986/how-do-i-remove-the-first-n-lines-from-a-string-in-ruby
                            grep_block = grep_block.to_a[1..-1].join
                            
                            # buffer the grep data in a hash until the context
                            # lines have been parsed out proerly
                            block_data = {
                                :file_type   => ftype,
                                :file        => nil,
                                :line_number => nil,
                                :match       => match,
                                :name	     => signature.name || signature.literal,
                                :snippet     => '',
                                :group		 => signature_group.to_s,
                            }
                            						
                            # parse out the block metadata
							filename_terminator_pos         = grep_block.index(?\x00)
                            line_number_terminator_position = grep_block.index(grep_block.match(/[:\-]+/).to_s)
                            block_data[:file]               = grep_block.slice(0..(filename_terminator_pos - 1)) if block_data[:file].nil?
                            block_data[:line_number]        = grep_block.slice((filename_terminator_pos + 1)..(line_number_terminator_position - 1)) if block_data[:line_number].nil?
                            
                            # now iterate over each line, removing filenames
                            grep_block.each_line do |grep_line|
                                block_data[:snippet] += grep_line.gsub!(block_data[:file], '')
                                
                            end
                            
                            # parse out the match if a regex was specified
                            if block_data[:match].to_s.empty?
                                block_data[:match] = block_data[:snippet].match(signature.regex)
                            end
                            
                            # create a new PoI object based on block_data{}
                            @points_of_interest.push(PoI.new(block_data))
                        end
					end
				end	
			end
		end		
	end
	
    
    
    
	# Sorts the vulnscanner results into the format expected by the 
	# HTML report. May only be invoked after performing a scan.
	#
	# Usage:
	#	vulnscanner.scan
	#	vulnscanner.sort
	#
	def sort
		@points_of_interest.each_with_index do |point, index|
			@points_of_interest_sorted[point.file_type.to_sym] ||= {}
			@points_of_interest_sorted[point.file_type.to_sym][point.group.to_sym] ||= {}
			@points_of_interest_sorted[point.file_type.to_sym][point.group.to_sym][point.name.to_sym] ||= []
			@points_of_interest_sorted[point.file_type.to_sym][point.group.to_sym][point.name.to_sym].push point
		end
	end
end
