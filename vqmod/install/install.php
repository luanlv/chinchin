<?php
$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX."product` LIKE 'promo_stamp_on'");
if(!$query->num_rows){
	$this->db->query("ALTER TABLE `".DB_PREFIX."product` ADD `promo_stamp_on` TEXT NOT NULL");
}
$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX."product` LIKE 'promo_stamp'");
if(!$query->num_rows){
	$this->db->query("ALTER TABLE `".DB_PREFIX."product` ADD `promo_stamp` TEXT NOT NULL");
}
$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX."product` LIKE 'promo_txt_stamp_text'");
if(!$query->num_rows){
	$this->db->query("ALTER TABLE `".DB_PREFIX."product` ADD `promo_txt_stamp_text` TEXT NOT NULL");
}
$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX."product` LIKE 'promo_shadow'");
if(!$query->num_rows){
	$this->db->query("ALTER TABLE `".DB_PREFIX."product` ADD `promo_shadow` INT NOT NULL");
}
