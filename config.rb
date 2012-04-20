#######################################################################
# Configs
#######################################################################
# @todo: files to exclude
$configs = {
	
	# files to exclude from the search
	:exclude => [
		'.git',
		'.svn',
	],
	
	# If true, javascript will be embedded directly into the report. If
	# false, it will be linked to a hosted file.
	:embed_javascript => false,
}


#######################################################################
# Payloads
#######################################################################
# assemble the array of payloads
$payloads = {}

# need to gracefully handle 'synonymous' filetype extensions here
# (.php, .php4, .php5, .phtml, etc)
require './payloads/php.rb'
require './payloads/html.rb'
require './payloads/js.rb'
#require './payloads/sql.rb'
#payloads += custom_strings
