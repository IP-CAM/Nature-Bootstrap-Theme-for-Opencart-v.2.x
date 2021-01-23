<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		/* $this->load->model('tool/savemail');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_tool_savemail->save($this->request->post['email']);
			setcookie("send_mail", "true" ,time()+96000);
			
			$this->response->redirect($this->url->link('common/home'));	
		}
		
		$data['action'] = $this->url->link('common/home', '', 'SSL');
		$logged = $this->customer->isLogged();
		
		if (isset($_COOKIE['send_mail'])) {
			$send_mail = true;
		}else{
			$send_mail = false;
		}
		
		if(!$logged){
			if($send_mail){
				$data['show_modal'] = false;
			}else{
				$data['show_modal'] = true;
			}
		} */
		
		$this->load->language('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['baner'] = $this->load->controller('common/baner');
		$data['baner_1'] = $this->load->controller('common/baner_1');
		$data['baner_2'] = $this->load->controller('common/baner_2');
		$data['baner_3'] = $this->load->controller('common/baner_3');
		
		$this->load->model('catalog/information');	
		$informations = $this->model_catalog_information->getInformations();
		$data['read_more'] = $this->language->get('read_more'); 
		foreach ($informations as $information_id) {
			
			if (!$information_id['top'] && !$information_id['bottom'] && !$information_id['neytral']) {
			
				$data['informations'][] = array(
					'information_id' => $information_id['information_id'],
					'title' => $information_id['title'],
					'description' => html_entity_decode($information_id['description'], ENT_QUOTES, 'UTF-8'),
					'short_description' => mb_substr(strip_tags(html_entity_decode($information_id['description'], ENT_QUOTES, 'UTF-8')), 0, 500) . '...',
					'href' => $this->url->link('information/information', 'information_id=' .  $information_id['information_id'])
				);
				
			}
		}
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
	
	public function validate() {
		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$this->error['email'] = "noooooo";
		}
		
		return !$this->error;
	}
}