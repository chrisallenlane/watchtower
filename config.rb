#######################################################################
# Configs
#######################################################################
# @todo: implement this
project_dir = ''

$configs = {
	# If true, javascript will be embedded directly into the report. If
	# false, it will be linked to a hosted file.
	:embed_javascript 	=> true,
	
	# exclude directories from the search
	:exclude_dirs		=> [
		#'/path/to/ignore/one',
		#'/path/to/ignore/two',
	],
	
	# text to display in the report footer
	:footer_text => "This is the footer text.",
	
	# for use with HTML reporting
	# @todo: implement this
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
	:web_app			=> {
		:is_web_app		=> false,
		:base_url		=> '',
	}
}


#######################################################################
# Payloads
#######################################################################
# assemble the array of payloads
$payloads ||= {}
$configs[:payloads].each {|payload| require payload}
