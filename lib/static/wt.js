/* The main wt object */
var wt = {

    // sets the highlighting on or off
    setHighlight: function(mode){
        var bg_color = (mode === 'on') ? 'yellow' : 'transparent' ;
        $('span.match_highlight').css('background-color', bg_color);
    },

    // toggles the pin status of the sidebar
    togglePin: function(){
        // get a handle on the necessary objects
        var pin_link = $('div.column_nav span.pin a');

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
