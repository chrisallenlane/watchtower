#######################################################################
# Configs
#######################################################################
# These are not currently in use, but may come into play if I build a 
# graphical front-end eventually
#@@browser = 'google-chrome'
#@@editor  = 'geany'


#######################################################################
# Payloads
#######################################################################
# assemble the array of payloads
$payloads = {}

# need to gracefully handle 'synonymous' filetype extensions here
# (.php, .php4, .php5, .phtml, etc)
require './payloads/php.rb'
require './payloads/html.rb'
#require './payloads/js.rb'
#require './payloads/asp.rb'
#require './payloads/sql.rb'
#payloads += custom_strings
