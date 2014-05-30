<?php if ($error) { ?>
<div class="warning"><?php echo $error; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<table class="list">
  <thead>
    <tr>
      <td class="left"><b><?php echo $column_date_added; ?></b></td>
      <td class="left"><b><?php echo $column_comment; ?></b></td>
      <td class="left"><b><?php echo $column_status; ?></b></td>
      <td class="left"><b><?php echo $column_notify; ?></b></td>
<td class="left" width="50"><b><?php echo $column_delete_history; ?></b></td>
    </tr>
  </thead>
  <tbody>
    <?php if ($histories) { ?><?php $history_num='0'; ?>
	<?php foreach ($histories as $history) { ?><?php $history_num++; ?>
		<tr>
			<td class="left"><?php echo $history['date_added']; ?></td>
			<td class="left"><?php echo $history['comment']; ?></td>
			<?php if ($history['status']       == "Полностью готово / Complete") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Complete") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Collected") { ?><td class="left"><font color="green"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Готов к отправке / Processed") { ?><td class="left"><font color="magenta"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Обработка / Processing") { ?><td class="left"><font color="blue"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Посылка отправлена / Shipped") { ?><td class="left"><font color="brown"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Счёт оплачен, заказ в очереди") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Pre-order") { ?><td class="left"><font color="red"><?php echo $history['status']; ?></font></td>
			<?php } elseif ($history['status'] == "Отменен / Canceled") { ?><td class="left"><font color="grey"><?php echo $history['status']; ?></font></td>
			<?php } else { ?> <td class="left"><?php echo $history['status']; ?></td>
			<?php } ?>
			
			<td class="left"><?php echo $history['notify']; ?></td>
			<td class="center"><?php if($history_num > '1' && $history['notify_bool'] != True)
				{ ?><a id="delete-order-history-<?php echo $history['order_history_id']; ?>" onclick="confirmOrderHistory('<?php echo $history['order_history_id']; ?>');">
					<img src="view/image/delete.png" alt="<?php echo $column_delete_history; ?>" /></a><? 
				} ?></td>
		</tr>
	<?php } ?>
	<?php } else { ?>
		<tr>      <td class="center" colspan="4"><?php echo $text_no_results; ?></td>    </tr>    
	<?php } ?>
  </tbody>
</table>
<div class="pagination"><?php echo $pagination; ?></div>

<script language="javascript">
function confirmOrderHistory(order_history_id){
	if(confirm('<?php echo $text_confirm_delete_history; ?>')){
		deleteOrderHistory(order_history_id);
	}
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
</script>