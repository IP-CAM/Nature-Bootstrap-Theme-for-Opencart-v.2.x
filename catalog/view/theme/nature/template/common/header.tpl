<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>

        <script type="text/javascript">!function(){var t=document.createElement("script");t.type="text/javascript",t.async=!0,t.src="https://vk.com/js/api/openapi.js?168",t.onload=function(){VK.Retargeting.Init("VK-RTRG-739466-2zC8F"),VK.Retargeting.Hit()},document.head.appendChild(t)}();</script><noscript><img src="https://vk.com/rtrg?p=VK-RTRG-739466-2zC8F" style="position:fixed; left:-999px;" alt=""/></noscript>
		
<script type="text/javascript">!function(){var t=document.createElement("script");t.type="text/javascript",t.async=!0,t.src="https://vk.com/js/api/openapi.js?168",t.onload=function(){VK.Retargeting.Init("VK-RTRG-739462-eIQiu"),VK.Retargeting.Hit()},document.head.appendChild(t)}();</script><noscript><img src="https://vk.com/rtrg?p=VK-RTRG-739462-eIQiu" style="position:fixed; left:-999px;" alt=""/></noscript>		



<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="interkassa-verification" content="2358a3204dd24fdb670fda7c038ce9fe" />
<meta name="yandex-verification" content="5ee35434f5d3a2ab" />
<link rel='stylesheet' href='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Tracking/styles/tracking.css' />
<link rel='stylesheet' href='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Map/styles/map.css' />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>


                
<!-- * = * -->
<?php $linkTags = ''; foreach($link as $key => $val){$linkTags .= $key . '="' . $val . '" ';}
?><link <?php echo $linkTags; ?>/>
<!-- * = * -->

            
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<!--<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>-->
<!--<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet" type="text/css" />-->

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<link href="catalog/view/theme/nature/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/nature/stylesheet/tiens.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css">
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>

                
          <!-- * = * -->
          <?php require_once DIR_CONFIG .'ssb_library/ssb_data.php';
          $this->ssb_data = ssb_data::getInstance();
          $tools = $this->ssb_data->getSetting('tools');
          if($tools AND isset($_SESSION["ssb_page_type"])){
          if($tools['qr_code']['status'] OR $tools['soc_buttons']['status']){
          include_once DIR_CONFIG .'ssb_library/catalog/tools/panel_bar_head.tpl';
          }

          if($tools['webm_tool']['data']['google']){
          $google_meta = $tools['webm_tool']['data']['google'];
          if ( strpos( $google_meta, 'content' ) !== false ) {
          preg_match( '/content="([^"]+)"/', htmlspecialchars_decode($google_meta), $match );
          if(isset($match[1])){
          $google_meta = $match[1];
          }
          }
          echo "\n<meta name=\"google-site-verification\" content=\"$google_meta\" />\n";
          }

          if($tools['webm_tool']['data']['bing']){
          $bing_meta = $tools['webm_tool']['data']['bing'];
          if ( strpos( $bing_meta, 'content' ) !== false) {
          preg_match( '/content="([^"]+)"/', htmlspecialchars_decode($bing_meta), $match );
          if(isset($match[1])){
          $bing_meta = $match[1];
          }
          }
          echo "<meta name=\"msvalidate.01\" content=\"$bing_meta\" />\n";
          }

          if($tools['webm_tool']['data']['alexa']){
          $alexaverify = $tools['webm_tool']['data']['alexa'];
          echo "<meta name=\"alexaVerifyID\" content=\"" . htmlspecialchars( $alexaverify, ENT_NOQUOTES, 'UTF-8' ) . "\" />\n";
          }
          }
          ?>
          <!-- * = * -->
		
		
			<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1837630019719837');
  fbq('track', 'PageView');
</script>
<!-- fix_ add  modal message -->
<script>
    function showMessage(afterClose,text,title){
      document.querySelector("#exampleModal .modal-body").innerHTML = text;
      document.querySelector("#exampleModal .modal-title").innerHTML = title;
      document.querySelector("#exampleModal #example-btnOk").innerHTML = "проверить почту";
      document.querySelector("#example-btnCancel > a").innerHTML = "Зарегестрироваться";
      document.querySelector("#example-btnCancel > a").setAttribute('href', '/create-account');
      document.querySelector("#exampleModal #example-btnOk").style.visibility = "hidden";
      //let mail = "<?php echo $themaill;?>".split('@')[1];
     // console.log(mail);      
      $("#exampleModal").on('hidden.bs.modal', ()=>{
        //window.open('http://www.'+mail, '_blank');
        afterClose();
      });
      $("#exampleModal").modal();
    }
 
<?php if($showmodal){ ?>
  
 document.addEventListener('DOMContentLoaded', (event) => {
    $("#example-btnOk").bind("click", function(evt, ui) {
      evt.preventDefault();
    
    });

      document.querySelector("#exampleModal").addEventListener('click',(e)=>{
        if (e.target.id==="exampleModal"){
          window.open(window.location.origin+'/create-account', '_blank');
         // window.location.replace(window.location.origin+'/create-account');
        }
      });

    document.querySelector("#exampleModal #example-btnOk").addEventListener('click',(e)=>{
      let link = "<?php echo $themail;?>".split('@')[1];
      window.open('https://www.'+link,'_blank');
    
    });
    document.querySelector("#exampleModal #example-btnCancel").addEventListener('click',()=>{
    //let link = "<?php echo $themail;?>".split('@')[1];
      window.open('/create-account');
    });
    showMessage(()=>{},'На Ваш @Email отправлен  "КУПОН на СКИДКУ - 30%" <br/><br />Если желаете всегда покупать по <b>СКИДКАМ до - 50%</b> <br /><br />= <a href="/create-account"><b>ЗАРЕГИСТРИРУЙТЕСЬ!</b></a>','системное сообщение');
  });   

<?php } ?>

</script>

<script>
<?php if (!$logged){ ?>
function timeoutMessage(theFunc, messageDelay = 500) {
  let messageTimeoutleave = 0;
  let messageTimeoutStart = 0;
  
  window.addEventListener('load', ()=>{
    messageTimeoutStart = setTimeout(()=>{
      theFunc();

    } , 30000);

    setInterval(()=>{
      theFunc();

    } , 60000);
  });
  window.addEventListener('mouseout' , () => {
      if (messageTimeoutStart) {clearTimeout(messageTimeoutStart);messageTimeoutStart = 0;}
      messageTimeoutleave = setTimeout(() => {
      theFunc();
      }, messageDelay);
  });
  window.addEventListener('mouseover' , () => {
      clearTimeout(messageTimeoutleave);
  });
}

timeoutMessage(funcrrr);
<?php } ?>

</script>        

<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1837630019719837&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
			


</head>
<body class="<?php echo $class; ?>">

<?php /* if((!$show_modal) &&($denymodal != true)){ */?>
<?php if((!$showmodal)&&($denymodal != true)){ ?>
  <div class="modal fade" id="modal-skidki" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
    <button type="button" class="btn btn-default btn-close" data-dismiss="modal">X</button>
      <div class="modal-content">
          <p style = "margin: 0 0 0px;"> <a href="http://www.tjanshi.com/create-account"><img src="image/catalog/slide_reg.jpg" width="100%"></a></p>
      
          <form method="post" action="<?php echo $action; ?>" enctype="multipart/form-data">
            <div class="modal-body clearfix" style = "text-align:center;">
              <div class="form-group col-sm-10">
                <label for="email" class="control-label" style = "color:#ff0000; text-align:center;">Что бы получить СКИДКИ до - 50% -   укажите  Ваш @Еmail</label>
                <input type="email" id = "emailText" class="form-control" name="themail" required>
              </div>
              <div class="col-sm-2">  
                <br>
                <input type="submit" class="btn btn-orange pull-right" />
              </div>  
            </div>  
   
          </form> 
      </div>
    </div>
  </div>
  <script>
    document.addEventListener('DOMContentLoaded', (event) => {
   
      document.querySelector("#modal-skidki").addEventListener('click',(e)=>{
        if (e.target.id==="modal-skidki"){
          //window.location.replace(window.location.origin+'/create-account');
          window.open(window.location.origin+'/create-account', '_blank');
        }
      });

       document.querySelector("#exampleModal").addEventListener('click',(e)=>{
        if (e.target.id==="exampleModal"){
          //window.location.replace(window.location.origin+'/create-account');
          window.open(window.location.origin+'/create-account', '_blank');
        }
      });

    });
  </script>
<?php } ?>

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(43972874, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/43972874" style="position:absolute; left:-9999px;" alt="" /></div></noscript>

<!-- /Yandex.Metrika counter -->
<nav id="top">
  <div class="container">
    <a class="pull-left" href="http://www.tjanshi.com/oplata.html" title="INTERKASSA" target="_blank">
    <img src="https://www.interkassa.com/img/ik_88x31_01.gif" alt="INTERKASSA" /></a>
    <?php if($_SERVER['REQUEST_URI'] != '/checkout'){ ?>
      <?php echo $currency; ?>
    <?php } ?> 
    <?php echo $language; ?>
    <a class="btn btn-link text-stock pull" href="http://www.tjanshi.com/skidki.html" style = "color:red !important">Акция</a>
    <div id="top-links" style="margin: 0px;padding: 0px;" class="nav pull-right">
      <ul class="list-inline">
        <!-- <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm"><?php echo $text_wishlist; ?></span></a></li> -->
<!--      <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm"><?php echo $text_shopping_cart; ?></span></a></li>-->
            <?php /* fix_12 ?>
			<li><a href="/contact" title="<?php echo $text_checkout; ?>"><i class="fa fa-phone" style="font-size:16px;color:black; padding-right: 5px;"></i><i class="fa fa-telegram" style="font-size:16px;color:aqua"></i><span class="hidden-xs hidden-sm"><?php echo $text_checkout; ?></span></a></li>
            <?php  fix_12 */?>
			<?php if ($logged) { ?>
            <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <?php /*<!-- <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li> -->*/?>
			<a class="btn btn-link text-stock pull" style = "margin-bottom: 10px;" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
            <?php /*<!--  <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>-->*/?>
            <?php } ?>
          </ul>
        </li>

      </ul>
    </div>
  </div>
</nav>
<?php include "catalog/view/theme/nature/template/common/info.tpl"; ?>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-1 col-xs-2">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="/"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" width="100%" height="100%"/></a>
          <?php } else { ?>
          <h1><a href="/"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div id="shop-name" class="col-sm-3 col-md-3" style="padding-top: 15px;">
	<?php /* fix_12 */?>
       <? /* <h1><a href="/"><?php echo $name; ?></a></h1>*/?>
	   <a style = "font-size: 18px;text-shadow: 1px 1px 2px rgba(0,0,0,.5);" href="/"><?php echo $name; ?></a>
	<?php /* fix_12 */?>
      </div>
      <div class="col-sm-5 col-md-4 header-panel"><?php echo $search; ?>
      </div>
      <div class="col-sm-3 col-md-offset-1 header-panel"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories || $informations) { ?>
<div id="tiens-menu" class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav width-100">    
        <li><a href="http://www.tjanshi.com/korporaciya-tyanshi.html"><?php echo $tiens; ?></a></li>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div> 
            <a href="<?php echo $category['href']; ?>" class="see-all" style="text-align: center;"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <?php if ($category['category_id'] != 59) { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php if ($informations) { ?>
          <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        <?php } ?>
        <li><a href="https://www.tjanshi.com/zabolevaniya-i-lechenie.html">Профилактика</a></li>
		 <li><a href="https://www.tjanshi.com/otzivy.html">Отзывы</a></li>
        <li><a href="https://www.tjanshi.com/sertifikaty.html"><?php echo $text_sertificates; ?></a></li>
        <li class="navbar-right"><a href="https://www.tjanshi.com/skidki.html" id="menu-discounts"><?php echo $text_discounts; ?></a></li>
      </ul>
    </div><span></span>
  </nav>
  <?php  if ($_SERVER["REQUEST_URI"] == "/" || $_SERVER["REQUEST_URI"] == "/ru/" || $_SERVER["REQUEST_URI"] == "/index.php" || $_SERVER["REQUEST_URI"] == "/ua/") { ?>
    <div id="slideshow-header" class="owl-carousel">
        <div class="item">
        <a href="http://www.tjanshi.com/ozdorovitelnye-pribory.html">
          <img src="image/catalog/ozd-pribori.jpg" alt="" class="img-responsive" />
        </a>
      </div>
      <div class="item">
        <a href="http://www.tjanshi.com/dieticheskie-dobavki.html">
          <img src="image/catalog/banner-bads.jpg" alt="" class="img-responsive" />
        </a>
      </div>
  </div>
    <script type="text/javascript">
	
    $('#slideshow-header').owlCarousel({
      items: 6,
      autoPlay: 5000,
      singleItem: true,
      navigation: true,
      navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
      pagination: true
    });
    </script>
  <?php } ?>  
</div>
<?php } ?>



<!-- Begin of Chaport Live Chat code -->
<script type="text/javascript">
(function(w,d,v3){
w.chaportConfig = {
  appId : '5ffef9f327f3994c3b92fa3e'
};

if(w.chaport)return;v3=w.chaport={};v3._q=[];v3._l={};v3.q=function(){v3._q.push(arguments)};v3.on=function(e,fn){if(!v3._l[e])v3._l[e]=[];v3._l[e].push(fn)};var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://app.chaport.com/javascripts/insert.js';var ss=d.getElementsByTagName('script')[0];ss.parentNode.insertBefore(s,ss)})(window, document);
</script>
<!-- End of Chaport Live Chat code -->