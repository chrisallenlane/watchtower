# A hash of interesting HTML elements
$payloads[:html] = {
	# dangerous PHP functions
	:inputs => %w[
		<form
		<input
		<textarea
		<select
		<script
	]
}
