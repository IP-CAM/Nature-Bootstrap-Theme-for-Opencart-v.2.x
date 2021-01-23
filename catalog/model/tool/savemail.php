<?php

class ModelToolSavemail extends Model {
	
	public function save($email){
		$this->db->query("INSERT INTO " . DB_PREFIX . "emails_coupon SET email = '". $email ."'");
		
		//$subject = sprintf('text_update_footer', html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
		
		$text = 'Поздравляем Вас!

Вы получили "КУПОН на СКИДКУ -30%" = 3030303030

По этому КУПОНУ "3030303030" - Вы сможете 1 раз преобрести продукцию "Тяньши" по СКИДКЕ -30%


Если Вы желаете постоянно покупать  ВСЮ продукцию "Тяньши" по СКИДКАМ до -50%= пройдите регистрацию в нашем интернет-магазине
https://www.tjanshi.com/create-account	


По любым вопросам - обращайтесь на наш WhatsApp 79899970655

----------------------------------------------------------------------------------
P.S. Мы очень стараемся сделать оздоровительную продукцию «Тяньши» ДОСТУПНОЙ для ВСЕХ!

		
		';


		$text_for_admin = "Код купона на скидку был отправлен на почту: " . $email . "
" . date("Y-m-d H:i:s");
		
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
		$mail->setSubject(html_entity_decode("Купон на скидку", ENT_QUOTES, 'UTF-8'));
		$mail->setText($text);
		$mail->send();
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($this->config->get('config_email'));
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode("Купон на скидку", ENT_QUOTES, 'UTF-8'));
		$mail->setText(html_entity_decode($text_for_admin));
		$mail->send();
	}
	
}


?>