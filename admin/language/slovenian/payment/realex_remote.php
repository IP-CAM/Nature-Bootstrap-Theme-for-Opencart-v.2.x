<?php
// Heading
$_['heading_title']					= 'Realex Remote';

// Text
$_['text_payment']					= 'Payment';
$_['text_success']					= 'USPEŠNO Ste spremenili Realex račun podrobnosti!';
$_['text_edit']                     = 'Uredi Realex Remote';
$_['text_card_type']				= 'Tip kartice';
$_['text_enabled']					= 'Omogočeno';
$_['text_use_default']				= 'Uporabi privzeto';
$_['text_merchant_id']				= 'Merchant ID';
$_['text_subaccount']				= 'Sub Account';
$_['text_secret']					= 'Shared secret';
$_['text_card_visa']				= 'Visa';
$_['text_card_master']				= 'MasterCard';
$_['text_card_amex']				= 'American Express';
$_['text_card_switch']				= 'Switch/Maestro';
$_['text_card_laser']				= 'Laser';
$_['text_card_diners']				= 'Diners';
$_['text_capture_ok']				= 'Capture was successful';
$_['text_capture_ok_order']			= 'Capture was successful, order status updated to success - settled';
$_['text_rebate_ok']				= 'Rabat je bil uspešen';
$_['text_rebate_ok_order']			= 'Rabat je bil uspešen, da status posodobitev za davka oproščeno';
$_['text_void_ok']					= 'Void was successful, order status updated to voided';
$_['text_settle_auto']				= 'Samodejno';
$_['text_settle_delayed']			= 'Delayed';
$_['text_settle_multi']				= 'Multi';
$_['text_ip_message']				= 'You must supply your server IP address to your Realex account manager before going live';
$_['text_payment_info']				= 'Podatki o plačilu';
$_['text_capture_status']			= 'Payment captured';
$_['text_void_status']				= 'Payment voided';
$_['text_rebate_status']			= 'Payment rebated';
$_['text_order_ref']				= 'Order ref';
$_['text_order_total']				= 'Skupno dovoljeno';
$_['text_total_captured']			= 'Total captured';
$_['text_transactions']				= 'Transakcije';
$_['text_confirm_void']				= 'Are you sure you want to void the payment?';
$_['text_confirm_capture']			= 'Are you sure you want to capture the payment?';
$_['text_confirm_rebate']			= 'Are you sure you want to rebate the payment?';
$_['text_realex_remote']			= '<a target="_BLANK" href="http://www.realexpayments.co.uk/partner-refer?id=opencart"><img src="view/image/payment/realex.png" alt="Realex" title="Realex" style="border: 1px solid #EEEEEE;" /></a>';

// Column
$_['text_column_amount']			= 'Znesek';
$_['text_column_type']				= 'Tip';
$_['text_column_date_added']		= 'Ustvarjeno';

// Entry
$_['entry_merchant_id']				= 'Merchant ID';
$_['entry_secret']					= 'Shared secret';
$_['entry_rebate_password']			= 'Rebate password';
$_['entry_total']					= 'Skupaj';
$_['entry_sort_order']				= 'Vrstni red';
$_['entry_geo_zone']				= 'Geo Cona';
$_['entry_status']					= 'Status';
$_['entry_debug']					= 'Debug logging';
$_['entry_auto_settle']				= 'Settlement type';
$_['entry_tss_check']				= 'TSS pregledi';
$_['entry_card_data_status']		= 'Card info logging';
$_['entry_3d']						= 'Omogoči 3D secure';
$_['entry_liability_shift']			= 'Accept non-liability shifting scenarios';
$_['entry_status_success_settled']	= 'Success - settled';
$_['entry_status_success_unsettled'] = 'Success - not settled';
$_['entry_status_decline']			= 'Zavrni';
$_['entry_status_decline_pending']	= 'Decline - offline auth';
$_['entry_status_decline_stolen']	= 'Decline - lost or stolen card';
$_['entry_status_decline_bank']		= 'Decline - bank error';
$_['entry_status_void']				= 'Razveljavi';
$_['entry_status_rebate']			= 'Rebated';

// Help
$_['help_total']					= 'Skupni znesek, ki mora biti dosežen, da se možnost plačila prikaže';
$_['help_card_select']				= 'Ask the user to choose thier card type before they are redirected';
$_['help_notification']				= 'You need to supply this URL to Realex to get payment notifications';
$_['help_debug']					= 'Enabling debug will write sensitive data to a log file. You should always disable unless instructed otherwise.';
$_['help_liability']				= 'Accepting liability means you will still accept payments when a user fails 3D secure.';
$_['help_card_data_status']			= 'Logs last 4 cards digits, expire, name, type and issuing bank information';

// Tab
$_['tab_account']					= 'API info';
$_['tab_sub_account']				= 'Računi';
$_['tab_order_status']				= 'Order Status:';
$_['tab_payment']					= 'Nastavitve plačil';

// Button
$_['button_capture']				= 'Capture';
$_['button_rebate']					= 'Rebate / refund';
$_['button_void']					= 'Void';

// Error
$_['error_merchant_id']				= 'ID trgovca je zahtevan';
$_['error_secret']					= 'Shared secret is required';