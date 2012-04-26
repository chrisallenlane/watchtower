require 'lib/models/poi.rb'
require 'rubygems'
require 'colorize'

data = {
		:file_type		=> 'php',
		:file			=> 'example.php',
		:line_number	=> 100,
		:match			=> 'eval(',
		:snippet		=> 'eval(evilFunction())',
		:group			=> 'dangerous_functions',
}
$poi = PoI.new(data)
$poi.colorize
puts $poi

