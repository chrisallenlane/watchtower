require 'test/test_helper.rb'
require 'lib/models/poi.rb'


class TestPoi < ::Test::Unit::TestCase
  
  def setup
	data = {
		:file_type		=> 'php',
		:file			=> 'example.php',
		:line_number	=> '100',
		:match			=> 'eval(',
		:name			=> 'eval(',
		:snippet		=> 'eval(evilFunction())',
		:group			=> 'dangerous_functions',
	}
	@poi = PoI.new(data)
  end
  
  
  must "initialize properly" do
	assert_equal @poi.file_type, 'php'
	assert_equal @poi.file, 'example.php'
	assert_equal @poi.line_number, '100'
	assert_equal @poi.match, 'eval('
	assert_equal @poi.name, 'eval('
	assert_equal @poi.snippet, 'eval(evilFunction())'
	assert_equal @poi.group, 'dangerous_functions'
  end
  
  must "convert to string" do
	str = "example.php:100\neval(\neval(\neval(evilFunction())\ndangerous_functions"
	assert_equal @poi.to_s, str
  end
  
  must "concatenate" do
	str = "example.php:100\neval(evilFunction())dangerous_functions"
	assert_equal (str + 'CONCAT'), "example.php:100\neval(evilFunction())dangerous_functionsCONCAT"
  end
  
  must "convert to array" do
	assert_equal @poi.to_a, %w[php example.php 100 eval( eval( eval(evilFunction()) dangerous_functions]
  end
  
  must "convert to xml" do
	xml = "\t<poi>\n\t\t<file><![CDATA[example.php]]></file>\n\t\t<file_type><![CDATA[php]]></file_type>\n\t\t<line_number><![CDATA[100]]></line_number>\n\t\t<match><![CDATA[eval(]]></match>\n\t\t<name><![CDATA[eval(]]></name>\n\t\t<snippet><![CDATA[eval(evilFunction())]]></snippet>\n\t\t<group><![CDATA[dangerous_functions]]></group>\n\t</poi>\n"
	assert_equal (@poi.to_xml), xml 
  end
end
