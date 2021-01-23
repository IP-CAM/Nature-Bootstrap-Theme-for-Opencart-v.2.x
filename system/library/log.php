<?php
class Log {
	private $handle;
	/* fix_log */
	private $handle2;
	/* !fix_log */
	public function __construct($filename) {
		$this->handle = fopen(DIR_LOGS . $filename, 'a');
		/* fix_log */
		$this->handle2= fopen(DIR_LOGS . 'mylog.txt', 'a');
		/* !fix_log */
	}

	public function write($message) {
		fwrite($this->handle, date('Y-m-d G:i:s') . ' - ' . print_r($message, true) . "\n");
	}

	public function __destruct() {
		fclose($this->handle);
		fclose($this->handle2);
	}
	/* fix_log */
	public function debug($message){
		fwrite($this->handle2, date('Y-m-d G:i:s') . ' - '  .print_r($message, true) . "\n");
		
	}
	public static function dbg($msg){
		$v = fopen(DIR_LOGS . 'mylog.txt', 'a');
		fwrite($v, date('Y-m-d G:i:s') . ' - ' . print_r($msg, true) . "\n");
		
	}
	/* !fix_log */
}