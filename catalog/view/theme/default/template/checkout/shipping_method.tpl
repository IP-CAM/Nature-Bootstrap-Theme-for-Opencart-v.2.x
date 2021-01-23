
<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>

<?php foreach ($shipping_methods as $shipping_method) { ?>
<!--<p><strong><?php echo $shipping_method['title']; ?></strong></p>-->
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>

<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" id="radio_<?php echo $shipping_method['code']; ?>" onchange='showHideContent("radio_<?php echo $shipping_method['code']; ?>", "content_<?php echo $shipping_method['code']; ?>")' />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="radio_<?php echo $shipping_method['code']; ?>" onchange='showHideContent("radio_<?php echo $shipping_method['code']; ?>", "content_<?php echo $shipping_method['code']; ?>")'/>
    <?php } ?>
    <?php echo $quote['title']; ?><!-- - <?php echo $quote['text']; ?>--></label>
</div>
 
<?php } ?>

<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>

<?php } ?>

<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>

<script type="text/javascript">
  function showHideContent(radio, content) {
    other = document.getElementsByClassName('content-helper');
    for(i = 0; i < other.length; i++){
      other[i].style.display = "none";
    }
    radio = document.getElementById(radio);
    content = document.getElementById(content);
    if (radio.checked) content.style.display = "block";
    else content.style.display = "none";
  }

  $(document).ready(function() {
    alert("test");
    $("input[type=\'radio\']:checked").trigger("change");
  });

</script>