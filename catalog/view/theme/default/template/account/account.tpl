<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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
	
	 <?php /* fix_20 add_skidki_block */?>
	 <h1>Покупки</h1>
	 <br>
	  <h4 style="margin-bottom: 0cm; line-height: 1.4;" class = "skidki_block">
		<div style="text-align: left;">
			<span style="font-family: Arial; font-size: 16px; font-weight: bold; color: inherit;">
				<h2>Поздравляем! Вы можете покупать продукцию Тяньши по <b>СКИДКАМ до - 50%</b></h2>
		
			</span>
		</div>
	
	  </h4>

    <div class = "col-sm-4 col-md-offset-3 header-panel" style="float:right; override:none; min-width: 300px;">
      <button type="button" data-loading-text="Загрузка..." class="btn btn-inverse btn-block btn-lg  btn-orange">
        <a style="color:white" href="produkciya.html">
          <i class="fa fa-shopping-cart"></i> 
          <span style="font-size: 18px;">Купить по СКИДКАМ</span><!--<span id="cart-total">Товаров 2 (6352р.)</span>-->
        </a>
      </button>
    </div>
    <br/>

	 <?php /* fix_20 add_skidki_block */?>
     <h2><?php echo $text_my_orders; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <?php if ($reward) { ?>
        <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      </ul>
      <h2><?php echo $text_my_account; ?></h2>
	  <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $editgroup; ?>"><?php echo $text_editgroup; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul>
     
      <h2><?php echo $text_my_newsletter; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
	  <?php /* fix_19 
	  <h2>Мои купоны</h2>
      <p>Постоянный купон на скидку - 10% = 10011001</p>
      <p>Одноразовый купон на скидку - 30% = 30300303</p>*/?>
	  <?php /* !fix_19 */?>
      <?php echo $content_bottom; ?>
	</div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>