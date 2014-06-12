<?php
class ModelFaqFaq extends Model {
	public function getFaqByCategory($idCategory, $language_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq f WHERE f.idCategory = '" . (int)$idCategory . "' AND f.language_id=".$language_id." ORDER BY f.sortQuestion");
		return $query->rows;
	}
	
	public function getFaqCategories($language_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_categories fc WHERE fc.language_id=".$language_id." ORDER BY fc.sortCategory");
		return $query->rows;
	}
	
	public function getFaqsQuery($query, $language_id) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq f, " . DB_PREFIX . "faq_categories fc WHERE f.idCategory = fc.idCategory AND f.language_id=".$language_id." AND (f.question LIKE '%".$query."%' OR f.response LIKE '%".$query."%')");
		
		return $query->rows;
	}	
	
	public function getLanguageByCode($code){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language l WHERE l.code='".$code."'");
		return $query->row;
	}
}
?>