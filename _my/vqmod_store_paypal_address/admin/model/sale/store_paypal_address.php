<?php

class ModelSaleStorePaypalAddress extends Model {

    public function install() {
	
		$update = array();
		
		$query_column = $this->db->query("SHOW COLUMNS FROM `order` LIKE 'user'");
		if (!$query_column->num_rows) {
			 $update[] = $this->db->query('ALTER TABLE order ADD payment_paypal_receiver VARCHAR(64)');
		}
			
		return (!in_array(false, $update));
    }
	
}
?>