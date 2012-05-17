# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
html_signatures = {
	:inputs => %w[
		<form
		<input
		<select
		<script
		<textarea
	],
	
	:dangerous => %w[
		<applet
		<embed
		<iframe
		<noscript
		<object
		<style
		<xml
	],
	
	:comments => %w[
		<!--
	],
}

# While this is obviously not necessary, assembling the signature hash
# thusly makes it a bit easier/faster to turn on/off the various
# signatures to scan for
$signatures[:html] ||= {}
$signatures[:html][:inputs] 		= html_signatures[:inputs]
$signatures[:html][:dangerous]	= html_signatures[:dangerous]
$signatures[:html][:comments]		= html_signatures[:comments]
