# A hash of interesting HTML elements
$payloads[:html] = {
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
