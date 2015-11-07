<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <table class="form">
        <tr>
          <td><?php echo $entry_date_start; ?>
            <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" /></td>
          <td><?php echo $entry_date_end; ?>
            <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" /></td>
          <td style="text-align: right;"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
        </tr>
      </table>
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
			
            <td class="right"><?php echo $column_q_to_ship; ?></td>
            <td class="right"><?php echo $column_q_sold; ?></td>
            <td class="right"><?php echo $column_q_ws_to_ship; ?></td>
            <td class="right"><?php echo $column_q_ws_sold; ?></td>

			<?php foreach ($order_statuses as $order_status) { ?>
			<td class="left"><?php echo $order_status['name']; ?></td>
			<?php } ?>			

            <td class="right"><?php echo $column_m_to_ship; ?></td>
            <td class="right"><?php echo $column_m_sold; ?></td>
            <td class="right"><?php echo $column_m_ws_to_ship; ?></td>
            <td class="right"><?php echo $column_m_ws_sold; ?></td>
			
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left"><?php echo $product['model']; ?></td>
			
            <td class="right"><?php echo $product['q_to_ship']; ?></td>
            <td class="right"><?php echo $product['q_sold']; ?></td>
            <td class="right"><?php echo $product['q_ws_to_ship']; ?></td>
            <td class="right"><?php echo $product['q_ws_sold']; ?></td>

			<?php foreach ($order_statuses as $order_status) { ?>
			<td class="left"><?php echo $product[$order_status['order_status_id']]['quantity']; ?></td>
			<?php } ?>			

            <td class="right"><?php echo $product['m_to_ship']; ?></td>
            <td class="right"><?php echo $product['m_sold']; ?></td>
            <td class="right"><?php echo $product['m_ws_to_ship']; ?></td>
            <td class="right"><?php echo $product['m_ws_sold']; ?></td>
			
			</tr>
			<?php } ?>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
			
            <td class="right"><?php echo $column_q_to_ship; ?></td>
            <td class="right"><?php echo $column_q_sold; ?></td>
            <td class="right"><?php echo $column_q_ws_to_ship; ?></td>
            <td class="right"><?php echo $column_q_ws_sold; ?></td>

			<?php foreach ($order_statuses as $order_status) { ?>
			<td class="left"><?php echo $order_status['name']; ?></td>
			<?php } ?>			

            <td class="right"><?php echo $column_m_to_ship; ?></td>
            <td class="right"><?php echo $column_m_sold; ?></td>
            <td class="right"><?php echo $column_m_ws_to_ship; ?></td>
            <td class="right"><?php echo $column_m_ws_sold; ?></td>
          </tr>

		  <tr>
            <td class="left"><?php echo "Total"; ?></td>
            <td class="left"></td>
			
            <td class="right"><?php echo "-"; ?></td>
            <td class="right"><?php echo "-"; ?></td>
            <td class="right"><?php echo "-"; ?></td>
            <td class="right"><?php echo "-"; ?></td>

			<?php foreach ($order_statuses as $order_status) { ?>
			<td class="left"><?php echo $order_status['total']; ?></td>
			<?php } ?>		

            <td class="right"><?php echo $m_to_ship; ?></td>
            <td class="right"><?php echo $m_sold; ?></td>
            <td class="right"><?php echo $m_ws_to_ship; ?></td>
            <td class="right"><?php echo $m_ws_sold; ?></td>
			</tr>
	  
          <?php } else { ?>
          <tr>
            <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="pagination"><?php echo $pagination; ?></div>
	  
	  <h3><?php echo $header_to_ship; ?></h3>
	      <?php foreach ($order_status_to_ship as $order_status_id) { ?>
			  <?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
				<p><?php echo $order_status_id . " - " . $order_status['name']; ?></p>
                <?php } ?>
              <?php } ?>
          <?php } ?>  

	  <h3><?php echo $header_sold; ?></h3>
	      <?php foreach ($order_status_sold as $order_status_id) { ?>
			  <?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
				<p><?php echo $order_status_id . " - " . $order_status['name']; ?></p>
                <?php } ?>
              <?php } ?>
          <?php } ?> 
		  
	  <h3><?php echo $header_ws_to_ship; ?></h3>
	      <?php foreach ($order_status_ws_to_ship as $order_status_id) { ?>
			  <?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
				<p><?php echo $order_status_id . " - " . $order_status['name']; ?></p>
                <?php } ?>
              <?php } ?>
          <?php } ?>
		  
	  <h3><?php echo $header_ws_sold; ?></h3>
	      <?php foreach ($order_status_ws_sold as $order_status_id) { ?>
			  <?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
				<p><?php echo $order_status_id . " - " . $order_status['name']; ?></p>
                <?php } ?>
              <?php } ?>
          <?php } ?> 
		  
		  
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/product_by_state&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}
	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
		
	location = url;
}
//--></script> 

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
	
	$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<?php echo $footer; ?>