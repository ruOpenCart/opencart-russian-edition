<?php
class ControllerExtensionModuleAssemblyConfiguratorAssemblyConfiguratorModification extends Controller {
	private $dir_modifications = DIR_STORAGE . 'ocn/modifications/';

	public function index() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_modifications');

		$modifications = $this->prepareModifications();

		$data = [
			'url_install' => $this->load->controller(
				'extension/module/assembly_configurator/assembly_configurator_general/getFullLink',
				['module' => 'extension/module/assembly_configurator/assembly_configurator_modification/install']
			),
			'url_refresh' => $this->load->controller(
				'extension/module/assembly_configurator/assembly_configurator_general/getFullLink',
				['module' => 'extension/module/assembly_configurator/assembly_configurator_modification/refresh']
			),
			'table' => $this->load->view('extension/module/assembly_configurator/assembly_configurator_modifications_table', ['modifications' => $modifications])
		];

		return $this->load->view('extension/module/assembly_configurator/assembly_configurator_modifications', $data);
	}

	public function refresh() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_modifications');

		$data['modifications'] = $this->prepareModifications();

		$this->response->setOutput($this->load->view('extension/module/assembly_configurator/assembly_configurator_modifications_table', $data));
	}

	public function install() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_modifications');

		$this->load->model('setting/modification');

		$files = $this->request->post['modifications'];
		$modifications = $this->prepareModifications();

		foreach($files as $file) {
			$file_full_path = $this->dir_modifications . $file;
			$modification_id = $modifications[$file]['modification_id'];

			if (is_file($file_full_path)) {
				$modification = [
					'extension_install_id' => 0,
					'name' => $modifications[$file]['name'],
					'code' => $modifications[$file]['code'],
					'author' => $modifications[$file]['author'],
					'version' => $modifications[$file]['version'],
					'link' => $modifications[$file]['link'],
					'xml' => $modifications[$file]['xml'],
					'status' => 1
				];

				if ($modifications[$file]['available_update'] && $modification_id) {
					$this->model_setting_modification->deleteModification($modification_id);
					$modification['modification_id'] = $modification_id;
				}

				$this->model_setting_modification->addModification($modification);
			}
		}

		$data['status'] = 'success';
		$data['color'] = 'success';
		$data['text_status'] = $this->language->get('text_success_status');
		$data['text_message'] = $this->language->get('text_success_message');

		$this->response->addHeader('Content-Type: application/json; charset=utf-8');
		$this->response->setOutput(json_encode($data));
	}

	private function prepareModifications() {
		$this->load->model('setting/modification');
		$xml_columns = ['name', 'code', 'author', 'version', 'link'];
		$files = $this->load->controller(
			'extension/module/assembly_configurator/assembly_configurator_general/getFiles',
			['pattern' => '/.(xml)$/', 'path' => 'ocn/modifications/', 'type' => 'modifications']
		);

		$modifications = [];
		foreach($files as $file_name => $path) {
			$xml = file_get_contents($path);

			if ($xml) {
				$dom = new DOMDocument('1.0', 'UTF-8');
				$dom->loadXml($xml);

				$xml_data = [];
				foreach ($xml_columns as $xml_column) {
					$xml_data[$xml_column] = $dom->getElementsByTagName($xml_column)->item(0)->nodeValue;
				}

				$modifications[$file_name] = [
					'name'                   => $xml_data['name'],
					'code'                   => $xml_data['code'],
					'author'                 => $xml_data['author'],
					'version'                => $xml_data['version'],
					'link'                   => $xml_data['link'],
					'xml'                    => $xml,
					'status'                 => 1,
					'modification_id'        => 0,
					'installed'              => '',
					'available_installation' => true,
					'available_update'       => false,
					'text_status'            => $this->language->get('text_available_installation'),
				];

				$installed_modification = $this->model_setting_modification->getModificationByCode($dom->getElementsByTagName('code')->item(0)->nodeValue);

				if ($installed_modification) {
					$status_versions = $xml_data['version'] <= $installed_modification['version'];
					$text_status = $status_versions ? 'text_available_installed' : 'text_available_update';

					$modifications[$file_name]['modification_id'] = $installed_modification['modification_id'];
					$modifications[$file_name]['installed'] = $installed_modification['version'];
					$modifications[$file_name]['available_installation'] = false;
					$modifications[$file_name]['available_update'] = !$status_versions;
					$modifications[$file_name]['text_status'] = $this->language->get($text_status);
				}
			}
		}

		return $modifications;
	}
}
