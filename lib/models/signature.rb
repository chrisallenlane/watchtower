class Signature
	attr_accessor :name, :sig, :regex
	
	def initialize data
		@name   = data[:name]
		@sig    = data[:sig]
		@regex  = data[:regex]
	end

end
