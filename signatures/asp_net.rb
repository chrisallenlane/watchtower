#@todo antisnatchor: improve the list
$signatures[:asp_net] ||= {}
$signatures[:asp_net][:dangerous_functions] = [
    # File access
    Signature.new({:literal => 'FileStream'}),
    Signature.new({:literal => 'StreamReader'}),
    Signature.new({:literal => 'StreamWriter'}),

    # DB access
    Signature.new({:literal => 'SqlCommand'}),
    Signature.new({:literal => 'SqlDataAdapter'}),
    Signature.new({:literal => 'OleDbCommand'}),
    Signature.new({:literal => 'OdbcCommand'}),
    Signature.new({:literal => 'SqlCeCommand'}),

    # External Process
    Signature.new({:literal => 'Process.Start'}),
    Signature.new({:literal => 'ProcessStartInfo'}),

    # HTTP redirect/playing with response headers
    Signature.new({:literal => 'HttpResponse.Redirect'}),
    Signature.new({:literal => 'HttpResponse.Status'}),
    Signature.new({:literal => 'HttpResponse.StatusCode'}),
    Signature.new({:literal => 'HttpResponse.AddHeader'}),
    Signature.new({:literal => 'HttpResponse.AppendHeader'}),

]
