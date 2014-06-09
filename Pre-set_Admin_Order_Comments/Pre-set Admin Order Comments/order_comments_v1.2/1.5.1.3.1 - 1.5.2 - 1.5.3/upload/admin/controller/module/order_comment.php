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

		$this->data['tab_comment1'] = $this->language->get('tab_comment1');
		$this->data['tab_comment2'] = $this->language->get('tab_comment2');
		$this->data['tab_comment3'] = $this->language->get('tab_comment3');
		$this->data['tab_comment4'] = $this->language->get('tab_comment4');
		$this->data['tab_comment5'] = $this->language->get('tab_comment5');
		$this->data['tab_comment6'] = $this->language->get('tab_comment6');

		$this->data['entry_com1_title'] = $this->language->get('entry_com1_title');
		$this->data['entry_com1_contents'] = $this->language->get('entry_com1_contents');
		$this->data['entry_com2_title'] = $this->language->get('entry_com2_title');
		$this->data['entry_com2_contents'] = $this->language->get('entry_com2_contents');
		$this->data['entry_com3_title'] = $this->language->get('entry_com3_title');
		$this->data['entry_com3_contents'] = $this->language->get('entry_com3_contents');
		$this->data['entry_com4_title'] = $this->language->get('entry_com4_title');
		$this->data['entry_com4_contents'] = $this->language->get('entry_com4_contents');
		$this->data['entry_com5_title'] = $this->language->get('entry_com5_title');
		$this->data['entry_com5_contents'] = $this->language->get('entry_com5_contents');
		$this->data['entry_com6_title'] = $this->language->get('entry_com6_title');
		$this->data['entry_com6_contents'] = $this->language->get('entry_com6_contents');
		
		
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
		
		if (isset($this->request->post['com1_title'])) {
			$this->data['com1_title'] = $this->request->post['com1_title'];
		} else {
			$this->data['com1_title'] = $this->config->get('com1_title');
		}
		
		if (isset($this->request->post['com1_contents'])) {
			$this->data['com1_contents'] = $this->request->post['com1_contents'];
		} else {
			$this->data['com1_contents'] = $this->config->get('com1_contents');
		}
		
		if (isset($this->request->post['com2_title'])) {
			$this->data['com2_title'] = $this->request->post['com2_title'];
		} else {
			$this->data['com2_title'] = $this->config->get('com2_title');
		}
		
		if (isset($this->request->post['com2_contents'])) {
			$this->data['com2_contents'] = $this->request->post['com2_contents'];
		} else {
			$this->data['com2_contents'] = $this->config->get('com2_contents');
		}
			
		if (isset($this->request->post['com3_title'])) {
			$this->data['com3_title'] = $this->request->post['com3_title'];
		} else {
			$this->data['com3_title'] = $this->config->get('com3_title');
		}
		
		if (isset($this->request->post['com3_contents'])) {
			$this->data['com3_contents'] = $this->request->post['com3_contents'];
		} else {
			$this->data['com3_contents'] = $this->config->get('com3_contents');
		}
			
		if (isset($this->request->post['com4_title'])) {
			$this->data['com4_title'] = $this->request->post['com4_title'];
		} else {
			$this->data['com4_title'] = $this->config->get('com4_title');
		}
		
		if (isset($this->request->post['com4_contents'])) {
			$this->data['com4_contents'] = $this->request->post['com4_contents'];
		} else {
			$this->data['com4_contents'] = $this->config->get('com4_contents');
		}
			
		if (isset($this->request->post['com5_title'])) {
			$this->data['com5_title'] = $this->request->post['com5_title'];
		} else {
			$this->data['com5_title'] = $this->config->get('com5_title');
		}
		
		if (isset($this->request->post['com5_contents'])) {
			$this->data['com5_contents'] = $this->request->post['com5_contents'];
		} else {
			$this->data['com5_contents'] = $this->config->get('com5_contents');
		}
			
		if (isset($this->request->post['com6_title'])) {
			$this->data['com6_title'] = $this->request->post['com6_title'];
		} else {
			$this->data['com6_title'] = $this->config->get('com6_title');
		}
		
		if (isset($this->request->post['com6_contents'])) {
			$this->data['com6_contents'] = $this->request->post['com6_contents'];
		} else {
			$this->data['com6_contents'] = $this->config->get('com6_contents');
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