######################################################################
# Configs
######################################################################
@@browser = 'google-chrome'
@@editor  = 'geany'


######################################################################
# Payloads
######################################################################
# assemble the array of payloads
$payloads = {}

require './payloads/php.rb'
#require './payloads/html.rb'
#require './payloads/js.rb'
#require './payloads/asp.rb'
#require './payloads/sql.rb'
#payloads += custom_strings
