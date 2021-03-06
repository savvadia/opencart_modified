<?php
class ModelTotalLowOrderFeeForZones extends Model {
	public function getTotal(&$total_data, &$total, &$taxes, &$address='') {
			
			if($address)
			{
					$this->load->language('total/low_order_fee_for_zones');
					
						$getShippingPrice=$this->getZonePrice($address['zone_id'],$address['country_id']);
						if($getShippingPrice)
						{
							$change = round($total * $getShippingPrice/100);
							
							$total_data[] = array( 
								'code'       => 'low_order_fee_for_zones',
								'title'      => $this->language->get('text_low_order_fee_for_zones'),
								'text'       => $this->currency->format($change),
								'value'      => $change,
								'sort_order' => $this->config->get('low_order_fee_for_zones_sort_order')
							);
							
							$total += $change;
						}
			}
	}
	function getZonePrice($zone_id='',$country_id='')
	{
		$order_total=$this->cart->getTotal();
		
		$query = $this->db->query("SELECT " . DB_PREFIX . "geo_zone.low_order_fee_for_zones_price," . DB_PREFIX . "geo_zone.low_order_total_for_zones_price FROM " . DB_PREFIX . "geo_zone," . DB_PREFIX . "zone_to_geo_zone where " . DB_PREFIX . "zone_to_geo_zone.zone_id='".$zone_id."' AND " . DB_PREFIX . "zone_to_geo_zone.geo_zone_id=" . DB_PREFIX . "geo_zone.geo_zone_id AND " . DB_PREFIX . "zone_to_geo_zone.country_id='".$country_id."'");
			
			$zone_data = $query->rows;
			if(!$zone_data)
			{
				$qQuery="SELECT " . DB_PREFIX . "geo_zone.low_order_fee_for_zones_price," . DB_PREFIX . "geo_zone.low_order_total_for_zones_price FROM " . DB_PREFIX . "geo_zone," . DB_PREFIX . "zone_to_geo_zone where " . DB_PREFIX . "zone_to_geo_zone.zone_id='0' AND " . DB_PREFIX . "zone_to_geo_zone.geo_zone_id=" . DB_PREFIX . "geo_zone.geo_zone_id AND " . DB_PREFIX . "zone_to_geo_zone.country_id='".$country_id."'";
				$query = $this->db->query($qQuery);
				
				$zone_data = $query->rows;
			}
			
			$zone_found=array('low_order_total_for_zones_price' => 0, 'low_order_fee_for_zones_price' => 0);
			
			if($zone_data)
			{
				foreach($zone_data as $zone_entry) {
					if($zone_entry['low_order_total_for_zones_price'] > $order_total &&
					   $zone_entry['low_order_fee_for_zones_price'] < $zone_found['low_order_fee_for_zones_price'] &&
					   $zone_entry['low_order_fee_for_zones_price'] != 0) {
							$zone_found = $zone_entry;
					}
				}
			}
			
			return $zone_found['low_order_fee_for_zones_price'];
	}
}
?>