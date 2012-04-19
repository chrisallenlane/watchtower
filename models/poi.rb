# "Point of Interest"
class PoI
	@@color_file_type   = :red
	@@color_file        = :cyan
	@@color_line_number = :yellow
	@@color_match       = :red

	attr_accessor :file_type, :file, :line_number, :match, :snippet
	
	# define the initializer. accept a hash of data
	def initialize data
		@file_type   = data[:file_type]
		@file        = data[:file]
		@line_number = data[:line_number]
		@match       = data[:match]
		@snippet     = data[:snippet]
	end
	
	# colorizes command-line output
	def colorize
		@file 		 = @file.colorize(@@color_file)
		@line_number = @line_number.colorize(@@color_line_number)
		@snippet 	 = @snippet.sub(@match, @match.colorize(:background => @@color_match))
	end
	
	# outputs the point of interest to the command line
	def to_s
		text = @file + ':' + @line_number + "\n"
		text += @snippet
	end
	
	# implement the concatenation operator
	def + arg
		self.to_s + arg
	end
	
	# outputs as CSV
	def csv
	
	end
	
	# outputs as HTML
	def html
		html = ''
		# @todo: implement this here
	end
	
	# outputs as XML
	def xml
		"\t<poi>\n" +
			"\t\t<file><![CDATA[#{@file}]]></file>\n" + 
			"\t\t<file_type><![CDATA[#{@file_type}]]></file_type>\n" + 
			"\t\t<line_number><![CDATA[#{@line_number}]]></line_number>\n" + 
			"\t\t<match><![CDATA[#{@match}]]></match>\n" + 
			"\t\t<snippet><![CDATA[#{@snippet}]]></snippet>\n" + 
		"\t</poi>\n"
	end
end
