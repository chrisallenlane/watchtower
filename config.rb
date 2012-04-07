# This is going to be SUPER convenient:
# ack-grep --help=types


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

#payloads += custom_strings
