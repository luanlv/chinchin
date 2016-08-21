<?php
class ControllerModuleFacebookMessage extends Controller {
	public function index() {
		$data['store_name'] = $this->config->get('config_name');
		$data['fb_app_id'] = $this->config->get('facebook_message_app_id');
		$data['fb_page_url'] = $this->config->get('facebook_message_page_url');
		$data['width'] = $this->config->get('facebook_message_width') ? $this->config->get('facebook_message_width') : 280;
		$data['height'] = $this->config->get('facebook_message_height') ? $this->config->get('facebook_message_height') : 300;
		$data['small_header'] = $this->config->get('facebook_message_small_header') ? 'true' : 'false';
		$data['display_mode'] = $this->config->get('facebook_message_display_mode');
		$data['display_position'] = $this->config->get('facebook_message_display_position');
		
		$localisation = $this->config->get('facebook_message_localisation');
		
		// Set Facebook API language
		if (isset($localisation[$this->config->get('config_language_id')]['localisation'])) {
			$data['fb_locale'] = $localisation[$this->config->get('config_language_id')]['localisation'];
		} else {
			$data['fb_locale'] = 'en_US';
		}
		
		// Set Widget text
		if (isset($localisation[$this->config->get('config_language_id')]['widget_text'])) {
			$data['widget_text'] = $localisation[$this->config->get('config_language_id')]['widget_text'];
		} else {
			$data['widget_text'] = '';
		}		
		
		// add later animation as option
		//$data['animation'] = $this->config->get('facebook_message_display_animation');
		
		if ($this->config->get('facebook_message_status')) {		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/facebook_message.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/facebook_message.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/facebook_message.tpl', $data));
			}
		}
	}	 
}
?>