<?php
class ControllerExtensionModuleAssemblyConfiguratorAssemblyConfiguratorInfo extends Controller {
	private $author_name = 'Hkr';
	private $author_link = 'https://forum.opencart.name/members/hkr.3/';
	private $extension_link = 'https://forum.opencart.name/resources/';

	public function index() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_info');

		$data = [
			'url_extension_link' => $this->extension_link,
			'data_author_name' => $this->author_name,
			'url_author_link' => $this->author_link,
			'data_version' => $this->load->controller('extension/module/assembly_configurator/assembly_configurator_general/getVersion'),
			'data_version_re' => VERSION_RE,
			'data_version_oc' => VERSION,
		];

		return $this->load->view('extension/module/assembly_configurator/assembly_configurator_info', $data);
	}
}
