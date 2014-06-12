<?php echo $header; ?>
<link rel="stylesheet" href="view/javascript/jquery/ui/themes/base/jquery.ui.all.css">
<style type="text/css">
	.titleForm{font-size:27px;margin-left: 15px;}
	.success, .warning {display:none;position:absolute;top:13&px;left:125px;font-weight:bold;font-style:italic;}
	#titleFormQuestion, #titleFormCat {margin:0px;}
	.headerQuestion, .headerCategory {height:25px;padding:0px;margin:0px 0 15px 0;}
	.fLeft {float:left;}
	.fRight {float:right;}
	#spanSearch {margin-right:40px;}
	.searchQuestion{height:10px;}
	.faq_question_field{width:100%}
	.faqCategories_question{width:70%}
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <input type="hidden" id="sortCategory" value="DESC">
  <input type="hidden" id="sortQuestion" value="ASC">
  <input type="hidden" id="currentPage" value="1">
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="success"></div>
      <div class="warning"></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs">
      	<a href="#tab-questions"><?php echo $tab_questions; ?></a>
      	<a href="#tab-categories"><?php echo $tab_categories; ?></a>
      </div>
      <div id="tab-questions">
          <div id="languagesQuestions" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#languageQuest<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="languageQuest<?php echo $language['language_id']; ?>">
          	<div id="listQuestions<?php echo $language['language_id']; ?>">
				<div class="headerQuestion">
					<div class="fLeft">
						<button class="button deleteQuestion" id="<?php echo $language['language_id']; ?>" onClick="deleteQuestionButton(this.id)"><span><?php echo $text_deleteQuestions;?></span></button>
					</div>	
					
					<div class="fRight">
						<span id="spanSearch">
						<strong id="searchWord"><?php echo $text_search;?></strong>
						<input class="searchQuestion" id="searchQuestion<?php echo $language['language_id']; ?>" type="text" onKeyUp="search(<?php echo $language['language_id']; ?>)"/>
						<input type="button" onclick="resetSearch(<?php echo $language['language_id']; ?>)" id="resetSearch" value="<?php echo $text_resetSearch;?>"/>
						</span>
						<button id="<?php echo $language['language_id']; ?>" class="button addQuestionButton" onClick="addQuestionButton(this.id)"><span><?php echo $text_addQuestion;?></span></button>
					</div>	
					
					
				</div>	
				<form id="formQuestion<?php echo $language['language_id']; ?>" action="" method="post" enctype="multipart/form-data">
				<div id="listQuestionsDiv<?php echo $language['language_id']; ?>"></div>	
				</form>
				<div class="pagination" id="pagination<?php echo $language['language_id']; ?>"></div>
			</div>

			<div id="tabFormQuestion<?php echo $language['language_id']; ?>">
				<div class="headerQuestion">	
					<div class="fLeft">					
						<span class="titleForm" id="titleFormQuestion<?php echo $language['language_id']; ?>"></span>
					</div>
					<div class="fRight">
						<button class="cancelQuestionButton button" id="<?php echo $language['language_id']; ?>" onClick="cancelQuestionButton(this.id)"><span><?php echo $text_questions;?></span></button>
						<button class="saveQuestionButton button" id="<?php echo $language['language_id']; ?>" onClick="saveQuestionButton(this.id)"><span><?php echo $text_save;?></span></button>
					</div>
				</div>
				<form id="addQuestionForm<?php echo $language['language_id']; ?>" action="" method="post" enctype="multipart/form-data">
					<input type="hidden" id="linkAddQuestion<?php echo $language['language_id']; ?>" value="<?php echo $actionAddQuestion; ?>">
					<input type="hidden" id="linkEditQuestion<?php echo $language['language_id']; ?>" value="<?php echo $actionEditQuestion; ?>">
					<input type="hidden" id="linkActionFormQuestion<?php echo $language['language_id']; ?>" value="">
					<input type="hidden" name="idFaq<?php echo $language['language_id']; ?>" id="faq_idFaq<?php echo $language['language_id']; ?>" value="">
					<input type="hidden" name="language_id" value="<?php echo $language['language_id']; ?>">
					<table class="form">
					  <tr>
					    <td><?php echo $column_category;?></td>
					    <td id="selectCategories<?php echo $language['language_id']; ?>">
					    	
					   </td>
					  </tr>
					  <tr>
		                <td><?php echo $text_sort;?></td>
		                <td>
		                	<input name="sortQuestion<?php echo $language['language_id']; ?>" id="sortQuestion<?php echo $language['language_id']; ?>" value="0" size="3">
			               </td>
		              </tr>
					  <tr>
					    <td><?php echo $column_question;?></td>
					    <td>
					    	<?php if(isset($question)){?>
					    		<input name="question<?php echo $language['language_id']; ?>" class="faq_question_field" id="faq_question<?php echo $language['language_id']; ?>" size="" value="<?php echo $question; ?>">
					    	<?php }else{?>	
					    		<input name="question<?php echo $language['language_id']; ?>" class="faq_question_field" id="faq_question<?php echo $language['language_id']; ?>" size="" value="">
					    	<?php }?>	
					    </td>
					  </tr>
					  <tr>
					    <td><?php echo $column_response;?></td>
					    <td id="textAreaTd<?php echo $language['language_id']; ?>">
						    <textarea name="response<?php echo $language['language_id']; ?>" id="response<?php echo $language['language_id']; ?>"></textarea>
					     </td>
					  </tr>
					</table>
				</form>
			</div>          
          </div>
          <?php } ?>
      </div>
      
      
      
      
      
      
      
      <div id="tab-categories">
      	<div id="languagesCategories" class="htabs">
        <?php foreach ($languages as $language) { ?>
        	<a href="#languageCat<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 			<?php echo $language['name']; ?></a>
        <?php } ?>
        </div>
        <?php foreach ($languages as $language) { ?>
        <div id="languageCat<?php echo $language['language_id']; ?>">
	      	<div id="listCategories<?php echo $language['language_id']; ?>">	
				<div class="headerCategory">
					<div class="fLeft">
						<button class="button deleteCategory" id="<?php echo $language['language_id']; ?>" onClick="deleteCategoryButton(this.id)"><span><?php echo $text_deleteCategories;?></span></button>
					</div>	
					<div class="fRight">
						<button id="<?php echo $language['language_id']; ?>" class="button addCategoryButton" onClick="addCategoryButton(this.id)"><span><?php echo $text_addCategory;?></span></button>
					</div>	
				</div>	
				<form id="formCategory<?php echo $language['language_id']; ?>" action="" method="post" enctype="multipart/form-data">
					<div id="listCategoriesDiv<?php echo $language['language_id']; ?>">
								
					</div>	
				</form>
			</div>	
				
			<div id="tabFormCategory<?php echo $language['language_id']; ?>">
				<div class="headerCategory">						
					<div class="fLeft">
						<span class="titleForm" id="titleFormCat<?php echo $language['language_id']; ?>"></span>
					</div>
					<div class="fRight">
						<button class="cancelCategoryButton button" id="<?php echo $language['language_id']; ?>" onClick="cancelCategoryButton(this.id)"><span><?php echo $text_categories;?></span></button>
						<button class="saveCategoryButton button" id="<?php echo $language['language_id']; ?>" onClick="saveCategoryButton(this.id)"><span><?php echo $text_save;?></span></button>
					</div>
				</div>
				<div>
					<form id="addCategoryForm<?php echo $language['language_id']; ?>" action="" method="post" enctype="multipart/form-data">
						<input type="hidden" id="linkAddCategory<?php echo $language['language_id']; ?>" value="<?php echo $actionAddCategory; ?>">
						<input type="hidden" id="linkEditCategory<?php echo $language['language_id']; ?>" value="<?php echo $actionEditCategory; ?>">
						<input type="hidden" id="linkActionFormCategory<?php echo $language['language_id']; ?>" value="">
						<input type="hidden" name="idCategory<?php echo $language['language_id']; ?>" id="faqCategories_id<?php echo $language['language_id']; ?>" value="">
						<input type="hidden" name="language_id" value="<?php echo $language['language_id']; ?>">
			            <table class="form">
				              <tr>
				                <td><?php echo $text_nameCategory;?></td>
				                <td>
				                	<input class="faqCategories_question" name="category<?php echo $language['language_id']; ?>" id="faqCategories_question<?php echo $language['language_id']; ?>" value="">
				               </td>
				              </tr>
				              <tr>
				                <td><?php echo $text_sort;?></td>
				                <td>
				                	<input name="sortCategory<?php echo $language['language_id']; ?>" id="sortCategory<?php echo $language['language_id']; ?>" value="0" size="3">
				               </td>
				              </tr>
			            </table>
			      	</form>
				</div>	
			</div>
		</div>
		<?php } ?>			
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('response<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languagesQuestions a').tabs();
$('#languagesCategories a').tabs();

$(document).ready(function() {
	<?php foreach ($languages as $language) {
		echo "getSelectCategories(".$language['language_id'].");";
		echo "hideTabFormQuestion(".$language['language_id'].");";
		echo "refreshListQuestions(0, 15, 'ASC', 'fc.category', ".$language['language_id'].");";	
		echo "refreshListCategories(".$language['language_id'].");";
		echo "pagination(1,".$language['language_id'].");";
		
		echo "hideTabFormCategory(".$language['language_id'].");";
	} ?>
});

function hideTabFormQuestion(language_id){
	$('#tabFormQuestion'+language_id).css('display', 'none');	
}
function showTabFormQuestion(language_id){
	$('#tabFormQuestion'+language_id).css('display', 'block');	
}

function hideListQuestions(language_id){
	$('#listQuestions'+language_id).css('display', 'none');	
}
function showListQuestions(language_id){
	$('#listQuestions'+language_id).css('display', 'block');	
}



function getSelectCategories(language_id){
	$.ajax({
		type: 'post',
		url: '<?php echo $linkGetSelectCategories ?>',
		data:'language_id='+language_id,
		dataType:'text',
		success: function(text)
		{
			$('#selectCategories'+language_id).html(text);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function saveQuestionButton(language_id){	
	if (typeof CKEDITOR !== "undefined") {
	    for ( instance in CKEDITOR.instances ) {
	    	if(instance == 'response'+language_id){
	    		$('#response'+language_id).val(escape(encodeURIComponent(CKEDITOR.instances[instance].getData())));
	    	}
	    }
	}
	$('#faq_question'+language_id).val(escape(encodeURIComponent($('#faq_question'+language_id).val())));
	$.ajax({
		type: 'post',
		url: $('#linkActionFormQuestion'+language_id).val(),
		data: $('#addQuestionForm'+language_id).serialize(),
		dataType:'xml',
		success: function(xml)
		{	
			if($(xml).find('status').text() == "success"){
				$('.success').text($(xml).find('message').text());		
				$('.success').fadeIn(2000, function () {
            	$(".success").fadeOut(1000);});	
				
				$('#searchQuestion').val('');
				var limit = 15;
				limitMin = ($('#currentPage').val()-1)*limit;
				refreshListQuestions(limitMin, limit, 'ASC', 'fc.category', language_id);
				
				refreshListCategories(language_id);
				showListQuestions(language_id);
				hideTabFormQuestion(language_id);

				$('#faq_idFaq'+language_id).val("");
				$('#sortQuestion'+language_id).val("0");
				$('#faq_question'+language_id).val("");
				if (typeof CKEDITOR !== "undefined") {
				    for ( instance in CKEDITOR.instances ) {
				    	if(instance == 'response'+language_id){
				    		CKEDITOR.instances[instance].destroy();	
				    	}
				    }
				}
				$('#textAreaTd'+language_id).html('<textarea name="response'+language_id+'" id="response'+language_id+'"></textarea>');
				CKEDITOR.replace('response'+language_id, {
					filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});							
			}
			else{
				$('.warning').text($(xml).find('message').text());						
				$('.warning').fadeIn(2000, function () {
            	$('.warning').fadeOut(1000);});
			}
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
	return false;
}

function refreshListQuestions(limitMin, limitMax, sort, column, language_id){
	$.ajax({
		type: 'post',
		url: '<?php echo $linkListQuestions; ?>',
		dataType:'text',
		data:'limitMin='+limitMin+'&limitMax='+limitMax+'&sort='+sort+'&column='+column+'&language_id='+language_id,
		success: function(text)
		{
			$('#listQuestionsDiv'+language_id).html(text);
			pagination($('#currentPage').val(), language_id);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function addQuestionButton(language_id){
	$('#titleFormQuestion'+language_id).text("<?php echo $text_titleAddQuestion; ?>");
	$('#linkActionFormQuestion'+language_id).val($('#linkAddQuestion'+language_id).val());
	hideListQuestions(language_id);
	showTabFormQuestion(language_id);
	return false;
}

function cancelQuestionButton(language_id){
	hideTabFormQuestion(language_id);
	showListQuestions(language_id);
	return false;
}

function pagination(currentPage, language_id){
	$.ajax({
		type: 'post',
		url: '<?php echo $pagination ?>',
		data: 'currentPage='+currentPage+'&language_id='+language_id,
		dataType:'text',
		success: function(text)
		{
			$('#pagination'+language_id).html(text);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function deleteQuestionButton(language_id){	
	$.ajax({
		type: 'post',
		url: '<?php echo $delete ?>',
		data: $('#formQuestion'+language_id).serialize(),
		dataType:'xml',
		success: function(xml)
		{	
			if($(xml).find('status').text() == 'success'){
				$('.success').text($(xml).find('message').text());						
				$('.success').fadeIn(2000, function () {
            	$(".success").fadeOut(1000);});
			}
			else{
				$('.warning').text($(xml).find('message').text());						
				$('.warning').fadeIn(2000, function () {
            	$(".warning").fadeOut(1000);});
			}
			refreshListQuestions(0, 15, 'ASC', 'fc.category', language_id);
			refreshListCategories(language_id);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function editQuestionButton(faq_id, language_id, category, question, response, sortQuestion){
	$('#titleFormQuestion'+language_id).text("<?php echo $text_titleEditQuestion; ?>");
	$('#faq_idFaq'+language_id).val(faq_id);
	$('#sortQuestion'+language_id).val(sortQuestion);
	$('#selectCategory'+language_id).val(category);
	$('#faq_question'+language_id).val(question);
	if (typeof CKEDITOR !== "undefined") {
	    for ( instance in CKEDITOR.instances ) {
	    	if(instance == 'response'+language_id){
	    		CKEDITOR.instances[instance].destroy();	
	    	}
	    }
	}
	
	$('#textAreaTd'+language_id).html('<textarea name="response'+language_id+'" id="response'+language_id+'">'+response+'</textarea>');
	CKEDITOR.replace('response'+language_id, {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});	
	$('#linkActionFormQuestion'+language_id).val($('#linkEditQuestion'+language_id).val());

	hideListQuestions(language_id);
	showTabFormQuestion(language_id);
	return false;
}


function hideTabFormCategory(language_id){
	$('#tabFormCategory'+language_id).css('display', 'none');	
}
function showTabFormCategory(language_id){
	$('#tabFormCategory'+language_id).css('display', 'block');	
}

function hideListCategories(language_id){
	$('#listCategories'+language_id).css('display', 'none');	
}
function showListCategories(language_id){
	$('#listCategories'+language_id).css('display', 'block');	
}

function refreshListCategories(language_id){
	$.ajax({
		type: 'post',
		url: '<?php echo $linkListCategories ?>',
		data:'language_id='+language_id,
		dataType:'text',
		success: function(text)
		{
			$('#listCategoriesDiv'+language_id).html(text);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function addCategoryButton(language_id){
	$('#titleFormCat'+language_id).text("<?php echo $text_titleAddCategory; ?>");
	$('#linkActionFormCategory'+language_id).val($('#linkAddCategory'+language_id).val());	
	hideListCategories(language_id);
	showTabFormCategory(language_id);
	return false;
}

function cancelCategoryButton(language_id){	
	hideTabFormCategory(language_id);
	showListCategories(language_id);
	return false;
}

function saveCategoryButton(language_id){	
	$('#faqCategories_question'+language_id).val(escape(encodeURIComponent($('#faqCategories_question'+language_id).val())));
	$.ajax({
		type: 'post',
		url: $('#linkActionFormCategory'+language_id).val(),
		data: $('#addCategoryForm'+language_id).serialize(),
		dataType:'xml',
		success: function(xml)
		{
			if($(xml).find('status').text() == "success"){
				$('.success').text($(xml).find('message').text());		
				$('.success').fadeIn(2000, function () {
            	$(".success").fadeOut(1000);});	
				
				refreshListCategories(language_id);
				refreshListQuestions(0, 15, 'ASC', 'fc.category', language_id);
				getSelectCategories(language_id);
				
				showListCategories(language_id);
				hideTabFormCategory(language_id);
				
				$('#faqCategories_question'+language_id).val("");
				$('#sortCategory'+language_id).val("0");
			}
			else{
				$('.warning').text($(xml).find('message').text());						
				$('.warning').fadeIn(2000, function () {
            	$(".warning").fadeOut(1000);});
			}
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
	return false;
}

function deleteCategoryButton(language_id){	
	$.ajax({
		type: 'post',
		url: '<?php echo $deleteCategory ?>',
		data: $('#formCategory'+language_id).serialize(),
		dataType:'xml',
		success: function(xml)
		{	
			if($(xml).find('status').text() == 'success'){
				$('.success').text($(xml).find('message').text());						
				$('.success').fadeIn(2000, function () {
            	$(".success").fadeOut(1000);});
			}
			else{
				$('.warning').text($(xml).find('message').text());						
				$('.warning').fadeIn(2000, function () {
            	$(".warning").fadeOut(1000);});
			}
			refreshListQuestions(0, 15, 'ASC', 'fc.category', language_id);
			refreshListCategories(language_id);
			getSelectCategories(language_id);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}

function editCategoryButton(category_id, language_id, category, sortCategory){
	$('#titleFormCat'+language_id).text("<?php echo $text_titleEditCategory; ?>");
	$('#faqCategories_question'+language_id).val(category);
	$('#sortCategory'+language_id).val(sortCategory);
	$('#faqCategories_id'+language_id).val(category_id);	
	$('#linkActionFormCategory'+language_id).val($('#linkEditCategory'+language_id).val());

	hideListCategories(language_id);
	showTabFormCategory(language_id);
	return false;
}

function search(language_id){
	if($('#searchQuestion'+language_id).val() != ""){
		searchQuestions($('#searchQuestion'+language_id).val(), language_id);
		$('#pagination'+language_id).html("");
	}
	else{
		refreshListQuestions(0, 15, 'ASC', 'fc.category', language_id);
		pagination(1);
	}
}

function searchQuestions(query, language_id){
	$.ajax({
		type: 'post',
		url: '<?php echo $linkListQuestions; ?>',
		dataType:'text',
		data:'query='+escape(encodeURIComponent(query))+'&language_id='+language_id,
		success: function(text)
		{
			$('#listQuestionsDiv'+language_id).html(text);
		},
		error: function()
		{
			alert('Error, cannot contact the server');
		}
	});
}
	
function resetSearch(language_id){
	$('#searchQuestion'+language_id).val("");
	refreshListQuestions(0, 15, 'ASC', 'fc.category', language_id);
	pagination(1);
}

function sortCategory(language_id){	
	$('#searchQuestion'+language_id).val('');
	var limit = 15;
	limitMin = ($('#currentPage').val()-1)*limit;
	refreshListQuestions(limitMin, limit, $('#sortCategory').val(), 'fc.category', language_id);
	if($('#sortCategory').val() == 'DESC'){
		$('#sortCategory').val('ASC');
	}
	else{
		$('#sortCategory').val('DESC');		
	}
	return false;
}

	
function sortQuestion(language_id){	
	$('#searchQuestion'+language_id).val('');
	var limit = 15;
	limitMin = ($('#currentPage').val()-1)*limit;
	refreshListQuestions(limitMin, limit, $('#sortQuestion').val(), 'f.question', language_id);
	if($('#sortQuestion').val() == 'DESC'){
		$('#sortQuestion').val('ASC');
	}
	else{
		$('#sortQuestion').val('DESC');		
	}
	return false;
}
//--></script> 
<?php echo $footer; ?>

