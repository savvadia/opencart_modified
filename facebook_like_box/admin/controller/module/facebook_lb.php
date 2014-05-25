<?php
class ControllerModuleFacebookLB extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/facebook_lb');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('facebook_lb', $this->request->post);		
			
			$this->cache->delete('product');
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_color_scheme_light'] = $this->language->get('text_color_scheme_light');
		$this->data['text_color_scheme_dark']  = $this->language->get('text_color_scheme_dark');
		$this->data['text_preview']            = $this->language->get('text_preview');
		
		$this->data['entry_page_url']        = $this->language->get('entry_page_url');
		$this->data['entry_dimension']       = $this->language->get('entry_dimension');
        $this->data['entry_color_scheme']    = $this->language->get('entry_color_scheme');
        $this->data['entry_faces']   		 = $this->language->get('entry_faces');
        $this->data['entry_stream'] 		 = $this->language->get('entry_stream');
        $this->data['entry_header'] 		 = $this->language->get('entry_header');
		$this->data['entry_border_color']    = $this->language->get('entry_border_color');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/facebook_lb', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/facebook_lb', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['facebook_lb_module'])) {
			$this->data['modules'] = $this->request->post['facebook_lb_module'];
		} elseif ($this->config->get('facebook_lb_module')) { 
			$this->data['modules'] = $this->config->get('facebook_lb_module');
		}				
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->data['token'] = $this->session->data['token'];
		
		$this->template = 'module/facebook_lb.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function preview() {   
		
		$this->data['page_url'] = $this->request->post['page_url'];
		$this->data['width'] = $this->request->post['width'];
		$this->data['height'] = $this->request->post['height'];
		$this->data['color_scheme'] = $this->request->post['color_scheme'];
		$this->data['show_faces'] = $this->request->post['show_faces'];
		$this->data['show_stream'] = $this->request->post['show_stream'];
		$this->data['show_header'] = $this->request->post['show_header'];
		$this->data['border_color'] = $this->request->post['border_color'];
		
		
		$this->template = 'module/facebook_lb_preview.tpl';
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/facebook_lb')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['facebook_lb_module'])) {
			foreach ($this->request->post['facebook_lb_module'] as $key => $value) {
				if (!$value['width'] || !$value['height']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}
				
				if (!$value['page_url']) {
					$this->error['page_url'][$key] = $this->language->get('error_page_url');
				}
			}
		}
		
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>