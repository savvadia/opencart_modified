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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"></div>
    </div>
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td class="left"><?php if ($sort == 'o.date_modified') { ?>
                <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'o.order_id') { ?>
                <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'customer') { ?>
                <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_products; ?></td>
              <td class="left"></td>
              <td class="left"></td>
              <td class="left"><?php if ($sort == 'user') { ?>
                <a href="<?php echo $sort_user; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_user; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_user; ?>"><?php echo $column_user; ?></a>
                <?php } ?></td>
			  <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td><input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" size="12" class="date" /></td>
              <td align="right"><input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" size="4" style="text-align: right;" /></td>
              <td><input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" /></td>
              <td><select name="filter_order_status_id">
                  <option value="*"></option>
                  <?php if ($filter_order_status_id == '0') { ?>
                  <option value="0" selected="selected"><?php echo $text_missing; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_missing; ?></option>
                  <?php } ?>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
				<td></td>
				<td></td>
				<td></td>
              <td><input type="text" name="filter_user" value="<?php echo $filter_user; ?>" /></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>
            <?php if ($orders) { ?>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="left"><?php echo $order['date_modified']; ?>::<?php echo $order['order_history_id']; ?></td>
			  <td class="right"><a href="<?php echo $order['href_short']; ?>"><?php echo $order['order_id']; ?></a></td>
              <td class="left"><?php echo $order['customer']; ?></td>
 
                <?php if (strpos($order['status'], "Shipped") !== false) { ?><td class="left"><font color="brown"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Accepted for shipping") !== false) { ?><td class="left"><font color="red"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Pending") !== false) { ?><td class="left"><font color="olive"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Complete") !== false) { ?><td class="left"><font color="green"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Collected") !== false) { ?><td class="left"><font color="pink"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Processing") !== false) { ?><td class="left"><font color="blue"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Processed") !== false) { ?><td class="left"><font color="magenta"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Preparation for shipping") !== false) { ?><td class="left"><font color="magenta"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Store Collection") !== false) { ?><td class="left"><font color="red"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Pre-order") !== false) { ?><td class="left"><font color="red"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Cancelled") !== false) { ?><td class="left"><font color="grey"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Refunded") !== false) { ?><td class="left"><font color="grey"><?php echo $order['status']; ?></font></td>
				<?php } elseif (strpos($order['status'], "Refund requested") !== false) { ?><td class="left"><font color="orange"><?php echo $order['status']; ?></font></td>
                
				<?php } elseif ($order['status'] == "Счёт оплачен, заказ в очереди") { ?><td class="left"><font color="red"><?php echo $order['status']; ?></font></td>
				<?php } else { ?> <td class="left"><?php echo $order['status']; ?></td>
				<?php } ?>
 
              <td class="left"><?php echo $order['products']; ?></td>
              <td class="left"><?php echo $order['notify']; ?></td>
              <td class="left"><?php echo $order['comment']; ?></td>
              <td class="left"><?php echo $order['user']; ?></td>
              <td class="right"><?php foreach ($order['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
            <td class="center" colspan="11"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=sale/activity&token=<?php echo $token; ?>';
	var filter_order_id = $('input[name=\'filter_order_id\']').attr('value');
	if (filter_order_id) {
		url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
	}
	var filter_customer = $('input[name=\'filter_customer\']').attr('value');
	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
	if (filter_order_status_id != '*') {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}	
	var filter_total = $('input[name=\'filter_total\']').attr('value');
	if (filter_total) {
		url += '&filter_total=' + encodeURIComponent(filter_total);
	}	
	var filter_date_modified = $('input[name=\'filter_date_modified\']').attr('value');
	if (filter_date_modified) {
		url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
	}
	location = url;
}
//--></script>  
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				currentCategory = item.category;
			}
			self._renderItem(ul, item);
		});
	}
});
$('input[name=\'filter_customer\']').catcomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						category: item.customer_group,
						label: item.name,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_customer\']').val(ui.item.label);
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<?php echo $footer; ?>