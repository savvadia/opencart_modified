<?php
class ControllerModuleOrderComment extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/order_comment');

        $this->document->setTitle($this->language->get('heading_title'));
        
		$this->load->model('setting/setting');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('order_comment', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

		$this->data['heading_title'] = $this->language->get('heading_title');

		for ($i=1; $i<=20; $i++) {

			/* $this->data['tab_comment' . $i] = $this->language->get('tab_comment' . $i); */
			$this->data['tab_comment' . $i] = $this->config->get('com' . $i . '_title') . " [" . $i . "]";
			$this->data['entry_com' .$i . '_title'] = $this->language->get('entry_com' . $i . '_title');
			$this->data['entry_com' .$i . '_contents'] = $this->language->get('entry_com' . $i . '_contents');
		
		}
	
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['token'] = $this->session->data['token'];
		
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
			'href'      => $this->url->link('module/order_comment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		$this->data['action'] = $this->url->link('module/order_comment', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
	for ($i=1; $i<=20; $i++) {
		
		if (isset($this->request->post['com' . $i . '_title'])) {
			$this->data['com' . $i . '_title'] = $this->request->post['com' . $i . '_title'];
		} else {
			$this->data['com' . $i . '_title'] = $this->config->get('com' . $i . '_title');
		}
		
		if (isset($this->request->post['com' . $i . '_contents'])) {
			$this->data['com' . $i . '_contents'] = $this->request->post['com' . $i . '_contents'];
		} else {
			$this->data['com' . $i . '_contents'] = $this->config->get('com' . $i . '_contents');
		}
		
	}			
		$this->template = 'module/order_comment.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
    }

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>