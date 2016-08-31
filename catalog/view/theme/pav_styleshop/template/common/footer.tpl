<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config'); 
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
  $layoutID = 1 ;
  $helper->loadFooterModules();
?>
 
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
  $ospans = array();
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php } ?>
 
<footer id="footer">

  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array(1=>4,2=>2,3=>2,4=>2,5=>2);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>
  <?php if( count($modules) <=0 ) { ?>
  <div class="footer-top">
    <div class="container">
        <div class="custom">
          <div class="row">
            <?php if ($informations) { ?>
            <div class="col-md-3 col-sm-6 col-xs-12 box">
              <div class="box-heading"><span><?php echo $text_information; ?></span></div>
              <ul class="list-unstyled">
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>

            <div class="col-md-3 col-sm-6 col-xs-12 box">
              <div class="box-heading"><span><?php echo $text_service; ?></span></div>
              <ul class="list-unstyled">
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
              </ul>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 box">
              <div class="box-heading"><span><?php echo $text_extra; ?></span></div>
              <ul class="list-unstyled">
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
              </ul>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 box">
              <div class="box-heading"><span><?php echo $text_account; ?></span></div>
              <ul class="list-unstyled">
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <?php } ?> 

  <?php
    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>3,2=>6,3=>3);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>
  <div class="footer-center">
    <div class="container">
      <div class="row">
        <?php if( $content=$helper->getLangConfig('widget_contact_us') ) {?>
          <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <?php echo $content; ?>
          </div>
        <?php } ?>

        <?php if( $content=$helper->getLangConfig('widget_banner_ft') ) {?>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
          <?php echo $content; ?>
        </div>
        <?php } ?>

        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <?php 
            $module = $helper->renderModule('pavnewsletter'); 
            if (count($module) && !empty($module)) { ?>
              <?php echo $module; ?>
          <?php } ?>
        </div>
      </div>
    </div>      
  </div>

  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

  <div id="powered">
    <div class="container">
      <div id="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Top</a></div>
      <div class="copyright pull-left">
      <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
        <?php echo $helper->getConfig('copyright'); ?>
      <?php } else { ?>
        <?php echo $powered; ?>. 
      <?php } ?>
      Designed by <a href="http://www.pavothemes.com" title="pavothemes - opencart themes clubs">PavoThemes</a>
      </div>  

      <?php if( $content=$helper->getLangConfig('widget_paypal_data') ) {?>
        <div class="paypal pull-right">
          <?php echo $content; ?>
        </div>
      <?php } ?>
    </div>
  </div>

</footer>

<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>

<script type="text/javascript">
  $(document).ready(function() {
    $("li:first-child").addClass('first');
    $("li:last-child").addClass('last');  
    $(".box-product .row:last-child").addClass('last');       
    $("#image-additional a:last-child").addClass('last');
    $(".product-items:last-child").addClass('last');
    $('.product-cols:last-child').addClass('last'); 
    $(".product-cols:first-child").addClass('first');   
    $(".product-grid div[class^='col-']:last-child").addClass('last');
    $(".product-grid .row:last-child").addClass('last');
    $(function(){
      $('#header .links li').last().addClass('last');
      $('.breadcrumb a').last().addClass('last');
      $('.cart tr').eq(0).addClass('first');                                                    
    });               
  });
</script>

</div>
 </section>
 <script language="javascript">
    /*************************
    Phần mềm LiveChat Fanpage Facebook miễn phí
    Verison 2.1 (Update 04-11-2015)
    Tác giả Hoangluyen.com 
    Email: admin@hoangluyen.com
    Download Source: https://hoangluyen.com/livechat-fanpage-facebook/
    *************************/
    var f_chat_vs = "Version 2.1";
    var f_chat_domain =  "https://shopchinchin.com";    
    var f_chat_name = "Hỗ trợ khách hàng";
    var f_chat_star_1 = "Chào bạn!";
    var f_chat_star_2 = "Tôi có thế giúp đỡ gì cho bạn?";
    var f_chat_star_3 = "<a href='javascript:;' onclick='f_bt_start_chat()' id='f_bt_start_chat'>Bắt đầu Chat</a>";
    var f_chat_star_4 = "Chú ý: Bạn phải đăng nhập <a href='http://facebook.com/' target='_blank' rel='nofollow'>Facebook</a> mới có thể trò chuyện.";
    var f_chat_fanpage = "chinchinhoanghai"; /* Đây là địa chỉ Fanpage*/
    var f_chat_background_title = "#3B5998"; /* Lấy mã màu tại đây http://megapixelated.com/tags/ref_colorpicker.asp */
    var f_chat_color_title = "#fff";
    var f_chat_cr_vs = 21; /* Version ID */
    var f_chat_vitri_manhinh = "right:10px;"; /* Right: 10px; hoặc left: 10px; hoặc căn giữa left:45% */    
</script>
<!-- $Chat iCon Font (có thể bỏ) -->
<link rel="stylesheet" href="/livechat/fonts/css/font-awesome.min.css" type="text/css"/>
<!-- $Chat Javascript (không được xóa) -->
<script src="/livechat/chat.js?vs=2.1"></script>
<!-- $Chat HTML (không được xóa) -->
<div id='fb-root'></div>
<a title='Mở hộp Chat' id='chat_f_b_smal' onclick='chat_f_show()' class='chat_f_vt'><i class='fa fa-comments title-f-chat-icon'></i> Chat</a><div id='b-c-facebook' class='chat_f_vt'><div id='chat-f-b' onclick='b_f_chat()' class='chat-f-b'><i class='fa fa-comments title-f-chat-icon'></i><label id="f_chat_name"></label><span id='fb_alert_num'>1</span><div id='t_f_chat'><a href='javascript:;' onclick='chat_f_close()' id='chat_f_close' class='chat-left-5'>x</a></div></div><div id='f-chat-conent' class='f-chat-conent'><script>document.write("<div class='fb-page' data-tabs='messages' data-href='https://www.facebook.com/"+f_chat_fanpage+"' data-width='250' data-height='310' data-small-header='true' data-adapt-container-width='true' data-hide-cover='true' data-show-facepile='false' data-show-posts='true'></div>");</script><div id='fb_chat_start'><div id='f_enter_1' class='msg_b fb_hide'></div><div id='f_enter_2' class='msg_b fb_hide'></div><br/><p id='f_enter_3' class='fb_hide' align='center'><a href='javascript:;' onclick='f_bt_start_chat()' id='f_bt_start_chat'>Bắt đầu Chat</a></p><br/><p id='f_enter_4' class='fb_hide' align='center'></p></div><div id="f_chat_source" class='chat-single'></div></div></div>
<!-- #CHAT -->

</body></html>
