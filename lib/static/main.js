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

        // initialize the datastore object
        data_store = {
            save: function(){
                poi_classes = [];
                
                // Iterate over the PoIs. Save the class of each
                // that has been marked.
                $('div.point_of_interest').each(function(index, element){                    
                    the_classes = $(element).attr('class');
                    // don't bother saving information for the unmarked
                    if(the_classes != 'point_of_interest'){
                        poi_classes[index] = the_classes;
                    }
                });
                localStorage.<%= watchtower_storage %> = window.JSON.stringify(poi_classes);
            },
            
            load: function(){
                // verify that a localstorage object exists
                if(localStorage.<%= watchtower_storage %> != null){
                    
                    // unpack the saved classes back into an array
                    poi_classes = jQuery.parseJSON(localStorage.<%= watchtower_storage %>);
                    
                    // do this.save(), but in reverse
                    $('div.point_of_interest').each(function(index, element){
                        if(poi_classes[index] != null){
                            $(element).attr('class', poi_classes[index]);
                        }
                    });
                    
                    // hide the appropriate PoIs
                    $('div.point_of_interest.poi_hidden div.poi_content').hide();
                    $('div.point_of_interest.poi_hidden span.poi_mark_content a.poi_hide').text('Show');
                }
            }
        }
        data_store.load();
    } else {
        // warn the user that work will not be saved
        console.log('Local storage is not available.');
        $('p.warning#no_storage').fadeIn();
    }
});

// shows/hides payload groups
function toggleSignatureGroup(obj, group){
	sym     = $(obj).children('span.expand_collapse').text();
	new_sym = (sym == '-') ? '+' : '-' ;
	$(obj).children('span.expand_collapse').text(new_sym);
	$('ul.signature_group_' + group).fadeToggle();
	$('div.signature_group_' + group).fadeToggle();
    data_store.save();
}

// shows/hides an individual signature
function toggleSignature(filetype, signature){
	obj      = $('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').last();
	new_text = ($(obj).text() == 'Show') ? 'Hide' : 'Show' ;
	$(obj).text(new_text);
	
	//modify the nav item
	$('div#filetype_' + filetype + ' div.column_nav ul li.' + signature + ' a').toggleClass('signature_hidden');
	//hide the signature
	$('div#filetype_' + filetype + ' div.signature_' + signature).fadeToggle();
    data_store.save();
}

// hides each poi's content
function poiHideContent(obj){
	next_text = ($(obj).text() == 'Hide') ? 'Show' : 'Hide';
	$(obj).text(next_text);
	poi = $(obj).parents('div.point_of_interest');
	$(poi).toggleClass('poi_hidden');
    $(poi).children('div.poi_content').fadeToggle();
    data_store.save();
}

// marks the poi as "ok" or "bad"
function poiMark(obj, mark){
	poi = $(obj).parents('div.point_of_interest');
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
    data_store.save();
}

// shows only the pois specified
function showPoi(mode){
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
    data_store.save();
}

// sets the highlighting on or off
function setHighlight(mode){
	if(mode == 'on'){
		$('span.match_highlight').css('background-color', 'yellow');
	} else {
		$('span.match_highlight').css('background-color', 'transparent');
	}
}
