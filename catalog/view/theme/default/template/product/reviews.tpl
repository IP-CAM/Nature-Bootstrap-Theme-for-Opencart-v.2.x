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
 	<div class="reviews">
 		<h1><?php echo $heading_title; ?> <small class="write-review"><a href="http://www.tjanshi.com/?route=common/reviews_global"><span class="glyphicon glyphicon-comment"></span> <?php echo $write_review?></a></small></h1>
 		<hr>
 		<?php foreach($reviews as $review) { ?>
 			<div class="row">
 				<div class="col-lg-10 col-md-10 col-sm-9 col-xs-8">
		 			<p class="star-reviews"><strong><?php echo $review['author']; ?></strong>
		 			<?php for ($i = 1; $i <= 5; $i++) { ?>
		              <?php if ($review['rating'] < $i) { ?>
		              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
		              <?php } else { ?>
		              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
		              <?php } ?>
		        	<?php } ?> <small><?php echo $review['date_added']; ?></small></p>
		        	<p>
		        	<?php if ($review['product']['product_id'] != 8769) { ?>
		        		<a class="blue-link" href="<?php echo $review['product']['href']; ?>"><?php echo $review['product']['name']; ?></a>
		        	<?php } else { ?>
		        		<a class="blue-link" href="http://www.tjanshi.com/korporaciya-tyanshi.html"><?php echo $review['product']['name']; ?></a>
		        	<?php } ?>
		        	</p>
		        	<p><?php echo $review['text']; ?></p>
		        </div>
		        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4 review-product">
		        	
		        	<?php if ($review['product']['product_id'] != 8769) { ?>
		        		<a href="<?php echo $review['product']['href']; ?>"><img src="<?php echo $review['product']['image']; ?>" alt="<?php echo $review['product']['image']; ?>" width="100%"/></a><br>
		        		<b><?php echo $review['product']['name']; ?></b>
		        	<?php } else { ?>
		        		<a href="http://www.tjanshi.com/korporaciya-tyanshi.html"><img src="<?php echo $review['product']['image']; ?>" alt="<?php echo $review['product']['image']; ?>" width="100%" /></a><br>
		        		<b><?php echo $review['product']['name']; ?></b>
		        	<?php } ?>
		        	<p class="star-reviews"><?php for ($i = 1; $i <= 5; $i++) { ?>
		              <?php if ($review['product']['rating'] < $i) { ?>
		              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
		              <?php } else { ?>
		              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
		              <?php } ?><?php } ?></p>
		        </div>	
	        </div>	
	        <hr>
 		<?php } ?>
 		<h1><small class="write-review"><a class="write-review" href="http://www.tjanshi.com/?route=common/reviews_global"><span class="glyphicon glyphicon-comment"></span> <?php echo $write_review?></a></small></h1>
 	</div>
 	<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>