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
    
     <table class="form" style="width:350px">
        <tr>
          <td ><?php echo $num_rec; ?></td>
            <td><input type="text" name="num_rec" value="<?php echo $num_rec_value; ?>" size="12" /></td>
          <td><a class="button"  onClick="filter()" ><?php echo $button_filter; ?></a></td>
        </tr>
      </table>
    
    
 <script type="text/javascript">
 <!--
 function Legend()
 {
 button_value=document.getElementById('legend').value
 if(button_value=="<?php echo $hide_legend; ?>")
 {
document.getElementById('legend').value="<?php echo $show_legend; ?>"
document.getElementById('legend_div').style.display='none'
 } else 
 {
document.getElementById('legend').value="<?php echo $hide_legend; ?>"
document.getElementById('legend_div').style.display='block'
 }
 }
 function Go(ElId)
 {
url = 'index.php?route=report/product_by_states&token=<?php echo $token; ?>&page=<?php echo $page; ?>';
var num_rec = $('input[name=\'num_rec\']').attr('value');
if (num_rec) {
		url += '&num_rec=' + encodeURIComponent(num_rec);
	}
url+='#'+ElId;
	location = url;
 }
 

function filter() {
	url = 'index.php?route=report/product_by_states&token=<?php echo $token; ?>';
	
	var num_rec = $('input[name=\'num_rec\']').attr('value');
	
	if (num_rec) {
		url += '&num_rec=' + encodeURIComponent(num_rec);
	}

	location = url;
}
//-->
 </script>

<a class="button" id="legend" onClick="Legend()"><?php echo $show_legend; ?></a>
<br>
<div id='legend_div' style="display:none">
      <fieldset>
  <legend><?php echo $legend; ?></legend>

<h3><?php echo $column_for_shipping; ?></h3> <ul>
               <?php if ($groups1) { ?>
          <?php foreach ($groups1 as $group1) { 
          echo "<li>".$group1['name']."</li>";}}
          ?>
          </ul>
<h3><?php echo $column_paid; ?></h3> <ul>
               <?php if ($groups2) { ?>
          <?php foreach ($groups2 as $group2) { 
          echo "<li>".$group2['name']."</li>";}}
          ?>
          </ul>
          
<h3><?php echo $column_wholesale; ?></h3> <ul>
               <?php if ($groups3) { ?>
          <?php foreach ($groups3 as $group3) { 
          echo "<li>".$group3['name']."</li>";}}
          ?>
          </ul>
  </fieldset>      
  </div>

  <h2><?php echo $header_table1 ?></h2>
  <a name="table1"></a>
  <a class="button" onClick="Go('table2')">To second table</a>

      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
            <td class="right"><?php echo $column_for_shipping; ?></td>
            <td class="right"><?php echo $column_paid; ?></td>
            <td class="right"><?php echo $column_wholesale; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { 
             ?>
          <tr>
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left"><?php echo $product['model']; ?></td>
            <td class="right"><?php echo $product['shipping']; ?></td>
            <td class="right"><?php echo $product['paid']; ?></td>
            <td class="right"><?php echo $product['wholesale']; ?></td>
          </tr>
          <?php } ?>
                <thead>
             <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
            <td class="right"><?php echo $column_for_shipping; ?></td>
            <td class="right"><?php echo $column_paid; ?></td>
            <td class="right"><?php echo $column_wholesale; ?></td>
          </tr>
                  </thead>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="pagination"><?php echo $pagination; ?></div>
      <h2><?php echo $header_table2 ?></h2>
        <a name="table2"></a>
  <a class="button" onClick="Go('table1')">To first table</a>

        <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
            <td class="right"><?php echo $column_for_shipping; ?></td>
            <td class="right"><?php echo $column_paid; ?></td>
            <td class="right"><?php echo $column_wholesale; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) {         ?>
          <tr>
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left"><?php echo $product['model']; ?></td>
            <td class="right"><?php echo $product['total_shipping']; ?></td>
            <td class="right"><?php echo $product['total_paid']; ?></td>
            <td class="right"><?php echo $product['total_wholesale']; ?></td>
          </tr>
          <?php } ?>
                <thead>
             <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
            <td class="right"><?php echo $column_for_shipping; ?></td>
            <td class="right"><?php echo $column_paid; ?></td>
            <td class="right"><?php echo $column_wholesale; ?></td>
          </tr>
                  </thead>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>