<?php
    //include('vendor/autoload.php'); //Подключаем библиотеку
    use Telegram\Bot\Api; 
	echo "ddddddd";
	
	$bot_api_key  = '1149949072:AAHRJTOjjtUnqei-61bjpRqTULgbI6ahaEc';
	$bot_username = 'tjanshi_bot';
	$hook_url     = 'https://your-domain/path/to/hook.php';
	
    $telegram = new Api('1149949072:AAHRJTOjjtUnqei-61bjpRqTULgbI6ahaEc'); //Устанавливаем токен, полученный у BotFather
    
	
	try {
		// Create Telegram API object
		$telegram = new Longman\TelegramBot\Telegram($bot_api_key, $bot_username);
			$result = Request::sendMessage([
			'chat_id' => 968238478,
			'text'    => 'Your utf8 text 😜 ...',
		]);
		// Handle telegram webhook request
		$telegram->handle();
	} catch (Longman\TelegramBot\Exception\TelegramException $e) {
		// Silence is golden!
		// log telegram errors
		// echo $e->getMessage();
	}
	
?>