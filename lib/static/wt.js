var wt = {
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
        if(pin_link.html() == 'pin'){
            $('div.column_nav').css('position', 'fixed');
            pin_link.html('unpin');
        } else {
            $('div.column_nav').css('position', 'relative');
            pin_link.html('pin')
        }
    },
},
