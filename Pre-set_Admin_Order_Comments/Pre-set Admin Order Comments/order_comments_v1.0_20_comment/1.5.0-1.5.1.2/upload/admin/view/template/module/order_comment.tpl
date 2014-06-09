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
		<div id="tabs" class="vtabs">
			<a href="#tab_comment1"><?php echo $tab_comment1; ?></a>
			<a href="#tab_comment2"><?php echo $tab_comment2; ?></a>
			<a href="#tab_comment3"><?php echo $tab_comment3; ?></a>
			<a href="#tab_comment4"><?php echo $tab_comment4; ?></a>
			<a href="#tab_comment5"><?php echo $tab_comment5; ?></a>
			<a href="#tab_comment6"><?php echo $tab_comment6; ?></a>
			<a href="#tab_comment7"><?php echo $tab_comment7; ?></a>
			<a href="#tab_comment8"><?php echo $tab_comment8; ?></a>
			<a href="#tab_comment9"><?php echo $tab_comment9; ?></a>
			<a href="#tab_comment10"><?php echo $tab_comment10; ?></a>
			<a href="#tab_comment11"><?php echo $tab_comment11; ?></a>
			<a href="#tab_comment12"><?php echo $tab_comment12; ?></a>
			<a href="#tab_comment13"><?php echo $tab_comment13; ?></a>
			<a href="#tab_comment14"><?php echo $tab_comment14; ?></a>
			<a href="#tab_comment15"><?php echo $tab_comment15; ?></a>
			<a href="#tab_comment16"><?php echo $tab_comment16; ?></a>
			<a href="#tab_comment17"><?php echo $tab_comment17; ?></a>
			<a href="#tab_comment18"><?php echo $tab_comment18; ?></a>
			<a href="#tab_comment19"><?php echo $tab_comment19; ?></a>
			<a href="#tab_comment20"><?php echo $tab_comment20; ?></a>
		</div>
		<div id="tab_comment1" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com1_title; ?></td>
					<td><input type="text" name="com1_title" value="<?php	echo $com1_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com1_contents; ?></td>
					<td><textarea name="com1_contents" id="com1_contents" rows="10" cols="100"><?php echo $com1_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment2" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com2_title; ?></td>
					<td><input type="text" name="com2_title" value="<?php echo $com2_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com2_contents; ?></td>
					<td><textarea name="com2_contents" id="com2_contents" rows="10" cols="100"><?php echo $com2_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment3" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com3_title; ?></td>
					<td><input type="text" name="com3_title" value="<?php echo $com3_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com3_contents; ?></td>
					<td><textarea name="com3_contents" id="com3_contents" rows="10" cols="100"><?php echo $com3_contents;?></textarea></td>
				</tr>
			</table>
		</div>
		
		<div id="tab_comment4" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com4_title; ?></td>
					<td><input type="text" name="com4_title" value="<?php echo $com4_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com4_contents; ?></td>
					<td><textarea name="com4_contents" id="com4_contents" rows="10" cols="100"><?php echo $com4_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment5" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com5_title; ?></td>
					<td><input type="text" name="com5_title" value="<?php echo $com5_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com5_contents; ?></td>
					<td><textarea name="com5_contents" id="com5_contents" rows="10" cols="100"><?php echo $com5_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment6" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com6_title; ?></td>
					<td><input type="text" name="com6_title" value="<?php echo $com6_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com5_contents; ?></td>
					<td><textarea name="com6_contents" id="com6_contents" rows="10" cols="100"><?php echo $com6_contents;?></textarea></td>
				</tr>
			</table>
		</div>
		
		<div id="tab_comment7" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com7_title; ?></td>
					<td><input type="text" name="com7_title" value="<?php echo $com7_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com7_contents; ?></td>
					<td><textarea name="com7_contents" id="com7_contents" rows="10" cols="100"><?php echo $com7_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment8" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com8_title; ?></td>
					<td><input type="text" name="com8_title" value="<?php echo $com8_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com8_contents; ?></td>
					<td><textarea name="com8_contents" id="com8_contents" rows="10" cols="100"><?php echo $com8_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment9" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com9_title; ?></td>
					<td><input type="text" name="com9_title" value="<?php echo $com9_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com9_contents; ?></td>
					<td><textarea name="com9_contents" id="com9_contents" rows="10" cols="100"><?php echo $com9_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment10" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com10_title; ?></td>
					<td><input type="text" name="com10_title" value="<?php echo $com10_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com10_contents; ?></td>
					<td><textarea name="com10_contents" id="com10_contents" rows="10" cols="100"><?php echo $com10_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment11" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com11_title; ?></td>
					<td><input type="text" name="com11_title" value="<?php echo $com11_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com11_contents; ?></td>
					<td><textarea name="com11_contents" id="com11_contents" rows="10" cols="100"><?php echo $com11_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment12" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com12_title; ?></td>
					<td><input type="text" name="com12_title" value="<?php echo $com12_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com12_contents; ?></td>
					<td><textarea name="com12_contents" id="com12_contents" rows="10" cols="100"><?php echo $com12_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment13" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com13_title; ?></td>
					<td><input type="text" name="com13_title" value="<?php echo $com13_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com13_contents; ?></td>
					<td><textarea name="com13_contents" id="com13_contents" rows="10" cols="100"><?php echo $com13_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment14" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com14_title; ?></td>
					<td><input type="text" name="com14_title" value="<?php echo $com14_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com14_contents; ?></td>
					<td><textarea name="com14_contents" id="com14_contents" rows="10" cols="100"><?php echo $com14_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment15" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com15_title; ?></td>
					<td><input type="text" name="com15_title" value="<?php echo $com15_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com15_contents; ?></td>
					<td><textarea name="com15_contents" id="com15_contents" rows="10" cols="100"><?php echo $com15_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment16" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com16_title; ?></td>
					<td><input type="text" name="com16_title" value="<?php echo $com16_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com16_contents; ?></td>
					<td><textarea name="com16_contents" id="com16_contents" rows="10" cols="100"><?php echo $com16_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment17" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com17_title; ?></td>
					<td><input type="text" name="com17_title" value="<?php echo $com17_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com17_contents; ?></td>
					<td><textarea name="com17_contents" id="com17_contents" rows="10" cols="100"><?php echo $com17_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment18" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com18_title; ?></td>
					<td><input type="text" name="com18_title" value="<?php echo $com18_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com18_contents; ?></td>
					<td><textarea name="com18_contents" id="com18_contents" rows="10" cols="100"><?php echo $com18_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment19" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com19_title; ?></td>
					<td><input type="text" name="com19_title" value="<?php echo $com19_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com19_contents; ?></td>
					<td><textarea name="com19_contents" id="com19_contents" rows="10" cols="100"><?php echo $com19_contents;?></textarea></td>
				</tr>
			</table>
		</div>

		<div id="tab_comment20" class="vtabs-content">
			<table class="form">
				<tr>
					<td><?php echo $entry_com20_title; ?></td>
					<td><input type="text" name="com20_title" value="<?php echo $com20_title;	?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_com20_contents; ?></td>
					<td><textarea name="com20_contents" id="com20_contents" rows="10" cols="100"><?php echo $com20_contents;?></textarea></td>
				</tr>
			</table>
		</div>
		
	</form>
</div>
</div>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<?php echo $footer; ?>