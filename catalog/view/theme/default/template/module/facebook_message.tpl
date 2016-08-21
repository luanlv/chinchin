<div id="ocx-facebook-message" class="fbm-bottom fbm-<?php echo $display_position; ?> animated slideInUp">
	<div class="fbm-header">
		<?php if ($display_mode == 'icon') { ?>
		<a class="fbm-icon fbm-trigger" data-toggle="tooltip" title="<?php echo $widget_text; ?>"></a>
		<?php } else { ?>
		<a class="fbm-default fbm-trigger"><i class="fa fa-fw fa-comment-o"></i> <?php echo $widget_text; ?></a>
		<?php } ?>
	</div>
	<div class="fbm-message">
		<div class="fb-page" data-href="<?php echo $fb_page_url; ?>" data-tabs="messages" data-width="<?php echo $width; ?>" data-height="<?php echo $height; ?>" data-adapt-container-width="true" data-small-header="<?php echo $small_header; ?>" data-hide-cover="false" data-show-facepile="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="<?php echo $fb_page_url; ?>"><a href="<?php echo $fb_page_url; ?>"><?php echo $store_name; ?></a></blockquote></div></div>
	</div>	
</div>

<script type="text/javascript"><!--
window.fbAsyncInit = function() {
	FB.init({
		appId      : <?php echo $fb_app_id; ?>, 
		status     : true,
		cookie     : true,
		xfbml      : true
	});
};

// Load the SDK Asynchronously
(function(d){
	var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
	js = d.createElement('script'); js.id = id; js.async = true;
	js.src = "//connect.facebook.net/<?php echo $fb_locale; ?>/all.js";
	d.getElementsByTagName('head')[0].appendChild(js);
}(document));

$(document).ready(function(){
	$('#ocx-facebook-message .fbm-message').css({'width': '<?php echo $width; ?>px', 'height': '<?php echo $height; ?>px'});
	
	<?php if ($display_mode == 'default') { ?>
	$('#ocx-facebook-message .fbm-header').css({'width': '<?php echo $width; ?>px'});
	<?php } ?>
});	
//--></script>