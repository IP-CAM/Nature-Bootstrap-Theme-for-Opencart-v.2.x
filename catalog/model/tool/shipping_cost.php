<?php
class ModelToolShippingCost extends Model{
	
	public function calc($data){
		
		
		if( $this->cart->getTotal() > 27000)
			return 0;
		
		//if ($data['city'] == '' or $data['city'] == '' or $data['country_id'] == '' or $data['country_id'] == '0')
		//	return 0;
		
		$ukraine_id = 220;
		$russia_id = 176;				
		
		
		if($data['country_id'] == $ukraine_id)
			return 180;
		
		
		
		$this->load->model('localisation/city');
		$city_info = $this->model_localisation_city->getCityByName($data['city']);	
		return $city_info['shipping_price'];
		
		
		return 0;
	/*	$fo_sibir = array(
			'zone' => array(62, 50, 58, 64, 70, 75, 90, 91, 110, 78, 45), //зоны Сибирского ФО
			'1' => 8.14,
			'2' => 8.95,
			'3' => 9.9,
			'4' => 11.26,
			'5' => 11.94,
			'6' => 13.16,
			'7' => 14.45
		);
			
		$fo_dalvo = array(
			'zone' => array(53, 52, 96, 80, 119, 124, 61, 71, 47), //зоны Дальневосточного ФО
			'1' => 8.82,
			'2' => 9.70,
			'3' => 10.8,
			'4' => 11.8,
			'5' => 13.02,
			'6' => 14.38,
			'7' => 15.87
		);
		
		$fo_other = array(	//остальные зоны
			'1' => 7.46,
			'2' => 8.28,
			'3' => 9.09,
			'4' => 10.04,
			'5' => 10.99,
			'6' => 12.07,
			'7' => 13.29
		);
		
		$mark = array(
			'1' => 40.678,
			'2' => 67.797,
			'3' => 94.916,
			'4' => 135.594,
			'5' => 176.272,
			'6' => 216.950
		);*/
		//$total = $this->cart->getTotal();
		
		
		
			
			
			
		
		/*}elseif(in_array($data['zone_id'], $fo_sibir['zone'])){
			switch ($total) {
				case ($total < $mark['1']): 					   return $fo_sibir['1']; break;
				case ($total > $mark['1'] && $total < $mark['2']): return $fo_sibir['2']; break;
				case ($total > $mark['2'] && $total < $mark['3']): return $fo_sibir['3'];break;
				case ($total > $mark['3'] && $total < $mark['4']): return $fo_sibir['4'];break;
				case ($total > $mark['4'] && $total < $mark['5']): return $fo_sibir['5'];break;
				case ($total > $mark['5'] && $total < $mark['6']): return $fo_sibir['6'];break;
				case ($total > $mark['6']):						   return $fo_sibir['7'];break;
			}
		}elseif(in_array($data['zone_id'], $fo_dalvo['zone'])){
			switch ($total) {
				case ($total < $mark['1']): 					   return $fo_dalvo['1'];break;
				case ($total > $mark['1'] && $total < $mark['2']): return $fo_dalvo['2'];break;
				case ($total > $mark['2'] && $total < $mark['3']): return $fo_dalvo['3'];break;
				case ($total > $mark['3'] && $total < $mark['4']): return $fo_dalvo['4'];break;
				case ($total > $mark['4'] && $total < $mark['5']): return $fo_dalvo['5'];break;
				case ($total > $mark['5'] && $total < $mark['6']): return $fo_dalvo['6'];break;
				case ($total > $mark['6']):						   return $fo_dalvo['7'];break;
			}
		}elseif($data['country_id'] == $russia_id){
			switch ($total) {
				case ($total < $mark['1']): 					   return $fo_other['1'];break;
				case ($total > $mark['1'] && $total < $mark['2']): return $fo_other['2'];break;
				case ($total > $mark['2'] && $total < $mark['3']): return $fo_other['3'];break;
				case ($total > $mark['3'] && $total < $mark['4']): return $fo_other['4'];break;
				case ($total > $mark['4'] && $total < $mark['5']): return $fo_other['5'];break;
				case ($total > $mark['5'] && $total < $mark['6']): return $fo_other['6'];break;
				case ($total > $mark['6']):						   return $fo_other['7'];break;
			}
		}*/
		
	}
}


?>