var wt = {
    // shows/hides payload groups
    toggleSignatureGroup: function(obj, group){
        var sym     = $(obj).children('span.expand_collapse').text();
        var new_sym = (sym == '-') ? '+' : '-' ;
        $(obj).children('span.expand_collapse').text(new_sym);
        $('ul.signature_group_' + group).fadeToggle();
        $('div.signature_group_' + group).fadeToggle();
        wt.data_store.save();
    },

    // shows/hides an individual signature
    toggleSignature: function(filetype, signature){
        var obj      = $('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').last();
        var new_text = ($(obj).text() == 'Show') ? 'Hide' : 'Show' ;
        $(obj).text(new_text);
        
        //modify the nav item
        $('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').toggleClass('signature_hidden');
        //hide the signature
        $('div#filetype_' + filetype + ' div.signature_' + signature).fadeToggle();
        wt.data_store.save();
    },


    // sets the highlighting on or off
    setHighlight: function(mode){
        if(mode == 'on'){
            $('span.match_highlight').css('background-color', 'yellow');
        } else {
            $('span.match_highlight').css('background-color', 'transparent');
        }
    },

    // toggles the pin status of the sidebar
    togglePin: function(){
        // get a handle on the necessary objects
        var pin_link = $('div.column_nav span.pin a');
        var side_bar = $('div.column_nav');

        // toggle the pin state
        if($(pin_link).html() == 'pin'){
            $('div.column_nav').css('position', 'fixed');
            $(pin_link).html('unpin');
        } else {
            $('div.column_nav').css('position', 'relative');
            $(pin_link).html('pin')
        }
    },
}
