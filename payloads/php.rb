# Enumerate the various PHP hazards to search for
$payloads[:php] = {
	# dangerous PHP functions
	:dangerous_functions => %w[
		assert(
		base64_decode(
		base64_encode(
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
	:user_data => %w[
		$_GET
		$_POST
		$_SESSION
		$_SERVER
		$_COOKIE
		$_REQUEST
		$GLOBALS
		$_FILES
	]
}
