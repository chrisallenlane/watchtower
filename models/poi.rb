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
	def to_s
		text = ''
		text += @file + ':' + @line_number + "\n"
		text += @snippet
	end
	
	# colorizes command-line output
	def colorize
		text = ''
		text += @file.colorize(@@color_file) + ':' + @line_number.colorize(@@color_line_number) + "\n"
		text += @snippet.sub(@match, @match.colorize(:background => @@color_match))
	end
	
	# implement the concatenation operator
	def + arg
		self.to_s + arg
	end
	
	# outputs as HTML
	def html
		html = ''
		# @todo: implement this here
	end
	
end
