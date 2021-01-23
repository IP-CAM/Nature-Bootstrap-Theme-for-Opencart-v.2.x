<?php
// Heading
$_['heading_title']					= 'Authorize.Net (SIM)';

// Text
$_['text_payment']					= 'Platba';
$_['text_success']					= 'Úspěch: Byl upraven Authorize.Net (SIM) account details!';
$_['text_edit']                     = 'Upravit Authorize.Net (SIM)';
$_['text_authorizenet_sim']			= '<a onclick="window.open(\'http://reseller.authorize.net/application/?id=5561103\');"><img src="view/image/payment/authorizenet.png" alt="Authorize.Net" title="Authorize.Net" style="border: 1px solid #EEEEEE;" /></a>';

// Entry
$_['entry_merchant']				= 'Merchant ID';
$_['entry_key']						= 'Transaction Key';
$_['entry_callback']				= 'Relay Response URL';
$_['entry_md5']						= 'MD5 Hash Value';
$_['entry_test']					= 'Test Mode';
$_['entry_total']					= 'Celkem';
$_['entry_order_status']			= 'Stav objednávky';
$_['entry_geo_zone']				= 'Daňová oblast';
$_['entry_status']					= 'Stav';
$_['entry_sort_order']				= 'Pořadí';

// Help
$_['help_callback']					= 'Please login and set this at <a href="https://secure.authorize.net" target="_blank" class="txtLink">https://secure.authorize.net</a>.';
$_['help_md5']						= 'The MD5 Hash feature enables you to authenticate that a transaction response is securely received from Authorize.Net.Please login and set this at <a href="https://secure.authorize.net" target="_blank" class="txtLink">https://secure.authorize.net</a>.(Optional)';
$_['help_total']					= 'The checkout total the order must reach before this payment method becomes active.';

// Error
$_['error_permission']				= 'Varování: Nemáte oprávnění upravovat payment Authorize.Net (SIM)!';
$_['error_merchant']				= 'Merchant ID Required!';
$_['error_key']						= 'Transaction Key Required!';