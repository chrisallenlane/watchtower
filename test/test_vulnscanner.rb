require 'test/test_helper.rb'
require 'lib/models/signature.rb'
require 'lib/models/vulnscanner.rb'

# @todo: I should probably beef up the testing on this class in the
# future. It's a bit weak right now.
class TestVulnscanner < ::Test::Unit::TestCase  
  def setup
	# mock the config file
	$configs                    = {}
	$configs[:exclude_files]    = []
	$configs[:exclude_dirs]     = []
    $configs[:ftype_ext]        = {}
    $configs[:ftype_ext][:php]  = %w[php phpt php3 php4 php5 phtml]
    
	# specify the signatures
	signatures = {}
	signatures[:php] = {}
	signatures[:php][:dangerous_functions] = [
		Signature.new({:literal => 'eval('}),
		Signature.new({:literal => 'base64_decode('}),
	]
	
	# specify the directory to scan
	scandir = File.dirname(__FILE__)
	@vulnscanner = VulnScanner.new({
		:signatures 	=> signatures,
		:scan_dir 		=> scandir,
		:before_context => 0,
		:after_context	=> 0
	})
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
