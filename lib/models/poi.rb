# This class models the various Points of Interest (hence, PoI) that are
# detected by the VulnScanner.
class PoI
	@@color_file_type   = :red
	@@color_file        = :cyan
	@@color_line_number = :yellow
	@@color_match       = :red

	attr_accessor :file_type, :file, :line_number, :match, :name, :snippet, :group
		
	# Initializes the Poi (Point of Interest) object. Accepts a hash
	# containing the following keys:
	#
	# <tt>:file_type</tt>:: The file type in which the PoI was found
	# <tt>:file</tt>:: The file in which the PoI was found
	# <tt>:line_number</tt>:: The line number at which the PoI was found
	# <tt>:match</tt>:: The specified signature which this PoI matches
	# <tt>:name</tt>:: The name of this PoI
	# <tt>:snippet</tt>:: A code snippet of the match in context
	# <tt>:group</tt>:: The group to witch the signature belongs
	#
	# Usage:
	#	data = {
	#		:file_type   => 'php',
	#		:file        => 'example.php',
	#		:line_number => 100,
	#		:match       => 'exec(',
	#		:snippet     => 'exec(evilfunction())',
	#		:group       => 'dangerous_functions',
	#	}
	#	poi = PoI.new(data)
	#
	def initialize data
		@file_type   = data[:file_type].to_s
		@file        = data[:file].to_s
		@line_number = data[:line_number].to_s
		@match       = data[:match].to_s
		@name        = data[:name].to_s
		@snippet     = data[:snippet].to_s
		@group       = data[:group].to_s
	end
	
	# Colorizes output in the command line
	#
	# Usage:
	#	poi.colorize
	#
	def colorize
		@file 		 = @file.colorize(@@color_file)
		@line_number = @line_number.colorize(@@color_line_number)
		@snippet 	 = @snippet.sub(@match, @match.colorize(:background => @@color_match))
	end
	
	# Formats the PoI object for display as plain text
	#
	# Usage:
	#	puts poi
	#
	def to_s
		text = @file + ':' + @line_number + "\n"
		text += @name + "\n"
		text += @match + "\n"
		text += @snippet + "\n"
		text += @group
	end

	# Implements the string concatenation operator
	#
	# Usage:
	#	puts poi + "\n\n"
	#
	def + arg
		self.to_s + arg
	end
	
	# Converts a PoI object to an array.
	#
	# Usage:
	#	poi.to_a
	#
	def to_a
		[@file_type, @file, @line_number, @match, @name, @snippet, @group]
	end
	
	# Converts a PoI object into an XML representation
	#
	# Usage:
	#	puts poi.xml
	#
	def xml
		"\t<poi>\n" +
			"\t\t<file><![CDATA[#{@file}]]></file>\n" + 
			"\t\t<file_type><![CDATA[#{@file_type}]]></file_type>\n" + 
			"\t\t<line_number><![CDATA[#{@line_number}]]></line_number>\n" + 
			"\t\t<match><![CDATA[#{@match}]]></match>\n" + 
			"\t\t<name><![CDATA[#{@name}]]></name>\n" + 
			"\t\t<snippet><![CDATA[#{@snippet}]]></snippet>\n" + 
			"\t\t<group><![CDATA[#{@group}]]></group>\n" + 
		"\t</poi>\n"
	end
end
