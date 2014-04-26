<?php

class ControllerModuleNotifyWhenArrives extends Controller {

    private $error = array();
 
    public function index() {

	$this->load->language('module/notify_when_arrives');

	$this->document->setTitle($this->language->get('heading_title'));

	$this->load->model('setting/setting');

	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
	    $this->model_setting_setting->editSetting('notify_when_arrives', $this->request->post);

	    $this->session->data['success'] = $this->language->get('text_success');

	    $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
	}



	$this->data['tip_stock_status'] = $this->language->get('tip_stock_status');
 

	$this->data['text_install_error'] = $this->language->get('text_install_error');
	$this->data['text_install_success'] = $this->language->get('text_install_success');
	$this->data['text_installed'] = $this->language->get('text_installed');

	$this->data['token'] = $this->session->data['token'];

	$this->data['heading_title'] = $this->language->get('heading_title');

	$this->data['text_enabled'] = $this->language->get('text_enabled');
	$this->data['text_disabled'] = $this->language->get('text_disabled');

	$this->data['text_module'] = $this->language->get('text_module');

	$this->data['text_show_module'] = $this->language->get('text_show_module');
	$this->data['text_show_product'] = $this->language->get('text_show_product');

	$this->data['text_show_both'] = $this->language->get('text_show_both');
	$this->data['text_show_click'] = $this->language->get('text_show_click');
	$this->data['text_show_redirect'] = $this->language->get('text_show_redirect');
	$this->data['text_show_popup'] = $this->language->get('text_show_popup');
        
	$this->data['text_use_email'] = $this->language->get('text_use_email');
	$this->data['text_use_name'] = $this->language->get('text_use_name');
	$this->data['text_use_phone'] = $this->language->get('text_use_phone');
	$this->data['text_use_custom'] = $this->language->get('text_use_custom');
        
	$this->data['text_custom_type'] = $this->language->get('text_custom_type');
        
	$this->data['text_general'] = $this->language->get('text_general');
	$this->data['text_statistics'] = $this->language->get('text_statistics');

	$this->data['text_product_name'] = $this->language->get('text_product_name');
	$this->data['text_product_requested'] = $this->language->get('text_product_requested');
	$this->data['text_product_notified'] = $this->language->get('text_product_notified');
	$this->data['text_product_emails'] = $this->language->get('text_product_emails');

	$this->data['text_content_top'] = $this->language->get('text_content_top');
	$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
	$this->data['text_column_left'] = $this->language->get('text_column_left');
	$this->data['text_column_right'] = $this->language->get('text_column_right');
	$this->data['text_view_mails'] = $this->language->get('text_view_mails');
	$this->data['text_hide_mails'] = $this->language->get('text_hide_mails');
	$this->data['text_confirm_delete'] = $this->language->get('text_confirm_delete');

	$this->data['text_delete_ok'] = $this->language->get('text_delete_ok');
	$this->data['text_delete_error'] = $this->language->get('text_delete_error');

	$this->data['text_updated'] = $this->language->get('text_updated');

	$this->data['text_delete_statistic'] = $this->language->get('text_delete_statistic');
	$this->data['text_no_data'] = $this->language->get('text_no_data');
	$this->data['text_tip_layout'] = $this->language->get('text_tip_layout');

	$this->data['text_none'] = $this->language->get('text_none');

	$this->data['text_notify_auto'] = $this->language->get('text_notify_auto');
	$this->data['text_notify_manual'] = $this->language->get('text_notify_manual');

	$this->data['text_nwa_replace_default'] = $this->language->get('text_nwa_replace_default');
	$this->data['text_nwa_replace_compatibility'] = $this->language->get('text_nwa_replace_compatibility');
	$this->data['text_nwa_replace_append'] = $this->language->get('text_nwa_replace_append');
        $this->data['text_nwa_replace_popup'] = $this->language->get('text_nwa_replace_popup');
	
	$this->data['text_custom_type_number'] = $this->language->get('text_custom_type_number');
	$this->data['text_custom_type_text'] = $this->language->get('text_custom_type_text');
	$this->data['text_custom_type_text_number'] = $this->language->get('text_custom_type_text_number');
	$this->data['text_custom_type_any'] = $this->language->get('text_custom_type_any');
      
	$this->data['entry_stock_status'] = $this->language->get('entry_stock_status');
        
	$this->data['entry_nwa_replace_mode'] = $this->language->get('entry_nwa_replace_mode');
	$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        
	$this->data['entry_subject_costumer'] = $this->language->get('entry_subject_costumer');
	$this->data['entry_subject_admin'] = $this->language->get('entry_subject_admin');
	$this->data['entry_mail_costumer'] = $this->language->get('entry_mail_costumer');
	$this->data['entry_mail_admin'] = $this->language->get('entry_mail_admin');

    	$this->data['entry_fields'] = $this->language->get('entry_fields');
        $this->data['entry_custom_name'] = $this->language->get('entry_custom_name');
        $this->data['entry_custom_type'] = $this->language->get('entry_custom_type');
                
	$this->data['entry_status'] = $this->language->get('entry_status');
	$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
	$this->data['entry_layout'] = $this->language->get('entry_layout');
	$this->data['entry_position'] = $this->language->get('entry_position');
	$this->data['entry_show_mode'] = $this->language->get('entry_show_mode');
	$this->data['entry_install'] = $this->language->get('entry_install');
	$this->data['entry_notify_mode'] = $this->language->get('entry_notify_mode');
	$this->data['entry_nwa_cron_key'] = $this->language->get('entry_nwa_cron_key');
	$this->data['entry_nwa_cron_key_tip'] = $this->language->get('entry_nwa_cron_key_tip');
        
	$this->data['button_save'] = $this->language->get('button_save');
	$this->data['button_cancel'] = $this->language->get('button_cancel');
	$this->data['button_add_module'] = $this->language->get('button_add_module');
	$this->data['button_add_account'] = $this->language->get('button_add_account');
	$this->data['button_remove'] = $this->language->get('button_remove');
	$this->data['button_notify'] = $this->language->get('button_notify');

	$this->data['tab_general'] = $this->language->get('tab_general');
	$this->data['tab_statistics'] = $this->language->get('tab_statistics');
	$this->data['tab_mail'] = $this->language->get('tab_mail');
        
	$this->data['tip_notify_mode'] = $this->language->get('tip_notify_mode');
        
	$this->data['entry_notify_admin'] = $this->language->get('entry_notify_admin');
        	
	$this->data['entry_notify_button'] = $this->language->get('entry_notify_button');
        
    if (isset($this->request->post['nwa_use_name'])) {
	    $this->data['nwa_use_name'] = $this->request->post['nwa_use_name'];
	} else {
	    $this->data['nwa_use_name'] = $this->config->get('nwa_use_name');
	}  
        
    if (isset($this->request->post['nwa_use_phone'])) {
	    $this->data['nwa_use_phone'] = $this->request->post['nwa_use_phone'];
	} else {
	    $this->data['nwa_use_phone'] = $this->config->get('nwa_use_phone');
	}  
        
     if (isset($this->request->post['nwa_use_custom'])) {
	    $this->data['nwa_use_custom'] = $this->request->post['nwa_use_custom'];
	} else {
	    $this->data['nwa_use_custom'] = $this->config->get('nwa_use_custom');
	} 
            if (isset($this->request->post['nwa_custom_name'])) {
	    $this->data['nwa_custom_name'] = $this->request->post['nwa_custom_name'];
	} else {
	    $this->data['nwa_custom_name'] = $this->config->get('nwa_custom_name');
	}  
        
    if (isset($this->request->post['nwa_custom_type'])) {
	    $this->data['nwa_custom_type'] = $this->request->post['nwa_custom_type'];
	} else {
	    $this->data['nwa_custom_type'] = $this->config->get('nwa_custom_type');
	}   
        
        if (isset($this->request->post['notify_button'])) {
	    $this->data['notify_button'] = $this->request->post['notify_button'];
	} else {
	    $this->data['notify_button'] = $this->config->get('notify_button');
	}
        
                if (isset($this->request->post['notify_admin'])) {
	    $this->data['notify_admin'] = $this->request->post['notify_admin'];
	} else {
	    $this->data['notify_admin'] = $this->config->get('notify_admin');
	}
        
    if (isset($this->request->post['nwa_cron_key'])) {
	    $this->data['nwa_cron_key'] = $this->request->post['nwa_cron_key'];
	} else {
	    $this->data['nwa_cron_key'] = $this->config->get('nwa_cron_key');
	} 
        
	if (isset($this->request->post['nwa_replace_mode'])) {
	    $this->data['nwa_replace_mode'] = $this->request->post['nwa_replace_mode'];
	} else {
	    $this->data['nwa_replace_mode'] = $this->config->get('nwa_replace_mode');
	}
	if (isset($this->error['warning'])) {
	    $this->data['error_warning'] = $this->error['warning'];
	} else {
	    $this->data['error_warning'] = '';
	}

	if (isset($this->request->post['notify_mode'])) {
	    $this->data['notify_mode'] = $this->request->post['notify_mode'];
	} else {
	    $this->data['notify_mode'] = $this->config->get('notify_mode');
	}


	if (isset($this->request->post['notify_when_arrives'])) {
	    $this->data['modules'] = $this->request->post['notify_when_arrives'];
	} elseif ($this->config->get('notify_when_arrives')) {
	    $this->data['modules'] = $this->config->get('notify_when_arrives');
	}

	$this->data['breadcrumbs'] = array();

	$this->data['breadcrumbs'][] = array(
	    'text' => $this->language->get('text_home'),
	    'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	    'separator' => false
	);

	$this->data['breadcrumbs'][] = array(
	    'text' => $this->language->get('text_module'),
	    'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
	    'separator' => ' :: '
	);

	$this->data['breadcrumbs'][] = array(
	    'text' => $this->language->get('heading_title'),
	    'href' => $this->url->link('module/notify_when_arrives', 'token=' . $this->session->data['token'], 'SSL'),
	    'separator' => ' :: '
	);


	$this->data['action'] = $this->url->link('module/notify_when_arrives', 'token=' . $this->session->data['token'], 'SSL');

	$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

	$this->load->model('localisation/stock_status');

	$this->data['status_list'] = $this->model_localisation_stock_status->getStockStatuses();
	
	$this->load->model('localisation/language');

	$this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        $this->load->model('sale/customer_group');
 
        $not_logged = array('customer_group_id' => 'not_logged','name'=> $this->language->get('text_nwa_not_logged_users'));
 
        $customer_groups =$this->model_sale_customer_group->getCustomerGroups();
        
         array_unshift( $customer_groups,$not_logged);
        
        $this->data['customer_groups'] =   $customer_groups;

	if (isset($this->request->post['notify_when_arrives_skip_status'])) {

	    $this->data['notify_when_arrives_skip_status'] = (array) explode(',',$this->request->post['notify_when_arrives_skip_status']);
	} else {
	    $this->data['notify_when_arrives_skip_status'] = (array) explode(',',$this->config->get('notify_when_arrives_skip_status'));
	}
	if (isset($this->request->post['notify_when_arrives_customer_group'])) {

	    $this->data['notify_when_arrives_customer_group'] = (array) explode(',',$this->request->post['notify_when_arrives_customer_group']);
	} else {
	    $this->data['notify_when_arrives_customer_group'] = (array) explode(',',$this->config->get('notify_when_arrives_customer_group'));
	}
	$this->data['notify_when_arrives_subject'] = array();
	$this->data['notify_when_arrives_mail'] = array();
	
	foreach($this->data['languages'] as $language){
	    
	   if(isset($this->request->post['notify_when_arrives_subject_'.$language['language_id'].'_costumer'])){
		
		$this->data['notify_when_arrives_subject'][$language['language_id']]['costumer'] = $this->request->post['notify_when_arrives_subject_'.$language['language_id'].'_costumer'];
	   
		$this->data['notify_when_arrives_mail'][$language['language_id']]['costumer'] = $this->request->post['notify_when_arrives_mail_'.$language['language_id'].'_costumer'];
 
	    }else{
		
		if ($this->config->get('notify_when_arrives_subject_'.$language['language_id'].'_costumer')){
		 
		    $this->data['notify_when_arrives_subject'][$language['language_id']]['costumer'] = $this->config->get('notify_when_arrives_subject_'.$language['language_id'].'_costumer');
  
		}else{
		    

		    $this->data['notify_when_arrives_subject'][$language['language_id']]['costumer'] = $this->language->get('default_mail_subject');
     
		}
		
		if ($this->config->get('notify_when_arrives_mail_'.$language['language_id'].'_costumer')){
		    
		    $this->data['notify_when_arrives_mail'][$language['language_id']]['costumer'] = $this->config->get('notify_when_arrives_mail_'.$language['language_id'].'_costumer');
 
		}else{
		    
		    $this->data['notify_when_arrives_mail'][$language['language_id']]['costumer'] =$this->language->get('default_mail_body');
 		    
		}

	    }

	    if(isset($this->request->post['notify_when_arrives_subject_'.$language['language_id'].'_admin'])){
 
		$this->data['notify_when_arrives_subject'][$language['language_id']]['admin'] = $this->request->post['notify_when_arrives_subject_'.$language['language_id'].'_admin'];
	   
		$this->data['notify_when_arrives_mail'][$language['language_id']]['admin'] = $this->request->post['notify_when_arrives_mail_'.$language['language_id'].'_admin'];
 
	    }else{
		
		if ($this->config->get('notify_when_arrives_subject_'.$language['language_id'].'_admin')){
		    
		    $this->data['notify_when_arrives_subject'][$language['language_id']]['admin'] = $this->config->get('notify_when_arrives_subject_'.$language['language_id'].'_admin');
	       
		}else{
		    
		    $this->data['notify_when_arrives_subject'][$language['language_id']]['admin'] = $this->language->get('default_mail_subject_admin');
	           
		}
		
		if ( $this->config->get('notify_when_arrives_mail_'.$language['language_id'].'_admin')){
		    
		    $this->data['notify_when_arrives_mail'][$language['language_id']]['admin'] = $this->config->get('notify_when_arrives_mail_'.$language['language_id'].'_admin');
    
		}else{
		    
		    $this->data['notify_when_arrives_mail'][$language['language_id']]['admin'] = $this->language->get('default_mail_body_admin');
       
		}

	    }
  
	}
		
	if (isset($this->request->post['notify_when_arrives_status'])) {
	    $this->data['notify_when_arrives_status'] = $this->request->post['notify_when_arrives_status'];
	} else {
	    $this->data['notify_when_arrives_status'] = $this->config->get('notify_when_arrives_status');
	}

	if (isset($this->request->post['notify_when_arrives_show_mode'])) {
	    $this->data['notify_when_arrives_show_mode'] = $this->request->post['notify_when_arrives_show_mode'];
	} else {
	    $this->data['notify_when_arrives_show_mode'] = $this->config->get('notify_when_arrives_show_mode');
	}

	if (substr(VERSION, 0, 5) == '1.5.0') {

	    $this->data['version'] = '1.5.0';

	    if (isset($this->request->post['notify_when_arrives_module'])) {
		$modules = explode(',', $this->request->post['notify_when_arrives_module']);
		$this->data['notify_when_arrives_module'] = $this->request->post['notify_when_arrives_module'];
	    } elseif ($this->config->get('notify_when_arrives_module') != '') {
		$modules = explode(',', $this->config->get('notify_when_arrives_module'));
		$this->data['notify_when_arrives_module'] = $this->config->get('notify_when_arrives_module');
	    } else {
		$modules = array();
		$this->data['notify_when_arrives_module'] = null;
	    }


	    foreach ($modules as $module) {
		if (isset($this->request->post['notify_when_arrives_' . $module . '_layout_id'])) {
		    $this->data['notify_when_arrives_' . $module . '_layout_id'] = $this->request->post['notify_when_arrives_' . $module . '_layout_id'];
		} else {
		    $this->data['notify_when_arrives_' . $module . '_layout_id'] = $this->config->get('notify_when_arrives_' . $module . '_layout_id');
		}

		if (isset($this->request->post['notify_when_arrives_' . $module . '_position'])) {
		    $this->data['notify_when_arrives_' . $module . '_position'] = $this->request->post['notify_when_arrives_' . $module . '_position'];
		} else {
		    $this->data['notify_when_arrives_' . $module . '_position'] = $this->config->get('notify_when_arrives_' . $module . '_position');
		}

		if (isset($this->request->post['notify_when_arrives_' . $module . '_status'])) {
		    $this->data['notify_when_arrives_' . $module . '_status'] = $this->request->post['notify_when_arrives_' . $module . '_status'];
		} else {
		    $this->data['notify_when_arrives_' . $module . '_status'] = $this->config->get('notify_when_arrives_' . $module . '_status');
		}

		if (isset($this->request->post['notify_when_arrives_' . $module . '_sort_order'])) {
		    $this->data['notify_when_arrives_' . $module . '_sort_order'] = $this->request->post['notify_when_arrives_' . $module . '_sort_order'];
		} else {
		    $this->data['notify_when_arrives_' . $module . '_sort_order'] = $this->config->get('notify_when_arrives_' . $module . '_sort_order');
		}
	    }

	    $this->data['modules'] = $modules;
	} else {

	    $this->data['version'] = '1.5.1';

	    $this->data['modules'] = array();

	    if (isset($this->request->post['notify_when_arrives_module'])) {

		$this->data['modules'] = $this->request->post['notify_when_arrives_module'];
	    } elseif ($this->config->get('notify_when_arrives_module')) {
		$this->data['modules'] = $this->config->get('notify_when_arrives_module');
	    }
	}


	$this->load->model('module/notify_when_arrives');

	$this->data['notify_when_arrives_installed'] = $this->model_module_notify_when_arrives->install();
	$this->data['product_statistics'] = $this->model_module_notify_when_arrives->getList();

	$this->load->model('design/layout');

	$this->data['layouts'] = $this->model_design_layout->getLayouts();

	$this->template = 'module/notify_when_arrives.tpl';
	$this->children = array(
	    'common/header',
	    'common/footer',
	);

	$this->response->setOutput($this->render());
    }
    public function option_warning() {

	    $this->load->language('module/notify_when_arrives');

	    $this->response->setOutput('<div class="attention">'.str_replace('{heading_title}','<a href="index.php?route=module/notify_when_arrives&amp;token='.$this->session->data['token'].'">'.$this->language->get('heading_title').'</a>', $this->language->get('option_warning')).'</div>');

    }
    public function notify() {

	$this->load->language('module/notify_when_arrives');

	$this->load->model('module/notify_when_arrives');
        
        $sent = 0;


	if (!isset($this->request->get['main']) || $this->config->get('notify_mode') || isset($this->request->get['nwa_cron_key']) ) {

	    $requests = $this->model_module_notify_when_arrives->getList(true);

	    if ($requests) {

		$stores = array();

		$stores[0] = array('url' => HTTP_CATALOG, 'name' => $this->config->get('config_name'), 'email' => $this->config->get('config_email'));

		$this->load->model('setting/store');
		$this->load->model('setting/setting');

		foreach ($this->model_setting_store->getStores() as $result) {

		    $store_config = $this->model_setting_setting->getSetting('config', $result['store_id']);

		    $stores[$result['store_id']] = array('url' => $store_config['config_url'], 'name' => $store_config['config_name'], 'email' => $store_config['config_email']);
		}
 
		foreach ($requests['statistics'] as $store_id => $store_requests) {

		    foreach ($store_requests as $language_id => $language_request) {
			
			$mail_subject = $this->config->get('notify_when_arrives_subject_'.$language_id.'_costumer');
			$mail_admin_subject = $this->config->get('notify_when_arrives_subject_'.$language_id.'_admin');
			$mail_message = html_entity_decode($this->config->get('notify_when_arrives_mail_'.$language_id.'_costumer'), ENT_QUOTES, 'UTF-8');
			$mail_admin_message = html_entity_decode($this->config->get('notify_when_arrives_mail_'.$language_id.'_admin'), ENT_QUOTES, 'UTF-8');

			foreach ($language_request as $request_id => $request) {

			    $id = $request['product_id'];
			    $name = $request['name'];
                            $keyword = $request['keyword'];
			    $mails = $request['mails'];
                            
                            if (!$keyword || !$this->config->get('config_seo_url')){
                               
                                  $link = '<a href="' . $stores[$store_id]['url'] . 'index.php?route=product/product&amp;product_id=' . $id . '">' . $stores[$store_id]['url'] . 'index.php?route=product/product&amp;product_id=' . $id . '</a>';
			    
                                
                            }else{
                                
                                
                                  $link = '<a href="' . $stores[$store_id]['url'] . $keyword.'">'. $stores[$store_id]['url'] . $keyword. '</a>';
			    
                                             
                            }
                            
                            $store_name = $stores[$store_id]['name'];

			    $subject = str_replace(array('{store_name}', '{product_name}', '{product_link}'), array($store_name, $name, $link), $mail_subject);
			    $message = str_replace(array('{store_name}', '{product_name}', '{product_link}'), array($store_name, $name, $link), $mail_message);


			    foreach ($mails as $user_info) {
                                
                                $message = str_replace(array('{user_name}', '{user_phone}', '{user_custom}'), array($user_info['user'],$user_info['phone'],$user_info['custom']), $message);

				$this->sendEmail($stores[$store_id], $user_info['email'], $subject, $message);
                                                                
                                $sent ++;

			    }

			    $admin_subject = str_replace(array('{store_name}', '{product_name}', '{product_link}'), array($store_name, $name, $link), $mail_admin_subject);
			    $admin_message = str_replace(array('{store_name}', '{product_name}', '{product_link}'), array($store_name, $name, $link), $mail_admin_message);

			    $this->sendEmail($stores[$store_id], $stores[$store_id]['email'], $admin_subject, $admin_message);
			}
		    }
		}

		    $this->model_module_notify_when_arrives->updateStatistics($requests['ids']);

	    }
	}
	if (isset($this->request->get['main'])) {

	    $waiting = $this->model_module_notify_when_arrives->count();

	    if ($waiting) {

		$this->response->setOutput(' <span><b style="color:red;text-decoration:blink;">' . $waiting . '</b> ' . $this->language->get('text_wait_count').'</span>');
	    } else {

		$this->response->setOutput('<span><b>0</b> ' . $this->language->get('text_wait_count').'</span>');
	    }
	}elseif (isset($this->request->get['nwa_cron_key'])) {
            
             $waiting = (int) $this->model_module_notify_when_arrives->count();

 
            $this->response->setOutput(str_replace(array('{count_sent}','{count_wait}'), array($sent,$waiting), $this->language->get('text_wait_count_cron')));
	
        }else {
 
	    $this->response->setOutput(json_encode($this->model_module_notify_when_arrives->getList()));
	}
    }
    public function delete() {

	$json = array();

	if (isset($this->request->post['product_id'])) {

	    $this->load->model('module/notify_when_arrives');

	    $delete_status = $this->model_module_notify_when_arrives->deleteStatistic($this->request->post['product_id']);

	    $json = array('success' => $delete_status, 'error' => 0);
	} else {

	    $json = array('success' => 0, 'error' => 1);
	}

	$this->response->setOutput(json_encode($json));
    }

    private function sendEmail($store, $address, $subject, $message) {

	if (!isset($this->notify_mail)) {

	    $this->notify_mail = new Mail();
	    $this->notify_mail->protocol = $this->config->get('config_mail_protocol');
	    $this->notify_mail->parameter = $this->config->get('config_mail_parameter');
	    $this->notify_mail->hostname = $this->config->get('config_smtp_host');
	    $this->notify_mail->username = $this->config->get('config_smtp_username');
	    $this->notify_mail->password = $this->config->get('config_smtp_password');
	    $this->notify_mail->port = $this->config->get('config_smtp_port');
	    $this->notify_mail->timeout = $this->config->get('config_smtp_timeout');
	}

	$this->notify_mail->setFrom($store['email']);
	$this->notify_mail->setSender($store['name']);

	$this->notify_mail->setTo($address);
	$this->notify_mail->setSubject($subject);
	$this->notify_mail->setHtml($message);
	#$this->notify_mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
	#$this->notify_mail->setSender($order_info['store_name']);
	#$this->notify_mail->addAttachment(DIR_IMAGE . $this->config->get('config_logo'), md5(basename($this->config->get('config_logo'))));

	$this->notify_mail->send();
    }

    private function validate() {
	if (!$this->user->hasPermission('modify', 'module/notify_when_arrives')) {
	    $this->error['warning'] = $this->language->get('error_permission');
	}
	if (isset($this->request->post['notify_when_arrives_skip_status'])){
	    
	    $this->request->post['notify_when_arrives_skip_status'] =  implode(',',  $this->request->post['notify_when_arrives_skip_status']);
	}
	if (isset($this->request->post['notify_when_arrives_customer_group'])){
	    
	    $this->request->post['notify_when_arrives_customer_group'] =  implode(',',  $this->request->post['notify_when_arrives_customer_group']);
	}
	if (!$this->error) {
	    return true;
	} else {
	    return false;
	}
    }

}

?>