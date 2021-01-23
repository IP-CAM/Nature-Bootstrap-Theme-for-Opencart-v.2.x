<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-paymaster" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
<div class="container-fluid">
	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> Edit PayMaster.ua</h3>
	</div>
	<div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-paymaster" class="form-horizontal">

		<div class="form-group required">
			<label class="col-sm-2 control-label" for="input-paymaster_merchant_id"><?php echo $entry_merchant_id; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_merchant_id" value="<?php echo $paymaster_merchant_id; ?>" placeholder="<?php echo $entry_merchant_id; ?>" id="input-paymaster_merchant_id" class="form-control" />
			</div>
			<?php if ($error_merchant_id) { ?>
			<div class="text-danger"><?php echo $error_merchant_id; ?></div>
			<?php } ?>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="input-paymaster_secret_key"><?php echo $entry_secret_key; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_secret_key" value="<?php echo $paymaster_secret_key; ?>" placeholder="<?php echo $entry_secret_key; ?>" id="input-paymaster_secret_key" class="form-control" />
			</div>
			<?php if ($error_secret_key) { ?>
			<div class="text-danger"><?php echo $error_secret_key; ?></div>
			<?php } ?>
		</div>	

		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_hash_alg"><?php echo $entry_hash_alg; ?></label>
			<div class="col-sm-10">
				<select name="paymaster_hash_alg" id="input-paymaster_hash_alg" class="form-control">
				<?php if ($paymaster_hash_alg=='sha1') { ?>		
				<option value="sha256">sha256</option>					
				<option value="md5">md5</option>				
				<option value="sha1" selected="selected">sha1</option>				
				<?php }elseif ($paymaster_hash_alg=='md5') { ?>
				<option value="sha256">sha256</option>
				<option value="md5" selected="selected">md5</option>
				<option value="sha1">sha1</option>	
				<?php } else { ?>	
				<option value="sha256" selected="selected">sha256</option>			
				<option value="md5">md5</option>	
				<option value="sha1">sha1</option>				
				<?php } ?>
				</select>
			</div>
		</div>
	
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_result_url"><?php echo $text_url_res; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_result_url" readonly="readonly" value="<?php echo $copy_result_url; ?>" id="input-paymaster_result_url" class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_success_url"><?php echo $text_url_suc; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_success_url" readonly="readonly" value="<?php echo $copy_success_url; ?>" id="input-paymaster_success_url" class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_fail_url"><?php echo $text_url_fail; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_fail_url" readonly="readonly" value="<?php echo $copy_fail_url; ?>" id="input-paymaster_fail_url" class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_test"><?php echo $entry_test; ?></label>
			<div class="col-sm-10">
				<select name="paymaster_test" id="input-paymaster_test" class="form-control">
				<?php if ($paymaster_test) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_order_status_id"><?php echo $entry_order_status; ?></label>
			<div class="col-sm-10">
				<select name="paymaster_order_status_id" id="input-paymaster_order_status_id" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $paymaster_order_status_id) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>


		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_geo_zone_id"><?php echo $entry_geo_zone; ?></label>
			<div class="col-sm-10">
				<select name="paymaster_geo_zone_id" id="input-paymaster_geo_zone_id" class="form-control">
				<option value="0"><?php echo $text_all_zones; ?></option>
				<?php foreach ($geo_zones as $geo_zone) { ?>
				<?php if ($geo_zone['geo_zone_id'] == $paymaster_geo_zone_id) { ?>
				<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
				<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_status"><?php echo $entry_status; ?></label>
			<div class="col-sm-10">
				<select name="paymaster_status" id="input-paymaster_status" class="form-control">
				<?php if ($paymaster_status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-paymaster_sort_order"><?php echo $entry_sort_order; ?></label>
			<div class="col-sm-10">
				<input type="text" name="paymaster_sort_order" value="<?php echo $paymaster_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-paymaster_sort_order" class="form-control" />
			</div>
		</div>
    </form>
  </div>
</div>
<?php echo $footer; ?>