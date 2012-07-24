$signatures[:java] ||= {}
$signatures[:java][:file_access] = [
    # File access
    Signature.new({:literal => 'new FileInputStream'}),
    Signature.new({:literal => 'new FileOutputStream'}),
    Signature.new({:literal => 'new FileReader'}),
    Signature.new({:literal => 'new FileWriter'}),
    Signature.new({:literal => 'new File'}),
]

$signatures[:java][:db_access] = [
    # DB access
    # no PreparedStatement -> potentially vulnerable
    Signature.new({:literal => 'createStatement'}),
    Signature.new({:literal => '.execute'}),
    Signature.new({:literal => '.executeQuery'}),
    Signature.new({:literal => 'Statement.execute'}),
    Signature.new({:literal => 'Statement.executeQuery'}),
]

$signatures[:java][:external_process] = [
    # External Process
    Signature.new({:literal => 'Runtime.getRuntime'}),
    Signature.new({:literal => 'Runtime.Exec'}),
    Signature.new({:literal => 'Process'}),
]

$signatures[:java][:HTTP_request] = [
    # HTTP redirect/playing with response headers
    Signature.new({:literal => '.sendRedirect'}),
    Signature.new({:literal => '.setStatus'}),
    Signature.new({:literal => '.addHeader'}),
    Signature.new({:literal => '.getParameter'}),
    Signature.new({:literal => '.getHeader'}),
]

$signatures[:java][:Crypto_and_Keystore]= [
    # Keystore/Crypto usage
    Signature.new({:literal => 'KeyStore.'}),
    Signature.new({:literal => 'PrivateKey'}),
    Signature.new({:literal => 'SamlAuthToken'}),
]
