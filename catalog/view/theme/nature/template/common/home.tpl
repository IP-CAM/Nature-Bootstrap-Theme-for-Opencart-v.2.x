<?php echo $header; ?>
<?php if(isset($baner)){ echo $baner; } ?>
<div id="home_content" class="container">
	<div class="row">
		<?php if(isset($baner_1)){?>
		<div class="col-sm-4">
			<div class="padded">
				<?php echo $baner_1; ?>
			</div>
		</div>
		<?php } ?>
		<?php if(isset($baner_2)){?>
		<div class="col-sm-4">
			<div class="padded">
				<?php echo $baner_2; ?>
			</div>
		</div>
		<?php } ?>
		<?php if(isset($baner_3)){?>
		<div class="col-sm-4">
			<div class="padded">
				<?php echo $baner_3; ?>
			</div>
		</div>
		<?php } ?>
	</div>
	<div class="row"><?php echo $content_top; ?></div>
	<div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="<?php echo $class; ?>"><?php echo $content_bottom; ?></div>
    <?php echo $column_right; $cnt =1; ?></div>
    <?php foreach ($informations as $information) { ?>
        <?php if($information['information_id'] != '16' and $information['title']!="Сертификаты") { ?>
        <div class="informations_block col-md-4 col-sm-6 col-xs-12 forclick<?php echo $cnt;?>"  style = "">
          <h3><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></h3>
          <div class="info-description">
           <?php echo $information['short_description']; ?><br>
           <a class="inf_read_more" href="<?php echo $information['href']; ?>"><?php echo $read_more; ?></a>
          </div>
        </div>
		<!-- TASK добавляем поведение наведения м нажатия на блок-->
		<style>
			.informations_block:hover{
				cursor:pointer;
			}
		</style>
		<script>
			window.addEventListener("load", function(event) {
				document.querySelector(".forclick<?php echo $cnt;?>").addEventListener('click',()=>{
					window.location.replace('<?php echo $information['href']; ?>');
				});
			});
		</script>
		<?php $cnt++;} ?>
<?php } ?>
</div>
<br>
<a href="http://www.tjanshi.com/produkciya.html" class="feed-items-link" style="font-size: 18px; font-weight: bold;"><span class="glyphicon glyphicon-tree-deciduous"> </span> Весь каталог продукции Тяньши</a>
<br>

<?php 
	echo $footer; 
?>