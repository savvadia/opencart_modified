<?php echo $header; ?>
<style type="text/css">
	#searchBar {float:right}
	#searchWord {font-style:italic;font-size:17px;}
	#searchQuestion{margin-left:10px;margin-right:10px};
	#resetSearch {font-size:14px;font-style:italic;margin-left:10px;}
	#list{clear:both;}
</style>

	<script>
	$(document).ready(function() {
	//	$('.accordion').accordion({collapsible: true, autoHeight: false, active: false})
	listQuestions();
	});
	</script>	
<div class="container"><?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content"><?php echo $content_top; ?>
    <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
    </div>
    <h1 style="display:block;float:left;"><?php echo $heading_title;?></h1>
    <div id="searchBar"><strong id="searchWord"><?php echo $text_search;?></strong><input id="searchQuestion" type="text" size="35"/><span><a id="resetSearch"><?php echo $text_resetSearch;?></a></span></div>
    <div id="list">
	</div>     	 	
</div>
</div>
<?php 
echo "<script type=text/javascript>	
	function listQuestions(){
		$.ajax({
			type: 'post',
			url:'".$linkListQuestions."',
			dataType:'text',
			success: function(text)
			{
				$('#list').html(text);
				$('.accordion').accordion({collapsible: true, autoHeight: false, active: false})
			},
			error: function()
			{
				alert('Error, cannot contact the server');
			}
		})
	}	

	$('#searchQuestion').keyup(function(){
		if($('#searchQuestion').val() != ''){
			$.ajax({
				type: 'post',
				url:'".$linkSearch."',
				dataType:'text',
				data:'query='+escape(encodeURIComponent($('#searchQuestion').val())),
				success: function(text)
				{
					$('#list').html(text);
					$('.accordion').accordion({collapsible: true, autoHeight: false, active: false})
				},
				error: function()
				{
					alert('Error, cannot contact the server');
				}
			})
		}
		
		return false;
	});
	
	$('#resetSearch').click(function(){
		$('#searchQuestion').val('');
		listQuestions();
	});
</script>";
?>
<?php echo $footer; ?>