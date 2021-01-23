<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 style="margin-top: 0px;"><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
        <?php  if (isset($products)) {  ?>
        	<div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary btn-orange"><?php echo $button_checkout; ?></a><a href="/produkciya.html" class="btn btn-default resized-btn"><?php echo $button_shopping; ?></a></div>
        <?php } ?>
      </h1>
	  <?php /* fix_14 
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">*/?>
	  
	  <form action="<?php echo str_replace('http:','https:',$action); ?>" method="post" enctype="multipart/form-data">
	  <?php /* fix_14 */?>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
				
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');location.reload();"><i class="fa fa-times-circle"></i></button></span></div></td>
                  <?php if ($discount == 0){ ?>
                    <td class="text-right"><?php echo $product['price']; ?></td>
                    <td class="text-right"><?php echo $product['total']; ?></td>
                  <?php }else{ ?>
                    <td class="text-right"><strike><?php echo $product['price']; ?></strike><br><span style="color:red;"><?php echo   round($product['price']*(1-$discount/100)).'р.'; ?></span></td>
                    <td class="text-right"><strike><?php echo $product['total']; ?></strike><br><span style="color:red;"><?php echo   round($product['total']*(1-$discount/100)).'р.'; ?></span></td>
                  <?php } ?>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');location.reload();"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
		<!--<div class="pull-right"><?php echo $currency; ?></div>
		<br>-->
      </form>
	  
      
       <br />
      <div class="row">


        <?php if ($coupon || $voucher || $reward || $shipping) { ?>
          <?php /* fix_19 */?>
          <?php if (!$logged){ ?>
            <h2><?php echo $text_next; ?></h2>
            <p style="font-size: 14px;"><?php echo $text_next_choice; ?></p>
          <?php }else{?>
          <div class="col-sm-7">
            <ul style="margin-top:20px;padding-left:0px;"><h3 style ="color:blue;">СКИДКИ увеличиваются Автоматически:</h3></ul>
            <b><li>-  от 1 руб. до 15 000.руб. = СКИДКА -30% </li>
            <li>-  от 15 000.руб. до 30 000 руб. = СКИДКА -35% + БЕСПЛАТНАЯ Доставка</li>
            <li>-  от 30 000 руб. до 60 000 руб. = СКИДКА -40% + БЕСПЛАТНАЯ Доставка</li>
            <li>-  от 60 000 руб. до 999000 руб. = СКИДКА -50% + БЕСПЛАТНАЯ Доставка</li></b>
          </div>
          <br/>

          <?php } ?> 
        
          <div class="col-sm-4" style = "float:right;" >
            <table class="table table-bordered">
              <?php foreach ($totals as $total) { ?>
              <tr>
                  <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                  <td class="text-right"><?php echo $total['text']; ?></td>
              </tr>
              <?php } ?>
            </table>
          </div>
        

      </div>
        <?php /* fix_19 */?>
        <br /><br />
        <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>

     


        <?php }else{ ?>
      </div>
        <?php } ?>

      <br>
      <div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue;?>/produkciya.html" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary btn-orange"><?php echo $button_checkout; ?></a></div>
      </div>

      <?php echo $content_bottom; ?></div>

    <?php echo $column_right; ?></div>
    <div class="row block-alpha container" style="padding-top: 40px; background: rgba(255,255,255,0.7);">
          <p>Мы принимаем все популярные <a class="blue-link" href="http://www.tjanshi.com/oplata.html">способы оплаты онлайн</a>:</p>
          <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/mastercard.png" width="100%"  />
            </div>
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/visa.png" width="100%"  />
            </div>
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/privat24.png" width="100%"  /> 
            </div> 
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/liqpay.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/webmoney.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/qiwi.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/sberbank.png" width="100%"  /> 
            </div>
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/alphaklik.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/advcash.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/payeer.png" width="100%"  /> 
            </div>  
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/contact.png" width="100%"  /> 
            </div> 
            <div class="col-sm-1 col-xs-2">
              <img src="http://www.tjanshi.com/image/catalog/common/w1.png" width="100%"  /> 
            </div>  
    </div>

</div>

<?php echo $footer; ?>