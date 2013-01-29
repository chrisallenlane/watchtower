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

    // hides each poi's content
    poiHideContent: function(obj){
        var next_text = ($(obj).text() == 'Hide') ? 'Show' : 'Hide';
        $(obj).text(next_text);
        var poi = $(obj).parents('div.point_of_interest');
        $(poi).toggleClass('poi_hidden');
        $(poi).children('div.poi_content').fadeToggle();
        wt.data_store.save();
    },

    // marks the poi as "ok" or "bad"
    poiMark: function(obj, mark){
        var poi = $(obj).parents('div.point_of_interest');
        // toggle the classes of both the pois and the links
        if(mark == 'ok'){
            $(poi).toggleClass('poi_ok');
            $(poi).removeClass('poi_dubious');
            $(poi).removeClass('poi_bad');
        } else if(mark == 'dubious'){
            $(poi).removeClass('poi_ok');
            $(poi).toggleClass('poi_dubious');
            $(poi).removeClass('poi_bad');
        } else if(mark == 'bad'){
            $(poi).removeClass('poi_ok');
            $(poi).removeClass('poi_dubious');
            $(poi).toggleClass('poi_bad');
        }
        wt.data_store.save();
    },

    // shows only the pois specified
    showPoi: function(mode){
        // @note: this is just too slow to render with show(), so don't try.
        // The animations perform terribly.
        if(mode == 'all'){
            $('div.point_of_interest').css('display', 'block');
        } else if(mode == 'ok'){
            $('div.point_of_interest').css('display', 'none');
            $('div.point_of_interest.poi_ok').css('display', 'block');
        } else if(mode == 'dubious'){
            $('div.point_of_interest').css('display', 'none');
            $('div.point_of_interest.poi_dubious').css('display', 'block');
        } else if(mode == 'bad'){
            $('div.point_of_interest').css('display', 'none');
            $('div.point_of_interest.poi_bad').css('display', 'block');
        }
        
        // hide the signature groups which have no signatures to display
        $('div.signature_group').show();
        if(mode == 'ok' || mode == 'dubious' || mode == 'bad'){
            $('div.signature_group').each(function(index, element){
                if($(this).find('div.point_of_interest.poi_' + mode).length == 0){
                    $(this).hide();
                }
            });
        }
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
