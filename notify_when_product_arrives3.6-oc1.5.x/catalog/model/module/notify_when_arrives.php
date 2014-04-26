<?php

class ModelModuleNotifyWhenArrives extends Model {

    public function getProductStatusId($product_id) {

	#1.5.0 does not return product status id
	if ($this->config->get('notify_when_arrives_installed')) {

	    $sql = "
            SELECT stock_status_id from " . DB_PREFIX . "product as product
            WHERE
            product_id = '" . (int) $product_id . "'
	     ";

	    $query = $this->db->query($sql);

	    if ($query->row) {

		return (int) $query->row['stock_status_id'];
	    }
	}
    }

 public function getOutOfStockList() {

	$result = array();

	if ($this->config->get('notify_when_arrives_installed')) {
	    
	   $result = $this->cache->get('nwa_osl');
            
            if (!$result){
               

	    $sql = "
            SELECT product_id from " . DB_PREFIX . "product as product
            WHERE
            product.quantity <= '0'
	    AND
	    product.stock_status_id NOT IN ('" . implode("','", (array) explode(',',$this->config->get('notify_when_arrives_skip_status'))) . "')
	    ";

	    $query = $this->db->query($sql);


	    foreach ($query->rows as $product) {

		$result[] = $product['product_id'];
	    }
	    
	        $this->cache->set('nwa_osl',$result);
                
            }
	}

	return (($result) ? $result : array());
    }

    public function register($email,$name,$phone,$custom,$product_id, $option_id, $option_value_id) {

	if ($this->config->get('notify_when_arrives_installed')) {

	    $query = $this->db->query("SELECT * FROM
                            notify_when_arrives 
                            WHERE
                            product_id = '" . (int) $product_id . "'
                            AND
			     option_id = '" . (int) $option_id . "'
                            AND
			     option_value_id = '" . (int) $option_value_id . "'
                            AND
                            store_id = '" . (int) $this->config->get('config_store_id') . "'
                            AND
                            email = '" . $email . "'
                            AND
                            notified = '0'");

	    if ($query->num_rows) {

		return 'exists';
	    }


	    return $this->db->query("INSERT INTO
                            notify_when_arrives 
                            SET
                            product_id = '" . (int) $product_id . "',
                            store_id = '" . (int) $this->config->get('config_store_id') . "',
			    language_id = '" .  (int)$this->config->get('config_language_id')  . "',
                            email = '" . $email . "',
                            user = '" . $name . "',
                            phone = '" . $phone . "',
                            custom = '" . $custom . "',
			    option_value_id = '" . $option_value_id . "',
			    option_id = '" . $option_id . "',
                            notified = '0'");
	}
    }
    public function getProductName($product_id) {

      $query = $this->db->query(" SELECT
                                product_description.`name` as product_name
                                FROM
                                " . DB_PREFIX . "product as product
                                INNER JOIN 
                                " . DB_PREFIX . "product_description as product_description
                                ON product.product_id = product_description.product_id
                                WHERE
                                product.product_id = '".(int) $product_id."'
                                AND
                                product_description.language_id ='". (int)$this->config->get('config_language_id') ."'");
       
           if ($query->row) {

		return  $query->row['product_name'];
	    }
       
    }
 
    public function getOptionName($option_id) {

      $query = $this->db->query("SELECT 
                                option_description.`name` as option_name
                                FROM
                                `" . DB_PREFIX . "option` as `option`
                                INNER JOIN 
                                " . DB_PREFIX . "option_description as option_description
                                ON option.option_id = option_description.option_id
                                WHERE
                                option.option_id = '".(int) $option_id."'
                                AND
                                option_description.language_id ='". (int)$this->config->get('config_language_id') ."'");
       
           if ($query->row) {

		return  $query->row['option_name'];
	    }
       
    }
    public function getOptionValueName($option_value_id) {

      $query = $this->db->query("SELECT option_value_description.`name` as option_value_name
                                FROM
                                " . DB_PREFIX . "option_value as option_value
                                INNER JOIN 
                                " . DB_PREFIX . "option_value_description as option_value_description
                                ON option_value.option_value_id = option_value_description.option_value_id
                                WHERE
                                option_value.option_value_id = '".(int) $option_value_id."'
                                AND
                                option_value_description.language_id ='". (int)$this->config->get('config_language_id') ."'");
       
           if ($query->row) {

		return  $query->row['option_value_name'];
	    }
       
    }
 
}

?>