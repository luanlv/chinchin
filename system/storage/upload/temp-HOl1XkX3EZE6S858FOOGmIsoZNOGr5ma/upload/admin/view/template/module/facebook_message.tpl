<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-fbm" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
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
	<div id="total-recovered"></div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fbm" class="form-horizontal">
			<ul class="nav nav-tabs" id="tabs">
				<li class="active"><a href="#tab-setting" data-toggle="tab"><i class="fa fa-fw fa-cogs"></i> <?php echo $tab_setting; ?></a></li>
				<li><a href="#tab-localisation" data-toggle="tab"><i class="fa fa-fw fa-language"></i> <?php echo $tab_localisation; ?></a></li>
				<li><a href="#tab-help" data-toggle="tab"><i class="fa fa-fw fa-question-circle"></i> <?php echo $tab_help; ?></a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="tab-setting"> 
					<fieldset>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status;?></label>
							<div class="col-sm-10">
								<select name="facebook_message_status" id="input-status" class="form-control">
									<?php if ($facebook_message_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>											
					</fieldset>	

					<fieldset>
						<legend class="small text-center"></legend>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-app-id"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_app_id; ?>"><?php echo $entry_app_id;?></span></label>
								<div class="col-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-key"></i></span>	
										<input type="text" name="facebook_message_app_id" placeholder="<?php echo $entry_app_id; ?>" id="input-app-id" value="<?php echo $facebook_message_app_id; ?>" class="form-control" />
									</div>
									<?php if ($error_app_id) { ?>
									<div class="text-danger"><?php echo $error_app_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-page-url"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_page_url; ?>"><?php echo $entry_page_url;?></span></label>
								<div class="col-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-link"></i></span>	
										<input type="text" name="facebook_message_page_url" placeholder="<?php echo $entry_page_url; ?>" id="input-page-url" value="<?php echo $facebook_message_page_url; ?>" class="form-control" />
									</div>
									<?php if ($error_page_url) { ?>
									<div class="text-danger"><?php echo $error_page_url; ?></div>
									<?php } ?>
								</div>
							</div>							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-width"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_width; ?>"><?php echo $entry_width;?></span></label>
								<div class="col-sm-10">
									<div class="input-group">	
										<input type="text" name="facebook_message_width" placeholder="<?php echo $entry_width; ?>" id="input-width" value="<?php echo $facebook_message_width; ?>" class="form-control" />
										<span class="input-group-addon">px</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-height"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_height; ?>"><?php echo $entry_height;?></span></label>
								<div class="col-sm-10">
									<div class="input-group">	
										<input type="text" name="facebook_message_height" placeholder="<?php echo $entry_height; ?>" id="input-height" value="<?php echo $facebook_message_height; ?>" class="form-control" />
										<span class="input-group-addon">px</span>
									</div>
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-small-header"><?php echo $entry_small_header;?></label>
								<div class="col-sm-10">
									<select name="facebook_message_small_header" id="input-small-header" class="form-control">
										<?php if ($facebook_message_small_header) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>							
					</fieldset>	

					<fieldset>
						<legend class="small text-center"><?php echo $legend_display_mode_position; ?></legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display-mode"><?php echo $entry_display_mode;?></label>
							<div class="col-sm-10">
								<select name="facebook_message_display_mode" id="input-display-mode" class="form-control">
									<?php if ($facebook_message_display_mode == 'default') { ?>
									<option value="default" selected="selected"><?php echo $text_default; ?></option>
									<option value="icon"><?php echo $text_icon; ?></option>					
									<?php } else { ?>
									<option value="default"><?php echo $text_default; ?></option>
									<option value="icon" selected="selected"><?php echo $text_icon; ?></option>										
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display-position"><?php echo $entry_display_position;?></label>
							<div class="col-sm-10">
								<select name="facebook_message_display_position" id="input-display-position" class="form-control">
									<?php if ($facebook_message_display_position == 'bottom-left') { ?>
									<option value="bottom-left" selected="selected"><?php echo $text_bottom_left; ?></option>
									<option value="bottom-right"><?php echo $text_bottom_right; ?></option>
									<?php } else { ?>
									<option value="bottom-left"><?php echo $text_bottom_left; ?></option>
									<option value="bottom-right" selected="selected"><?php echo $text_bottom_right; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</fieldset>	
				</div>								

				<div class="tab-pane" id="tab-localisation">
					<div class="tab-content">				
						<fieldset>
							<legend class="small text-center"><?php echo $legend_localisation; ?></legend>
							
							<div class="alert alert-info"><i class="fa fa-fw fa-info-circle"></i> <?php echo $help_localisation_info; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
							
							<?php foreach ($languages as $language) { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-localisation-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_localisation; ?>"><?php echo $language['name']; ?></span></label>
								<div class="col-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="facebook_message_localisation[<?php echo $language['language_id']; ?>][localisation]" placeholder="<?php echo $help_fb_locale; ?>" id="input-localisation-<?php echo $language['language_id']; ?>" value="<?php echo isset($facebook_message_localisation[$language['language_id']]['localisation']) ? $facebook_message_localisation[$language['language_id']]['localisation'] : ''; ?>" class="form-control" />
									</div>
								</div>
							</div>		
							<?php } ?>
						</fieldset>	
						<fieldset>
							<legend class="small text-center"><?php echo $legend_widget; ?></legend>
							<?php foreach ($languages as $language) { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-widget-<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></label>
								<div class="col-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="facebook_message_localisation[<?php echo $language['language_id']; ?>][widget_text]" placeholder="<?php echo $help_widget; ?>" id="input-widget-<?php echo $language['language_id']; ?>" value="<?php echo isset($facebook_message_localisation[$language['language_id']]['widget_text']) ? $facebook_message_localisation[$language['language_id']]['widget_text'] : ''; ?>" class="form-control" />
									</div>
								</div>
							</div>		
							<?php } ?>
						</fieldset>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-help">
					<div class="tab-content">
						Change Log and HELP Guide is available: <a href="http://www.oc-extensions.com/Facebook-Message-Opencart-2.x" target="blank">HERE</a><br /><br />
						If you need support email us at <strong>support@oc-extensions.com</strong> (Please first read help guide) 				
					</div>
				</div>				
			</div>
		</form>	
    </div>
  </div>
</div>
<?php echo $footer; ?>