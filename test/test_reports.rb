# @todo: this test is going to test the validity of the various sample
# reports (csv, html, xml).
require 'test/test_helper.rb'


class TestReports < ::Test::Unit::TestCase
  
  def setup
  
	#data = {
		#:file_type		=> 'php',
		#:file			=> 'example.php',
		#:line_number	=> '100',
		#:match			=> 'eval(',
		#:name			=> 'eval(',
		#:snippet		=> 'eval(evilFunction())',
		#:group			=> 'dangerous_functions',
	#}
	#@poi = PoI.new(data)
  end
  
  #must "output valid CSV" do
	
  #end
  
  #must "output valid HTML" do
	
  #end
  
  #must "output valid XML" do
	
  #end
  
  must "contain no typos in the README" do
    assert_equal '', `cat ./README.md | aspell list --encoding utf-8`
  end
  
end
