<?php echo $header; ?>
<?php if($show_modal) { ?>

<?php } ?>
<style>a:link {color: #333 }</style>
<div class="container">
  <ul class="breadcrumb">
	
    <?php 
	
	foreach ($breadcrumbs as $breadcrumb) { ?>
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
    <div id="content" style="min-height: none;" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo str_replace('http://www.tjanshi.com/login','http://www.tjanshi.com/?route=account/register',str_replace('create-account','?route=account/register',str_replace("color: #0000ff", "", $description))); ?>
      <?php if ($send_mail) { ?>
    
		
        <?php } ?></div>
      <?php foreach ($informations as $information) { ?>
        <?php if($information['information_id'] != '16' and $information['title']!="Сертификаты") { ?>
        <div class="informations_block col-md-4 col-sm-6 col-xs-12">
          <h3><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></h3>
          <div class="info-description">
           <?php echo $information['short_description']; ?><br>
           <a class="inf_read_more" href="<?php echo $information['href']; ?>"><?php echo $read_more; ?></a>
          </div>
        </div>
        <?php } ?>
      <?php } ?><?php echo str_replace("Рекомендуемые","",$content_bottom); ?></div>
    <?php echo $column_right; ?></div>
</div>


  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="display: none" id="pop1">

</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div style="z-index: 10000; width: 100%; height: 100%; background-color: grey; opacity: 0.5; position: absolute"></div>
  <div class="modal-dialog" role="document" style="z-index: 10001">
    <div class="modal-content">
      <div class="modal-body text-center">
        <h4 class="modal-title" id="exampleModalLabel" style="font-size: 20px">Купон на СКИДКУ -30% оправлен Вам на E-mail</h4><br>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Понятно</button>
      
     
      
       
      </div>
    </div>
</div>
  </div>
<div class="container">

<?php if ($products) { ?>
	<div>
      <h3><?php echo $text_related; ?></h3></div>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="fix-height product-thumb transition">
            <div class="image transition"><?php if ($product['upc']) { ?><i style="background: url('catalog/view/theme/default/image/sticker_<?php echo $product['upc']; ?>.png');"></i><?php } ?><a role="button" data-toggle="modal" id="product_link-<?php echo $product['product_id']; ?>" href="#product_<?php echo $product['product_id']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
    <div class="image_panel">
      <a href="<?php echo $product['href']; ?>" class="btn btn-primary btn-lg">
          <span class="fa fa-search"></span>
      </a>
    </div></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <div class="fix-desc"><?php echo $product['description']; ?></div>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php echo $text_price; ?>
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?> 
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
    </div>  
	<input type="hidden" id="yak_mene_ce_zaibalo"  <?if (isset($_GET['mail']) and $_GET['mail'] == 'ok') echo 'value="1"'; else echo 'value="0"';
?>value="">
	 

<?php echo $footer; ?>

  


