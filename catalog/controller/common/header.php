<?php
class ControllerCommonHeader extends Controller {
	public function index() {

		
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->model('tool/savemail');
		$this->load->model('tool/mailsender');
		$data['showmodal']=false;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['themail'])){
			$data['themail'] = $this->request->post['themail'];
			$data['showmodal']=true;
			//$this->model_tool_mailsender->send($this->request->post['email']);
			$this->model_tool_savemail->save($this->request->post['themail']);
			$data['themail'] = $this->request->post['themail'];
			setcookie("denymodal", "true" ,time()+630000);
			$data['denymodal'] = true;
			
		}else{
			isset($_COOKIE['denymodal'])?$data['denymodal'] = true:$data['denymodal'] = false;
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			//$this->model_tool_savemail->save($this->request->post['email']);
			//$this->mylog->write("czac");
			setcookie("send_mail", "true" ,time()+630000);

			$this->response->redirect($_SERVER["REQUEST_URI"]."?mail=ok");	
		}else{
			setcookie("send_mail", "true" ,time()+3600);
		}
		
		$this->load->model('tool/telegram');
		//$this->model_tool_telegram->init();
		
		$data['action'] = $_SERVER['REQUEST_URI'];
		$logged = $this->customer->isLogged();
		
		if (isset($_COOKIE['send_mail'])) {
			$send_mail = true;
		}else{
			$send_mail = false;
		}
		$data['logged'] = $logged;//
		if(!$logged){
			if($send_mail){
				$data['show_modal'] = false;
			}else{
				$data['show_modal'] = true;
			}
		}else{
			$data['show_modal'] = false;
		}
		
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['tiens'] = $this->language->get('tiens');
		$data['reviews'] = $this->language->get('reviews');
		$data['text_discounts'] = $this->language->get('text_discounts');
		
		$data['text_sertificates'] = $this->language->get('text_sertificates');
		$data['text_phone_ru'] = $this->language->get('text_phone_ru');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		
		$this->load->model('catalog/information');					//added for info
		
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();
		$data['informations'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		$informations = $this->model_catalog_information->getInformations();
		$data['read_more'] = $this->language->get('read_more'); 
		
		foreach ($informations as $information) {			//added for info
			if ($information['top']){
				$data['informations'][] = array(
					'title' => $information['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $information['information_id']),
					'meta_keyword' => $information['meta_keyword']
				);
			}
		}
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				
				$this->load->model('tool/image');
				$image = empty($category['image']) ? 'no_image.jpg' : $category['image'];
				$thumb = $this->model_tool_image->resize($image, 100, 100);
				$img = $this->model_tool_image->getImage($image);
				
				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'thumb'	   => $img,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
	
	public function validate() {
		if ((utf8_strlen($this->request->post['email']) > 96) || (utf8_strlen($this->request->post['email']) == 0) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email']) || !isset($this->request->post['zaibalo'])) {
			$lock = false;
		}else{
			$lock = true;
		}
		//return false;
		return $lock;
	}
}