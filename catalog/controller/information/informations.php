<?php
class ControllerInformationInformations extends Controller {
	public function index() {
		$this->load->language('module/informations');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		$data['informations'] = array();
		$informations = $this->model_catalog_information->getInformations();
		
		$data['read_more'] = $this->language->get('read_more');

		foreach ($informations as $information_id) {
		
			//$information_info = $this->model_catalog_information->getInformation($information_id);
			
			if (!$information_id['top'] && !$information_id['bottom']){
			
				$data['informations'][] = array(
					'information_id' => $information_id['information_id'],
					'title' => $information_id['title'],
					'description' => html_entity_decode($information_id['description'], ENT_QUOTES, 'UTF-8'),
					'short_description' => mb_substr(strip_tags(html_entity_decode($information_id['description'], ENT_QUOTES, 'UTF-8')), 0, 500) . '...',
					'href' => $this->url->link('information/information', 'information_id=' .  $information_id['information_id'])
				);
				
			}
		}

			$this->document->setTitle($this->language->get('meta_title'));
			$this->document->setDescription($this->language->get('meta_description'));
			$this->document->setKeywords($this->language->get('meta_keyword'));

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('information/informations')
			);

			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/informations.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/informations.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/informations.tpl', $data));
			}
		
	}

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}