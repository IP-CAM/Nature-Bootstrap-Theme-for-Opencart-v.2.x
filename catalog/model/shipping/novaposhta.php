<?php
class ModelShippingNovaposhta extends Model {
	function getQuote($address) {
		$this->load->language('shipping/novaposhta');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('novaposhta_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('novaposhta_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		if ($this->cart->getSubTotal() < $this->config->get('novaposhta_total')) {
			$status = false;
		}

		$method_data = array();
		
		//скрипт расчета доставки___________________________________________________		
		$this->load->model('tool/shipping_cost');
		
		$data_for_calc = array(
			'country_id' => $address['country_id'],
			
			'city' => $address['city']
		);
		$cost = $this->model_tool_shipping_cost->calc($data_for_calc);
#___________________________________________________________________________		
		
		if ($status) {
			$quote_data = array();

			$quote_data['novaposhta'] = array(
				'code'         => 'novaposhta.novaposhta',
				'title'        => $this->language->get('text_description'),
				'cost'         => $cost,
				'tax_class_id' => 0,
				'text'         => $this->language->get('text_support'),
				'text_support' => $this->language->get('text_support') . $this->language->get('nearest_branch')
			);

			$method_data = array(
				'code'       => 'novaposhta',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('novaposhta_sort_order'),
				'error'      => false,
				'text_support' => $this->language->get('text_support') . $this->language->get('nearest_branch')
			);
		}

		return $method_data;
	}
}