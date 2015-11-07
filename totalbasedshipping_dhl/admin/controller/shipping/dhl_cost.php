<?php

class ControllerShippingDhlCost extends Controller { 
	private $error = array();
	
	public function index() {  
	
		$this->load->language('shipping/dhl_cost');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {	
		
			$this->model_setting_setting->editSetting('dhl_cost', $this->request->post);	

			$this->session->data['success'] = $this->language->get('text_success');
									
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . ($this->session->data['token']));
				
		}
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_rate'] = $this->language->get('entry_rate');
		$this->data['entry_dhl_costclass'] = $this->language->get('entry_dhl_costclass');
		$this->data['entry_tax'] = $this->language->get('entry_tax');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home',
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/shipping',
       		'text'      => $this->language->get('text_shipping'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=shipping/dhl_cost',
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=shipping/dhl_cost&token=' . ($this->session->data['token']);
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . ($this->session->data['token']);

		$this->load->model('localisation/geo_zone');
		
		$geo_zones = $this->model_localisation_geo_zone->getGeoZones();
		
		foreach ($geo_zones as $geo_zone) {
			if (isset($this->request->post['dhl_cost' . $geo_zone['geo_zone_id'] . '_rate'])) {
				$this->data['dhl_cost_' . $geo_zone['geo_zone_id'] . '_rate'] = $this->request->post['dhl_cost_' . $geo_zone['geo_zone_id'] . '_rate'];
			} else {
				$this->data['dhl_cost_' . $geo_zone['geo_zone_id'] . '_rate'] = $this->config->get('dhl_cost_' . $geo_zone['geo_zone_id'] . '_rate');
			}		
			
			if (isset($this->request->post['dhl_cost_' . $geo_zone['geo_zone_id'] . '_status'])) {
				$this->data['dhl_cost_' . $geo_zone['geo_zone_id'] . '_status'] = $this->request->post['dhl_cost_' . $geo_zone['geo_zone_id'] . '_status'];
			} else {
				$this->data['dhl_cost_' . $geo_zone['geo_zone_id'] . '_status'] = $this->config->get('dhl_cost_' . $geo_zone['geo_zone_id'] . '_status');
			}		
		}
		
		$this->data['geo_zones'] = $geo_zones;
		if (isset($this->request->post['dhl_cost_tax_class_id'])) {
			$this->data['dhl_cost_tax_class_id'] = $this->request->post['dhl_cost_tax_class_id'];
		} else {
			$this->data['dhl_cost_tax_class_id'] = $this->config->get('dhl_cost_tax_class_id');
		}
		
		if (isset($this->request->post['dhl_cost_status'])) {
			$this->data['dhl_cost_status'] = $this->request->post['dhl_cost_status'];
		} else {
			$this->data['dhl_cost_status'] = $this->config->get('dhl_cost_status');
		}
		
		if (isset($this->request->post['dhl_cost_sort_order'])) {
			$this->data['dhl_cost_sort_order'] = $this->request->post['dhl_cost_sort_order'];
		} else {
			$this->data['dhl_cost_sort_order'] = $this->config->get('dhl_cost_sort_order');
		}	
		
		$this->load->model('localisation/tax_class');
				
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$this->template = 'shipping/dhl_cost.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
		$this->response->setOutput($this->render());
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/dhl_cost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>