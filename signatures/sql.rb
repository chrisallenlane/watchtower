# A hash of interesting SQL data
$signatures[:sql] ||= {}
$signatures[:sql][:markup_injections] = [
	Signature.new({:sig => '<script'}),
	Signature.new({:sig => '<iframe'}),
]

$signatures[:sql][:php_injections] = [
	Signature.new({:sig => '<?php'}),
	Signature.new({:sig => '<?'}),
	Signature.new({:sig => '<?='}),
]
