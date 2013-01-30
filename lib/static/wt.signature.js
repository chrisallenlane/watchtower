/* Signatures */
wt.signature = {
    
    // shows/hides an individual signature
    toggle: function(filetype, signature){
        var obj      = $('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').last();
        var new_text = (obj.text() == 'Show') ? 'Hide' : 'Show' ;
        obj.text(new_text);
        
        //modify the nav item
        $('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').toggleClass('signature_hidden');
        //hide the signature
        $('div#filetype_' + filetype + ' div.signature_' + signature).fadeToggle();
        wt.data_store.save();
    },

    // shows/hides payload groups
    toggle_group: function(obj, group){
        var sym     = $(obj).children('span.expand_collapse').text();
        var new_sym = (sym == '-') ? '+' : '-' ;
        $(obj).children('span.expand_collapse').text(new_sym);
        $('ul.signature_group_' + group).fadeToggle();
        $('div.signature_group_' + group).fadeToggle();
        wt.data_store.save();
    },

},
