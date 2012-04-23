#######################################################################
# Configs
#######################################################################
$configs = {
	
	# If true, javascript will be embedded directly into the report. If
	# false, it will be linked to a hosted file.
	:embed_javascript => true,
	
	# @todo: files to exclude from the search
	:exclude_dirs => [

	],
	
	# @todo: implement this
	:payload_dir => '',
	
	# for use with HTML reporting
	# @todo: implement this
	:html_stylesheet => '',
}


#######################################################################
# Payloads
#######################################################################
# assemble the array of payloads
$payloads = {}

# might want to wrap this in some load function
require './payloads/html.rb'
require './payloads/php.rb'
require './payloads/js.rb'
require './payloads/sql.rb'
