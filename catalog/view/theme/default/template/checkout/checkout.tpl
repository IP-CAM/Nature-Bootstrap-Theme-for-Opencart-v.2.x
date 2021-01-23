<?php

echo $header;
?>

<div class="container">
		<div class="row">
		    <div class="col-md-12">
			    <div class="breadcrumbs">
				  <ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				  </ul>
				</div>
			</div>

		</div>

		<div class="error"></div>

		<div class="checkout-container">
		<?php if (!isset($address)) {?>
		<div class="row">
			<div class="col-md-12">
			    <h2><?php echo $heading_title; ?></h2>
			    <p class="well"><?php echo $text_returning_customer; ?> &nbsp;<a href="#" onclick="jQuery('.login-form').toggle();return false;"><?php echo $text_i_am_returning_customer; ?></a></p>

			    <div class="login-form registerbox clearfix" style="display:none">
				<div class="row">
				<div class="col-md-12 message"></div>
				<form class="form-inline" role="form">
			        <div class="col-md-8">
				<div class="form-group">
				  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				  <input type="text" name="email" value="" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-email" class="form-control" />
				</div>&nbsp;&nbsp;
				<div class="form-group">
				  <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
				  <input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-password" class="form-control" />
				</div>
				</div>
				<div class="form-group col-md-4">
				    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" class="btn btn-primary" />
				    <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				</div>
			      </form>
			    </div>
			</div>
		    </div>
		</div>
		<?php }?>

		<div class="row box checkout_form">
		    <div class="col-md-6 register_block">
			<div class="row">
				  <div class="col-md-12  hidden">
				    <h3><?php echo $text_your_details; ?></h3>
				  </div>

				  <?php //if (!isset($address)) {?>
				  <div class="form-group seo-hidden" >
				    <label class="control-label"><?php echo $entry_customer_group; ?></label>
				    <?php foreach ($customer_groups as $customer_group) { ?>
				    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
				    <div class="radio">
				      <label>
					<input type="radio"  name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
					<?php echo $customer_group['name']; ?></label>
				    </div>
				    <?php } else { ?>
				    <div class="radio">
				      <label>
					<input type="radio" checked="checked" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
					<?php echo $customer_group['name']; ?></label>
				    </div>
				    <?php } ?>
				    <?php } ?>
				  </div>
				  <div class="form-group required col-md-6 hidden">
				    <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
				    <input type="text" name="firstname" value="<?php if (isset($address['firstname'])) echo $address['firstname']; elseif (isset($firstname)) echo $firstname; ?>" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-payment-firstname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group required col-md-6 hidden">
				    <label class="control-label" for="input-payment-fathername"><?php echo $entry_fathername; ?></label>
				    <input type="text" name="fathername" value="<?php if (isset($fathername)) echo $fathername;?>" placeholder="<?php echo str_replace(':','',$entry_fathername); ?>" id="input-payment-fathername" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group required col-md-6 hidden">
				    <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
				    <input type="text" name="lastname" value="<?php if (isset($lastname)) echo $lastname;?>" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-payment-lastname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group col-md-6 hidden">
					<label class="control-label" for="input-birth_date"><?php echo $entry_birth_date; ?></label>
					  <input type="text" name="birth_date" value="<?php if (isset($birth_date)) echo $birth_date; ?>" placeholder="<?php echo $entry_birth_date; ?>" id="input-birth_date" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>

				  </div>
				  <div class="form-group required col-md-12  hidden">
				    <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
				    <input type="text" name="email" value="<?php if (isset($email)) echo $email;?>" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-payment-email" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group  col-md-6  hidden">
				    <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
				    <input type="text" name="telephone" value="<?php if (isset($telephone)) echo $telephone;?>" placeholder="<?php echo str_replace(':','',$entry_telephone); ?>" id="input-payment-telephone" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <?php //if (!$checkout_hide_fax) {?>
				  <div class="form-group col-md-6  hidden">
				    <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
				    <input type="text" name="fax" value="<?php if (isset($fax)) echo $fax;?>" placeholder="<?php echo str_replace(':','',$entry_fax1); ?>" id="input-payment-fax" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <?php //}?>

				  <div class="col-md-12">
				    <h3 class="clearfix"><?php echo $text_your_address; ?></h3>
 <?php /* fix_16 */?>
			      <?php/* if ($addresses) {*/ ?>
				  <?php if (1==0) { ?>
<?php /* fix_16 */?>				  
				  <?php if (isset($customer_id)) {?>
			      <div class="radio">
				 <label>
				 
				  	 <?php /*<!--  <input type="radio" name="payment_address" value="existing" checked="checked" onclick="jQuery('#payment-address-new').hide()" /> -->*/?>
				  <?php /* fix_16 */?>
				  <?php echo $text_address_existing; ?></label>
			      </div>
				  
			      <div id="payment-existing">
					<select id="payment-existing-selectt" name="payment_address_id" class="form-control">
					  <? echo $payment_address_id;?>
					  <?php foreach ($addresses as $address) { ?>
					  <?php if (isset($payment_address_id) && $address['address_id'] == $payment_address_id && !empty($address['address_1'])) { ?>
					  <option data-isaddress="true" value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>, <?php echo $address['postcode']; ?></option>
					  <option data-isaddress="true" value="<?php echo $address['address_id']+1; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
					  <?php } else { ?>
					  <option data-isaddress="false" value="<?php echo $address['address_id']; ?>">нет адреса</option>
					  
					  <?php } ?>
					  <?php } ?>
					</select>
			      </div>
			      <?php } ?>
			    <?php if (isset($customer_id)) {?>
			      <div class="radio">
				  <label>
				  <?php /* fix_16 */?>
				  	 <?php /*<!-- <input type="radio" name="payment_address" value="new" onclick="jQuery('#payment-address-new').show();"/>-->*/?>
				  <?php /* fix_16 */?>
					<?php echo $text_address_new; ?>
				  </label>
			      </div>
				  <?php } ?>
			      <?php } ?>
				  </div>
				  
				 <?php /* fix_16 */?>
				  	 <?php /*<!--  <div id="payment-address-new" <?php if (isset($customer_id) && $addresses) {?>	style="display:none"<?php }?>> -->*/?>
				  <div id="payment-address-new">
				 <?php /* !fix_16 */?>
				 
				 
				  
				  <?php // if (!$checkout_hide_company){?>
				  <div class="form-group col-md-6 seo-hidden">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
				    <input type="text" name="company" value="<?php if (isset($company)) echo $company;?>" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-payment-company" class="form-control" />
				  </div>
				   <?php //} else {?>
					   <input type="hidden" name="company" value="" />
				   <?php //}?>
				   

				  <?php if (isset($entry_company_id)) { ?>
				  <?php if (!$checkout_hide_company_id){?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company_id; ?></label>
				    <input type="text" name="company_id" value="<?php if (isset($company_id)) echo $company_id; ?>" placeholder="<?php echo str_replace(':','',$entry_company_id); ?>" id="input-payment-company-id" class="form-control" />
				  </div>
				   <?php } else {?>
					   <input type="hidden" name="company_id" value="" />
				   <?php }?>

				  <?php if (!$checkout_hide_tax_id){?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-tax-id-"><?php echo $entry_tax_id; ?></label>
				    <input type="text" name="tax_id" value="<?php if (isset($tax_id)) echo $tax_id; ?>" placeholder="<?php echo str_replace(':','',$entry_tax_id); ?>" id="input-tax-id-" class="form-control" />
				  </div>
				   <?php } else {?>
					   <input type="hidden" name="tax_id" value="" />
				   <?php } }?>

				  <div class="form-group col-md-12 seo-hidden">
				    <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				    <input type="text" name="address_2" value="<?php if (isset($address_2)) echo $address_2;?>" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-payment-address-2" class="form-control" />
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
				    <select name="country_id" id="input-payment-country" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($countries as $country) { ?>
				      <?php if ($country['country_id'] == $country_id) { ?>
				      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
				      <?php } else { ?>
				      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
				      <?php } ?>
				      <?php } ?>
				    </select>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
				    <select name="zone_id" id="input-payment-zone" class="form-control">
				    </select>
				  </div>
				  <div class="form-group required col-md-6">
					<label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
					<div id="div-city">
						<input style="display: hidden" name="city" type="text" id="input-payment-city" class="form-control city-inp" placeholder="<?php echo $entry_city; ?>">
						<?php /* c_fix_2
					  <select name="city" id="input-payment-city"  class="form-control city-sel">
					  */?>
					  
					  <?php /* !c_fix_2*/?>
					  </select>

					</div>

				  </div>



				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
				    <input type="text" name="postcode" value="<?php if (isset($postcode)) echo $postcode;?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-payment-postcode" class="form-control" />
				  </div>
				   <div class="form-group required col-md-12">
				    <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
				    <input type="text" name="address_1" value="<?php if (isset($address_1)) echo $address_1;?>" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-payment-address-1" class="form-control" />
				  </div>
				</div>

				<?php if (!isset($customer_id)) {?>
				<div class="form-group col-md-12">
					<label>
					<input type="checkbox" name="register" onclick="jQuery('.register-form').toggle()">&nbsp;<?php echo $text_register; ?></label>
				</div>
				<?php } ?>


				<div class="register-form" style="display:none">
				      <div class="form-group required col-md-6">
					<label class="control-label" for="input-payment-password"><?php echo $entry_password; ?></label>
					<input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-payment-password" class="form-control" />
				      </div>
				      <div class="form-group required col-md-6">
					<label class="control-label" for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
					<input type="password" name="confirm" value="" placeholder="<?php echo str_replace(':','',$entry_confirm); ?>" id="input-payment-confirm" class="form-control" />
				      </div>
				</div>
			<?php /*} else {?>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
				    <p><?php echo $firstname; ?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-fathername"><?php echo $entry_fathername; ?></label>
				    <p><?php echo $fathername; ?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
				    <p><?php echo $lastname; ?></p>
				  </div>
				  <div class="form-group required  col-md-6">
				    <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
				    <p><?php echo $email; ?></p>
				  </div>
				  <div class="form-group required  col-md-6">
				    <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
				    <p><?php echo $telephone; ?></p>
				  </div>
				  <?php if (!empty($fax)) {?>
				  <div class="form-group col-md-12">
				    <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
				    <p><?php echo $fax; ?></p>
				  </div>
				  <?php }?>


				  <div class="col-md-12">
				    <h3 class="clearfix"><?php echo $text_your_address; ?></h3>
				  </div>

				  <?php if (!empty($address['company'])) {?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
				    <p><?php echo $address['company']; ?></p>
				  </div>
				  <?php }?>

				  <?php if (!empty($address['address_1'])) {?>
				  <div class="form-group required col-md-12">
				    <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
				    <p><?php echo $address['address_1'];?></p>
				  </div>
				   <?php }?>

				  <?php if (!empty($address['address_2'])) {?>
				  <div class="form-group col-md-12">
				    <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				    <p><?php echo $address['address_2'];?></p>
				  </div>
				   <?php }?>

				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
				    <p><?php echo $address['country'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-zone"><?php echo $entry_zone;; ?></label>
				    <p><?php echo $address['zone'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
				    <p><?php echo $address['city'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
				    <p><?php echo $address['postcode'];?></p>
				  </div>

			<?php } */?>
		      </div>
		    </div>
		    <div class="col-md-6">
		    <div class="seo-hidden">
			<div class="shiptobilling clearfix">
				    <h3><?php echo $text_checkout_shipping_address; ?></h3>
					<?php if (!isset($customer_id)) {?>
				    <label class="checkbox">
					    <input type="checkbox" name="shipping_address" value="new" <?php if (isset($address_id)) echo 'checked="checked"';?> onclick="jQuery('.shipping-address').toggle()"><?php echo $text_address_new; ?>
				    </label>
					<?php } ?>
			    </div>
			    <div class="shipping-address" <?php if (isset($shipping_address_id) || isset($customer_id)) echo 'style="display:block"'; else echo 'style="display:none"'; ?>>
			      <?php if ($addresses) { ?>
				  <?php if (isset($customer_id)) {?>
			      <div class="radio">
				<label>
				  <input type="radio" name="shipping_address" id="jkl" value="existing" checked="checked" onclick="jQuery('#shipping-new').hide()" />
				  <?php echo $text_address_existing; ?></label>
			      </div>
			      <div id="shipping-existing">

				<select name="shipping_address_id" class="form-control">
				  <?php foreach ($addresses as $address) { ?>
				  <?php if (isset($shipping_address_id) && $address['address_id'] == $shipping_address_id) { ?>
				  <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } ?>
				  <?php } ?>
				</select>
			      </div>
			      <?php } ?>
			    <?php if (isset($customer_id)) {?>
			      <div class="radio">
				  <label>
				  <input type="radio" name="shipping_address" value="new" onclick="jQuery('#shipping-new').show();"/>
				  <?php echo $text_address_new; ?></label>
			      </div>
				  <?php } ?>
			      <?php } ?>
			      <br />
			      <div id="shipping-new" style="display: <?php echo (($addresses && isset($customer_id)) ? 'none' : 'block'); ?>;">
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
				  <div class="">
				    <input type="text" name="shipping_firstname" value="" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-shipping-firstname" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-fathername"><?php echo $entry_fathername; ?></label>
				  <div class="">
				    <input type="text" name="shipping_fathername" value="" placeholder="<?php echo str_replace(':','',$entry_fathername); ?>" id="input-shipping-fathername" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
				  <div class="">
				    <input type="text" name="shipping_lastname" value="" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-shipping-lastname" class="form-control" />
				  </div>
				</div>
				<?php //if (!$checkout_hide_company_id){?>
				<div class="form-group">
				  <label class="control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
				  <div class="">
				    <input type="text" name="shipping_company" value="" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-shipping-company" class="form-control" />
				  </div>
				</div>
			   <?php //} else {?>
				   <input type="hidden" name="shipping_company" value="" />
			   <?php //}?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
				  <div class="">
				    <input type="text" name="shipping_address_1" value="" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-shipping-address-1" class="form-control" />
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
				  <div class="">
				    <input type="text" name="shipping_address_2" value="" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-shipping-address-2" class="form-control" />
				  </div>
				</div>
				 <div class="form-group required">
					<label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
					<div class="">
					  <select name="city1" id="input-city" class="form-control">
					  </select>

					</div>
				  </div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
				  <div class="">
				    <input type="text" name="shipping_postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-shipping-postcode" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
				  <div class="">
				    <select name="shipping_country_id" id="input-shipping-country" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($countries as $country) { ?>
				      <?php if ($country['country_id'] == $country_id) { ?>
				      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
				      <?php } else { ?>
				      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
				      <?php } ?>
				      <?php } ?>
				    </select>
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
				  <div class="">
				    <select name="shipping_zone_id" id="input-shipping-zone" class="form-control">
				    </select>
				  </div>
				</div>
				<?php if (isset($custom_fields)) foreach ($custom_fields as $custom_field) { ?>
				<?php if ($custom_field['type'] == 'select') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <select name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
				      <?php } ?>
				    </select>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'radio') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="radio">
					<label>
					  <input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'checkbox') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="checkbox">
					<label>
					  <input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'text') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'textarea') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <textarea name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'file') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				    <input type="hidden" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'date') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="date" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'datetime') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="datetime-local" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'time') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="time" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php } ?>
			      </div>
			</div>
			    <div class="shipping-method">
				<?php if ($error_warning) { ?>
				<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
				<?php } ?>
				<?php if ($shipping_methods) { ?>
				<p><?php echo $text_shipping_method; ?></p>
				<?php foreach ($shipping_methods as $shipping_method) { ?>
				<p><strong><?php echo $shipping_method['title']; ?></strong></p>
				<?php if (!$shipping_method['error']) { ?>
				<?php foreach ($shipping_method['quote'] as $quote) { ?>
				<div class="radio">
				  <label>
				    <?php if ($quote['code'] == $code || !$code) { ?>
				    <?php $code = $quote['code']; ?>
				    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" checked="checked" />
				    <?php } else { ?>
				    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" />
				    <?php } ?>
				    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
				</div>
				<?php } ?>
				<?php } else { ?>
				<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				</div>
				</div>

				<div class="your_order">
		    		<h3><?php echo $text_cart;?></h3>
					    <table id="cart_table" class="table table-bordered table-hover table-responsive">
					      <thead>
						<tr>
						  <th class="text-left"><?php echo $column_name; ?></th>
						  <th class="text-left hidden-xs"><?php echo $column_model; ?></th>
						  <th class="text-right hidden-xs"><?php echo $column_quantity; ?></th>
						  <th class="text-right hidden-xs"><?php echo $column_price; ?></th>
						  <th class="text-right"><?php echo $column_total; ?></th>
						</tr>
					      </thead>
					      <tbody>
						<?php foreach ($products as $product) { ?>
						<tr>
						  <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						    <?php foreach ($product['option'] as $option) { ?>
						    <br />
						    &nbsp;<small> - <?php echo $option['name']; ?>: <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
						    <?php } ?></td>
						  <td class="text-left hidden-xs"><?php echo $product['model']; ?></td>
						  <td class="text-right hidden-xs"><?php echo $product['quantity']; ?></td>
						  <td class="text-right hidden-xs"><?php echo $product['price']; ?></td>
						  <td class="text-right"><?php echo $product['total']; ?></td>
						</tr>
						<?php } ?>
						<?php foreach ($vouchers as $voucher) { ?>
						<tr>
						  <td class="text-left"><?php echo $voucher['description']; ?></td>
						  <td class="text-left hidden-xs"></td>
						  <td class="text-right hidden-xs">1</td>
						  <td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
						  <td class="text-right"><?php echo $voucher['amount']; ?></td>
						</tr>
						<?php } ?>
					      </tbody>
					      <tfoot>

						<?php $i=0; foreach ($totals as $total) { $i++;?>

						<tr>
						  <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
						  <td class="text-right"><?php echo isset($total['text'])?'-'.$total['text']:$total['text']; ?></td>
						  <?php  if ($total['code']=="total"){$totalprice = $total['text'];} ?>
						</tr>
						<?php } ?>
					      </tfoot>
					    </table>
					<label></label>
					<div class="payment-method" style="" >
					<?php if ($error_warning) { ?>
					<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
					<?php } ?>
					<?php if ($payment_methods) { ?>
					<p><?php echo $text_payment_method; ?></p>
					<?php foreach ($payment_methods as $payment_method) { ?>
					<div class="radio">
					  <label>
					    <?php if ($payment_method['code'] == $code || !$code) { ?>
					    <?php $code = $payment_method['code']; ?>
					    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" checked="checked" />
					    <?php } else { ?>
					    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" />
					    <?php } ?>
					    <?php echo $payment_method['title']; ?></label>
					</div>
					<?php } ?>
						
					<?php } ?>
					</div>
					
					<p><strong><?php echo $text_comments; ?></strong></p>
					<p>
					  <textarea name="comment" rows="3" class="form-control"><?php echo $comment; ?></textarea>
					</p>
					<?php if ($text_agree) { ?>
					<!--<div class="buttons clearfix">
					  <div class="pull-right"><?php echo $text_agree; ?>
					    <?php if ($agree) { ?>
					    <input type="checkbox" name="agree" value="1" checked="checked" />
					    <?php } else { ?>
					    <input type="checkbox" name="agree" value="1" checked="checked"/>
					    <?php } ?>
					    &nbsp;
					  </div>
					</div>
					<?php } else { ?>
					<!--<div class="buttons">
					  <div class="pull-right">
					    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" class="btn btn-primary" />
					  </div>
					</div>-->
					<?php } ?>
					<div ><input type="checkbox" name="politika" value="1" id="politika" ><span style="color: red">*</span> Я согласен с <u><a href="politika.html" target="_blank">политикой конфиденциальности</a></u></div>

					<div class="payment clearfix pull-right">
					    <?php if ($payment) echo $payment; else {?>
					    <input type="button" class="btn btn-primary btn-orange" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" id="button-register" value="<?php echo $heading_title; ?>">
						<br/>
						<br />
					<!--
						<a href = "https://yoomoney.ru/to/410013151272081/<?php echo preg_replace("/[^0-9]/", "", $totalprice ); ?>/">
							<input type="button" class="btn btn-primary btn-orange" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" id="button-register" value="Оплата банковской картой">
						</a> 
					-->

					    <?php }?></div>
					</div>
					<p id="logg"></p>
			    </div>
			</div>
		</div>
	</div>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="display: none" id="pop">

</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
        <h4 class="modal-title" id="exampleModalLabel" style="font-size: 20px">Заполните все обязательные поля, которые помечены <strong style="color: red">*</strong></h4><br>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Понятно</button>
      </div>
     
      
       
      </div>
    </div>
  </div>
</div>
	</div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<input type="hidden" id="country_temp">

<script type="text/javascript">
<?php /*c_fix_2 
$("#input-payment-telephone").mask("99(999)9999 999");*/?>
$.mask.definitions['1'] = "[1-9+]";
$("#input-payment-telephone").mask("19(999)9999 999");
<?php //!c_fix_2?>
$("#input-birth_date").mask("99-99-9999", {placeholder: "дд.мм.гггг" });<!--
var error = true;

// Login
$(document).delegate('#button-login', 'click', function() {

    $.ajax({
        url: 'index.php?route=checkout/checkout/login_validate',
        type: 'post',
        data: $('.login-form :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},
        complete: function() {
            $('#button-login').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('.login-form .message').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
           }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Register
$(document).delegate('#button-register', 'click', function()
{

	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');
	//alert( data)
    $.ajax({
        url: 'index.php?route=checkout/checkout/validate',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},
        complete: function() {
            $('#button-register').button('reset');
        },
        success: function(json) {
			
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
				error = true;
				$("#pop").trigger('click');
                if (json['error']['warning']) {
                    $('.error').prepend('<div class="alert alert-danger" ><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

		for (i in json['error']) {
                    $('[name="' + i + '"]').after('<div class="text-danger" style="color: red">' + json['error'][i] + '</div>');
		}
            } else
	    {
			error = false;
			jQuery('[name=\'payment_method\']:checked').click();
			$.ajax({
				url: 'index.php?route=payment/ikgateway/index',
				success: function(){

					document.forms['checkout'].submit();
				}
			});
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-spinner fa-spin"></i>');
        },
        complete: function() {
			$('.fa-spinner').remove();
        },
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
			<?php /*c_fix_2
			if (json['country_id'] != 220)
			{
				$(".city-inp").hide();
				$(".city-inp").attr('id', 'input-payment-city4');
				//$(".city-inp").attr('name', 'city5');

				$(".city-sel").attr('id', 'input-payment-city');
				//$(".city-sel").attr('name', 'city');
				$(".city-sel").show();
				
				//

			}
			else
			{
				$(".city-sel").hide();
				$(".city-sel").attr('id', 'input-payment-city4');
				//$(".city-sel").attr('name', 'city5');

				$(".city-inp").attr('id', 'input-payment-city');
				//$(".city-inp").attr('name', 'city');
				$(".city-inp").show();
				
				//$("#div-city").empty();
				//$("#div-city").append('<select name="city" id="input-payment-city" class="form-control city-sel"></select>');
			}
			!c_fix_2 */?>
            $("#country_temp").val(json['country_id']);
            $('select[name=\'zone_id\']').html(html).val("");
			$('select[name=\'city\']').html('<option value=""><?php echo $text_select; ?></option><option value="0" selected="selected"><?php echo $text_none; ?></option>');
			$('#input-payment-city').trigger('change');

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'zone_id\']').on('change', function() {


	if ($("#country_temp").val() == 220)
	{
		$('select[name=\'city\']').html('<option value="'+$('select[name=\'zone_id\'] option:selected').text()+'" selected="selected">'+$('select[name=\'zone_id\'] option:selected').text()+'</option>');

		return;
	}

	$.ajax({
		url: 'index.php?route=account/account/zone&zone_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'zone_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {


			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['city'] && json['city'] != '') {
				for (i = 0; i < json['city'].length; i++) {
					html += '<option value="' + json['city'][i]['name'] + '"';

					if (json['city'][i]['city_id'] == '<?php echo $city_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['city'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'city\']').html(html);
			$('#input-payment-city').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'zone_id\']').trigger('change');


$('select[name=\'payment_country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-spinner fa-spin"></i>');
        },
        complete: function() {
			$('.fa-spinner').remove();
        },
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }

            $('select[name=\'shipping_zone_id\']').html(html).val("");
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});





$('select[name=\'country_id\'], select[name=\'zone_id\'], select[name=\'city\']').on('change', function()
{
	if (this.name == 'contry_id') jQuery("select[name=\'zone_id\']").val("");
	if (this.name == 'shipping_country_id') jQuery("select[name=\'shipping_zone_id\']").val("");

    jQuery(".shipping-method").load('index.php?route=checkout/checkout/shipping_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function()
    {
		if (jQuery("input[name=\'shipping_method\']:first").length)
		{
			jQuery("input[name=\'shipping_method\']:first").attr('checked', 'checked').prop('checked', true).click();
		} else
		{
			jQuery("#cart_table").load('index.php?route=checkout/checkout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));
		}
    });

	jQuery(".payment-method").load('index.php?route=checkout/checkout/payment_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function()
	{
		jQuery("[name=\'payment_method\']").removeAttr("checked").prop('checked', true);
	});
});


$(document).delegate('input[name=\'shipping_method\']', 'click', function()
{
    jQuery("#cart_table").load('index.php?route=checkout/checkout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));
});

$('body').delegate('[name=\'payment_method\']','click', function()
{

	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');

	if (!error)
    $.ajax({
        url: 'index.php?route=checkout/checkout/confirm',
        type: 'post',
        data: data,
        success: function(html)
        {
			jQuery(".payment").html(html);

			jQuery("#button-confirm").click();

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'country_id\']').trigger('change');

jQuery(document).ready(function()
{
	jQuery('input:radio[name=\'payment_method\']:first').attr('checked', true).prop('checked', true);
	<?php /*if ($opencart_version < 2000) {?>
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});   $('#table_cart').html(html);
	<?php }*/?>
});


jQuery('body').on('change','#input-payment-city',function(){
	//alert($('#input-payment-city').val());
      $("input[name=\'shipping_method\']:first").attr('checked', 'true');
	$.ajax({
		type: 'post',
		url: 'index.php?route=checkout/checkout/foo',
		data: $('#input-payment-country, #input-payment-zone, #input-payment-city'),
		 error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }

	});
});
jQuery('body').on('change','#input-payment-zone',function(){
	//alert($('#input-payment-zone);
      $("input[name=\'shipping_method\']:first").attr('checked', 'true');
	$.ajax({
		type: 'post',
		url: 'index.php?route=checkout/checkout/foo',
		data: $('#input-payment-country, #input-payment-zone, #input-payment-city'),
		 error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }

	});
});




//--></script>
<style>
	#paymentForm{
		display: none;
	}
	#button-confirm{
		display: none;
	}
}
}
</style>

<?php echo $footer;?>
