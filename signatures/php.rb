# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:php] ||= {}
$signatures[:php][:dangerous_functions] = [
	Signature.new({:literal => 'assert('}),
	Signature.new({:literal => 'create_function('}),
	Signature.new({:literal => 'curl_exec('}),
	Signature.new({:literal => 'curl_init('}),
	Signature.new({:literal => 'eval('}),
	Signature.new({:literal => 'exec('}),
	Signature.new({:literal => 'fclose('}),
	Signature.new({:literal => 'file('}),
	Signature.new({:literal => 'file_get_contents('}),
	Signature.new({:literal => 'fopen('}),
	Signature.new({:literal => 'fread('}),
	Signature.new({:literal => 'fread('}),
	Signature.new({:literal => 'fsockopen('}),
	Signature.new({:literal => 'include('}),
	Signature.new({:literal => 'include_once('}),
	Signature.new({:literal => 'mail('}),
	Signature.new({:literal => 'ob_get_contents('}),
	Signature.new({:literal => 'passthru('}),
	Signature.new({:literal => 'pfsockopen('}),
	Signature.new({:literal => 'popen('}),
	Signature.new({:literal => 'proc_open('}),
	Signature.new({:literal => 'readfile('}),
	Signature.new({:literal => 'readfile('}),
	Signature.new({:literal => 'require('}),
	Signature.new({:literal => 'require_once('}),
	Signature.new({:literal => 'shell_exec('}),
	Signature.new({:literal => 'system('}),
	Signature.new({:literal => 'unserialize('}),
	Signature.new({:literal => '`'}),
]

$signatures[:php][:payload_obfuscators] = [
	Signature.new({:literal => 'base64_decode('}),
	Signature.new({:literal => 'base64_encode('}),
	Signature.new({:literal => 'bzcompress('}),
	Signature.new({:literal => 'bzdecompress('}),
	Signature.new({:literal => 'gzdeflate('}),
	Signature.new({:literal => 'gzdinflate('}),
	Signature.new({:literal => 'gzdencode('}),
	Signature.new({:literal => 'gzuncompress('}),
	Signature.new({:literal => 'zlib_encode('}),
	Signature.new({:literal => 'zlib_decode('}),
	Signature.new({:literal => '$$'}),
]

$signatures[:php][:form_data] = [
	Signature.new({:literal => '$_GET'}),
	Signature.new({:literal => '$_POST'}),
]

$signatures[:php][:globals] = [
	Signature.new({:literal => '$_SESSION'}),
	Signature.new({:literal => '$_SERVER'}),
	Signature.new({:literal => '$_COOKIE'}),
	Signature.new({:literal => '$_REQUEST'}),
	Signature.new({:literal => '$_FILES'}),
	Signature.new({:literal => '$GLOBALS'}),
]

$signatures[:php][:developer_notes] = [
	Signature.new({:literal => '@todo'}),
	Signature.new({:literal => '@bug'}),
	Signature.new({:literal => '@fixme'}),
	Signature.new({:literal => '@kludge'}),
	Signature.new({:literal => '@note'}),
]

$signatures[:php][:custom_strings] = [
	Signature.new({:literal => 'username'}),
	Signature.new({:literal => 'password'}),
	Signature.new({:literal => 'host'}),
	Signature.new({:literal => 'database'}),
]

$signatures[:php][:hashes] = [
	Signature.new({:name => 'MD5',  :regex => '[0-9a-f]{32}'}),
	Signature.new({:name => 'SHA1', :regex => '[0-9a-f]{40}'}),
]
