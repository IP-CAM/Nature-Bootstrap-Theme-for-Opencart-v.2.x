<?php

class ControllerCatalogMailsender extends Controller { 

	public function index(){
		
		$email = 'privalovihor@gmail.com';
		
		$this->load->model('tool/mailsender');
		$this->model_tool_mailsender->send($email);
		
		$this->response->setOutput($this->load->view('marketing/contact.tpl', $data));
	}