######################################################################
# Configs
######################################################################
@@browser = 'google-chrome'
@@editor  = 'geany'


######################################################################
# Payloads
######################################################################
dangerous_functions = %w[
	assert\(
	base64_decode\(
	base64_encode\(
	create_function\(
	curl_exec\(
	curl_init\(
	eval\(
	exec\(
	fclose\(
	file\(
	file_get_contents\(
	file_put_contents\(
	fopen\(
	fread\(
	fsockopen\(
	include\(
	include_once\(
	mail\(
	ob_get_contents\(
	passthru\(
	pfsockopen\(
	popen\(
	proc_open\(
	readfile\(
	require\(
	require_once\(
	shell_exec\(
	system\(
	unserialize\(
	`
]

user_data = %w[
	\$_GET
	\$_POST
	\$_SESSION
	\$_SERVER
	\$_COOKIE
	\$_REQUEST
	\$GLOBALS
	\$_FILES
]

custom_strings = %w[
	whatever
]

# assemble the array of payloads
payloads = []
payloads += dangerous_functions
payloads += user_data
#payloads += custom_strings
