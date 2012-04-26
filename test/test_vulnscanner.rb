require 'test/test_helper.rb'
require 'lib/models/vulnscanner.rb'

# @todo: I should probably beef up the testing on this class in the
# future. It's a bit weak right now.
class TestVulnscanner < ::Test::Unit::TestCase  
  def setup
	# mock the config file
	$configs = {}
	$configs[:exclude_dirs] = []
  
	# specify the payloads
	payloads = {}
	payloads[:php] = {}
	payloads[:php][:dangerous_functions] = ['eval(', 'base64_decode(']
	
	# specify the directory to scan
	scandir = File.dirname(__FILE__)
	@vulnscanner = VulnScanner.new({:payloads => payloads, :scan_dir => scandir})
  end
  
  must "scan" do
	@vulnscanner.scan
	assert_equal @vulnscanner.points_of_interest.count, 2	
  end
  
  must "sort" do
	@vulnscanner.scan # why do I seem to need to do this here?
	@vulnscanner.sort
	assert_equal @vulnscanner.points_of_interest.count, 2
	assert_equal @vulnscanner.points_of_interest_sorted.count, 1
  end
  
end
