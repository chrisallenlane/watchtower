# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:linux] ||= {}

$signatures[:linux][:system_files] = [
	Signature.new({:literal => '/etc/groups'}),
	Signature.new({:literal => '/etc/gshadow'}),
	Signature.new({:literal => '/etc/hosts.allow'}),
	Signature.new({:literal => '/etc/hosts.deny'}),
	Signature.new({:literal => '/etc/login.defs'}),
	Signature.new({:literal => '/etc/passwd'}),
	Signature.new({:literal => '/etc/securetty'}),
	Signature.new({:literal => '/etc/security'}),
	Signature.new({:literal => '/etc/shadow'}),
	Signature.new({:literal => '/etc/shells'}),
]

$signatures[:linux][:ssh_files] = [
	Signature.new({:literal => '/etc/ssh/ssh_config'}),
	Signature.new({:literal => '/etc/ssh/sshd_config'}),
	Signature.new({:literal => 'id_rsa'}),
	Signature.new({:literal => 'cert.pem'}),
]
