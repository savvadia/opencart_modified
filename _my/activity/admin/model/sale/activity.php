<?php

class ModelSaleActivity extends Model {

    public function install() {
	
		$update = array();
		
		$query_column = $this->db->query("SHOW COLUMNS FROM `order_history` LIKE 'user'");
		if (!$query_column->num_rows) {
			 $update[] = $this->db->query('ALTER TABLE order_history ADD user VARCHAR(100)');
		}
			
		return (!in_array(false, $update));
    }
	
	public function getActivity($data = array()) {
	
		$sql = "SELECT oh.order_history_id, oh.order_id, oh.order_status_id,  oh.notify, oh.comment, oh.user, oh.date_added as date_modified, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = oh.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status, (SELECT GROUP_CONCAT( CONCAT(op.quantity,  ' x ', op.model) SEPARATOR '<br />' ) AS p FROM `order_product` op WHERE o.order_id = op.order_id GROUP BY op.order_id) as products, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order_history` as oh left join `order` as o on o.order_id = oh.order_id";
		
		if (isset($data['filter_order_status_id']) && !is_null($data['filter_order_status_id'])) {
			$sql .= " WHERE oh.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE oh.order_status_id > '0'";
		}
		if (!empty($data['filter_order_id'])) {
			$sql .= " AND oh.order_id = '" . (int)$data['filter_order_id'] . "'";
		}
		if (!empty($data['filter_customer'])) {
			$sql .= " AND LCASE(CONCAT(o.firstname, ' ', o.lastname)) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_customer'])) . "%'";
		}
		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(oh.date_added) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}
		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}
		$sort_data = array(
			'o.order_id',
			'customer',
			'status',
			'oh.date_added',
			'o.total'
		);
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY oh.order_history_id";
		}
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getTotalActivity($data = array()) {
      	$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order_history` as oh left join `order` as o on o.order_id = oh.order_id";
		if (isset($data['filter_order_status_id']) && !is_null($data['filter_order_status_id'])) {
			$sql .= " WHERE oh.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE oh.order_status_id > '0'";
		}
		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}
		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}
		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
}
?>