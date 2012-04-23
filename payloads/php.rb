# Enumerate a hash containing all of the various payloads (grouped
# topically) for which one may want to scan.
php_payloads = {
	# dangerous PHP functions
	:dangerous_functions => %w[
		assert(		
		create_function(
		curl_exec(
		curl_init(
		eval(
		exec(
		fclose(
		file(
		file_get_contents(
		file_put_contents(
		fopen(
		fread(
		fsockopen(
		include(
		include_once(
		mail(
		ob_get_contents(
		passthru(
		pfsockopen(
		popen(
		proc_open(
		readfile(
		require(
		require_once(
		shell_exec(
		system(
		unserialize(
		`
	],

	# dangerous user data
	:payload_obfuscators => %w[
		base64_decode(
		base64_encode(
		bzcompress(
		bzdecompress(
		gzdeflate(
		gzinflate(
		gzencode(
		gzuncompress(
		zlib_encode(
		zlib_decode(
		$$
	],
	
	# dangerous user data
	:form_data => %w[
		$_GET
		$_POST
	],
	
	# dangerous user data
	:globals => %w[
		$_SESSION
		$_SERVER
		$_COOKIE
		$_REQUEST
		$_FILES
		$GLOBALS
	],
	
	# dangerous user data
	:developer_notes => %w[
		@todo
		@bug
		@fixme
		@kludge
		@note
	],
	
	# dangerous user data
	:sql => %w[
		SELECT
		UPDATE
		DELETE
	],
	
	# dangerous user data
	:wordpress_specific => %w[
		$wpdb
	],
	
	# custom strings
	:custom_strings => %w[
		username
		password
		host
		database
	],
}


# While this is obviously not necessary, assembling the payload hash
# thusly makes it a bit easier/faster to turn on/off the various
# payloads to scan for
$payloads[:php] ||= {}
$payloads[:php][:dangerous_functions] 	= php_payloads[:dangerous_functions]
$payloads[:php][:payload_obfuscators] 	= php_payloads[:payload_obfuscators]
$payloads[:php][:form_data] 			= php_payloads[:form_data]
$payloads[:php][:globals] 				= php_payloads[:globals]
$payloads[:php][:developer_notes] 		= php_payloads[:developer_notes]
$payloads[:php][:sql]			 		= php_payloads[:sql]
$payloads[:php][:wordpress_specific]	= php_payloads[:wordpress_specific]
$payloads[:php][:custom_strings] 		= php_payloads[:custom_strings]
