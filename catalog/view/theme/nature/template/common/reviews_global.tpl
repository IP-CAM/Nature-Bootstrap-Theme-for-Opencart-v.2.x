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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	
	
	
	
 	<div>
 	</div>
	
	
	
	<?php if (isset($_GET['form'])) {?>
 	
	
	<?
	}
	
	?>
	<?php if (!isset($_GET['form'])) {?>
	<div class="row">
		<div class="col-md-3">
			<h1><?php echo $heading_title; ?></h1>
		</div>
		<div class="col-md-9" style="padding-top: 25px;">
			<small class="write-review" style=" font-size: 18px" id="form-trigger"><a><span class="glyphicon glyphicon-comment"></span> Оставить отзыв о продукции Тяньши</a></small>
		</div>
	
	</div>
	<hr>
	<div id="form-new" style="display: none">
		<form class="form-horizontal" id="form-review">
			<h2><?php echo $text_write; ?></h2>
			<?php if ($review_guest) { ?>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				<input type="text" name="name" value="" id="input-name" class="form-control" />
			  </div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
				<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
				<div class="help-block"><?php echo $text_note; ?></div>
			  </div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label"><?php echo $entry_rating; ?></label>
				&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp;<?php echo $entry_good; ?></div>
			</div>
			<?php if ($site_key) { ?>
			  <div class="form-group">
				<div class="col-sm-12">
				  <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
				</div>
			  </div>
			<?php } ?>
			<div class="buttons clearfix">
			  <div class="pull-right">
			   
				<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
			  </div>
			</div>
			<?php } else { ?>
			<?php echo $text_login; ?>
			<?php } ?>
			
			
				   
		</form>
		<div id="review"></div>
		<hr>
	</div>
	<?
	
	//if ($reviews)echo "ok" else echo "bad";
	foreach ($reviews as $review) 
	{?>
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-9 col-xs-8">
			<p class="star-reviews"><strong><?=$review['author']?></strong>
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($review['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
			  <small><?=$review['date_added']?></small>
			</p>
			<p>
				<a class="blue-link" href="http://www.tjanshi.com/<?=$review['link']?>">
					<?=$review['name']?>
				</a>
			</p>
			<p>
				<?=$review['text']?>			
			</p>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-4 review-product">
			
			<a href="http://www.tjanshi.com/<?=$review['link']?>"><img src="https://www.tjanshi.com/image/<?=$review['img']?>" width="100%">
			</a>
			<br>
			<b>
				<?=$review['name']?>
			</b>
			<p class="star-reviews">		              		              
				<?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($review['prod_rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
			</p>
		</div>	
		
	</div>
	<hr>
	
	<?}
	}?>
 	<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

$("#form-trigger").click(function()
{
	
		$("#form-new").slideToggle(500);
	
});
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
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
<script type="text/javascript"><!--


//$('#review').load('index.php?route=product/product/review1&product_id=8769');

$('#button-review').on('click', function() {
	//alert();
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=8769',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<?php echo $footer; ?>
