<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body >

<?php
$noOfElems = count($orders);

foreach ($orders as $index => $order) { 

  if($index == 0) {  ?><div style="page-break-inside : avoid;"><table><tr><?php }
  
	 ?> 
		  <td style="font-size:10px; vertical-align:top; padding-top:1mm;padding-bottom:1mm;padding-right:3mm;padding-left:3mm; border:1px; width:63mm; height: 30.63mm"><b><?php echo $text_to; ?></b><br />
		  <?php echo ucwords($order['shipping_address']) . "<br />" . $text_telephone . $order['telephone'] . ", ID=" . $order['order_id']; ?><br /></td>
	 <?php
	  
	  if($index % 3 == 2) { 
		echo "</tr></table></div>";     
		
		if($index + 1 != $noOfElems) { ?><div style="page-break-inside : avoid;"><table><tr><?php     }
	  }
	  
	  if($index + 1 == $noOfElems) {
		
		if($index % 3 == 0) { ?><td></td><td></td></tr></table></div><?php }
		if($index % 3 == 1) { ?><td></td></tr></table></div><?php }
		if($index % 3 == 2) { ?></tr></table></div><?php     }
	  }
  }
?>

</body>
</html>