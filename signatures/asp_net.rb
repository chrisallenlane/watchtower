#@todo antisnatchor: improve the list
$signatures[:asp_net] ||= {}
$signatures[:asp_net][:file_access] = [
    # File access
    Signature.new({:literal => 'FileStream'}),
    Signature.new({:literal => 'StreamReader'}),
    Signature.new({:literal => 'StreamWriter'}),
]

$signatures[:asp_net][:db_access] = [
    # DB access
    Signature.new({:literal => 'SqlCommand'}),
    Signature.new({:literal => 'SqlDataAdapter'}),
    Signature.new({:literal => 'OleDbCommand'}),
    Signature.new({:literal => 'OdbcCommand'}),
    Signature.new({:literal => 'SqlCeCommand'}),
    Signature.new({:literal => 'OracleCommand'}),
]

$signatures[:asp_net][:external_process] = [
    # External Process
    Signature.new({:literal => 'Process.Start'}),
    Signature.new({:literal => 'ProcessStartInfo'}),
]

$signatures[:asp_net][:HTTP_request] = [
    # HTTP redirect/playing with response headers
    Signature.new({:literal => 'HttpResponse.Redirect'}),
    Signature.new({:literal => 'HttpResponse.Status'}),
    Signature.new({:literal => 'HttpResponse.StatusCode'}),
    Signature.new({:literal => 'HttpResponse.AddHeader'}),
    Signature.new({:literal => 'HttpResponse.AppendHeader'}),
]
