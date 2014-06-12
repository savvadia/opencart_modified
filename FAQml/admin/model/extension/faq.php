<?php
class ModelExtensionFaq extends Model {	
	public function creationTables(){
		$queryFaqCategories = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "faq_categories` (
			  `idCategory` int(11) NOT NULL auto_increment,
			  `category` varchar(50000) character set utf8 default NULL,
			  `language_id` int(11) NOT NULL,
			  `sortCategory` int(11) default NULL,

			  PRIMARY KEY  (`idCategory`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
		$this->db->query($queryFaqCategories);
	
		$queryFaq = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "faq` (
					  `idFaq` int(11) NOT NULL auto_increment,
					  `idCategory` int(11) default NULL,
					  `question` varchar(50000) character set utf8 default NULL,
					  `response` varchar(50000) character set utf8 default NULL,
					  `language_id` int(11) NOT NULL,
					  `sortQuestion` int(11) default NULL,					  
					  PRIMARY KEY  (`idFaq`),
					  KEY `idCategory` (`idCategory`),
					  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `" . DB_PREFIX . "faq_categories` (`idCategory`)
					) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
		$this->db->query($queryFaq);
	}
	
	public function getFaqCategories($language_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_categories fc WHERE fc.language_id=".$language_id." ORDER BY fc.sortCategory");
		return $query->rows;
	}
	
	public function addFaq($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "faq SET idCategory = '" . $data['question'][$data['language_id']]['category'] . "', question = '" . $data['question'.$data['language_id']] . "', response = '" . $data['response'.$data['language_id']] . "', language_id = '" . $data['language_id'] . "', sortQuestion = '" . $data['sortQuestion'.$data['language_id']] . "'");
		
		$this->cache->delete('faq');
	}	
	
	public function getFaqs($limitMin, $limitMax, $sort, $column, $language_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq f, " . DB_PREFIX . "faq_categories fc WHERE f.idCategory = fc.idCategory AND fc.language_id=".$language_id." ORDER BY ".$column." ". $sort. ", f.sortQuestion LIMIT ".$limitMin.", ".$limitMax);
		
		return $query->rows;
	}	
	
	public function getFaqsQuery($query, $language_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq f, " . DB_PREFIX . "faq_categories fc WHERE f.idCategory = fc.idCategory AND fc.language_id=".$language_id." AND (f.question LIKE '%".$query."%' OR f.response LIKE '%".$query."%') ORDER BY fc.category, f.sortQuestion");
		return $query->rows;
	}
	
	public function getTotalFaqsByCategory($idCategory, $language_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq WHERE idCategory= '".(int)$idCategory."' AND language_id=".$language_id);
		
		return $query->row['total'];
	}	
	
	public function getTotalFaqs($language_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq WHERE language_id=".$language_id);
		
		return $query->row['total'];
	}	
	
	public function deleteFaq($idFaq) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq WHERE idFaq = '" . (int)$idFaq . "'");
		$this->cache->delete('faq');
	}	
	
	public function editFaq($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "faq SET idCategory = '" . $data['question'][$data['language_id']]['category'] . "', question = '" . $data['question'.$data['language_id']] . "', response = '" . $data['response'.$data['language_id']] . "', sortQuestion = '" . $data['sortQuestion'.$data['language_id']] . "' WHERE idFaq = '" . (int)$data['idFaq'.$data['language_id']] . "'");
		
		$this->cache->delete('faq');
	}
	
	public function addFaqCategories($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_categories SET category = '" . $data['category'.$data['language_id']] . "', language_id = '" . $data['language_id'] . "', sortCategory = '" . $data['sortCategory'.$data['language_id']] . "'");
		
		$this->cache->delete('faq_categories');
	}	

	public function deleteFaqCategories($idCategory) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_categories WHERE idCategory = '" . (int)$idCategory . "'");
		$this->cache->delete('faq_categories');
	}
		
	public function testCategory($idCategory) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq f WHERE f.idCategory = '" . (int)$idCategory . "'");
		if(count($query->row) != 0){
			return true;
		}
		return false;
	}	
	
	public function editFaqCategories($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "faq_categories SET category = '" . $data['category'.$data['language_id']] . "', sortCategory = '" . $data['sortCategory'.$data['language_id']] ."' WHERE idCategory = '" . (int)$data['idCategory'.$data['language_id']] . "'");
		
		$this->cache->delete('faq_categories');
	}
}
?>