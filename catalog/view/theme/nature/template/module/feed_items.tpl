<!--<h3><?php echo $heading_title; ?></h3>-->
<?php foreach ($categories as $category) { ?>


<div class="container">
	<div class="row">
		<h3 class="feed-items"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h3>
		
	  <?php foreach ($products as $product) { ?>
	  <?php if ($product['category_id'] == $category['category_id']) { ?>
	  <div class="item-product-scroll col-xs-12 col-sm-6 col-md-4 col-lg-3">
	    <div class="fix-height product-thumb transition">

	      <div class="image transition">
			<?php if ($product['upc']) { ?><i style="background: url('catalog/view/theme/default/image/sticker_<?php echo $product['upc']; ?>.png');"></i><?php } ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" 
                alt="<?php echo $product['alt_image'] ? $product['alt_image'] : $product['name']; ?>"
				
             
                title="<?php echo $product['title_image'] ? $product['title_image'] : $product['name']; ?>"
				
             class="img-responsive" /></a>
			<div class="image_panel">
				<a href="<?php echo $product['href']; ?>" class="btn btn-primary btn-lg">
					<span class="fa fa-search"></span>
				</a>
			</div>
		  </div>
			<?php
			//fix делаем ссылки оранжевыми.
			?>
	      <div class="caption">
	        <h4><a href="<?php echo $product['href']; ?>" ><?php echo $product['name']; ?></a></h4>
	        <!--<?php if ($product['rating']) { ?>
	        <div class="rating">
	          <?php for ($i = 1; $i <= 5; $i++) { ?>
	          <?php if ($product['rating'] < $i) { ?>
	          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
	          <?php } else { ?>
	          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
	          <?php } ?>
	          <?php } ?>
	        </div>
	        <?php } ?>
	        <!--<p class="feed-visits"><span class="glyphicon glyphicon-eye-open" title="<?php echo $text_views; ?>"></span> (<?php echo $product['viewed_total']; ?>) <span class="glyphicon glyphicon-comment" title="<?php echo $text_reviews; ?>"></span> (<?php echo $product['reviews_total']; ?>)</p>
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
	        <?php } ?> -->
	        
	      </div>
	      <div class="button-group">
	        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
	        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
	        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
	      </div>
	    </div>
	  </div>
	  <?php } ?>
	  <?php } ?>
	
</div>
<div class = "row" style = "padding:20px;">
		<a class="feed-items-link btn btn-orange" style ="letter-spacing: 3px; text-decoration: none;" href="<?php echo $category['href']?>" ><?php echo mb_strtoupper($text_all); ?><?php echo mb_strtoupper($category['name']); ?></a>
	</div>
</div>

<script type="text/javascript">
$('#mod_feed_items<?php echo $category['category_id']; ?>').owlCarousel({
	items: 4,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
</script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>

<?php } ?>


<style>
	.btn-orange:hover{
		color:white !important;
		text-decoration: none;
	}
</style>