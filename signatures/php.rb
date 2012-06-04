# TODO: THIS SHOULD BE YAML

# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:php] ||= {}
$signatures[:php][:dangerous_functions] = [
	Signature.new({:sig => 'assert('}),
	Signature.new({:sig => 'create_function('}),
	Signature.new({:sig => 'curl_exec('}),
	Signature.new({:sig => 'curl_init('}),
	Signature.new({:sig => 'eval('}),
	Signature.new({:sig => 'exec('}),
	Signature.new({:sig => 'fclose('}),
	Signature.new({:sig => 'file('}),
	Signature.new({:sig => 'file_get_contents('}),
	Signature.new({:sig => 'fopen('}),
	Signature.new({:sig => 'fread('}),
	Signature.new({:sig => 'fread('}),
	Signature.new({:sig => 'fsockopen('}),
	Signature.new({:sig => 'include('}),
	Signature.new({:sig => 'include_once('}),
	Signature.new({:sig => 'mail('}),
	Signature.new({:sig => 'ob_get_contents('}),
	Signature.new({:sig => 'passthru('}),
	Signature.new({:sig => 'pfsockopen('}),
	Signature.new({:sig => 'popen('}),
	Signature.new({:sig => 'proc_open('}),
	Signature.new({:sig => 'readfile('}),
	Signature.new({:sig => 'readfile('}),
	Signature.new({:sig => 'require('}),
	Signature.new({:sig => 'require_once('}),
	Signature.new({:sig => 'shell_exec('}),
	Signature.new({:sig => 'system('}),
	Signature.new({:sig => 'unserialize('}),
	Signature.new({:sig => '`'}),
]

$signatures[:php][:signature_obfuscators] = [
	Signature.new({:sig => 'base64_decode('}),
	Signature.new({:sig => 'base64_encode('}),
	Signature.new({:sig => 'bzcompress('}),
	Signature.new({:sig => 'bzdecompress('}),
	Signature.new({:sig => 'gzdeflate('}),
	Signature.new({:sig => 'gzdinflate('}),
	Signature.new({:sig => 'gzdencode('}),
	Signature.new({:sig => 'gzuncompress('}),
	Signature.new({:sig => 'zlib_encode('}),
	Signature.new({:sig => 'zlib_decode('}),
	Signature.new({:sig => '$$'}),
]

$signatures[:php][:form_data] = [
	Signature.new({:sig => '$_GET'}),
	Signature.new({:sig => '$_POST'}),
]

$signatures[:php][:globals] = [
	Signature.new({:sig => '$_SESSION'}),
	Signature.new({:sig => '$_SERVER'}),
	Signature.new({:sig => '$_COOKIE'}),
	Signature.new({:sig => '$_REQUEST'}),
	Signature.new({:sig => '$_FILES'}),
	Signature.new({:sig => '$GLOBALS'}),
]

$signatures[:php][:developer_notes] = [
	Signature.new({:sig => '@todo'}),
	Signature.new({:sig => '@bug'}),
	Signature.new({:sig => '@fixme'}),
	Signature.new({:sig => '@kludge'}),
	Signature.new({:sig => '@note'}),
]

$signatures[:php][:custom_strings] = [
	Signature.new({:sig => 'username'}),
	Signature.new({:sig => 'password'}),
	Signature.new({:sig => 'host'}),
	Signature.new({:sig => 'database'}),
]

$signatures[:php][:hashes] = [
	Signature.new({:name => 'MD5',  :regex => '[0-9a-f]{32}'}),
	Signature.new({:name => 'SHA1', :regex => '[0-9a-f]{40}'}),
]
