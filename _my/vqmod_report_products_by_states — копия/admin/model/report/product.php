<?php
class ModelReportProduct extends Model {
	public function getProductsViewed($data = array()) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 ORDER BY p.viewed DESC";
					
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
	
	public function getTotalProductsViewed() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE viewed > 0");
		
		return $query->row['total'];
	}
	
	public function getTotalProductViews() {
      	$query = $this->db->query("SELECT SUM(viewed) AS total FROM " . DB_PREFIX . "product");
		
		return $query->row['total'];
	}
			
	public function reset() {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = '0'");
	}
	
	public function getPurchased($data = array()) {
		$sql = "SELECT op.name, op.model, SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";
		
		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		
		$sql .= " GROUP BY op.model ORDER BY total DESC";
					
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
	
	public function getTotalPurchased($data) {
      	$sql = "SELECT COUNT(DISTINCT op.model) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		
		$query = $this->db->query($sql);
				
		return $query->row['total'];
	}
	
	//функция для извлечения информации из БД для статусов заказов
public function getProductByState($data=array()) 
{

// небольшая обработка входных данных, теперь можно группировать в три группы любые статусы
for ($i=0;$i<count($data);$i++)
{
$condition[$i]="";
for($j=0;$j<(count($data[$i])-1);$j++)
{
if ($i==0){
$condition[$i]=$condition[$i]."o.order_status_id=\"".$data[$i][$j]."\" OR ";
}
else $condition[$i]=$condition[$i]."o".$i.".order_status_id=\"".$data[$i][$j]."\" OR ";
}
if ($i==0){
$condition[$i]=$condition[$i]."o.order_status_id=\"".$data[$i][(count($data[$i])-1)]."\"";
} else $condition[$i]=$condition[$i]."o".$i.".order_status_id=\"".$data[$i][$j]."\"";
}
// закончилась обработка

      	$sql = "SELECT op.name, op.model, Count(o.order_status_id) AS shipping, Count(o1.order_status_id) AS paid, Count(o2.order_status_id) AS wholesale, IFNULL (SUM(o.total), 0) AS total_shipping, IFNULL(SUM(o1.total), 0) AS total_paid, IFNULL(SUM(o2.total), 0) AS total_wholesale FROM `".DB_PREFIX."order_product` op LEFT JOIN `".DB_PREFIX."order` o ON (op.order_id = o.order_id AND (".$condition[0].")) LEFT JOIN `".DB_PREFIX."order` o1 ON (op.order_id = o1.order_id AND (".$condition[1].")) LEFT JOIN `".DB_PREFIX."order` o2 ON (op.order_id = o2.order_id AND (".$condition[2].")) Group By op.name HAVING (COUNT(o.order_status_id) <> 0 OR COUNT(o1.order_status_id)<> 0 OR COUNT(o2.order_status_id) <> 0) ORDER BY op.model ASC";
		$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		$query = $this->db->query($sql);

		return $query->rows;
	}


public function getProductByStateTotal($data=array()) 
{

// небольшая обработка входных данных, теперь можно группировать в три группы любые статусы
for ($i=0;$i<count($data);$i++)
{

$condition[$i]="";
for($j=0;$j<(count($data[$i])-1);$j++)
{
if ($i==0){
$condition[$i]=$condition[$i]."o.order_status_id=\"".$data[$i][$j]."\" OR ";
}
else $condition[$i]=$condition[$i]."o".$i.".order_status_id=\"".$data[$i][$j]."\" OR ";
}
if ($i==0){
$condition[$i]=$condition[$i]."o.order_status_id=\"".$data[$i][(count($data[$i])-1)]."\"";
} else $condition[$i]=$condition[$i]."o".$i.".order_status_id=\"".$data[$i][$j]."\"";
}
// закончилась обработка

      	$sql = "SELECT op.name, op.model, Count(o.order_status_id) AS shipping, Count(o1.order_status_id) AS paid, Count(o2.order_status_id) AS wholesale, IFNULL (SUM(o.total), 0) AS total_shipping, IFNULL(SUM(o1.total), 0) AS total_paid, IFNULL(SUM(o2.total), 0) AS total_wholesale FROM `".DB_PREFIX."order_product` op LEFT JOIN `".DB_PREFIX."order` o ON (op.order_id = o.order_id AND (".$condition[0].")) LEFT JOIN `".DB_PREFIX."order` o1 ON (op.order_id = o1.order_id AND (".$condition[1].")) LEFT JOIN `".DB_PREFIX."order` o2 ON (op.order_id = o2.order_id AND (".$condition[2].")) Group By op.name HAVING (COUNT(o.order_status_id) <> 0 OR COUNT(o1.order_status_id)<> 0 OR COUNT(o2.order_status_id) > 0) ORDER BY op.model ASC";
		$query = $this->db->query($sql);

return count($query->rows);
}

public function getProductStateLegend($data=array())
{
$condition="";
for($i=0;($i<count($data)-1);$i++)
{
$condition=$condition."order_status_id=\"".$data[$i]."\" OR ";
}
$condition=$condition."order_status_id=\"".$data[(count($data)-1)]."\" ";
$sql="SELECT name FROM `order_status` WHERE (".$condition.") AND language_id=1";
$query = $this->db->query($sql);
return $query->rows;

}

}

?>