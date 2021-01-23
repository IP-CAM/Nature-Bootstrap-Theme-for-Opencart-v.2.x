<?php


class ModelToolTelegram extends Model {
    public $bot_api_key  = '1149949072:AAHRJTOjjtUnqei-61bjpRqTULgbI6ahaEc';
    public $bot_username = '@tjanshi_bot';
    public $chat_id = "-1001228704748";
    //$hook_url     = 'https://your-domain/path/to/hook.php';
    function init(){

    }
    function init2(){
        return "ddddd";
    }
    function sendMessage($text){
        
        
        $website="https://api.telegram.org/bot".$this->bot_api_key;
        //$chatId=1234567;  //** ===>>>NOTE: this chatId MUST be the chat_id of a person, NOT another bot chatId !!!**
        $params=[
            'chat_id'=>$this->chat_id, 
            'text'=>$text,
            'parse_mode'=>'markdown',
        ];
        $ch = curl_init($website . '/sendMessage');
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, ($params));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $result = curl_exec($ch);
        curl_close($ch);
    }


}
?>