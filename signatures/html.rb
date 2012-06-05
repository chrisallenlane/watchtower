# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:html] ||= {}
$signatures[:html][:inputs] = [
	Signature.new({:literal => '<form'}),
	Signature.new({:literal => '<input'}),
	Signature.new({:literal => '<select'}),
	Signature.new({:literal => '<script'}),
	Signature.new({:literal => '<textarea'}),
]

$signatures[:html][:dangerous] = [
	Signature.new({:literal => '<applet'}),
	Signature.new({:literal => '<embed'}),
	Signature.new({:literal => '<iframe'}),
	Signature.new({:literal => '<noscript'}),
	Signature.new({:literal => '<object'}),
	Signature.new({:literal => '<style'}),
	Signature.new({:literal => '<xml'}),
]

$signatures[:html][:comments] = [
	Signature.new({:literal => '<!--'}),
]
