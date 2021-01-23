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
    <div id="content" class="<?php echo $class; ?>" style="margin-bottom: 20px;"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
		<?php /*
		<!--
		
      <div class="row c-delivery"> 
        <div class="col-md-6" style="text-align: center; position: relative;"> <br> 

          <h5 style="margin-bottom: 3em ; margin-top: 1em; "> <?php echo $text_country_ru; ?> </h5>
          <div>
            <?php if ($open) { ?>
            <strong><?php echo $text_open_ru; ?></strong><br>
            <?php echo $text_openvalue_ru; ?>
            <?php echo $open; ?><br />
            <br />
            <?php } ?>
            <?php if ($comment) { ?>
            <strong><?php echo $text_comment; ?></strong><br>
            <?php echo $comment; ?>
            <?php } ?>
          </div>
          <div itemscope itemtype="http://schema.org/Organization">
            <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
              <strong><?php echo $text_address; ?>: </strong>
              <span itemprop="postalCode"><?php echo $text_address_postalCode_ru; ?></span>,
              <span itemprop="addressLocality"><?php echo $text_address_town_ru; ?></span>,
              <span itemprop="streetAddress"><?php echo $text_address_street_ru; ?></span>
            </div>
            <h3><?php echo $text_location_ru; ?></h3>
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="itemscope">
                 <strong><?php echo $text_site; ?>: </strong><span itemprop="name"><a href="https://www.tjanshi.com">https://www.tjanshi.com</a> </span></br>
                  <strong><?php echo $text_store_email; ?>: </strong> 
                  <span itemprop="email"><?php echo $store_email; ?></span> <br/>
                  <strong><?php echo $text_telephone; ?>: </strong>
                  <span itemprop="telephone">
                    <a class="contact-phone-number" title="Позвонить" href="tel:<?php echo $text_phone_ru; ?>"><?php echo $text_phone_ru; ?></a>
                  </span><br/>
                  <div class="form-inline">
                    <strong><?php echo $text_soc; ?>: </strong>
                    <a title="WhatsApp" href="whatsapp://send?phone=<?php echo $text_phone_ru; ?>"><img src="image/soc/whatsapp.png" width="50px" height="50px"></a>
                    <a class="hidden-xs" title="Viber" href="viber://chat?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
                    <a class="visible-xs" title="Viber" href="viber://add?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
                    <a title="Telegram" href="tg://resolve?domain=<?php echo $text_phone_ru; ?>"><img src="image/soc/telegram.png" width="50px" height="50px"></a>
                  </div>

                </div>
                <?php if ($geocode) { ?>
                <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                <?php } ?>
              </div>

            </div>
          </div>


          <div style="opacity: 0.2; position: absolute; top: 0px;"> <img src="image/catalog/delivery/Russia.png" width="50%"> </div>
          <p class="scheme"><?php echo $text_scheme_ru; ?></p>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2182.8111710344233!2d37.56794544915815!3d55.7277073561576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b54b999bdc339d%3A0xf196121db163d208!2z0YPQuy4g0KPRgdCw0YfQtdCy0LAsIDIyLCDQnNC-0YHQutCy0LAsIDExOTA0OA!5e0!3m2!1sru!2sru!4v1502179407810" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>

        </div>

        <div class="col-md-6" style="text-align: center; position: relative;"> <br> 

          <h5 style="margin-bottom: 3em; margin-top: 1em;"> <?php echo $text_country_ua; ?></h5>
          <div>
            <?php if ($open) { ?>
            <strong><?php echo $text_open_ua; ?></strong><br>
            <?php echo $text_openvalue_ua; ?>
            <?php echo $open; ?><br />
            <br />
            <?php } ?>
            <?php if ($comment) { ?>
            <strong><?php echo $text_comment; ?></strong><br>
            <?php echo $comment; ?>
            <?php } ?>
          </div>
          <div itemscope itemtype="http://schema.org/Organization">
            <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
              <strong><?php echo $text_address; ?>: </strong>
              <span itemprop="postalCode"><?php echo $text_address_postalCode_ua; ?></span>,
              <span itemprop="addressLocality"><?php echo $text_address_town_ua; ?></span>,
              <span itemprop="streetAddress"><?php echo $text_address_street_ua; ?></span>

            </div>


            <h3><?php echo $text_location_ua; ?></h3>
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="itemscope">
                <strong><?php echo $text_site; ?>: </strong><span itemprop="name"><a href="https://www.tjanshi.com/ua/">https://www.tjanshi.com/ua/</a> </span></br>
                  <strong><?php echo $text_store_email; ?>: </strong> 
                  <span itemprop="email"><?php echo $store_email; ?></span> <br/>
                  <strong><?php echo $text_telephone; ?>: </strong>
                  <span itemprop="telephone">
                    <a class="contact-phone-number" title="Позвонить" href="tel:<?php echo $text_phone_ua; ?>"><?php echo $text_phone_ua; ?></a>
                  </span><br/>
                  <div class="form-inline">
                    <strong><?php echo $text_soc; ?>: </strong>
                    <a title="WhatsApp" href="whatsapp://send?phone=<?php echo $text_phone_ru; ?>"><img src="image/soc/whatsapp.png" width="50px" height="50px"></a>
                    <a class="hidden-xs" title="Viber" href="viber://chat?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
                    <a class="visible-xs" title="Viber" href="viber://add?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
                    <a title="Telegram" href="tg://resolve?domain=<?php echo $text_phone_ru; ?>"><img src="image/soc/telegram.png" width="50px" height="50px"></a>
                  </div>
                </div>
                <?php if ($geocode) { ?>
                <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                <?php } ?>
              </div>
            </div>
          </div>

          <div style="opacity: 0.2; position: absolute; top: 0px;"> <img src="image/catalog/delivery/Ukraine.png" width="50%"> </div>

          <p class="scheme"><?php echo $text_scheme_ua; ?></p>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2538.3870610021145!2d30.48732341598537!3d50.48975357948076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cdfa684ea86d%3A0x1336654668d1889a!2z0L_RgNC-0YHQv9C10LrRgiDQodGC0LXQv9Cw0L3QsCDQkdCw0L3QtNC10YDQuCwgMTPQkiwg0JrQuNGX0LIsINCj0LrRgNCw0LjQvdCwLCAwMjAwMA!5e0!3m2!1sru!2sru!4v1502179612000" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>

        </div>
      </div>

		-->
		*/?>
		
		
		<div class="row row-centered c-delivery"> 
		
			<div class="col-md-12" style="text-align: center; position: relative;"> <br> 

			 
	
			  <div itemscope itemtype="http://schema.org/Organization">
				<div style="display:none;" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
				  <strong><?php echo $text_address; ?>: </strong>
				  <span itemprop="postalCode"><?php echo $text_address_postalCode_ru; ?></span>,
				  <span itemprop="addressLocality"><?php echo $text_address_town_ru; ?></span>,
				  <span itemprop="streetAddress"><?php echo $text_address_street_ru; ?></span>
				</div>
				<h3><?php echo $text_location_ru; ?></h3>
				<div class="panel panel-default">
				  <div class="panel-body">
					<div class="itemscope">
					 <strong><?php echo $text_site; ?>: </strong><span itemprop="name"><a href="https://www.tjanshi.com">https://www.tjanshi.com</a> </span></br>
					  <strong><?php echo $text_store_email; ?>: </strong> 
					  <span itemprop="email"><?php echo $store_email; ?></span> <br/>
					  <strong><?php echo $text_telephone; ?>: </strong>
					  <span itemprop="telephone">
						<a class="contact-phone-number" title="Позвонить" href="tel:<?php echo $text_phone_ru; ?>"><?php echo $text_phone_ru; ?></a>
					  </span><br/>
					  <div class="form-inline">
						<strong><?php echo $text_soc; ?>: </strong>
						<a title="WhatsApp" href="whatsapp://send?phone=<?php echo $text_phone_ru; ?>"><img src="image/soc/whatsapp.png" width="50px" height="50px"></a>
						<a class="hidden-xs" title="Viber" href="viber://chat?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
						<a class="visible-xs" title="Viber" href="viber://add?number=<?php echo $text_phone_ru; ?>"><img src="image/soc/viber.png" width="50px" height="50px"></a>
						<a title="Telegram" href="tg://resolve?domain=<?php echo $text_phone_ru; ?>"><img src="image/soc/telegram.png" width="50px" height="50px"></a>
					  </div>

					</div>
					<?php if ($geocode) { ?>
					<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
					<?php } ?>
				  </div>

				</div>
			  </div>

			</div>

		</div>
		
		
		
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                    <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <!-- <?php if ($location['open']) { ?>-->
                  <strong><?php echo $text_open; ?></strong><br/>
                  <!--<?php echo $location['open']; ?>-->
                  <br />
                  <!--<?php } ?>-->
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>


      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h3><?php echo $text_contact; ?></h3>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php if ($site_key) { ?>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
              <?php if ($error_captcha) { ?>
              <div class="text-danger"><?php echo $error_captcha; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
    </div>


    <?php echo $footer; ?>
