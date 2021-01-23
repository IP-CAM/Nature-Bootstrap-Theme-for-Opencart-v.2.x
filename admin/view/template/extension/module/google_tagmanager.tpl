<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-google-analytics" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tagmanager" class="form-horizontal">
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_signup; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_code" placeholder="<?php echo $entry_code; ?>" class="form-control" value="<?php echo $tagmanager_code;?>"/>
              <?php if ($error_code) { ?>
              <div class="text-danger"><?php echo $error_code; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_status" id="input-status" class="form-control">
                <?php if ($tagmanager_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-admin"><?php echo $entry_admin; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_admin" id="input-admin" class="form-control">
                <?php if ($tagmanager_admin) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
         <div class="form-group">
            <label class="col-sm-2 control-label" for="input-eu"><?php echo $entry_eu_cookie; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_eu_cookie" id="input-eu" class="form-control">
                <?php if ($tagmanager_eu_cookie) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cid"><?php echo $entry_cookie_text; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_cookie_text" placeholder="<?php echo $entry_cookie_text; ?>" class="form-control" value="<?php echo $tagmanager_cookie_text;?>"/>
            </div>
          </div> 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cid"><?php echo $entry_cookie_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_cookie_link" placeholder="<?php echo $entry_cookie_link; ?>" class="form-control" value="<?php echo $tagmanager_cookie_link;?>"/>
            </div>
          </div> 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cid"><?php echo $entry_cookie_button1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_cookie_button1" placeholder="<?php echo $entry_cookie_button1; ?>" class="form-control" value="<?php echo $tagmanager_cookie_button1;?>"/>
            </div>
          </div> 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cid"><?php echo $entry_cookie_button2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_cookie_button2" placeholder="<?php echo $entry_cookie_button2; ?>" class="form-control" value="<?php echo $tagmanager_cookie_button2;?>"/>
            </div>
          </div> 
         <div class="form-group">
            <label class="col-sm-2 control-label" for="input-adword"><?php echo $entry_adword; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_adword" id="input-adword" class="form-control">
                <?php if ($tagmanager_adword) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cid"><?php echo $entry_conversion_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_conversion_id" placeholder="<?php echo $entry_conversion_id; ?>" class="form-control" value="<?php echo $tagmanager_conversion_id;?>"/>
            </div>
          </div>   
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-clabel"><?php echo $entry_conversion_label; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_conversion_label" placeholder="<?php echo $entry_conversion_label; ?>" class="form-control" value="<?php echo $tagmanager_conversion_label;?>"/>
            </div>
          </div>   
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-adword"><?php echo $entry_remarketing; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_remarketing" id="input-adword" class="form-control">
                <?php if ($tagmanager_remarketing) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>  
       <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pixel"><?php echo $entry_pixel; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_pixel" id="input-pixel" class="form-control">
                <?php if ($tagmanager_pixel) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>    
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pixelcode"><?php echo $entry_pixelcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tagmanager_pixelcode" placeholder="<?php echo $entry_pixelcode; ?>" class="form-control" value="<?php echo $tagmanager_pixelcode;?>"/>
            </div>
          </div>            
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_product" id="input-adword" class="form-control">
                    <?php 
                      $product_map = array ('product_id','model','sku','model_product_id','product_id_currency');
                      foreach ($product_map as $pmap) { ?>
                    <?php if ($pmap == $tagmanager_product) { ?>
                    <option value="<?php echo $pmap; ?>" selected="selected"><?php echo $pmap; ?></option>
                    <?php } else { ?>
                  <option value="<?php echo $pmap; ?>"><?php echo $pmap; ?></option>
                    <?php } ?>
                    <?php } ?>
              </select>
            </div>
          </div> 
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-ptitle"><?php echo $entry_ptitle; ?></label>
            <div class="col-sm-10">
              <select name="tagmanager_ptitle" id="input-ptitle" class="form-control">
                    <?php 
                      $product_title = array ('name','brand_model');
                      foreach ($product_title as $ptitle) { ?>
                    <?php if ($ptitle == $tagmanager_ptitle) { ?>
                    <option value="<?php echo $ptitle; ?>" selected="selected"><?php echo $ptitle; ?></option>
                    <?php } else { ?>
                  <option value="<?php echo $ptitle; ?>"><?php echo $ptitle; ?></option>
                    <?php } ?>
                    <?php } ?>
              </select>
            </div>
          </div> 
      
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 