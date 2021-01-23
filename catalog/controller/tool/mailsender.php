<?php

class ControllerToolMailsender extends Controller { 

	public function index(){
		$header = $this->load->controller('common/header');
		
		//echo $header;
		
		echo "
			<style>
				.btn-ms{
					padding: 15px;
					font-weight: bold; 
				}
				.btn-ms:hover{
					box-shadow: inset 0 0 50px #ffffff;
				}
				.btn-ms-go{
					width: 100%; 
					background: -webkit-linear-gradient(top, #8bde76 0%,#b7f1b7 50%,#bdf3bf 51%,#83e06f 100%);
				} 
				.ms-controls-container{
					width: 100%
				}
				.btn-ms-controls{
					width: 50%;
				}
				.btn-ms-save{
					float: left;
					background: -webkit-linear-gradient(top, #3cb4d0 0%,#95e7f9 50%,#a9e2f3 51%,#4bc7d6 100%);
				}
				.btn-ms-clear{
					float: right;
					background: -webkit-linear-gradient(top, #e68247 0%,#f3d5b7 50%,#f3d8b6 51%,#d08851 100%);
				}
				.ms-form{
					margin-bottom: 50px;
				}
			</style>
		";
		
		echo "<div style='padding: 20px 10% 100px 10%'>";
		
		$link_dash = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('tool/mailsender');
		
		$message_text = $this->model_tool_mailsender->getMessageText();
		
		$users = $this->model_tool_mailsender->getAll();

// START IF POST		
		if($_SERVER['REQUEST_METHOD'] == 'POST'){ 		
			
			$this->model_tool_mailsender->setMessageText($_POST['message_text']);
			
			$this->model_tool_mailsender->send('privalovihor@gmail.com');
			
			echo "
				<a href='${link_dash}'>Назад в главное меню</a>
				<h3>Письмо было отправлено на такие электронные адреса:</h3>
				<h4>Всего: " . count($users) . "</h4>
				<hr>
				<table border='1px' cellpadding='5px' cellspacing='3px'>
				<thead>
				<tr>
					<td><b>№</b></td>
					<td><b>Адрес</b></td>
					<td><b>Статус</b></td>
				</tr>
				</thead>
				<tbody>
			";
			 
			$num = 0;
			foreach($users as $user){
				//$this->model_tool_mailsender->send($user['email']);
				$num++;
				echo "
					<tr><td>" . $num . "</td><td>" . $user['email'] . "</td><td>STATUS</td></tr>";
			}
	
			echo "
				</tbody>
				</table>
				<br>
				<hr>
				<a href='${link_dash}'>Назад в главное меню</a>
			";
//END POST METHOD			
		}else{
			
			echo "
				<a href='${link_dash}'>Назад в главное меню</a>
				<form class='ms-form' action='' method='POST' name='message_form'>
					<textarea name='message_text' placeholder='Текст сообщения'>
					" . $message_text . "
					</textarea>
					<div class='ms-controls-container'>
						<button id='ms-save' class='btn-ms btn-ms-save'>
							СОХРАНИТЬ ПИСЬМO
						</button>
						<button id='ms-clear' class='btn-ms btn-ms-clear'>
							ОЧИСТИТЬ ПИСЬМO
						</button>
					</div>	
					<button id='ms-go' class='btn-ms btn-ms-go' type='submit'>
						ОТПРАВИТЬ ПИСЬМO
					</button>
				</form>
				<hr>
				<h1>Письмо будет отправлено на электронные адреса:</h1>
				<b>Всего: " . count($users) . "</b>
			";
			
			
			
		}
		
		echo "</div>";

	}
	
}

?>

