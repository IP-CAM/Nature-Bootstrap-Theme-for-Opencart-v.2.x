<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> page-success"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <br \>
    <h4 style="margin-bottom: 0cm; line-height: 1.4;" class = "skidki_block">
		<div style="text-align: left;">
			<span style="font-family: Arial; font-size: 16px; font-weight: bold; color: inherit;">
				<h2>Поздравляем! Вы можете покупать продукцию Тяньши по <b>СКИДКАМ до - 50%</b></h2>
		
			</span>
		</div>
	
	  </h4>

    <div class = "col-sm-4 col-md-offset-3 header-panel" style="float:right; override:none; min-width: 300px;clear:both;">
      <button type="button" data-loading-text="Загрузка..." class="btn btn-inverse btn-block btn-lg  btn-orange" style="">
        <a style="color:white" href="produkciya.html">
          <i class="fa fa-shopping-cart"></i> 
          <span style="font-size: 18px;">Купить по СКИДКАМ</span><!--<span id="cart-total">Товаров 2 (6352р.)</span>-->
        </a>
      </button>
    </div>
    <br/>
    <br/>
	  <!-- <h3 style="color:white;">Благодарим  Вас за регистрацию на сайте, вы  получили возможность покупать продукцию Тяньши со СКИДКАМИ до -50% </h3>
	  <ul style="margin-top:20px;padding-left:0px;"><h4>СКИДКИ применяеются автоматически -  в зависимости от общей суммы заказа в козризе:</h4></ul>
		<li>-  от 1 руб. до 15 000.руб. = СКИДКА -30% </li>
		<li>-  от 15 000.руб. до 30 000 руб. = СКИДКА -35% + БЕСПЛАТНАЯ Доставка</li>
		<li>-  от 30 000 руб. до 60 000 руб. = СКИДКА -40% + БЕСПЛАТНАЯ Доставка</li>
		<li>-  от 60 000 руб. до 999000 руб. = СКИДКА -50% + БЕСПЛАТНАЯ Доставка</li>
      <?php/* echo $text_message; */?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>-->
</div>
<?php echo $footer; ?>