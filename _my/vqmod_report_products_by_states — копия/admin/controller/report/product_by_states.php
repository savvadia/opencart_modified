<?php
class ControllerReportProductByStates extends Controller { 
	public function index() {   
		$this->load->language('report/product_by_states');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['num_rec'])) {
			$num_rec = $this->request->get['num_rec'];
		} else {
			$num_rec=$this->config->get('config_admin_limit');
		}
		
						
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';
						
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if (isset($this->request->get['num_rec'])) {
			$url .= '&num_rec=' . $this->request->get['num_rec'];
		}
		
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('report/product_by_states', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
		
		$this->data['products'] = array();
		$this->data['products1'] = array();
		$this->data['groups1'] = array();
		$this->data['groups2'] = array();
		$this->data['groups3'] = array();
		

		 
		
		$data = array(  //это массив групп.
		Array("17", "22"), 
		Array("2", "5", "15", "17", "19" ,"22"), 
		Array("23", "24", "25", "26"),
		'start'   =>  ($page - 1) * $num_rec, 
		'limit'                  =>$num_rec
		);
		$results = $this->model_report_product->getProductByState($data);
		//$prices=$this->model_report_product->getProductByStatePrice($data);
		$product_total=$this->model_report_product->getProductByStateTotal($data);
		$groups1=$this->model_report_product->getProductStateLegend($data[0]);
		$groups2=$this->model_report_product->getProductStateLegend($data[1]);
		$groups3=$this->model_report_product->getProductStateLegend($data[2]);
			
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
				'model'      => $result['model'],
				'shipping'   => $result['shipping'],
				'paid'   => $result['paid'],
				'wholesale'   => $result['wholesale'],
				'total_shipping' =>$this->currency->format($result['total_shipping'], $this->config->get('config_currency')),
				'total_paid' => $this->currency->format($result['total_paid'], $this->config->get('config_currency')),
				'total_wholesale' => $this->currency->format($result['total_wholesale'], $this->config->get('config_currency'))
			);
		}
		
				foreach ($groups1 as $group1) {
			$this->data['groups1'][] = array(
				'name'       => $group1['name'],
			);
		}
				foreach ($groups2 as $group2) {
			$this->data['groups2'][] = array(
				'name'       => $group2['name'],
			);
		}
				foreach ($groups3 as $group3) {
			$this->data['groups3'][] = array(
				'name'       => $group3['name'],
			);
		}
		
		/*	foreach ($prices as $price) 
			{
			$this->data['products1'][] = array(
				'name'       =>$price['name'],
				'model'      => $price['model'],
				'shipping'   =>$this->model_report_product->format($price['shipping']),
				'paid'   => $this->model_report_product->format($price['paid']),
				'wholesale'   => $this->model_report_product->format($price['wholesale']),
			);
			}
		*/
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');
		
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_for_shipping'] = $this->language->get('column_for_shipping');
		$this->data['column_paid'] = $this->language->get('column_paid');
		$this->data['column_wholesale'] = $this->language->get('column_wholesale');
		$this->data['show_legend'] = $this->language->get('show_legend');
		$this->data['hide_legend'] = $this->language->get('hide_legend');
		
		$this->data['legend'] = $this->language->get('legend');
		
		$this->data['header_table1'] = $this->language->get('header_table1');
		$this->data['header_table2'] = $this->language->get('header_table2');
		$this->data['num_rec'] = $this->language->get('num_rec');
		$this->data['num_rec_value'] = $num_rec;
		$this->data['button_filter'] = $this->language->get('button_filter');
		
		$this->data['token'] = $this->session->data['token'];
		$this->data['page'] = $page;
		
	//	$this->load->model('localisation/order_status');
		
	//	$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		$url = '';
						
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $num_rec;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_by_states', 'token=' . $this->session->data['token'] . $url . '&page={page}'.'&num_rec='.$num_rec);
			
		$this->data['pagination'] = $pagination->render();		
		
	/*	$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end'] = $filter_date_end;		
		$this->data['filter_order_status_id'] = $filter_order_status_id;
	*/
		$this->template = 'report/product_by_states.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}	
}
?>