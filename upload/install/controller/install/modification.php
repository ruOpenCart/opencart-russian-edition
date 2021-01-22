<?php
class ControllerInstallModification extends Controller {
	public function index($post) {
		$dir = $_SERVER['DOCUMENT_ROOT'] . '/install/view/modifications/';
		$files = new FilesystemIterator($dir);
		$xmls = new RegexIterator($files, '/.(xml)$/');

		$this->load->model('install/modification');
		foreach($xmls as $xml) {
			$modification = $this->prepareModification($dir . $xml->getFilename());
			$this->model_install_modification->addModification($post, $xml->getFilename(), $modification);
		}
	}

	private function prepareModification($file) {
		$data = [];
		if (is_file($file)) {
			$xml = file_get_contents($file);
			if ($xml) {
				$dom = new DOMDocument('1.0', 'UTF-8');
				$dom->loadXml($xml);
				$data = [
					'name'    => $dom->getElementsByTagName('name')->item(0)->nodeValue,
					'code'    => $dom->getElementsByTagName('code')->item(0)->nodeValue,
					'author'  => $dom->getElementsByTagName('author')->item(0)->nodeValue,
					'version' => $dom->getElementsByTagName('version')->item(0)->nodeValue,
					'link'    => $dom->getElementsByTagName('link')->item(0)->nodeValue,
					'xml'     => $xml,
					'status'  => 1
				];
			}
		}

		return $data;
	}
}