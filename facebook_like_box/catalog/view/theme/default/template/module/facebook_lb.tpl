<div class="box">
	<div class="fb-like-box" data-href="<?php echo $page_url; ?>" data-width="<?php echo $width; ?>"  data-height="<?php echo $height; ?>" data-show-faces="<?php echo $show_faces; ?>" data-stream="<?php echo $show_stream; ?>" data-header="<?php echo $show_header; ?>" data-colorscheme="<?php echo $color_scheme; ?>" data-border-color="<?php echo $border_color; ?>"></div>
</div>	

<div id="fb-root"></div>
<script>
	if ($('.ocx-deal').length == 0) {
		window.fbAsyncInit = function() {
			FB.init({
				<?php if ($flb_app_id) { ?>
				appId      : '<?php echo $flb_app_id; ?>', // App ID
				<?php } ?>
				status     : true,
				cookie     : true, 
				xfbml      : true 
			});
			
			
		};

		// Load the SDK Asynchronously
		(function(d){
			var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
			js = d.createElement('script'); js.id = id; js.async = true;
			js.src = "//connect.facebook.net/en_US/all.js";
			d.getElementsByTagName('head')[0].appendChild(js);
		}(document));
	}	
</script>


 
