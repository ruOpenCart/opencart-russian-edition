<?php
class ControllerExtensionModuleAssemblyConfiguratorAssemblyConfiguratorGeneral extends Controller {
	private $user_token;
	private $assembly_configurator;
	private $code = 'ocn__assembly_configurator';

	public function __construct($registry) {
		parent::__construct($registry);

		$this->user_token = $this->session->data['user_token'];

		$this->load->model('setting/modification');
		$this->assembly_configurator = $this->model_setting_modification->getModificationByCode($this->code);
	}

	public function getVersion() {
		return $this->assembly_configurator['version'];
	}

	public function getFiles($params) {
		$source_directory = DIR_STORAGE . $params['path'];
		$directory_files = new FilesystemIterator($source_directory);
		$files = new RegexIterator($directory_files, $params['pattern']);

		$data = [];
		foreach($files as $file) {
			$file_name = $file->getFilename();
			$file_full_path = $source_directory . $file_name;

			if (is_file($file_full_path)) {
				$data[$file_name] = $file_full_path;
			}
		}

		return $data;
	}

	public function getBreadcrumbs($data = []) {
		return [
			[
				'text' => $this->language->get('text_home'),
				'href' => $this->getFullLink(['module' => 'common/dashboard'])
			],
			[
				'text' => $this->language->get('text_extension'),
				'href' => $this->getFullLink([ 'module' => 'marketplace/extension', 'params' => ['type' => 'module']])
			],
			[
				'text' => $this->language->get('heading_title'),
				'href' => $this->getFullLink(['module' => $data['module']])
			]
		];
	}

	public function getFullLink($data = []) {
		$url = '';
		if (isset($data['params'])) {
			foreach ($data['params'] as $key => $value) {
				$url .= '&' . $key . '=' . $value;
			}
		}
		$url .= '&user_token=' . $this->user_token;

		return $this->url->link($data['module'], $url, true);
	}
}
