jQuery(function(){
	jQuery('nav.resp a').bind('click', function(e){
		if (jQuery('nav.resp').hasClass('active')){
			jQuery('nav.resp').removeClass('active');
		}		
	});
	jQuery('#nav-button').on('click', function(e){
		jQuery('nav.resp').toggleClass('active');
	});
});

document.addEventListener( 'wpcf7mailsent', function( event ) {
    location = '/thankyou/';
}, false );