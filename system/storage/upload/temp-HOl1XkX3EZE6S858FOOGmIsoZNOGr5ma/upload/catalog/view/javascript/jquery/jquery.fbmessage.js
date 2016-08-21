$(document).ready(function(){
	$('body').prepend('<div id="fb-root"></div>');

	$.ajax({
		url: 'index.php?route=module/facebook_message',
		success: function(html) {
			$('#ocx-facebook-message').remove();
			
			$('body').prepend(html);
		}
	});
	
	$('body').on('click', function(e){
		if ($(e.target).hasClass('fbm-trigger')) {
			FBMShowMessageArea();
		} else if ($('.fbm-message').hasClass('fbm-opened')) {
			FBMHideMessageArea();
		}
	});
});

function FBMShowMessageArea() {
	$('#ocx-facebook-message .fbm-header').hide();
	$('#ocx-facebook-message .fbm-message').addClass('fbm-opened').show();
}

function FBMHideMessageArea() {
	$('#ocx-facebook-message .fbm-header').show();
	$('#ocx-facebook-message .fbm-message').removeClass('fbm-opened').hide();
}