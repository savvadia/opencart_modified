<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_page_url; ?></td>
            <td class="left"><?php echo $entry_dimension; ?></td>
            <td class="left"><?php echo $entry_color_scheme; ?></td>
            <td class="left"><?php echo $entry_faces; ?></td>
            <td class="left"><?php echo $entry_stream; ?></td>
            <td class="left"><?php echo $entry_header; ?></td>
            <td class="left"><?php echo $entry_border_color; ?></td>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
			<td class="left"><input type="text" name="facebook_lb_module[<?php echo $module_row; ?>][page_url]" value="<?php echo $module['page_url']; ?>" onchange="preview(<?php echo $module_row; ?>);" />
			<?php if (isset($error_page_url[$module_row])) { ?>
              <br /><span class="error"><?php echo $error_page_url[$module_row]; ?></span>
              <?php } ?></td>
			</td>
            <td class="left">
				<input type="text" name="facebook_lb_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="1"  onchange="preview(<?php echo $module_row; ?>);" />
			    <input type="text" name="facebook_lb_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="1" onchange="preview(<?php echo $module_row; ?>);" />
				<?php if (isset($error_dimension[$module_row])) { ?>
				<br /><span class="error"><?php echo $error_dimension[$module_row]; ?></span>
				<?php } ?></td>
			</td>
			</td>
			<td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][color_scheme]" onchange="preview(<?php echo $module_row; ?>);">
                <?php if ($module['color_scheme'] == 'light') { ?>
                <option value="light" selected="selected"><?php echo $text_color_scheme_light; ?></option>
                <option value="dark"><?php echo $text_color_scheme_dark; ?></option>
                <?php } else { ?>
                <option value="light"><?php echo $text_color_scheme_light; ?></option>
                <option value="dark" selected="selected"><?php echo $text_color_scheme_dark; ?></option>
                <?php } ?>
              </select></td>
			<td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][show_faces]" onchange="preview(<?php echo $module_row; ?>);">
                <?php if ($module['show_faces']) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>    
			<td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][show_stream]" onchange="preview(<?php echo $module_row; ?>);">
                <?php if ($module['show_stream']) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			<td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][show_header]" onchange="preview(<?php echo $module_row; ?>);">
                <?php if ($module['show_header']) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			<td class="left">#<input type="text" name="facebook_lb_module[<?php echo $module_row; ?>][border_color]" value="<?php echo $module['border_color']; ?>" size="1" class="cp" onchange="preview(<?php echo $module_row; ?>);" /></td>
            <td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="facebook_lb_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="facebook_lb_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
		  <tr>
			<td colspan="11"><div id="preview_<?php echo $module_row; ?>"></td>
		  </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="11"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="facebook_lb_module[' + module_row + '][page_url]" value="" onchange="preview(' + module_row + ');" /></td>';
	html += '    <td class="left"><input type="text" name="facebook_lb_module[' + module_row + '][width]" value="180" size="3" onchange="preview(' + module_row + ');" /> <input type="text" name="facebook_lb_module[' + module_row + '][height]" value="250" size="3" onchange="preview(' + module_row + ');"/></td>';	
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][color_scheme]" onchange="preview(' + module_row + ');">';
    html += '      <option value="light" selected="selected"><?php echo $text_color_scheme_light; ?></option>';
    html += '      <option value="dark"><?php echo $text_color_scheme_dark; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][show_faces]" onchange="preview(' + module_row + ');" >';
    html += '      <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
    html += '      <option value="0"><?php echo $text_no; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][show_stream]" onchange="preview(' + module_row + ');">';
    html += '      <option value="1"><?php echo $text_yes; ?></option>';
    html += '      <option value="0" selected="selected"><?php echo $text_no; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][show_header]" onchange="preview(' + module_row + ');">';
    html += '      <option value="1"><?php echo $text_yes; ?></option>';
    html += '      <option value="0" selected="selected"><?php echo $text_no; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left">#<input type="text" name="facebook_lb_module[' + module_row + '][border_color]" value="" size="1" class="cp" onchange="preview(' + module_row + ');" /></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="facebook_lb_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="facebook_lb_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '  <tr>';
	html += '  	 <td colspan="11"><br /><div id="preview_' + module_row + '"><br /></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}

function preview(module_row){
	var page_url     = encodeURIComponent( $('input[name=\'facebook_lb_module['+ module_row +'][page_url]\']').val());
	var width        = $('input[name=\'facebook_lb_module['+ module_row +'][width]\']').val();
	var height       = $('input[name=\'facebook_lb_module['+ module_row +'][height]\']').val();
	var color_scheme = $('select[name=\'facebook_lb_module['+ module_row +'][color_scheme]\']').val();
	var show_faces   = $('select[name=\'facebook_lb_module['+ module_row +'][show_faces]\']').val();
	var show_stream  = $('select[name=\'facebook_lb_module['+ module_row +'][show_stream]\']').val();
	var show_header  = $('select[name=\'facebook_lb_module['+ module_row +'][show_header]\']').val();
	var border_color = $('input[name=\'facebook_lb_module['+ module_row +'][border_color]\']').val();
	
	$.ajax({
		url: 'index.php?route=module/facebook_lb/preview&token=<?php echo $token; ?>',
		type: 'POST',
		data: 'page_url=' + page_url + '&width=' + width + '&height=' + height + '&color_scheme=' + color_scheme + '&show_faces=' + show_faces +'&show_stream=' + show_stream + '&show_header=' + show_header +'&border_color=' + border_color,
		success: function(data){
			$('#preview_'+module_row).html(data);
		}
	});
}
//--></script>

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


<?php echo $footer; ?>