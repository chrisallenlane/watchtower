<%

# Generate a unique name for the localStorage object for this report.
# This has to be done, because otherwise each report will share the
# same storage, which is bad.
watchtower_storage = 'watchtower' + Time.now.to_i.to_s

%>
// on-load initializations
jQuery(document).ready(function(){
    
    // initialize the tabbed display
	$('div#main').tabs();
	
	// animate opacity on the control bar
	$('#control_bar').hover(
		function(){	$(this).fadeTo('fast', 1); },
		function(){ $(this).fadeTo('fast', 0.75); }
	);
    
    // local storage
    if(typeof(Storage) !== 'undefined'){
        console.log('Local storage is available!');
        console.log('Saving to key: <%= watchtower_storage %>');
        data_store.load();
    } else {
        // warn the user that work will not be saved
        console.log('Local storage is not available.');
        $('p.warning#no_storage').fadeIn();
    }
});

