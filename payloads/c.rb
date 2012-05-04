# this list was borrowed, with gratitude, from Flawfinder:
# http://sourceforge.net/projects/flawfinder/

# @todo: I'm not an expert at C. It would be great to break up this list
# into more granular payload groups.
c_payloads = {
	:dangerous_functions => %w[
		strcpy
		lstrcpy
		wcscpy
		_tcscpy
		_mbscpy
		memcpy
		CopyMemory
		bcopy
		strcat
		lstrcat
		wcscat
		_tcscat
		_mbscat
		strncpy
		lstrcpyn
		wcsncpy
		_tcsncpy
		_mbsnbcpy
		strncat
		lstrcatn
		wcsncat
		_tcsncat
		_mbsnbcat
		strccpy
		strcadd
		gets
		_getts
		sprintf
		vsprintf
		swprintf
		vswprintf
		_stprintf
		_vstprintf
		printf
		vprintf
		vwprintf
		vfwprintf
		_vtprintf
		fprintf
		vfprintf
		_ftprintf
		_vftprintf
		syslog
		snprintf
		vsnprintf
		_snprintf
		_sntprintf
		_vsntprintf
		scanf
		vscanf
		wscanf
		_tscanf
		fscanf
		sscanf
		vsscanf
		vfscanf
		_ftscanf
		strlen
		wcslen
		_tcslen
		_mbslen
		streadd
		strecpy
		strtrns
		realpath
		getopt
		getopt_long
		getpass
		getwd
		getchar
		fgetc
		getc
		read
		_gettc
		chown
		chgrp
		chmod
		vfork
		readlink
		tmpfile
		tmpnam
		tempnam
		mktemp
		mkstemp
		fopen
		open
		umask
		GetTempFileName
		execl
		execlp
		execle
		execv
		execvp
		system
		popen
		WinExec
		ShellExecute
		execl
		execlp
		execle
		execv
		execvp
		system
		popen
		WinExec
		ShellExecute
		CreateProcessAsUser
		CreateProcessWithLogon
		CreateProcess
		atoi
		atol
		drand48
		erand48
		jrand48
		lcong48
		lrand48
		mrand48
		nrand48
		random
		seed48
		setstate
		srand
		strfry
		srandom
		crypt
		EVP_des_ecb
		EVP_des_cbc
		EVP_des_cfb
		EVP_des_ofb
		EVP_desx_cbc
		EVP_rc4_40
		EVP_rc2_40_cbc
		EVP_rc2_64_cbc
		chroot
		getenv
		curl_getenv
		g_get_home_dir
		g_get_tmp_dir
		SetThreadToken
		InitializeCriticalSection
		EnterCriticalSection
		LoadLibrary
		LoadLibraryEx
		SetSecurityDescriptorDacl
		AddAccessAllowedAce
		getlogin
		cuserid
		getpw
		getpass
		gsignal
		ssignal
		memalign
		ulimit
		usleep
		recv
		recvfrom
		recvmsg
		fread
		readv
	]
}


# While this is obviously not necessary, assembling the payload hash
# thusly makes it a bit easier/faster to turn on/off the various
# payloads to scan for.
#
# @note: actually, the above is incorrect, in this case - at least
# until we break this up into more than one group.
$payloads[:cc] ||= {}
$payloads[:cc][:dangerous_functions] = c_payloads[:dangerous_functions]

# `ack-grep --help-types` reveals that cc and cpp are used for C and C++
# files respectively. It'll just be easiest to duplicate the payloads
# here. This is probably not ideal, and something to revisit later if
# I ever choose to move away from ack-grep.
$payloads[:cpp] ||= {}
$payloads[:cpp][:dangerous_functions] = c_payloads[:dangerous_functions]
