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
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div id="tabs" class="htabs">
			<a href="#tab_comment1"><?php echo $tab_comment1; ?></a>
			<a href="#tab_comment2"><?php echo $tab_comment2; ?></a>
			<a href="#tab_comment3"><?php echo $tab_comment3; ?></a>
			<a href="#tab_comment4"><?php echo $tab_comment4; ?></a>
			<a href="#tab_comment5"><?php echo $tab_comment5; ?></a>
			<a href="#tab_comment6"><?php echo $tab_comment6; ?></a>
		</div>
		<div id="tab_comment1">
			<table class="form">
				<tr>
					<td><?php echo $entry_com1_title; ?></td>
					<td><input type="text" name="com1_title" value="<?php echo $com1_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com1_contents; ?></td>
					<td><textarea name="com1_contents" id="com1_contents" rows="10" cols=100"><?php echo $com1_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment2">
			<table class="form">
				<tr>
					<td><?php echo $entry_com2_title; ?></td>
					<td><input type="text" name="com2_title" value="<?php echo $com2_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com2_contents; ?></td>
					<td><textarea name="com2_contents" id="com2_contents" rows="10" cols=100"><?php echo $com2_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment3">
			<table class="form">
				<tr>
					<td><?php echo $entry_com3_title; ?></td>
					<td><input type="text" name="com3_title" value="<?php echo $com3_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com3_contents; ?></td>
					<td><textarea name="com3_contents" id="com3_contents" rows="10" cols=100"><?php echo $com3_contents;?></textarea></td>
				</tr>
			</table>
		</div>
		
		<div id="tab_comment4">
			<table class="form">
				<tr>
					<td><?php echo $entry_com4_title; ?></td>
					<td><input type="text" name="com4_title" value="<?php echo $com4_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com4_contents; ?></td>
					<td><textarea name="com4_contents" id="com4_contents" rows="10" cols=100"><?php echo $com4_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment5">
			<table class="form">
				<tr>
					<td><?php echo $entry_com5_title; ?></td>
					<td><input type="text" name="com5_title" value="<?php echo $com5_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com5_contents; ?></td>
					<td><textarea name="com5_contents" id="com5_contents" rows="10" cols=100"><?php echo $com5_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment6">
			<table class="form">
				<tr>
					<td><?php echo $entry_com6_title; ?></td>
					<td><input type="text" name="com6_title" value="<?php echo $com6_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com5_contents; ?></td>
					<td><textarea name="com6_contents" id="com6_contents" rows="10" cols=100"><?php echo $com6_contents;?></textarea></td>
				</tr>
			</table>
		</div>
	</form>
</div>
</div>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<?php echo $footer; ?>