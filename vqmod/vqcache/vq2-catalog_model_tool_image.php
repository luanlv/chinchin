<?php
class ModelToolImage extends Model {

	public function gdpromo($image, $promo_stamp_on, $promo_stamp, $promo_txt_stamp_text, $promo_shadow) {
		if($promo_stamp_on == 1){	
			if(!is_dir('image/promo/cache')){
				$structure = 'image/promo/cache/';
				if (!mkdir($structure, 0644, true)) {
					die('<p>mkdir failed<p>');
				}
			} 
			
			$promo_txt_font_size = 14;
			$promo_txt_font_color = "#ffffff";
			
			$ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
			$image = str_replace(HTTP_SERVER, "", $image);
			$image = str_replace(HTTPS_SERVER, "", $image);

			if (($ext == 'jpg') || ($ext == 'jpeg')){
				$target_img  = imagecreatefromjpeg($image); // creating the image
			}elseif($ext == 'png'){
				$target_img  = imagecreatefrompng($image); // creating the image
				imagealphablending($target_img, true);
				imagesavealpha($target_img, true);
			}elseif($ext == 'bmp'){
				$target_img  = imagecreatefrombmp($image); // creating the image
			}elseif($ext == 'gif'){
				$target_img  = imagecreatefromgif($image); // creating the image
			}
			
			
			list($color_r, $color_g, $color_b) = sscanf($promo_txt_font_color, "#%02x%02x%02x");
			
			$promo_txt_stamp_font   = "image/promo/font/tahoma.ttf";
			$promo_txt_grey_color  = imagecolorallocate($target_img, 118, 128, 128); //grey color
			$promo_txt_font_color  = imagecolorallocate($target_img, $color_r, $color_g, $color_b); //red color
			$promo_stamp = @imagecreatefrompng("image/promo/image/$promo_stamp");

			$promo_txt_marge_up = @imagesy($promo_stamp) / 2 + $promo_txt_font_size / 2;
			
			if (!empty($promo_txt_stamp_text)){
			// $promo_txt_stamp_text = wordwrap($promo_txt_stamp_text, true);
			
			if($promo_shadow == 1){
				@imagettftext($promo_stamp, $promo_txt_font_size, 0, 17 - 1, $promo_txt_marge_up + 1, $promo_txt_grey_color, $promo_txt_stamp_font, $promo_txt_stamp_text); // adding shadow
			}
			
			@imagettftext($promo_stamp, $promo_txt_font_size, 0, 17, $promo_txt_marge_up, $promo_txt_font_color, $promo_txt_stamp_font, $promo_txt_stamp_text); // adding the text
			}
			
		
			@imagecopy($target_img, $promo_stamp, (imagesx($target_img) - imagesx($promo_stamp)) * 1, (imagesy($target_img) - imagesy($promo_stamp)) * 0, 0, 0, imagesx($promo_stamp), imagesy($promo_stamp));

			imagepng($target_img, 'image/promo/cache/'.basename($image), 1);

			imagedestroy($target_img);

			return 'image/promo/cache/' . basename($image);
		}
	}
            
	public function resize($filename, $width, $height) {
		if (!is_file(DIR_IMAGE . $filename)) {
			return;
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$old_image = $filename;
		$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

		if (!is_file(DIR_IMAGE . $new_image) || (filectime(DIR_IMAGE . $old_image) > filectime(DIR_IMAGE . $new_image))) {
			$path = '';

			$directories = explode('/', dirname(str_replace('../', '', $new_image)));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

			list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

			if ($width_orig != $width || $height_orig != $height) {
				$image = new Image(DIR_IMAGE . $old_image);
				$image->resize($width, $height);
				$image->save(DIR_IMAGE . $new_image);
			} else {
				copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
			}
		}

		if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {
			return $this->config->get('config_url') . 'image/' . $new_image;
		}
	}
}
