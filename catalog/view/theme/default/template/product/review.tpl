<?php if ($reviews) { ?>
<?php foreach($reviews as $review) { ?>
      <div class="row">
        <div class="col-sm-10">
          <p><strong><?php echo $review['author']; ?> </strong>
          <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($review['rating'] < $i) { ?>
                  <span class="fa fa-stack" style="color: yellow; font-size: 10px;"><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack" style="color: yellow; font-size: 10px;"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } ?>
              <?php } ?> <small><?php echo $review['date_added']; ?></small></p>
              <p><?php echo $review['text']; ?></p>
        </div>
        <div class="col-sm-2">
          <p></p>
        </div>  
      </div>  
      <hr>
    <?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
