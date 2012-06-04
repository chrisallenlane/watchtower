$signatures[:js] ||= {}
$signatures[:js][:dangerous_functions] = [
	Signature.new({:sig => 'eval'}),
]
