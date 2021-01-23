<?php
class ControllerModuleCallback extends Controller {
	public function index() {
			$this->load->language('module/callback');
			$data['heading_title'] = $this->language->get('heading_title');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_phone'] = $this->language->get('entry_phone');
			$data['entry_submit'] = $this->language->get('entry_submit');
			$data['entry_error'] = $this->language->get('entry_error');
			$data['entry_ok'] = $this->language->get('entry_ok');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/callback.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/callback.tpl', $data);
			} else {
				return $this->load->view('default/template/module/callback.tpl', $data);
			}
	}
	
	public function send(){
		if (is_file('config.php')) {require_once('config.php');}
		require_once(DIR_SYSTEM . 'startup.php');
		$registry = new Registry();
		$loader = new Loader($registry);
		$registry->set('load', $loader);
		$config = new Config();
		$registry->set('config', $config);
		$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
		$registry->set('db', $db);
		$query = $db->query("SELECT value FROM `" . DB_PREFIX . "setting` WHERE `key` =  'config_email'");
		foreach ($query->rows as $result) {
			$email = $result['value'];
		}
		$name = $_SERVER['HTTP_HOST'];
		if($name=='') $name='callback.net';
		if($email!=''){
			if((isset($_GET['name']) && $_GET['name']!="") && (isset($_GET['phone']) && $_GET['phone']!="")) {
				$to = $email;
				$subject = 'CALLBACK';
				$message = '
					<html>
						<head>
							<title>'.$subject.'</title>
						</head>
						<body>
							<h3>'.$_GET["name"].'</h3>
							<h2>+'.$_GET["phone"].'</h2>
						</body>
					</html>';
				$headers  = "Content-type: text/html; charset=utf-8 \r\n";
				$headers .= "From: ".$name." <from@".$name.">\r\n";
				mail($to, $subject, $message, $headers);
				
			}
		}
		$this->response->redirect($this->url->link('common/home'));
	}
}