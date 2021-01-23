<!-- 
  Bootstrap docs: https://getbootstrap.com/docs
-->

<style>
   .modal-title{
     font-weight:800;

   }
</style>
<?php
//fix модальное окно для сообщений
?>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">

        <h5 style = "float: left;" class="modal-title" id="exampleModalLabel">Modal title</h5>
        <label style="float:right;margin-right: 30px;">
          <div>
            <label ><input  style = "margin:0px;" id = "dontShowAnymore" type="checkbox" name="dontshowanymore" value="a2"> Не показывать это сообщение</label>
            <button type="button" style="float:right;margin-left:5px;"  class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

      </div>

      <div class="modal-body" style ="font-size: 20px; text-align:center;">
        ...
      </div>
      
      <div class="modal-footer">

        <button type="button" id="example-btnOk" class="btn btn-primary resized-btn" data-dismiss="modal" style="float:left">Продолжить покупки</button>
        <button type="button" id="example-btnCancel"  class="btn btn-orange"><a style = "color:white;" href = "/cart" target ="_blank"> Смотреть корзину</a></button>
      </div>
    </div>
  </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', (event) => {
    //fix добавляем (не показывать модальное окно если выбрана галочка)
     document.querySelector("#dontShowAnymore").addEventListener('change',(e)=>{
        if (e.target.checked){
          let item = {
              expire: new Date().getTime()+24*60*60*1000
          }
          window.localStorage.setItem('showDialog',item);

        }else{
          window.localStorage.removeItem('showDialog');
         }
      }); 
  });
</script>
  
<footer>
  <?php
  $v = 0;
  if (isset($_POST['skidki_page']))
    $v = 1;
  ?>
  <div class="container block-alpha2">

    <div class="row"> 
      <div class="col-sm-5">
      	<ul class="list-inline">
          <?php foreach ($informations as $information) { ?>
              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
            <li><a href="/contact"><?php echo $text_contact; ?></a></li>
        </ul>
        <p><?php echo $text_footer; ?></p>
      </div>
      <div class="col-sm-5">
          <div class="row">
            <div class="col-sm-4 col-xs-4">
              <a href="https://www.tjanshi.com/dostavka.html"><img src="https://www.tjanshi.com/image/catalog/common/free-delivery.png" width="70%"  /></a>
            </div>
            <div class="col-sm-4 col-xs-4">
              <a href="https://www.tjanshi.com/sertifikaty.html"><img src="https://www.tjanshi.com/image/catalog/common/garantiya_icon.png" width="70%"  /></a>
            </div>
            <div class="col-sm-4 col-xs-4">
              <a href="https://www.tjanshi.com/sertifikaty.html"><img src="https://www.tjanshi.com/image/catalog/common/sertificate_icon.png" width="70%"  /></a> 
            </div>  
          </div>
      </div> 
      <div class="col-sm-2">
        <div>
              <div id="scrollup" class="btn btn-default"><span class="glyphicon glyphicon-arrow-up"></span> <?php echo $button_up;?></div>
          </div>
      </div>
    </div>
    
  </div>
  
</footer>
<?php  /* fix_30 */ ?>
<script>
  
<?php  /* fix_30 */ ?>
</script>
<script type="text/javascript" src="catalog/view/theme/nature/js/scrollReveal.js"></script>
<script type="text/javascript">



if ($("#yak_mene_ce_zaibalo").val() == 1)
	$("#pop1").trigger('click');

//alert();
  // The starting defaults.
  var config = {
    after: '0s',
    enter: 'bottom',
    move: '24px',
    over: '0.66s',
    easing: 'ease-in-out',
    viewportFactor: 0.33,
    reset: false,
    init: true
  };
  window.scrollReveal = new scrollReveal( config );
  
  $(document).ready(function() {
    $('.thumbnails').magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {
        enabled:true
      }
    });
  });
</script>


                
<!-- * = * -->
<?php require_once DIR_CONFIG .'ssb_library/ssb_data.php';
$this->ssb_data = ssb_data::getInstance();
$tools = $this->ssb_data->getSetting('tools');
if($tools AND isset($_SESSION["ssb_page_type"])){
  if($tools['qr_code']['status'] OR $tools['soc_buttons']['status']){
    $soc_buttons = $tools['soc_buttons'];
    $qr_code = $tools['qr_code'];
    require_once DIR_CONFIG .'ssb_library/catalog/tools/tool.php';
    $this->tool = tool::getInstance();
    $curPageURL = $this->tool->curPageURL();
    if($tools['qr_code']['status']){
      $qr_image_path = $this->tool->get_qr($curPageURL);
      $qr_image = "<img class='count' src='" . $qr_image_path . "' />";
    }
    include_once DIR_CONFIG .'ssb_library/catalog/tools/panel_bar.tpl';
  }
}
?>
<!-- * = * -->
        

        
</body></html>