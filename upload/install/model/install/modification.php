<?php
class ModelInstallModification extends Model {
	public function addModification($data, $filename, $xml) {
		$db = new DB($data['db_driver'], htmlspecialchars_decode($data['db_hostname']), htmlspecialchars_decode($data['db_username']), htmlspecialchars_decode($data['db_password']), htmlspecialchars_decode($data['db_database']), $data['db_port']);

		$extension_download_id = 0;
		$extension_install_id = 0;

		$sql  = "";
		$sql .= "INSERT INTO `" . $db->escape($data['db_prefix']) . "extension_install` SET";
		$sql .= " `filename` = '" . $db->escape($filename) . "',";
		$sql .= " `extension_download_id` = '" . (int)$extension_download_id . "',";
		$sql .= " `date_added` = NOW()";

		$db->query($sql);

		$extension_install_id = $db->getLastId();

		$sql  = "";
		$sql .= "INSERT INTO `" . $db->escape($data['db_prefix']) . "modification` SET";
		$sql .= " `extension_install_id` = '" . (int)$extension_install_id . "',";
		$sql .= " `name` = '" . $db->escape($xml['name']) . "',";
		$sql .= " `code` = '" . $db->escape($xml['code']) . "',";
		$sql .= " `author` = '" . $db->escape($xml['author']) . "',";
		$sql .= " `version` = '" . $db->escape($xml['version']) . "',";
		$sql .= " `link` = '" . $db->escape($xml['link']) . "',";
		$sql .= " `xml` = '" . $db->escape($xml['xml']) . "',";
		$sql .= " `status` = '" . (int)$xml['status'] . "',";
		$sql .= " `date_added` = NOW()";

		$db->query($sql);
	}
}
