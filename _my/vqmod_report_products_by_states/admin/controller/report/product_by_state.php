<?php

class ControllerReportProductByState extends Controller { 

	private function normalize_value($var) {
		return round(empty($var) ? 0 : $var, 0);
	}

	public function index() {  
		$this->load->language('report/product_by_state');
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}
		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}
		
		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}	
						
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

								
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
   		$this->data['breadcrumbs'] = array();
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('report/product_by_state', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
		
		$this->data['products'] = array();

		$this->load->model('localisation/order_status');
		
		$order_statuses = $this->model_localisation_order_status->getOrderStatuses();		

		foreach ($order_statuses as $key => $order_status) {
		
			$order_status_id = $order_status['order_status_id'];

			$data = array(
				'filter_date_start'	     => $filter_date_start, 
				'filter_date_end'	     => $filter_date_end, 
				'filter_order_status_id' => $order_status_id,
				'start'                  => 0, // ($page - 1) * $this->config->get('config_admin_limit')
				'limit'                  => 10000,
			);		

			$results = $this->model_report_product->getPurchased($data);	

			foreach ($results as $result) {
			
				if(!array_key_exists ($result['model'], $this->data['products'])) {
					$this->data['products'][$result['model']] = array(
						'name'       => $result['name'],
						'model'      => $result['model']
					);
				}
				$this->data['products'][$result['model']][$order_status_id]['quantity'] = $result['quantity'];
				$this->data['products'][$result['model']][$order_status_id]['total'] = $result['total'];
				
				if(!isset($order_statuses[$key]['total'])) {
					$order_statuses[$key]['total'] = 0;
				}
				
				$order_statuses[$key]['total'] += $result['total'];
				
			}
		}
	
		/* 
		1 Pending
		2 Processing
		5 Complete
		7 Canceled
		8 Denied
		9 Canceled Reversal
		10 Failed
		11 Refunded
		12 Reversed
		13 Chargeback
		14 Expired
		15 Shipped
		16 Voided
		17 Accepted for shipping
		18 Refund requested
		19 Shipped partially
		20 Joined
		21 Shipping claim
		22 Preparation for shipping
		23 WS Partially paid
		24 WS Fully paid
		25 WS Shipped
		26 WS Complete
		27 Done 
		*/
		$order_status_to_ship    = array(17, 19, 22);
		$order_status_sold       = array(17, 19, 22, 5, 15, 21);
		$order_status_ws_to_ship = array(23, 24);
		$order_status_ws_sold    = array(23, 24, 25, 26);
		$order_status_nice_order = array(17, 22, 19, 15, 5, 23, 24, 25, 26, 1, 21, 2, 11);
		
		$this->data['m_to_ship'] = 0;
		$this->data['m_sold'] = 0;
		$this->data['m_ws_to_ship'] = 0;
		$this->data['m_ws_sold'] = 0;
		
		foreach ($this->data['products'] as $model => $product_data) {
		
			$this->data['products'][$model]['q_to_ship'] = 0;
			$this->data['products'][$model]['q_sold'] = 0;
			$this->data['products'][$model]['q_ws_to_ship'] = 0;
			$this->data['products'][$model]['q_ws_sold'] = 0;
			$this->data['products'][$model]['m_to_ship'] = 0;
			$this->data['products'][$model]['m_sold'] = 0;
			$this->data['products'][$model]['m_ws_to_ship'] = 0;
			$this->data['products'][$model]['m_ws_sold'] = 0;
			
			foreach ($order_statuses as $key => $order_status) {
			
					$order_status_id = $order_status['order_status_id'];
					$quantity = round(isset($this->data['products'][$model][$order_status_id]['quantity']) ? $this->data['products'][$model][$order_status_id]['quantity']:0, 0);
					$total    = round(isset($this->data['products'][$model][$order_status_id]['quantity']) ? $this->data['products'][$model][$order_status_id]['total']:0, 0);
					
					if(in_array($order_status_id, $order_status_to_ship)) {
						$this->data['products'][$model]['q_to_ship'] += $quantity;
						$this->data['products'][$model]['m_to_ship'] += $total;
						$this->data['m_to_ship'] += $total;
					}
					if(in_array($order_status_id, $order_status_sold)) {
						$this->data['products'][$model]['q_sold'] += $quantity;
						$this->data['products'][$model]['m_sold'] += $total;
						$this->data['m_sold'] += $total;
					}
					if(in_array($order_status_id, $order_status_ws_to_ship)) {
						$this->data['products'][$model]['q_ws_to_ship'] += $quantity;
						$this->data['products'][$model]['m_ws_to_ship'] += $total;
						$this->data['m_ws_to_ship'] += $total;
					}
					if(in_array($order_status_id, $order_status_ws_sold)) {
						$this->data['products'][$model]['q_ws_sold'] += $quantity;
						$this->data['products'][$model]['m_ws_sold'] += $total;
						$this->data['m_ws_sold'] += $total;
					} 
			}
		}
		
		usort($this->data['products'], function($a, $b) {
			return $b['m_to_ship'] + $b['m_ws_to_ship'] - $a['m_to_ship'] - $a['m_ws_to_ship'];
		});
		
		$this->data['order_statuses'] = array();
		foreach ($order_status_nice_order as $order_status_id) {
			foreach ($order_statuses as $order_status) {
				if($order_status['order_status_id'] == $order_status_id &&
				   $order_status['total'] <> 0) {
					$this->data['order_statuses'][] = $order_status;
					break;
				}
			}
		}

		foreach ($order_statuses as $order_status) {
			if(!in_array($order_status['order_status_id'], $order_status_nice_order) &&
			   $order_status['total'] <> 0) {
				$this->data['order_statuses'][] = $order_status;
			}
		}
		
		$this->data['order_status_to_ship'] = $order_status_to_ship;
		$this->data['order_status_sold'] = $order_status_sold;
		$this->data['order_status_ws_to_ship'] = $order_status_ws_to_ship;
		$this->data['order_status_ws_sold'] = $order_status_ws_sold;
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');

		$this->data['header_to_ship'] = $this->language->get('header_to_ship');
		$this->data['header_sold'] = $this->language->get('header_sold');
		$this->data['header_ws_to_ship'] = $this->language->get('header_ws_to_ship');
		$this->data['header_ws_sold'] = $this->language->get('header_ws_sold');
		
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');

		$this->data['column_q_to_ship'] = $this->language->get('column_q_to_ship');
		$this->data['column_q_sold'] = $this->language->get('column_q_sold');
		$this->data['column_q_ws_to_ship'] = $this->language->get('column_q_ws_to_ship');
		$this->data['column_q_ws_sold'] = $this->language->get('column_q_ws_sold');
		$this->data['column_m_to_ship'] = $this->language->get('column_m_to_ship');
		$this->data['column_m_sold'] = $this->language->get('column_m_sold');
		$this->data['column_m_ws_to_ship'] = $this->language->get('column_m_ws_to_ship');
		$this->data['column_m_ws_sold'] = $this->language->get('column_m_ws_sold');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['button_filter'] = $this->language->get('button_filter');
		
		$this->data['token'] = $this->session->data['token'];
		
		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}
		
/* 		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_by_state', 'token=' . $this->session->data['token'] . $url . '&page={page}');
		$this->data['pagination'] = $pagination->render();		
	 */		
		
		$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end'] = $filter_date_end;		
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		
		$this->template = 'report/product_by_state.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}	
}
?>