<div class="fb-like-box" data-href="<?php echo $page_url; ?>" data-width="<?php echo $width; ?>" data-show-faces="<?php echo $show_faces; ?>" data-stream="<?php echo $show_stream; ?>" data-header="<?php echo $show_header; ?>" data-colorscheme="<?php echo $color_scheme; ?>" data-border-color="<?php echo $border_color; ?>"></div>

<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({appId: '233016153426386', status: true, cookie: true,
     xfbml: true});
  };
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
    '//connect.facebook.net/en_US/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
</script>