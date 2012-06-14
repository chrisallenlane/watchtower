// initializes the tabbed display and sortable pois
jQuery(document).ready(function(){
	$('div#main').tabs();
	/*
	// This is causing problems when clicking on pois with scrollbars
	$('.sortable').sortable();
	$('.sortable').children('div.poi_content').click(function(){
		$('.sortable').sortable('disable');
	});
	*/
	
	// animate opacity on the control bar
	$('#control_bar').hover(
		function(){	$(this).fadeTo('fast', 1); },
		function(){ $(this).fadeTo('fast', 0.75); }
	);
    
    // local storage
    if(typeof(Storage) !== 'undefined'){
        console.log('Local storage is available!');

        // initialize the datastore object
        data_store  = {
            // taking a very simple (and lazy) approach to save/load here
            save: function(){ localStorage.data_store_html = $('div#main').html(); },
            load: function(){
                if(localStorage.data_store_html != null){
                    $('div#main').html(localStorage.data_store_html);
                }
            }
        }
        data_store.load();
    } else {
        console.log('Local storage is not available.');
    }
});

// shows/hides payload groups
function toggleSignatureGroup(obj, group){
	sym     = $(obj).children('span.expand_collapse').text();
	new_sym = (sym == '-') ? '+' : '-' ;
	$(obj).children('span.expand_collapse').text(new_sym);
	$('ul.signature_group_' + group).fadeToggle();
	$('div.signature_group_' + group).fadeToggle();
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
}

// hides each poi's content
function poiHideContent(obj){
	next_text = ($(obj).text() == 'Hide') ? 'Show' : 'Hide';
	$(obj).text(next_text);
	poi = $(obj).parents('div.point_of_interest');
	$(poi).addClass('poi_hidden');
    $(poi).children('div.poi_content').fadeToggle();
}

// marks the poi as "ok" or "bad"
function poiMark(obj, mark){
	poi = $(obj).parents('div.point_of_interest');
	// toggle the classes of both the pois and the links
	if(mark == 'ok'){
		$(poi).removeClass('poi_bad');
		$(poi).toggleClass('poi_ok');
		$(poi).children('span.poi_mark_content').children('a.poi_bad').removeClass('selected');
		$(poi).children('span.poi_mark_content').children('a.poi_ok').toggleClass('selected');
	} else if(mark == 'bad'){
		$(poi).removeClass('poi_ok');
		$(poi).toggleClass('poi_bad');
		$(poi).children('span.poi_mark_content').children('a.poi_ok').removeClass('selected');
		$(poi).children('span.poi_mark_content').children('a.poi_bad').toggleClass('selected');
	}
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
		
	} else if(mode == 'bad'){
		$('div.point_of_interest').css('display', 'none');
		$('div.point_of_interest.poi_bad').css('display', 'block');
	}
	
	// hide the signature groups which have no signatures to display
	$('div.signature_group').show();
	if(mode == 'ok' || mode == 'bad'){
		$('div.signature_group').each(function(index, element){
			if($(this).find('div.point_of_interest.poi_' + mode).length == 0){
				$(this).hide();
			}
		});
	}
}

// sets the highlighting on or off
function setHighlight(mode){
	if(mode == 'on'){
		$('span.match_highlight').css('background-color', 'yellow');
	} else {
		$('span.match_highlight').css('background-color', 'transparent');
	}
}
