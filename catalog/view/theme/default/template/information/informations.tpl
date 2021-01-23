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
      <?php foreach ($informations as $information) { ?>
        <div class="informations_block col-md-4 col-sm-6 col-xs-12">
          <h3><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></h3>
          <div class="info-description">
           <?php echo $information['short_description']; ?><br>
           <a class="inf_read_more" href="<?php echo $information['href']; ?>"><?php echo $read_more; ?></a>
          </div>
        </div>

      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>