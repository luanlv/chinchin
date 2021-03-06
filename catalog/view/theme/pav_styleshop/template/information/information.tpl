<?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
<?php echo $header; ?>
<?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>

<div class="container">
    <div class="row">
    	<?php if( $SPAN[0] ): ?>
		<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
			<?php echo $column_left; ?>
		</aside>	
		<?php endif; ?> 
  
	    <section id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>">
	    	<div id="content">
	    		<?php echo $content_top; ?>
		      	<h1><?php echo $heading_title; ?></h1>
		      	<div class="wrapper">
					<?php echo $description; ?>
				</div>
				<div class="buttons">
					<div class="right">
						<a href="<?php echo $continue; ?>" class="button btn btn-theme-default">
							<?php echo $button_continue; ?>
						</a>
					</div>
				</div>
		      	<?php echo $content_bottom; ?>
	      	</div>
	    </section> 

		<?php if( $SPAN[2] ): ?>
			<aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">	
				<?php echo $column_right; ?>
			</aside>
		<?php endif; ?>

	</div>
</div>
<?php echo $footer; ?> 