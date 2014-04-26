<?php

class ModelModuleNotifyWhenArrives extends Model {

    public function install() {

	$query_table = $this->db->query("SHOW tables like 'notify_when_arrives'");

	if (!$query_table->num_rows) {

	    return $this->db->query('CREATE TABLE if not exists notify_when_arrives (
                                 id INT PRIMARY KEY AUTO_INCREMENT,
                                 email VARCHAR(100),
                                 user  VARCHAR(100),
                                 phone VARCHAR(100),
                                 custom VARCHAR(100),
                                 product_id INT (7),
				 option_id INT (7),
				 option_value_id INT (7),
                                 store_id INT(2) DEFAULT 0,
				 language_id INT(2) DEFAULT 1,
                                 notified INT(1)
                               )');
	}

	$update = array();

	$query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'store_id'");

	if (!$query_column->num_rows) {

	    $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD store_id INT(2) DEFAULT 0');
	}

	$query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'option_id'");

	if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD option_id INT(7)');
	}
        
	$query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'option_value_id'");

	if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD option_value_id INT(7)');
	}
        
	$query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'language_id'");

	if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD language_id INT(2) DEFAULT 1');
	}
        
        $query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'user'");

	if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD user VARCHAR(100)');
	}
        
        $query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'phone'");

        if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD phone VARCHAR(100)');
	}
        
        $query_column = $this->db->query("SHOW COLUMNS FROM `notify_when_arrives` LIKE 'custom'");

        if (!$query_column->num_rows) {

	     $update[] = $this->db->query('ALTER TABLE notify_when_arrives ADD custom VARCHAR(100)');
	}
        
	return (!in_array(false, $update));
    }

    public function count() {

	$result = $this->db->query("SELECT * FROM notify_when_arrives WHERE notified = '0'");

	return $result->num_rows;
    }

    public function getList($to_notify = false) {

	$statistics = array();

	$product_stock_query = ($to_notify) ? " HAVING (product_quantity > 0  AND nwa.notified = '0')" : "";

	$option_stock_query = ($to_notify) ? " HAVING (product_quantity > 0  AND option_quantity > 0 AND nwa.notified = '0') " : "";

	if ($this->config->get('notify_when_arrives_installed')) {

	    $sql = "
	    SELECT
	    nwa.id,
	    nwa.user,
            nwa.phone,
	    nwa.email,
            nwa.custom,
	    nwa.store_id,
	    nwa.product_id,
	    nwa.language_id,
	    url_alias.keyword,
	    product_description.`name`,
	    option_description.option_id,
	    option_description.`name` as option_name,
	    option_value_description.option_value_id,
	    option_value_description.`name` as option_value_name,
	    nwa.notified,
	    product_option_value.quantity as option_quantity,
	    product.quantity as product_quantity
	    FROM
	    notify_when_arrives as nwa
	    LEFT JOIN  " . DB_PREFIX . "url_alias  as url_alias ON `query` = CONCAT('product_id=',nwa.product_id)
	    INNER JOIN " . DB_PREFIX . "product as product ON nwa.product_id = product.product_id
	    INNER JOIN " . DB_PREFIX . "product_description as product_description ON nwa.product_id = product_description.product_id
	    INNER JOIN " . DB_PREFIX . "option_description as option_description ON (nwa.option_id = option_description.option_id AND nwa.language_id = option_description.language_id)
	    INNER JOIN " . DB_PREFIX . "option_value_description as option_value_description ON (nwa.option_value_id = option_value_description.option_value_id AND nwa.language_id = option_value_description.language_id)
	    INNER JOIN " . DB_PREFIX . "language as language ON nwa.language_id = language.language_id	    
	    INNER JOIN " . DB_PREFIX . "product_option_value  as product_option_value
	    ON  
		(nwa.option_id = product_option_value.option_id 
		AND 
		nwa.option_value_id = product_option_value.option_value_id
		AND
		nwa.product_id = product_option_value.product_id)
	 
	    WHERE
	    product_description.language_id  = nwa.language_id
	    $option_stock_query

	    UNION	 

	    SELECT
	    nwa.id,
	    nwa.user,
            nwa.phone,
	    nwa.email,
            nwa.custom,
	    nwa.store_id,
	    nwa.product_id,
	    nwa.language_id,
	    url_alias.keyword,
	    product_description.`name`,
	    NULL as option_id,
	    NULL as option_name,
	    NULL as option_value_id,
	    NULL as option_value_name,
	    nwa.notified,
	    NULL as option_quantity,
	    product.quantity as product_quantity
	    FROM
	    notify_when_arrives as nwa
	    LEFT JOIN  " . DB_PREFIX . "url_alias  as url_alias ON `query` = CONCAT('product_id=',nwa.product_id)
	    INNER JOIN " . DB_PREFIX . "product as product ON nwa.product_id = product.product_id
	    INNER JOIN " . DB_PREFIX . "product_description as product_description ON nwa.product_id = product_description.product_id
	    INNER JOIN " . DB_PREFIX . "language as language ON nwa.language_id = language.language_id
	    WHERE
	    product_description.language_id  = nwa.language_id
	    AND
	   (nwa.option_id IS NULL OR nwa.option_id = '0')
	   $product_stock_query";

	    $query = $this->db->query($sql);

	    if ($to_notify) {
		
		$id_list = array();

		foreach ($query->rows as $request) {

		    $store_id = $request['store_id'];
		    $language_id = $request['language_id'];
		    $group_id = $request['product_id'] . '_' . $request['option_id'] . '_' . $request['option_value_id'];
		    $id_list[] = $request['id'];
		    
		    if (!isset($statistics[$store_id][$language_id][$group_id])) {

			if ($request['option_name']) {

			    $statistics[$store_id][$language_id][$group_id]['name'] = $request['name'] . ' (' . $request['option_name'] . ':' . $request['option_value_name'] . ')';
			} else {

			    $statistics[$store_id][$language_id][$group_id]['name'] = $request['name'];
			}

			$statistics[$store_id][$language_id][$group_id]['mails'] = null;
			$statistics[$store_id][$language_id][$group_id]['product_id'] = $request['product_id'];
			$statistics[$store_id][$language_id][$group_id]['keyword'] = $request['keyword'];
			$statistics[$store_id][$language_id][$group_id]['requested'] = 0;
			$statistics[$store_id][$language_id][$group_id]['notified'] = 0;
		    }

		    $statistics[$store_id][$language_id][$group_id]['requested']++;
		    $statistics[$store_id][$language_id][$group_id]['language_id'] = $request['language_id'];

		    if ($request['notified']) {

			$statistics[$store_id][$language_id][$group_id]['notified']++;
		    } else {

			$statistics[$store_id][$language_id][$group_id]['mails'][] = array( 'user' => $request['user'],
                                                                                            'email' => $request['email'],
                                                                                            'phone' => $request['phone'],
                                                                                            'custom' => $request['custom']);
		    }
 
		}
	    } else {

		foreach ($query->rows as $request) {

		    $group_id = $request['product_id'] . '_' . $request['option_id'] . '_' . $request['option_value_id'];

		    if (!isset($statistics[$group_id])) {

			if ($request['option_name']) {

			    $statistics[$group_id]['name'] = $request['name'] . ' (' . $request['option_name'] . ':' . $request['option_value_name'] . ')';
			} else {

			    $statistics[$group_id]['name'] = $request['name'];
			}

			$statistics[$group_id]['mails'] = null;
			$statistics[$group_id]['product_id'] = $request['product_id'];
			$statistics[$group_id]['requested'] = 0;
			$statistics[$group_id]['notified'] = 0;
		    }

		    $statistics[$group_id]['requested']++;

		    if ($request['notified']) {

			$statistics[$group_id]['notified']++;
		    } else {

			$statistics[$group_id]['mails'] .=$request['user'].' | '.$request['email'].' | '.$request['phone'].' | '.$request['custom'] . '<br/>';
		    }
		}
	    }
	}
	
	if ($to_notify){
	    
	    return array('ids' => $id_list,'statistics'=> $statistics);
	    
	}else{
	    
	    return $statistics;
	}
	

    }

    public function deleteStatistic($product_id) {

	$info = explode('_', $product_id);

	if (isset($info[1]) && isset($info[2])) {

	    return $this->db->query(
			    "DELETE FROM notify_when_arrives 
			WHERE 
			 product_id= '" . (int) $info[0] . "' 
			 AND
			 option_id= '" . (int) $info[1] . "' 
			 AND
			 option_value_id= '" . (int) $info[2] . "'

			");
	} else {

	    return $this->db->query("DELETE FROM notify_when_arrives WHERE product_id = '" . (int) $product_id . "'");
	}
    }

    public function updateStatistics($id_list = array()) {

	 
	return 	$this->db->query(
			"UPDATE notify_when_arrives set notified = '1' 
			 WHERE 
			 id IN ('" . implode("','", $id_list). "')");
  
    }

}

?>