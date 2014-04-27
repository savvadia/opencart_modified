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
      <h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="low_order_fee_for_zones_status">
                <?php if ($low_order_fee_for_zones_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="low_order_fee_for_zones_sort_order" value="<?php echo $low_order_fee_for_zones_sort_order; ?>" size="1" /></td>
          </tr>
          <tr>
		<td colspan="2">
			<table>
				<tr>
					<td><b>Low Order Zone</b></td>
					<td><b>Low Order Zone Total</b></td>
					<td><b>Low Order Zone Price</b></td>
				</tr>
				<?php foreach ($geo_zones as $geo_zone) { ?>
				<tr>
					<td><?php echo $geo_zone['name']; ?></td>
					<td><input type="text" name="<?php echo "total[".$geo_zone['geo_zone_id']."]"; ?>" value="<?php echo $geo_zone['low_order_total_for_zones_price']; ?>" /></td>
					<td><input type="text" name="<?php echo $geo_zone['geo_zone_id']; ?>" value="<?php echo $geo_zone['low_order_fee_for_zones_price']; ?>" /></td>
				</tr>
				<?php } ?>
			</table>
		</td>
          </tr>	  
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 