<?php
    echo $header;
?><div id="content">  <div class="breadcrumb">    <?php
    foreach ($breadcrumbs as $breadcrumb)
    {
        echo $breadcrumb['separator'];?><a href="<?php echo $breadcrumb['href'];?>"><?php echo $breadcrumb['text'];?></a><?php
    }
?>  </div>

<div class="box">
	<div class="heading">
	<h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title;?></h1>
	
	<div class="buttons">
	<a onclick="window.open('<?php echo $sticker; ?>');" class="button"><?php echo $button_address; ?></a>
	<a onclick="location = '<?php echo $href_full_view;?>';" class="button"><?php echo $text_view;?></a>
	<a onclick="window.open('<?php echo $href_update; ?>');" class="button"><?php echo $text_edit; ?></a>
	<a onclick="window.open('<?php echo $invoice; ?>');" class="button"><?php echo $button_invoice; ?></a>
	<a onclick="location = '<?php echo $cancel;?>';" class="button"><?php echo $button_cancel;?></a>
	</div>
	
	<table class="form">
		<tr><td><?php echo $text_order_id;?></td><td>#<?php echo $order_id;?></td></tr>
		
		<?php
		if ($customer)
		{ ?> 
			<tr><td><?php echo $text_customer;?></td>
			<td><a href="<?php echo $customer;?>"><?php echo $firstname . "&nbsp;" . $lastname; ?></a> <?php echo $telephone . "&nbsp;" . $email; ?></td></tr><?php
		} else { ?>
			<tr><td><?php echo $text_customer;?></td>
			<td><?php echo $firstname . "&nbsp;" .  $lastname . ",&nbsp;" .  $email . "&nbsp;" . $telephone; ?></td></tr><?php
		} ?>

		<?php
		if ($order_status)
		{?>
			<tr><td><?php echo $text_order_status;?></td>
			<?php
			if ($order_status == "Полностью готово / Complete") { ?><td class="left"><font color="green"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Complete") { ?><td class="left"><font color="green"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Collected") { ?><td class="left"><font color="green"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Готов к отправке / Processed") { ?><td class="left"><font color="magenta"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Обработка / Processing") { ?><td class="left"><font color="blue"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Посылка отправлена / Shipped") { ?><td class="left"><font color="brown"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Счёт оплачен, заказ в очереди") { ?><td class="left"><font color="red"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Pre-order") { ?><td class="left"><font color="red"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Отменен / Canceled") { ?><td class="left"><font color="grey"><?php echo $order_status; ?></font></td><?php
            } elseif ($order_status == "Shipped") { ?><td class="left"><font color="magenta"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Accepted for shipping") { ?><td class="left"><font color="red"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Pending") { ?><td class="left"><font color="olive"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Complete") { ?><td class="left"><font color="green"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Collected") { ?><td class="left"><font color="pink"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Processing") { ?><td class="left"><font color="blue"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Store Collection") { ?><td class="left"><font color="red"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Pre-order") { ?><td class="left"><font color="red"><?php echo $order_status; ?></font></td><?php
			} elseif ($order_status == "Canceled") { ?><td class="left"><font color="grey"><?php echo $order_status; ?></font></td><?php

				} else {
				?><td id="order-status"><?php echo $order_status; ?></td><?php
			} ?>
			</tr><?php
		}?>

		<?php
		if ($comment) {?>
			<tr><td><?php echo $text_comment; ?></td><td><?php echo $comment;?></td></tr><?php 
		} ?>
	<tr><td><?php echo $text_date_added; ?></td><td><?php echo $date_added; ?></td></tr>
	</table>

<table class="form">
<tr><td></td><td><?php echo $text_payment_method; ?></td><td><?php echo $text_shipping_method; ?></td><td><?php echo "Refund info"; ?></td></tr>
<tr><td></td><td><?php echo $payment_method; ?><br><br><?php echo $payment_address; ?></td><td><?php echo $shipping_method; ?><br><br><?php echo $shipping_address; ?></td><td><?php echo $email; ?><br><?php echo $text_order_id;?>&nbsp;#<?php echo $order_id;?> - <?php echo $date_added; ?> - <?php echo $total; ?><br><?php echo $payment_address; ?></td></tr>
</table>

<table class="list">
<thead><tr>
	<td class="left"><?php echo $column_product;?></td>
	<td class="left"><?php echo $column_model;?></td>
	<td class="right"><?php echo $column_quantity; ?></td>
	<?php if($permission_allowed == True) {?>
		<td class="right"><?php echo $column_price; ?></td>
		<td class="right"><?php echo $column_total; ?></td>
	<?php } ?>
	</tr></thead>
	<tbody><?php
    foreach ($products as $product)
    {
		?><tr>
		<td class="left"><a href="<?php echo $product['href'];?>"><?php echo $product['name'];?></a><?php 
		foreach ($product['option'] as $option)
        {?>
			<br /><?php
            if ($option['type'] != 'file')
            {?>
				&nbsp;<small> - <?php
                echo $option['name'];?>: <?php
                echo $option['value'];?></small><?php
            }
            else
            {?>
				&nbsp;<small> - <?php
				echo $option['name'];?>: <a href="<?php echo $option['href'];?>"><?php 
				echo $option['value'];?></a></small><?php
            }?><?php
        }
		?></td>
		<td class="left"><?php echo $product['model'];?></td>
		<td class="right"><?php echo $product['quantity'];?></td>
		<?php if($permission_allowed == True) {?>
			<td class="right"><?php echo $product['price']; ?></td>
			<td class="right"><?php echo $product['total']; ?></td>
		<?php } ?>
		</tr><?php
    }?>
	</tbody>

	<?php if($permission_allowed == True) {?>
		<?php foreach ($totals as $totals) { ?>
		<tbody id="totals">
		<tr>
			<td colspan="4" class="right"><?php echo $totals['title']; ?>:</td>
			<td class="right"><?php echo $totals['text']; ?></td>
		</tr>
		</tbody>
		<?php } ?>
	<?php } ?>
	</table>
	
	<div id="history">	<table class="list">
	<thead><tr>
	<td class="left"><b><?php echo $column_date_added;?></b></td>
	<td class="left"><b><?php echo $column_comment;?></b></td>
	<td class="left"><b><?php echo $column_status;?></b></td>
<td class="left"><b><?php echo $column_user;?></b></td>
	<td class="left"><b><?php echo $column_notify;?></b></td>
	<td class="left" width="50"><b><?php echo $column_delete_history;?></b></td>
	</tr></thead>
	<tbody><?php
    if ($histories)
    {
        $history_num = '0';
        foreach ($histories as $history)
        {
            $history_num++; ?>
			
			<tr>
			<td class="left"><?php echo $history['date_added'];?></td>
			<td class="left"><?php echo $history['comment'];?></td>

			<?php if ($history['status'] == "Полностью готово / Complete") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Complete") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Collected") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Готов к отправке / Processed") { ?><td class="left"><font color="magenta"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Обработка / Processing") { ?><td class="left"><font color="blue"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Посылка отправлена / Shipped") { ?><td class="left"><font color="brown"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Счёт оплачен, заказ в очереди") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Pre-order") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Отменен / Canceled") { ?><td class="left"><font color="grey"><?php echo $history['status']; ?></font></td><?php
            } elseif ($history['status'] == "Shipped") { ?><td class="left"><font color="magenta"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Accepted for shipping") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Pending") { ?><td class="left"><font color="olive"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Complete") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Collected") { ?><td class="left"><font color="pink"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Processing") { ?><td class="left"><font color="blue"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Store Collection") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Pre-order") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td><?php
			} elseif ($history['status'] == "Canceled") { ?><td class="left"><font color="grey"><?php echo $history['status']; ?></font></td><?php
			} else { ?> <td class="left"><?php echo $history['status']; ?></td><?php
			} ?>
			
<td class="left"><?php echo $history['user']; ?></td>
			<td class="left"><?php echo $history['notify']; ?></td>
			<td class="center"><?php
			
            if ($history_num > '1' && $history['notify_bool'] != True)
            {?>
				<a id="delete-order-history-<?php echo $history['order_history_id'];?>" onclick="confirmOrderHistory('<?php echo $history['order_history_id'];?>');">
				<img src="view/image/delete.png" alt="<?php echo $column_delete_history; ?>" /></a><?
            }?>
			
			</td></tr><?php
        }
    }
    else
    {?>
		<tr><td class="center" colspan="4"><?php echo $text_no_results;?></td></tr><?php
    }?>
	</tbody></table></div>
	
	<table class="form">
	<tr>
	<td></td>
	<td>
</td></tr>

	<tr><td><?php echo $entry_comment; ?></td><td><textarea name="comment" id="comment" cols="40" rows="8" style="width: 99%"></textarea>
		
		<div style="margin-top: 10px; text-align: right;">
		<?php echo $entry_order_status;?>&nbsp;
		<select name="order_status_id"><?php
			foreach ($order_statuses as $order_statuses) {
				if ($order_statuses['order_status_id'] == $order_status_id)
				{?>
					<option value="<?php echo $order_statuses['order_status_id'];?>" selected="selected"><?php echo $order_statuses['name'];?></option><?php
				} else {?>
					<option value="<?php echo $order_statuses['order_status_id'];?>"><?php echo $order_statuses['name'];?></option> <?php
				}
			}?>
		</select>
	
		<?php	
		if($permission_allowed == False) { ?>
			<input type="hidden" id="notify" name="notify" value="1" id="notify_checkbox"/><?php 
			echo $this->language->get('text_no');
		} else { ?>
			<input type="checkbox" id="notify" name="notify" value="1" /><?php
		}?>
		<a id="button-notify" class="button" onclick="notifyCustomer();"><?php echo $entry_notify;?></a>
		<a id="button-history" class="button"><?php echo $button_add_history;?></a>
		</div>
		
	</td>
</tr>
</table>		

<?php if ($com1_title)  {?><?php echo "<div style=\"margin-top: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com1_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com1_title; ?></a></div> <?php } ?>
<?php if ($com2_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com2_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com2_title; ?></a></div> <?php } ?>
<?php if ($com3_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com3_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com3_title; ?></a></div> <?php } ?>
<?php if ($com4_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com4_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com4_title; ?></a></div> <?php } ?>
<?php if ($com5_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com5_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com5_title; ?></a></div> <?php } ?>
<?php if ($com6_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com6_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com6_title; ?></a></div> <?php } ?>
<?php if ($com7_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com7_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com7_title; ?></a></div> <?php } ?>
<?php if ($com8_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com8_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com8_title; ?></a></div> <?php } ?>
<?php if ($com9_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com9_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com9_title; ?></a></div> <?php } ?>
<?php if ($com10_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com10_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com10_title; ?></a></div> <?php } ?>
<?php if ($com11_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com11_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com11_title; ?></a></div> <?php } ?>
<?php if ($com12_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com12_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com12_title; ?></a></div> <?php } ?>
<?php if ($com13_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com13_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com13_title; ?></a></div> <?php } ?>
<?php if ($com14_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com14_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com14_title; ?></a></div> <?php } ?>
<?php if ($com15_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com15_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com15_title; ?></a></div> <?php } ?>
<?php if ($com16_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com16_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com16_title; ?></a></div> <?php } ?>
<?php if ($com17_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com17_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com17_title; ?></a></div> <?php } ?>
<?php if ($com18_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com18_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com18_title; ?></a></div> <?php } ?>
<?php if ($com19_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com19_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com19_title; ?></a></div> <?php } ?>
<?php if ($com20_title)  {?><?php echo "<div style=\"margin-top: 10px; margin-left: 10px; text-align: right; float: left;\"><a onclick=\"orcom('$com20_comment');\" id=\"orcom\" class=\"button\">"; ?>
                           <?php echo $com20_title; ?></a></div> <?php } ?>

						   
<div style="margin-top: 10px; margin-left: 10px; text-align: right; float: left;"><a onclick="orcom('');" id="orcom" class="button">Clear</a></div></div>
<div style="margin-top: 10px; margin-left: 10px; text-align: right; float: left;"><a href="<?php echo $this->url->link('module/order_comment', 'token=' . $this->session->data['token'], 'SSL'); ?>" id="orcom" class="button">Set</a></div></div>

<script type="text/javascript">
$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	
	return false;
});			

$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&short');

$('#button-history').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&short',
		type: 'post',
		dataType: 'html',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0) + '&append=' + encodeURIComponent($('input[name=\'append\']').attr('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').prepend('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#history').html(html);
			
			$('textarea[name=\'comment\']').val('');
			
			$('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
		}
	});
});

function notifyCustomer(text) {
	if(document.getElementById('notify').checked == true)
		document.getElementById('notify').checked = false;
	else
		document.getElementById('notify').checked = true;
} 

function orcom(text) {
document.getElementById('comment').value = text;
} 

function deleteOrderHistory(order_history_id){
	  $.ajax({
	  type: 'GET',
	  url: 'index.php?route=sale/order/deleteOrderHistory',
	  dataType: 'html',
	  data: 'token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&order_history_id='+order_history_id,
	  beforeSend: function() {
		  $('#delete-order-history-'+order_history_id).after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
	  },
	  complete: function() {
		  $('.loading').remove();
	  },
	  success: function(html) {
		  $('#history').html(html);
	  }
  });
}

//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<?php echo $footer; ?>


