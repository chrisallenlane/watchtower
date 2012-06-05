# A hash of interesting SQL data
$signatures[:sql] ||= {}
$signatures[:sql][:markup_injections] = [
	Signature.new({:literal => '<script'}),
	Signature.new({:literal => '<iframe'}),
]

$signatures[:sql][:php_injections] = [
	Signature.new({:literal => '<?php'}),
	Signature.new({:literal => '<?'}),
	Signature.new({:literal => '<?='}),
]
