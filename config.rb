#######################################################################
# Configs
#######################################################################
$configs = {
	:client_name		=> "Enzo's Pizza",

	# If true, javascript will be embedded directly into the report. If
	# false, it will be linked to a hosted file.
	:embed_javascript 	=> false,
	
	# exclude directories from the search
	:exclude_dirs		=> [
		#'/path/to/ignore/one',
		#'/path/to/ignore/two',
	],
	
	# text to display in the report footer
	:footer_text => "This is the footer text.",
	
	# text to display in the report header
	:header_text => "
	<div id='masthead_right'>
		<h4>Auditor:</h4>
		<p>Hiro Protagonist
		<br><a href='#'>hiro@example.com</a>
		<br><a href='#'>blog.example.com</a>
		<br><a href='#'>twitter.com/example</a></p>
	</div>
	",
	
	# for use with HTML reporting
	:stylesheets 		=> [
		'./lib/static/jquery-ui-1.8.19.custom.css',
		'./lib/static/main.css',
	],
	
	# payloads paths are relative to project root
	:payloads 			=> [
		'./payloads/html.rb',
		'./payloads/php.rb',
		'./payloads/js.rb',
		'./payloads/sql.rb',
	],
	
	# special settings for use with web apps only
	#:web_app			=> {
	#	:is_web_app		=> false,
	#	:base_url		=> '',
	#}
}


#######################################################################
# Payloads
#######################################################################
# assemble the array of payloads
$payloads ||= {}
$configs[:payloads].each {|payload| require payload}
