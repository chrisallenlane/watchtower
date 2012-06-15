require 'test/test_helper.rb'
require 'lib/models/signature.rb'


class TestSignature < ::Test::Unit::TestCase
  
  def setup
	# initialize a literal signature
    data = {
		:literal	=> 'exec(',
	}
	@sig_literal = Signature.new(data)
	
    # initialize a regex-bases signature
    data = {
		:name		=> 'MD5',
		:regex      => '[0-9a-f]{32}',
	}
	@sig_regex   = Signature.new(data)
  end
  
  must "initialize a literal signature" do
	assert_equal @sig_literal.literal, 'exec('
	assert_equal @sig_literal.name, nil
	assert_equal @sig_literal.regex, nil
  end
  
  must "initialize a regex signature" do
	assert_equal @sig_regex.literal, nil
	assert_equal @sig_regex.name, 'MD5'
	assert_equal @sig_regex.regex, '[0-9a-f]{32}'
  end
  
end
