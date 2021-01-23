<?php
/******************************************************
 * @package Google Tag Manager for OC2.0x
 * @version 2.8.5
 * @author https://aits.pk
 * @copyright Copyright (C)2017 aits.pk All rights reserved.
 * @email:info@aits.pk. 
 * $date: 29 Sep 2017
*******************************************************/
class ControllerExtensionModuleGoogleTagManager extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/module/google_tagmanager');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tagmanager', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_signup'] = $this->language->get('text_signup');
		
		$data['entry_code'] = $this->language->get('entry_code');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_admin'] = $this->language->get('entry_admin');
		$data['entry_conversion_id'] = $this->language->get('entry_conversion_id');
		$data['entry_conversion_label'] = $this->language->get('entry_conversion_label');
		$data['entry_eu_cookie'] = $this->language->get('entry_eu_cookie');
		$data['entry_cookie_text'] = $this->language->get('entry_cookie_text');
		$data['entry_cookie_link'] = $this->language->get('entry_cookie_link');
		$data['entry_cookie_button1'] = $this->language->get('entry_cookie_button1');
		$data['entry_cookie_button2'] = $this->language->get('entry_cookie_button2');
		$data['entry_remarketing'] = $this->language->get('entry_remarketing');
		$data['entry_pixel'] = $this->language->get('entry_pixel');
		$data['entry_pixelcode'] = $this->language->get('entry_pixelcode');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_ptitle'] = $this->language->get('entry_ptitle');
	 	$data['entry_adword'] = $this->language->get('entry_adword');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/google_tagmanager', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/google_tagmanager', 'token=' . $this->session->data['token'] , true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		$data['token'] = $this->session->data['token'];
				
		if (isset($this->request->post['tagmanager_code'])) {
			$data['tagmanager_code'] = $this->request->post['tagmanager_code'];
		} else {
			$data['tagmanager_code'] = $this->config->get('tagmanager_code');
		}
		
		if (isset($this->request->post['tagmanager_status'])) {
			$data['tagmanager_status'] = $this->request->post['tagmanager_status'];
		} else {
			$data['tagmanager_status'] = $this->config->get('tagmanager_status');
		}
		
		if (isset($this->request->post['tagmanager_admin'])) {
			$data['tagmanager_admin'] = $this->request->post['tagmanager_admin'];
		} else {
			$data['tagmanager_admin'] = $this->config->get('tagmanager_admin');
		}
		
		if (isset($this->request->post['tagmanager_adword'])) {
			$data['tagmanager_adword'] = $this->request->post['tagmanager_adword'];
		} else {
			$data['tagmanager_adword'] = $this->config->get('tagmanager_adword');
		}
		
		if (isset($this->request->post['tagmanager_conversion_id'])) {
			$data['tagmanager_conversion_id'] = $this->request->post['tagmanager_conversion_id'];
		} else {
			$data['tagmanager_conversion_id'] = $this->config->get('tagmanager_conversion_id');
		}
		
		if (isset($this->request->post['tagmanager_conversion_label'])) {
			$data['tagmanager_conversion_label'] = $this->request->post['tagmanager_conversion_label'];
		} else {
			$data['tagmanager_conversion_label'] = $this->config->get('tagmanager_conversion_label');
		}
		
		if (isset($this->request->post['tagmanager_eu_cookie'])) {
			$data['tagmanager_eu_cookie'] = $this->request->post['tagmanager_eu_cookie'];
		} else {
			$data['tagmanager_eu_cookie'] = $this->config->get('tagmanager_eu_cookie');
		}
		if (isset($this->request->post['tagmanager_cookie_text'])) {
			$data['tagmanager_cookie_text'] = $this->request->post['tagmanager_cookie_text'];
		} else {
			$data['tagmanager_cookie_text'] = $this->config->get('tagmanager_cookie_text');
		}
		if (isset($this->request->post['tagmanager_cookie_link'])) {
			$data['tagmanager_cookie_link'] = $this->request->post['tagmanager_cookie_link'];
		} else {
			$data['tagmanager_cookie_link'] = $this->config->get('tagmanager_cookie_link');
		}
		if (isset($this->request->post['tagmanager_cookie_button1'])) {
			$data['tagmanager_cookie_button1'] = $this->request->post['tagmanager_cookie_button1'];
		} else {
			$data['tagmanager_cookie_button1'] = $this->config->get('tagmanager_cookie_button1');
		}
		if (isset($this->request->post['tagmanager_cookie_button2'])) {
			$data['tagmanager_cookie_button2'] = $this->request->post['tagmanager_cookie_button2'];
		} else {
			$data['tagmanager_cookie_button2'] = $this->config->get('tagmanager_cookie_button2');
		}
		if (isset($this->request->post['tagmanager_remarketing'])) {
			$data['tagmanager_remarketing'] = $this->request->post['tagmanager_remarketing'];
		} else {
			$data['tagmanager_remarketing'] = $this->config->get('tagmanager_remarketing');
		}
		if (isset($this->request->post['tagmanager_product'])) {
			$data['tagmanager_product'] = $this->request->post['tagmanager_product'];
		} else {
			$data['tagmanager_product'] = $this->config->get('tagmanager_product');
		}
		if (isset($this->request->post['tagmanager_pixel'])) {
			$data['tagmanager_pixel'] = $this->request->post['tagmanager_pixel'];
		} else {
			$data['tagmanager_pixel'] = $this->config->get('tagmanager_pixel');
		}
			if (isset($this->request->post['tagmanager_pixelcode'])) {
			$data['tagmanager_pixelcode'] = $this->request->post['tagmanager_pixelcode'];
		} else {
			$data['tagmanager_pixelcode'] = $this->config->get('tagmanager_pixelcode');
		}
		if (isset($this->request->post['tagmanager_ptitle'])) {
			$data['tagmanager_ptitle'] = $this->request->post['tagmanager_ptitle'];
		} else {
			$data['tagmanager_ptitle'] = $this->config->get('tagmanager_ptitle');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/google_tagmanager', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/google_tagmanager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['tagmanager_code']) {
			$this->error['code'] = $this->language->get('error_code');
		}			

		return !$this->error;
	}
}
