<?php
class ControllerModuleFacebookLB extends Controller {
	protected function index($setting) {
		
      	$this->data['page_url'] = $setting['page_url'];
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		$this->data['color_scheme'] = $setting['color_scheme'];
		$this->data['show_faces'] = $setting['show_faces'];
		$this->data['show_stream'] = $setting['show_stream'];
		$this->data['show_header'] = $setting['show_header'];
		$this->data['border_color'] = $setting['border_color'];
		
		if ($this->config->get('fdu_app_id')){
			$this->data['flb_app_id'] = $this->config->get('fdu_app_id');
		} else {
			$this->data['flb_app_id'] = false;
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/facebook_lb.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/facebook_lb.tpl';
		} else {
			$this->template = 'default/template/module/facebook_lb.tpl';
		}

		$this->render();
	}
}
?>