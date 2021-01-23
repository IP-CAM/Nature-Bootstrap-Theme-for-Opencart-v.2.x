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
    <div id="content" class="<?php echo $class; ?>" ><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
	  <p style="box-sizing: border-box; margin: 0px 0px 0.25cm; direction: ltr; line-height: 1.4; text-align: left; orphans: 2; widows: 2; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><a target="_blank" href="http://www.tjanshi.com/?route=account/register" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 0, 255); text-decoration: none; outline: 0px;"><img src="http://www.tjanshi.com/image/catalog/slide_reg.jpg" width="100%" style="box-sizing: border-box; border: 0px; vertical-align: middle;"></a></p>
      <?php if ($thumb || $description) { ?>
      <div class="row" >
        <!--<?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>-->
        <!--<?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>-->
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-12">
          <ul class="list-inline">
            <?php foreach ($categories as $category) { ?>
            <li class="col-sm-3 col-sm-offset-1 sub-category"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" /><p><?php echo $category['name']; ?></p></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
      <div class="row hide">
        <div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="category-fix-height product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>" target = "_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
				<?php /* fix_12 
                <h4><a href="<?php echo $product['href']; ?>" target = "_blank"><?php echo $product['name']; ?></a></h4> */ ?>
				<h4><a target = "_blank" href="<?php echo preg_replace('/(?<=.com\/).*\//m','',$product['href']); ?>"><?php echo $product['name']; ?></a></h4>
				<?php /* fix_12 */?>
                <div class="fix-desc"><?php echo $product['description']; ?>
                  </br>
                  <span class="product-read_more"><a href="<?php echo $product['href']; ?>" ><?php echo $read_more; ?></a></span>
                </div>
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
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo str_replace("http:", "https:", $pagination); ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      </div>
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
	$(".tags").hide();
	if ($("#content h1:eq(0)").text()!="Продукция")
		$("#content h1:eq(0)").hide();
	$("#content h3:eq(0)").hide();

window.addEventListener('load', function() {
    //  var sessionStorage.getItem("isClosed");
    adddecorator  = function(){
      return function(product_id,quantity) {
        //let result = func(product_id,-123123);

        //openmodal()
        document.querySelector("#exampleModal .modal-body").innerHTML = `<b>ТОВАР УСПЕШНО ДОБАВЛЕН В КОРЗИНУ</b>`;
        //document.querySelector("#exampleModal .modal-footer").innerHTML = document.querySelector("#exampleModal .modal-footer").innerHTML;

        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('#cart > button').button('reset');
                if (json['redirect']) {
                    location = json['redirect'];
                }
              
            }
        });




        document.querySelector("#exampleModal .modal-title").innerHTML = "Системное сообщение";
        $("#exampleModal #example-btnCancel").show();
        $("#exampleModal").modal();
        //return result;
        
      }
    
    }

    document.querySelector("#exampleModal #example-btnOk").addEventListener('click',(e)=>{
        cart.add = cart.add2;

    });
    document.querySelector("#exampleModal .close").addEventListener('click',(e)=>{
      cart.add = cart.add2;

    });

    //fix добавляем декоратор в соответствии с тем, выбрана галочка в лиалоговом окне или нет.
    let show = window.localStorage.getItem('showDialog');
    if (show){
      show = JSON.parse(show);

      if (show.expire < (new Date()).getTime()){
        if (cart){
          cart.add2 = cart.add;
          cart.add = adddecorator();}
      }
    }else{
        if (cart){cart.add2 = cart.add;cart.add = adddecorator();}
      }
    // your code here
  })

</script>
