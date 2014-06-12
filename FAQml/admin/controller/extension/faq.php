<?php
class ControllerExtensionFaq extends Controller { 
	private $error = array();
	
	public function index() {	
		$this->load->language('extension/faq');	
		$this->load->model('extension/faq');
		$this->load->model('catalog/category');		
		$this->data['tab_questions'] = $this->language->get('text_tabQuestions');
		$this->data['tab_categories'] = $this->language->get('text_tabCategories');
	
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');

		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['category_id'])) {
			$this->data['action'] = $this->url->link('catalog/category/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/category/update', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'], 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
    	}
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['category_description'])) {
			$this->data['category_description'] = $this->request->post['category_description'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_description'] = $this->model_catalog_category->getCategoryDescriptions($this->request->get['category_id']);
		} else {
			$this->data['category_description'] = array();
		}

		$categories = $this->model_catalog_category->getCategories(0);

		// Remove own id from list
		if (!empty($category_info)) {
			foreach ($categories as $key => $category) {
				if ($category['category_id'] == $category_info['category_id']) {
					unset($categories[$key]);
				}
			}
		}

		$this->data['categories'] = $categories;

		if (isset($this->request->post['parent_id'])) {
			$this->data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($category_info)) {
			$this->data['parent_id'] = $category_info['parent_id'];
		} else {
			$this->data['parent_id'] = 0;
		}
						
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['category_store'])) {
			$this->data['category_store'] = $this->request->post['category_store'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_store'] = $this->model_catalog_category->getCategoryStores($this->request->get['category_id']);
		} else {
			$this->data['category_store'] = array(0);
		}			
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($category_info)) {
			$this->data['keyword'] = $category_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($category_info)) {
			$this->data['image'] = $category_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($category_info) && $category_info['image'] && file_exists(DIR_IMAGE . $category_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['top'])) {
			$this->data['top'] = $this->request->post['top'];
		} elseif (!empty($category_info)) {
			$this->data['top'] = $category_info['top'];
		} else {
			$this->data['top'] = 0;
		}
		
		if (isset($this->request->post['column'])) {
			$this->data['column'] = $this->request->post['column'];
		} elseif (!empty($category_info)) {
			$this->data['column'] = $category_info['column'];
		} else {
			$this->data['column'] = 1;
		}
				
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($category_info)) {
			$this->data['sort_order'] = $category_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($category_info)) {
			$this->data['status'] = $category_info['status'];
		} else {
			$this->data['status'] = 1;
		}
				
		if (isset($this->request->post['category_layout'])) {
			$this->data['category_layout'] = $this->request->post['category_layout'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_layout'] = $this->model_catalog_category->getCategoryLayouts($this->request->get['category_id']);
		} else {
			$this->data['category_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();




	
	
	
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_tabQuestions'] = $this->language->get('text_tabQuestions');
		$this->data['text_tabCategories'] = $this->language->get('text_tabCategories');
		$this->data['text_deleteQuestions'] = $this->language->get('text_deleteQuestions');
		$this->data['text_addQuestion'] = $this->language->get('text_addQuestion');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_resetSearch'] = $this->language->get('text_resetSearch');
		$this->data['text_deleteCategories'] = $this->language->get('text_deleteCategories');
		$this->data['text_addCategory'] = $this->language->get('text_addCategory');
		$this->data['text_noQuestions'] = $this->language->get('text_noQuestions');
		$this->data['text_noCategories'] = $this->language->get('text_noCategories');
		$this->data['text_save'] = $this->language->get('text_save');
		$this->data['text_questions'] = $this->language->get('text_questions');
		$this->data['text_categories'] = $this->language->get('text_categories');
		$this->data['text_nameCategory'] = $this->language->get('text_nameCategory');
		$this->data['text_sort'] = $this->language->get('text_sort');		
		
		$this->data['column_category'] = $this->language->get('column_category');
		$this->data['column_question'] = $this->language->get('column_question');
		$this->data['column_response'] = $this->language->get('column_response');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['text_titleAddQuestion'] = $this->language->get('text_titleAddQuestion');
		$this->data['text_titleAddCategory'] = $this->language->get('text_titleAddCategory');
		$this->data['text_titleEditQuestion'] = $this->language->get('text_titleEditQuestion');
		$this->data['text_titleEditCategory'] = $this->language->get('text_titleEditCategory');		
		
		
		$url = "";

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/faq', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);

		$this->model_extension_faq->creationTables();	

		$this->data['token'] = $this->session->data['token'];

		$this->data['linkGetSelectCategories'] = html_entity_decode ($this->url->link('extension/faq/getSelectCategories', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['actionAddQuestion'] =  html_entity_decode ($this->url->link('extension/faq/insert', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		$this->data['linkListQuestions'] = html_entity_decode ($this->url->link('extension/faq/getListQuestions', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['pagination'] = html_entity_decode ($this->url->link('extension/faq/pagination', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['delete'] = html_entity_decode ($this->url->link('extension/faq/deleteQuestion', 'token=' . $this->session->data['token'] . $url, 'SSL'));			
		$this->data['linkListCategories'] = html_entity_decode ($this->url->link('extension/faq/getListCategories', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['deleteCategory'] = html_entity_decode ($this->url->link('extension/faq/deleteCategory', 'token=' . $this->session->data['token'] . $url, 'SSL'));	
		
		
		$this->data['addQuestion'] = $this->url->link('extension/faq/insert');
		$this->data['addCategory'] = $this->url->link('extension/faq/insertCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');



		$this->data['actionAddCategory'] = $this->url->link('extension/faq/insertCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['actionEditQuestion'] = $this->url->link('extension/faq/update', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['actionEditCategory'] = $this->url->link('extension/faq/updateCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->template = 'extension/faq.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
		
	}

	public function getSelectCategories(){
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');		
		$faq_categories = array();
		$i=0;
		
		$faqCategories_Cat = $this->model_extension_faq->getFaqCategories($_POST['language_id']);		
		foreach($faqCategories_Cat as $cat){
			$faq_categories[$i]['idCategory'] = $cat['idCategory'];			
			$faq_categories[$i]['category'] = $cat['category'];
			$i++;
		}
		echo'<select id="selectCategory'.$_POST['language_id'].'" name="question['.$_POST['language_id'].'][category]">';
		foreach ($faq_categories as $cat) { 
			echo '<option value="'.$cat['idCategory'].'">'.urldecode(rawurldecode($cat['category'])).'</option>';
		}
	   	echo '</select>';
	}
	
	public function insert() {	
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		if($_POST['question'.$_POST['language_id']] == "" || $_POST['response'.$_POST['language_id']] == ""){
			echo "<status>warning</status>\n";
			echo "<message>".$this->language->get('error_allFieldsRequired')."</message>\n";
		}
		else if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_faq->addFaq($this->request->post);
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_addQuestion')."</message>\n";
		}
		
		echo "</result>\n";
		exit();
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/faq')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function getListQuestions(){
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');		
		$url = '';
		$faqs = array();
		if(!isset($_POST['sort'])){
			$sort = 'ASC';
			$column = 'fc.category';
		}
		else {
			$sort = $_POST['sort'];
		}
		
		if(isset($_POST['query']) && $_POST['query'] != ""){
			$results = $this->model_extension_faq->getFaqsQuery($_POST['query'], $_POST['language_id']);
		}
		else{
			$results = $this->model_extension_faq->getFaqs($_POST['limitMin'], $_POST['limitMax'], $sort, $_POST['column'], $_POST['language_id']);
		}

 
    	foreach ($results as $result) {
			$faqs[] = array(
				'idFaq' => $result['idFaq'],
				'category'     => $result['category'],
				'idCategory'     => $result['idCategory'],
				'question'     => $result['question'],
				'response'     => $result['response'],
				'selected'       => isset($this->request->post['selected']) && in_array($result['idFaq'], $this->request->post['selected']),
				'sort'         => $result['sortQuestion']
			);
		}
		
		$sort_question = $this->url->link('extension/faq', 'token=' . $this->session->data['token']. $url, 'SSL');
	
		$sort_category = $this->url->link('extension/faq', 'token=' . $this->session->data['token'] .  $url, 'SSL');
		
		
		echo'<table class="list">
			<thead>
				<tr>
					<td width="1" style="text-align: center;">
						<input type="checkbox" onclick="$(\'input[name*=\\\'selected\\\']\').attr(\'checked\', this.checked);" />
					</td>
					<td class="left" width="200" >';
					
					if(isset($_POST['sort']) && isset($_POST['column']) && $_POST['column'] == "fc.category"){
						if($_POST['sort'] == "ASC"){
							echo '<a class="sortCategory" onClick="sortCategory('.$_POST['language_id'].');"  style="padding-right:15px;background:url(view/image/asc.png) no-repeat right;">'.$this->language->get('column_category').'</a>';
						}
						else{
							echo '<a class="sortCategory" onClick="sortCategory('.$_POST['language_id'].');" style="padding-right:15px;background:url(view/image/desc.png) no-repeat right;">'.$this->language->get('column_category').'</a>';	
						}
					}
					else{
						echo '<a class="sortCategory" onClick="sortCategory('.$_POST['language_id'].');">'.$this->language->get('column_category').'</a>';
					}
				echo'</td>
					<td class="left">';
						if(isset($_POST['sort']) && isset($_POST['column']) && $_POST['column'] == "f.question"){
							if($_POST['sort'] == "ASC"){
								echo '<a class="sortQuestion" onClick="sortQuestion('.$_POST['language_id'].');" style="padding-right:15px;background:url(view/image/asc.png) no-repeat right;">'.$this->language->get('column_question').'</a>';
							}
							else{
								echo '<a class="sortQuestion" onClick="sortQuestion('.$_POST['language_id'].');" style="padding-right:15px;background:url(view/image/desc.png) no-repeat right;">'.$this->language->get('column_question').'</a>';	
							}
						}
						else{
									echo '<a class="sortQuestion" onClick="sortQuestion('.$_POST['language_id'].');">'.$this->language->get('column_question').'</a>';	
						}
				echo'</td>
				<td class="right" width="50">'.$this->language->get('column_sort').'</td>
				<td class="right" width="50">'.$this->language->get('column_action').'</td>
				</tr>
			</thead>';
			echo '<tbody>';
			if ($faqs) { 
				$i=0;
				foreach ($faqs as $faq) {
					echo '<tr>';
					if($i % 2 == 0){
						$color = 'background-color:#FFFFFF;';
					}
					else{
						$color = 'background-color:#EFEFEF;';
					}
					echo '<td style="text-align: center;'.$color.'">';
				
					echo '<input type="checkbox" name="selected[]" value="'.$faq['idFaq'].'" />';

					echo'</td>
						<td class="left" style="'.$color.'">'.urldecode(rawurldecode($faq['category'])).'</td>
						<td class="left" style="'.$color.'">'.urldecode(rawurldecode($faq['question'])).'</td>					
						<td class="right" style="'.$color.'">'.$faq['sort'].'</td>
						<td class="right" style="'.$color.'">';
					echo '<input type="button" class="button editQuestion" question="'.urldecode(rawurldecode($faq['question'])).'" response="'.htmlspecialchars(urldecode(rawurldecode($faq['response']))).'" onClick="editQuestionButton('.$faq['idFaq'].', '.$_POST['language_id'].','.$faq['idCategory'].', $(this).attr(\'question\'), $(this).attr(\'response\'),'.$faq['sort'].')" value="Edit"/>';
					echo '</td>';
					echo '</tr>';
					$i++;
				}
			}
			else {
				echo '<tr>
						<td class="center" colspan="5">'.$this->language->get('text_noQuestions').'</td>
					</tr>';
			}
			echo'</tbody>';
		echo '</table>';
	}
	
	public function pagination(){
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');		
		$limit = 15;
			
		if(isset($this->request->get['category'])){
			$nbQuestions = $this->model_extension_faq->getTotalFaqsByCategory($this->request->get['category'], $_POST['language_id']);
		}
		else{
			$nbQuestions = $this->model_extension_faq->getTotalFaqs($_POST['language_id']);
		}
		
		$nbPages = ceil($nbQuestions / $limit);
		
		echo '<div class="links">';
		for($i=1;$i<=$nbPages;$i++){
			if(isset($_POST['currentPage']) && $i == $_POST['currentPage']){
				echo '<b style="margin-left:3px;">'.$i.'</b>';
			}
			else{
				echo '<a class="page" id="'.$i.'" style="margin-left:3px;">'.$i.'</a>';
			}
		}
		echo '</div>';
		echo "<script type=text/javascript>	
			$('.page').click(function(){
				var limit = 15;
				limitMin = (this.id-1)*limit;
				$('#currentPage').val(this.id);
				pagination(this.id, ".$_POST['language_id'].");
				refreshListQuestions(limitMin, limit, $('#sortQuestion').val(), 'category', ".$_POST['language_id'].");
			});";
		echo "</script>";
		exit();
	}
	
	public function deleteQuestion() {
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";
		
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $faq_id) {
				$this->model_extension_faq->deleteFaq($faq_id);
			}
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_deleteQuestions')."</message>\n";
		}
		else{
			echo "<status>fail</status>\n";
			echo "<message>".$this->language->get('error_deleteQuestions')."</message>\n";
		}
		echo "</result>\n";
		exit();
	}
	
	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/faq')) {
			$this->error['warning'] = $this->language->get('error_permission');
			return false;
		}
		return true;
	}
	
	public function update() {
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";
		
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		if($_POST['question'.$_POST['language_id']] == "" || $_POST['response'.$_POST['language_id']] == ""){
			echo "<status>warning</status>\n";
			echo "<message>".$this->language->get('error_allFieldsRequired')."</message>\n";
		}
		else if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_faq->editFaq($this->request->post);			
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_modifyQuestion')."</message>\n";
		}

		echo "</result>\n";
		exit();
	}
	
	
	
	public function getListCategories(){
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');		
		$url = '';
		$faqs = array();
 
    	$faqCategories = array();
	
		$results = $this->model_extension_faq->getFaqCategories($_POST['language_id']);
 
		foreach ($results as $result) {
			$faqCategories[] = array(
				'idCategory'	=> $result['idCategory'],
				'category'		=> $result['category'],
				'selected'		=> isset($this->request->post['selected']) && in_array($result['idCategory'], $this->request->post['selected']),
				'sort'			=> $result['sortCategory']
			);
		}
		
		echo'<table class="list">
		  <thead>
			<tr>
			  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$(\'input[name*=\\\'selected\\\']\').attr(\'checked\', this.checked);" /></td>
			  <td class="left">'.$this->language->get('column_category').'</td>
				<td class="left" width="70"></td>
				<td class="right" width="50">'.$this->language->get('column_sort').'</td>
			  <td class="right" width="50">'.$this->language->get('column_action').'</td>
			</tr>
		  </thead>
		  <tbody>';
			if ($faqCategories) { 
				$i=0;
				foreach ($faqCategories as $faqCategories) {
					$nbQuesions = $this->model_extension_faq->getTotalFaqsByCategory($faqCategories['idCategory'], $_POST['language_id']);
					echo '<tr>';
					if($i % 2 == 0){
						$color = 'background-color:#FFFFFF;';
					}
					else{
						$color = 'background-color:#EFEFEF;';
					}
					echo'<td style="text-align: center;'.$color.'">';
						if ($faqCategories['selected']) {
							echo'<input type="checkbox" name="selected[]" value="'.$faqCategories['idCategory'].'" checked="checked" />';
						} 
						else {
							echo'<input type="checkbox" name="selected[]" value="'.$faqCategories['idCategory'].'" />';
						}
					echo'</td>
						<td class="left" style="'.$color.'">'.urldecode(rawurldecode($faqCategories['category'])).'</td>';
					if($nbQuesions[0]>1){
						echo'<td class="left" style="'.$color.';text-align:center;">'.$nbQuesions[0]." ".$this->language->get('text_labelmore1Question').'</td>';
					}
					else if($nbQuesions[0]==1){
						echo'<td class="left" style="'.$color.';text-align:center;">'.$nbQuesions[0]." ".$this->language->get('text_label0or1Question').'</td>';
					}	
					else{
						echo'<td class="left" style="'.$color.';text-align:center;color:red;">'.$nbQuesions[0]." ".$this->language->get('text_label0or1Question').'</td>';
					}	
					
					echo'<td class="right" style="'.$color.'">'.$faqCategories['sort'].'</td>
							<td class="right" style="'. $color.'">';
					echo '<input type="button" class="button editCategory" category="'.html_entity_decode(urldecode(rawurldecode($faqCategories['category']))).'" onClick="editCategoryButton('.$faqCategories['idCategory'].', '.$_POST['language_id'].',$(this).attr(\'category\'),'.$faqCategories['sort'].')" value="Edit"/>';
					echo '</td>
					</tr>';
					$i++;
				}
			} 
			else{
			echo '<tr>
			  <td class="center" colspan="5">'.$this->language->get('text_noCategories').'</td>
			</tr>';
			}
		  echo'</tbody>
		</table>';
	}
	
	public function insertCategory() {
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";

		$this->load->model('extension/faq');
		$this->load->language('extension/faq');		
		if($_POST['category'.$_POST['language_id']] == ""){
			echo "<status>warning</status>\n";
			echo "<message>".$this->language->get('error_allFieldsRequired')."</message>\n";
		}
		else if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormCategory()) {
			$this->model_extension_faq->addFaqCategories($this->request->post);
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_addCategory')."</message>\n";
		}
		
		echo "</result>\n";
		exit();
	}
	
	private function validateFormCategory() {
		if (!$this->user->hasPermission('modify', 'extension/faq')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function deleteCategory() {
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";
		
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		if (isset($this->request->post['selected']) && $this->validateDeleteCategory()) {
			foreach ($this->request->post['selected'] as $faqCategories_id) {
				$this->model_extension_faq->deleteFaqCategories($faqCategories_id);
			}
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_deleteCategories')."</message>\n";
		}
		else{
			echo "<status>fail</status>\n";
			echo "<message>".$this->language->get('error_deleteCategories')."</message>\n";
		}
		
		echo "</result>\n";
		exit();
	}
	
	private function validateDeleteCategory() {
		if (!$this->user->hasPermission('modify', 'extension/faq')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		foreach ($this->request->post['selected'] as $idCategory) {
			if($this->model_extension_faq->testCategory($idCategory)){
				$this->error['warning'] = $this->language->get('error_relation');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	 public function updateCategory() {
		echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
		echo "<result>\n";
		
		$this->load->model('extension/faq');
		$this->load->language('extension/faq');
		if($_POST['category'.$_POST['language_id']] == ""){
			echo "<status>warning</status>\n";
			echo "<message>".$this->language->get('error_allFieldsRequired')."</message>\n";
		}
		else if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormCategory()) {
			$this->model_extension_faq->editFaqCategories($this->request->post);
			echo "<status>success</status>\n";
			echo "<message>".$this->language->get('success_modifyCategory')."</message>\n";
		}
		echo "</result>\n";
		exit();
	}
}
?>