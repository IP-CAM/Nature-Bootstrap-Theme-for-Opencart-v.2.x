<?php

class ModelToolMailsender extends Model {
	
	private $text = '';
	private $subject = '';
	
	public function send($email){  
		
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
		$mail->setSubject(html_entity_decode($this->subject, ENT_QUOTES, 'UTF-8'));
		$mail->setText($this->text);
		
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
		
		$sql = "UPDATE " . DB_PREFIX . "mailsender SET text='" . $this->text . "' WHERE id=1";
		
		$this->db->query($sql);
		
	}
	
	public function getMessageText(){
		
		$sql = "SELECT text FROM " . DB_PREFIX . "mailsender WHERE id=1";
		
		$res = $this->db->query($sql);
		
		$text = $res->rows;
		
		$this->text = $text[0]['text'];
		
		return $this->text;
	}
	
	public function getMessage(){
		$sql = "SELECT subject, text FROM " . DB_PREFIX . "mailsender WHERE id=1";
		
		$res = $this->db->query($sql);
		
		$text = $res->rows;
		
		$this->text = $text[0]['text'];
		$this->subject = $text[0]['subject'];
		
		$result = array(
			'text' => $this->text,
			'subject' => $this->subject
		);
		
		return $result;
	}
	
	
	public function setMessage($text, $subject){
		$this->text = $text;
		$this->subject = $subject;
		
		$sql = "UPDATE " . DB_PREFIX . "mailsender SET subject='" . $this->subject . "', text='" . $this->text . "' WHERE id=1";
		
		$this->db->query($sql);
	}
	
	
}


?>