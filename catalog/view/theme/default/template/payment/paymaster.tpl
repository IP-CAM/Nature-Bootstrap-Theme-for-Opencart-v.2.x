<form action="<?php echo $action; ?>" accept-charset="utf-8" method="post" id="button-payments">	
<?php if($test_mode){?>
	<input type="hidden" value="18" name="LMI_PAYMENT_SYSTEM">
<?php }else{?>
<p><?php echo $select_pay_instu ?></p>
<label><input type="radio" value="0" name="LMI_PAYMENT_SYSTEM"><?php echo $select_pay_paymaster; ?><br><img src="catalog/view/theme/default/image/paymaster_ua_logos/paymaster.png" style="height:45px"></label><br>		
<?php } ?>

<input type="hidden" value="<?php echo $merchant_id; ?>" name="LMI_MERCHANT_ID">
<input type="hidden" value="<?php echo $amount; ?>" name="LMI_PAYMENT_AMOUNT">
<input type="hidden" value="<?php echo $order_id; ?>" name="LMI_PAYMENT_NO">
<input type="hidden" value="<?php echo $description; ?>" name="LMI_PAYMENT_DESC">								
<input type="hidden" value="<?php echo $success_url; ?>" name="LMI_SUCCESS_URL">
<input type="hidden" value="<?php echo $fail_url; ?>" name="LMI_FAIL_URL">					
<input type="hidden" value="<?php echo $lmi_hash; ?>" name="LMI_HASH">	
					
<div class="buttons">
  <div class="pull-right">
    <input type="submit" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
</form>