<?php
class ControllerModuleFacebookMessage extends Controller {
    private $error = array();
    private $version = '1.0';

    public function index() {
        $this->load->language('module/facebook_message');
        
        $this->document->setTitle($this->language->get('heading_title'));
		
        $this->document->addStyle('view/stylesheet/facebook_message.css');

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('facebook_message', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title') . ' ' . $this->version;
        
        $data['tab_setting'] = $this->language->get('tab_setting');
        $data['tab_localisation'] = $this->language->get('tab_localisation');
        $data['tab_help'] = $this->language->get('tab_help');
        
		$data['legend_localisation'] = $this->language->get('legend_localisation');
		$data['legend_widget'] = $this->language->get('legend_widget');
		$data['legend_display_mode_position'] = $this->language->get('legend_display_mode_position');
		
		$data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_icon'] = $this->language->get('text_icon');
		$data['text_icon_plus_text'] = $this->language->get('text_icon_plus_text');
		$data['text_bottom_left'] = $this->language->get('text_bottom_left');
		$data['text_bottom_right'] = $this->language->get('text_bottom_right');

		$data['entry_status'] = $this->language->get('entry_status');
        $data['entry_app_id'] = $this->language->get('entry_app_id');
        $data['entry_page_url'] = $this->language->get('entry_page_url');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_small_header'] = $this->language->get('entry_small_header');
        $data['entry_display_mode'] = $this->language->get('entry_display_mode');
        $data['entry_display_position'] = $this->language->get('entry_display_position');

        $data['help_app_id'] = $this->language->get('help_app_id');
        $data['help_page_url'] = $this->language->get('help_page_url');
        $data['help_width'] = $this->language->get('help_width');
        $data['help_height'] = $this->language->get('help_height');
        $data['help_localisation_info'] = $this->language->get('help_localisation_info');
        $data['help_localisation'] = $this->language->get('help_localisation');
        $data['help_fb_locale'] = $this->language->get('help_fb_locale');
        $data['help_widget'] = $this->language->get('help_widget');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['app_id'])) {
            $data['error_app_id'] = $this->error['app_id'];
        } else {
            $data['error_app_id'] = '';
        }

        if (isset($this->error['page_url'])) {
            $data['error_page_url'] = $this->error['page_url'];
        } else {
            $data['error_page_url'] = '';
        }

        $this->update_check();

        if (isset($this->error['update'])) {
            $data['update'] = $this->error['update'];
        } else {
            $data['update'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/facebook_message', 'token=' . $this->session->data['token'], 'SSL')
        );

		$data['action'] = $this->url->link('module/facebook_message', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['facebook_message_status'])){
            $data['facebook_message_status'] = $this->request->post['facebook_message_status'];
		} elseif ($this->config->get('facebook_message_status')) {
            $data['facebook_message_status'] = $this->config->get('facebook_message_status');
        } else {
            $data['facebook_message_status'] = '';
        }		
		
        if (isset($this->request->post['facebook_message_app_id'])) {
            $data['facebook_message_app_id'] = $this->request->post['facebook_message_app_id'];
        } elseif ($this->config->get('facebook_message_app_id')) {
            $data['facebook_message_app_id'] = $this->config->get('facebook_message_app_id');
        } else {
            $data['facebook_message_app_id'] = '';
        }

        if (isset($this->request->post['facebook_message_page_url'])) {
            $data['facebook_message_page_url'] = $this->request->post['facebook_message_page_url'];
        } elseif ($this->config->get('facebook_message_page_url')) {
            $data['facebook_message_page_url'] = $this->config->get('facebook_message_page_url');
        } else {
            $data['facebook_message_page_url'] = '';
        }

        if (isset($this->request->post['facebook_message_width'])) {
            $data['facebook_message_width'] = $this->request->post['facebook_message_width'];
        } elseif ($this->config->get('facebook_message_width')) {
            $data['facebook_message_width'] = $this->config->get('facebook_message_width');
        } else {
            $data['facebook_message_width'] = '';
        }

        if (isset($this->request->post['facebook_message_height'])) {
            $data['facebook_message_height'] = $this->request->post['facebook_message_height'];
        } elseif ($this->config->get('facebook_message_height')) {
            $data['facebook_message_height'] = $this->config->get('facebook_message_height');
        } else {
            $data['facebook_message_height'] = '';
        }

        if (isset($this->request->post['facebook_message_small_header'])) {
            $data['facebook_message_small_header'] = $this->request->post['facebook_message_small_header'];
        } elseif ($this->config->get('facebook_message_small_header')) {
            $data['facebook_message_small_header'] = $this->config->get('facebook_message_small_header');
        } else {
            $data['facebook_message_small_header'] = '';
        }
		
        if (isset($this->request->post['facebook_message_display_mode'])) {
            $data['facebook_message_display_mode'] = $this->request->post['facebook_message_display_mode'];
        } elseif ($this->config->get('facebook_message_display_mode')) {
            $data['facebook_message_display_mode'] = $this->config->get('facebook_message_display_mode');
        } else {
            $data['facebook_message_display_mode'] = '';
        }	

        if (isset($this->request->post['facebook_message_display_position'])) {
            $data['facebook_message_display_position'] = $this->request->post['facebook_message_display_position'];
        } elseif ($this->config->get('facebook_message_display_position')) {
            $data['facebook_message_display_position'] = $this->config->get('facebook_message_display_position');
        } else {
            $data['facebook_message_display_position'] = '';
        }		
		
        if (isset($this->request->post['facebook_message_localisation'])) {
            $data['facebook_message_localisation'] = $this->request->post['facebook_message_localisation'];
        } elseif ($this->config->get('facebook_message_localisation')) {
            $data['facebook_message_localisation'] = $this->config->get('facebook_message_localisation');
        } else {
            $data['facebook_message_localisation'] = array(); 
        }		
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/facebook_message.tpl', $data));
    }
    
    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/facebook_message')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (utf8_strlen($this->request->post['facebook_message_app_id']) < 3) {
            $this->error['app_id'] = $this->language->get('error_app_id');
        }

        if (utf8_strlen($this->request->post['facebook_message_page_url']) < 3) {
            $this->error['page_url'] = $this->language->get('error_page_url');
        }

        return !$this->error;
    }

    private function update_check() {
        $data = 'v=' . $this->version . '&ex=41&e=' . $this->config->get('config_email') . '&ocv=' . VERSION;
        $curl = false;

        if (extension_loaded('curl')) {
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            curl_setopt($ch, CURLOPT_URL, 'https://www.oc-extensions.com/api/v1/update_check');
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);
            curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'OCX-Adaptor: curl'));
            curl_setopt($ch, CURLOPT_REFERER, HTTP_CATALOG);

            if (function_exists('gzinflate')) {
                curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
            }

            $result = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            if ($http_code == 200) {
                $result = json_decode($result);

                if ($result) {
                    $curl = true;
                }

                if ( isset($result->version) && ($result->version > $this->version) ) {
                    $this->error['update'] = 'A new version of this extension is available. <a target="_blank" href="' . $result->url . '">Click here</a> to see the Changelog.';
                }
            }
        }

        if (!$curl) {
            if (!$fp = @fsockopen('ssl://www.oc-extensions.com', 443, $errno, $errstr, 20)) {
                return false;
            }

            socket_set_timeout($fp, 20);

            $headers = array();
            $headers[] = "POST /api/v1/update_check HTTP/1.0";
            $headers[] = "Host: www.oc-extensions.com";
            $headers[] = "Referer: " . HTTP_CATALOG;
            $headers[] = "OCX-Adaptor: socket";
            if (function_exists('gzinflate')) {
                $headers[] = "Accept-encoding: gzip";
            }
            $headers[] = "Content-Type: application/x-www-form-urlencoded";
            $headers[] = "Accept: application/json";
            $headers[] = 'Content-Length: '.strlen($data);
            $request = implode("\r\n", $headers)."\r\n\r\n".$data;
            fwrite($fp, $request);
            $response = $http_code = null;
            $in_headers = $at_start = true;
            $gzip = false;

            while (!feof($fp)) {
                $line = fgets($fp, 4096);

                if ($at_start) {
                    $at_start = false;

                    if (!preg_match('/HTTP\/(\\d\\.\\d)\\s*(\\d+)\\s*(.*)/', $line, $m)) {
                        return false;
                    }

                    $http_code = $m[2];
                    continue;
                }

                if ($in_headers) {

                    if (trim($line) == '') {
                        $in_headers = false;
                        continue;
                    }

                    if (!preg_match('/([^:]+):\\s*(.*)/', $line, $m)) {
                        continue;
                    }

                    if ( strtolower(trim($m[1])) == 'content-encoding' && trim($m[2]) == 'gzip') {
                        $gzip = true;
                    }

                    continue;
                }

                $response .= $line;
            }

            fclose($fp);

            if ($http_code == 200) {
                if ($gzip && function_exists('gzinflate')) {
                    $response = substr($response, 10);
                    $response = gzinflate($response);
                }

                $result = json_decode($response);

                if ( isset($result->version) && ($result->version > $this->version) ) {
                    $this->error['update'] = 'A new version of this extension is available. <a target="_blank" href="' . $result->url . '">Click here</a> to see the Changelog.';
                }
            }
        }
    }
}
