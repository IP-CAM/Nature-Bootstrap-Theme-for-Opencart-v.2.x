<?php

class ModelToolMailsender extends Model {
	
	private $text = '';
	
	public function send($email){
		
		//$subject = sprintf('text_update_footer', html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
		
		$text = '
Вы подали заявку на Скидку в  интернет-магазине "Тяньши"

С радостью ДАРИМ Вам  "КУПОН на СКИДКУ -30%" = 3030303030

По этому КУПОНУ "3030303030" - Вы сможете приобрести единоразово продукцию "Тяньши" по СКИДКЕ -30%


Если Вы желаете получить возможность постоянно покупать  продукцию "Тяньши" по СКИДКАМ до -50%= пройдите регистрацию в нашем интернет-магазине
https://www.tjanshi.com/create-account	


По любым вопросам - обращайтесь на наш WhatsApp 79899970655

----------------------------------------------------------------------------------
P.S. Мы очень стараемся сделать оздоровительную продукцию «Тяньши» ДОСТУПНОЙ для ВСЕХ!
';
		  
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode("Акция заканчивается", ENT_QUOTES, 'UTF-8'));
		$mail->setText($text);
		
		$mail->send();
	}
	
	public function getAll(){
		
		$sql = "SELECT email FROM " . DB_PREFIX . "emails_coupon";
		
		$res = $this->db->query($sql);
		
		$result = array_unique($res->rows, SORT_REGULAR);
		
		return $result;
		
	}
	
	public function setMessageText($text){
		$this->text = $text;
		file_put_contents('admin/model/tool/mailsender/text.txt', $this->text);
	}
	
	public function getMessageText(){
		$this->text = file_get_contents('admin/model/tool/mailsender/text.txt');
		return $this->text;
	}
	
	
}


?>