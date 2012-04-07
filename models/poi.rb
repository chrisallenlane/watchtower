# "Point of Interest"
class PoI
	@@color_filetype    = :red
	@@color_file        = :cyan
	@@color_line_number = :yellow
	@@color_match       = :red

	attr_accessor :filetype, :file, :line_number, :match, :snippet
	
	# define the initializer. accept a hash of data
	def initialize data
		@filetype    = data[:filetype]
		@file        = data[:file]
		@line_number = data[:line_number]
		@match       = data[:match]
		@snippet     = data[:snippet]
	end
	
	# outputs the point of interest to the command line
	def get use_color = false
		#buffer and return text describing self
		text = ''
		if use_color
			text += @file.colorize(@@color_file) + ':' + @line_number.colorize(@@color_line_number) + "\n"
			# highlight the match in the snippet
			text += @snippet.sub(@match, @match.colorize(:background => @@color_match))
		else
			text += @file + ':' + @line_number
			text += @snippet
		end
		
		return text
	end
	
end
