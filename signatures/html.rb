# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:html] ||= {}
$signatures[:html][:inputs] = [
	Signature.new({:sig => '<form'}),
	Signature.new({:sig => '<input'}),
	Signature.new({:sig => '<select'}),
	Signature.new({:sig => '<script'}),
	Signature.new({:sig => '<textarea'}),
]

$signatures[:html][:dangerous] = [
	Signature.new({:sig => '<applet'}),
	Signature.new({:sig => '<embed'}),
	Signature.new({:sig => '<iframe'}),
	Signature.new({:sig => '<noscript'}),
	Signature.new({:sig => '<object'}),
	Signature.new({:sig => '<style'}),
	Signature.new({:sig => '<xml'}),
]

$signatures[:html][:comments] = [
	Signature.new({:sig => '<!--'}),
]
