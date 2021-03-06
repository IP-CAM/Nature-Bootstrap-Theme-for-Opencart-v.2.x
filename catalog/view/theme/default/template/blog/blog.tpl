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
    <div id="content" style="background: rgba(255,255,255,0.45);" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $name; ?></h2>
      <?php if ($articles) { ?>

        <?php foreach ($articles as $article) { ?>
              <div class="panel-body">
                <div class="article-layout article-list col-xs-12">
                  <div class="article-intro">
                    <div>
                        <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                        <div class="article-description clearfix">
                          <p><?php echo $article['intro_text']; ?></p>
                          <div class="buttons pull-right">
                            <div class="pull-right">
                              <a href="<?php echo $article['href']; ?>" class="btn btn-primary"><?php echo $button_read_more; ?></a>
                            </div>
                          </div>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
        <?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
