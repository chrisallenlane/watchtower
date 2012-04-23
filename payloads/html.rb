# Enumerate a hash containing all of the various payloads (grouped
# topically) for which one may want to scan.
html_payloads = {
	# noteworthy HTML tags
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
		<object
		<style
		<xml
	],
	
	:comments => %w[
		<!--
	],
}

# While this is obviously not necessary, assembling the payload hash
# thusly makes it a bit easier/faster to turn on/off the various
# payloads to scan for
$payloads[:html] ||= {}
$payloads[:html][:inputs] 		= html_payloads[:inputs]
$payloads[:html][:dangerous]	= html_payloads[:dangerous]
$payloads[:html][:comments]		= html_payloads[:comments]
