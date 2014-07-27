<?php 
class ControllerFaqFaq extends Controller {
	public function index() {  
		$this->load->language('faq/faq');
		$this->load->model('faq/faq');
	
		$this->document->setTitle($this->language->get('heading_title')); 
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_resetSearch'] = $this->language->get('text_resetSearch');

		
		$this->data['breadcrumbs'] = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
      	
      	$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('faq/faq'),      		
			'separator' => $this->language->get('text_separator')
		);		
						
		
		$this->data['linkSearch'] = html_entity_decode ($this->url->link('faq/faq/search'));
		$this->data['linkListQuestions'] = html_entity_decode ($this->url->link('faq/faq/listQuestions'));
		
		$this->template = $this->config->get('config_template') . '/template/faq/faq.tpl';

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
						
		$this->response->setOutput($this->render());
}

	public function listQuestions(){
		$this->load->model('faq/faq');
		$this->load->language('faq/faq');
		// $language_id = $this->model_faq_faq->getLanguageByCode($this->session->data['language']);
		$language_id = $this->model_faq_faq->getLanguageByCode('en'); /* always English */

		$faq_categories = array();
		$faq = array();	
		$i=0;
		$j=0;
		$faq_Cat = $this->model_faq_faq->getFaqCategories($language_id['language_id']);		
		foreach($faq_Cat as $cat){
			$faq_categories[$i]['idCategory'] = $cat['idCategory'];			
			$faq_categories[$i]['category'] = $cat['category'];
			$i++;
			$faq_Questions = $this->model_faq_faq->getFaqByCategory($cat['idCategory'], $language_id['language_id']);
			foreach($faq_Questions as $question){	
				$faq[$j] = $question;
				$j++;
			}
		}
		
		foreach ($faq_categories as $cat) {
      		echo '<h2 class="titleCat">'.urldecode(rawurldecode($cat['category'])).'</h2>';
      		echo'<div class="accordion">';
			$questions = false;
			foreach ($faq as $faqCurrent) { 
				if($faqCurrent['idCategory'] == $cat['idCategory']){
					$questions = true;
					echo '<h3><a href="#">'.urldecode(rawurldecode($faqCurrent['question'])).'</a></h3>
							<div>'
								.urldecode(rawurldecode($faqCurrent['response'])).
							'</div>';
				}
			}
			if(!$questions){
				echo $this->language->get('text_categoryEmpty');
			}
			echo'</div><br/>';
		}
		exit();
	}

	public function search(){
		$this->load->model('faq/faq');
		$this->load->language('faq/faq');
		// $language_id = $this->model_faq_faq->getLanguageByCode($this->session->data['language']);
		$language_id = $this->model_faq_faq->getLanguageByCode('en'); /* always English */
				
		$faq_categories = array();
		$i=0;
		$j=0;
		$faq_categories = $this->model_faq_faq->getFaqsQuery($_POST['query'], $language_id['language_id']);
		echo '<h2 class="titleCat">'.$this->language->get('text_results').'</h2>';
		if($faq_categories){
			echo'<div class="accordion">';
			foreach ($faq_categories as $faqCurrent) { 
				echo '<h3><a href="#">'.urldecode(rawurldecode($faqCurrent['question'])).'</a></h3>
						<div>'
							.urldecode(rawurldecode($faqCurrent['response'])).
						'</div>';
			}
			echo'</div><br/>';
		}
		else{
			echo'<div class="accordion">';
					echo '<h3><a href="#">'.$this->language->get('text_noResults').'</a></h3>
							<div>'.$this->language->get('text_descriptionNoResults').'</div>';
				echo'</div><br/>';
		}
		exit();
	}
}
?>