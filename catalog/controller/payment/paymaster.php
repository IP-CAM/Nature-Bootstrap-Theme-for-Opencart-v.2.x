<?php
class ControllerPaymentPayMaster extends Controller {
  public function index() {
    $data['button_confirm'] = $this->language->get('button_confirm');
    $data['button_back'] = $this->language->get('button_back');

	$this->load->language('payment/paymaster');

    $data['action'] = 'https://lmi.paymaster.ua/';

    $this->load->model('checkout/order');

    $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
   
    $data['merchant_id'] = $this->config->get('paymaster_merchant_id');
   
    $data['order_id'] =  $this->session->data['order_id'];
   
    $order_total = $order_info['total'];
	$data['amount'] = number_format($order_info['total'], 2, ".", "");
	
	$secry = $this->config->get('paymaster_secret_key');	
	$hash_alg = $this->config->get('paymaster_hash_alg');	
	$data['lmi_hash'] = strtoupper(hash($hash_alg, $data['merchant_id'].$data['order_id'].$data['amount'].$secry));	   
		
    $data['description'] = $this->language->get('desc_2').$data['order_id'];//$this->language->get('desc_1').$this->config->get('config_name').  .', ' . $order_info['payment_firstname'] . ', ' . $order_info['email'];
    $data['test_mode'] = $this->config->get('paymaster_test');
    	
	$data['select_pay_instu'] = $this->language->get('select_pay_instu');
	$data['select_pay_paymaster'] = $this->language->get('select_pay_paymaster');	
	
	$data['success_url'] = $this->config->get('paymaster_success_url');
	$data['fail_url'] = $this->config->get('paymaster_fail_url');	
	
	$this->id = 'payment';
	
	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/paymaster.tpl')) {
		return $this->load->view($this->config->get('config_template') . '/template/payment/paymaster.tpl', $data);
	} else {
		return $this->load->view('default/template/payment/paymaster.tpl', $data);
	}
  }

  public function fail() { 
	$this->response->redirect($this->url->link('checkout/checkout', '', 'SSL'));		
	return TRUE;
  }

  public function success() { 
	$this->response->redirect($this->url->link('checkout/success', '', 'SSL'));		
	return TRUE;
  }

  public function callback() 
  {    
    $order_id = $this->request->post['LMI_PAYMENT_NO'];     
		$this->load->model('checkout/order');
    $order = $this->model_checkout_order->getOrder($order_id);
    $amount = number_format($order['total'], 2, '.', '');	
	$merchant_id = $this->config->get('paymaster_merchant_id');  
   
   if(isset($this->request->post['LMI_PREREQUEST'])){		
		if($this->request->post['LMI_MERCHANT_ID'] == $merchant_id && $this->request->post['LMI_PAYMENT_AMOUNT'] == $amount)
			echo 'YES';
		else 
			echo 'FAIL';
	}

    if(!isset($this->request->post['LMI_PREREQUEST']) && isset($this->request->post['LMI_HASH']))#bug fix by igorro: общий вид получателя параметров POST в OC такой
	{		
		$lmi_hash_post = $this->request->post['LMI_HASH'];		 
		$hash_alg = $this->config->get('paymaster_hash_alg');
        $secry = htmlspecialchars_decode($this->config->get('paymaster_secret_key'));#bug fix by igorro: Платежи не принимаются, если пароль имеет спецсимволы
		$hash = strtoupper(hash($hash_alg, $merchant_id.$order_id.$this->request->post['LMI_SYS_PAYMENT_ID'].$this->request->post['LMI_SYS_PAYMENT_DATE'].$amount.$this->request->post['LMI_PAID_AMOUNT'].$this->request->post['LMI_PAYMENT_SYSTEM'].$this->request->post['LMI_MODE'].$secry));	
	   
		if ($lmi_hash_post == $hash){
			$this->load->model('checkout/order');
			$order_info = $this->model_checkout_order->getOrder($order_id);
		  
			if( $order_info['order_status_id'] == 0) {
				$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('paymaster_order_status_id'), 'PayMaster.ua');
				exit;
			}
				
			if( $order_info['order_status_id'] != $this->config->get('paymaster_order_status_id')) {
				$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('paymaster_order_status_id'), 'PayMaster.ua', TRUE);			
			}
		
		}		
    }
  }
}