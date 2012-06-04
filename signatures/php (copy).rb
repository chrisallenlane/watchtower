# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
php_signatures = {
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

	:signature_obfuscators => %w[
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
	
	:form_data => %w[
		$_GET
		$_POST
	],
	
	:globals => %w[
		$_SESSION
		$_SERVER
		$_COOKIE
		$_REQUEST
		$_FILES
		$GLOBALS
	],
	
	:developer_notes => %w[
		@todo
		@bug
		@fixme
		@kludge
		@note
	],
	
	:custom_strings => %w[
		username
		password
		host
		database
	],
	
	# the following represents:
	# 1. MD5 Hashes
	# 2. SHA1 Hashes
	# 3. Any Base 64 encoded data
	:regex			=> %w[
		[0-9a-f]{32}
		[0-9a-f]{40}
		^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$
	]
}


# While this is obviously not necessary, assembling the signature hash
# thusly makes it a bit easier/faster to turn on/off the various
# signatures to scan for
$signatures[:php] ||= {}
$signatures[:php][:dangerous_functions] 	= php_signatures[:dangerous_functions].literal
$signatures[:php][:signature_obfuscators] 	= php_signatures[:signature_obfuscators].literal
$signatures[:php][:form_data] 				= php_signatures[:form_data].literal
$signatures[:php][:globals] 				= php_signatures[:globals].literal
$signatures[:php][:developer_notes] 		= php_signatures[:developer_notes].literal
$signatures[:php][:custom_strings] 			= php_signatures[:custom_strings].literal
$signatures[:php][:regex]		 			= php_signatures[:regex]
