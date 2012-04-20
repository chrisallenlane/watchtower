class VulnScanner

	attr_accessor :payloads, :points_of_interest, :scan_dir, :project_name
	
	# initializer
	def initialize data
		@payloads	= data[:payloads]
		@scan_dir 	= data[:scan_dir]
		@points_of_interest = []
	end
	
	# performs a scan of the specified codebase
	def scan
		@payloads.each do |file_type, payload_groups|
			# cast the file_type symbol into a string
			ftype = file_type.to_s	
			# iterate over the payload groups
			payload_groups.each do |payload_group, payloads|
			
				# iterate over each payload
				payloads.each do |payload|
					# do an ack-grep scan
					# @todo: --[no]ignore-dir=name Add/Remove directory from the list of ignored dirs
					result = `cd #{@scan_dir}; ack-grep '#{payload.shellescape}' --sort --#{ftype}`
					
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

							# buffer a new point of interest
							data = {
								:file_type   => ftype,
								:file        => file_name,
								:line_number => line_num,
								:match       => payload,
								:snippet     => snippet,
								:group		 => payload_group,
							}
							
							#puts data.to_yaml
							
							@points_of_interest.push(PoI.new(data))
						end
					end
				end	
			end
		end		
	end	
end
