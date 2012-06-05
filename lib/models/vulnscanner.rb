# This class encapsulates the main functionality of the application -
# the scanning of a codebase for potential points of interest as specified
# in the user-provided signatures.
class VulnScanner

	attr_accessor :signatures, :points_of_interest, :points_of_interest_sorted, :scan_dir
	
	# Initializes the VulnScanner instance. Accepts a hash containing
	# the following keys:
	#
	# <tt>:signatures</tt>:: A hash of signature strings for which to scan
	# <tt>:scan_dir</tt>  :: The project directory to scan
	#
	# Usage:
	#	data = {
	#		:signatures => signatures,
	#		:scan_dir => '/path/to/scan',
	#	}
	#
	def initialize data
		@signatures	                = data[:signatures]
		@scan_dir 	                = data[:scan_dir]
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
                    
					# do a grep scan
					if signature.regex.to_s.empty?
						result = `cd #{@scan_dir}; grep -RHn '#{signature.literal.chomp}' #{include_filetypes} #{exclude_files} #{exclude_dirs} .`
						match  = signature.literal
					else
						result = `cd #{@scan_dir}; grep -ERHn '#{signature.regex.chomp}' #{include_filetypes} #{exclude_files} #{exclude_dirs} .`
						match  = nil
					end
                    
					# display the matches
					unless result.strip.empty?
						# iterate over the ack results
						result.each_line do |line| 
							# parse the result string into components
							first_colon_pos  = line.index(':')
							second_colon_pos = line.index(':', first_colon_pos + 1)
							
							# parse out the important information
							file_name        = line.slice(0..(first_colon_pos - 1)) 
							line_num         = line.slice((first_colon_pos + 1)..(second_colon_pos - 1)) 
							snippet          = line.slice((second_colon_pos +1), line.length).strip

							# parse out the match if a regex was specified
							if match.to_s.empty?
								match = snippet.match(signature.regex)
							end

                            # this should not change
							# buffer a new point of interest
							data = {
								:file_type   => ftype,
								:file        => file_name,
								:line_number => line_num,
								:match       => match,
								:name	     => signature.name || signature.literal,
								:snippet     => snippet,
								:group		 => signature_group.to_s,
							}
							
							@points_of_interest.push(PoI.new(data))
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
