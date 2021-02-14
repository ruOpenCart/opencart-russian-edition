<?php
class ControllerExtensionModuleAssemblyConfiguratorAssemblyConfiguratorExtension extends Controller {
	private $errors = [];

	public function index() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_extensions');

		$extensions = $this->checkInstalledExtensions();

		$data = [
			'url_install' => $this->load->controller(
				'extension/module/assembly_configurator/assembly_configurator_general/getFullLink',
				['module' => 'extension/module/assembly_configurator/assembly_configurator_extension/install']
			),
			'url_refresh' => $this->load->controller(
				'extension/module/assembly_configurator/assembly_configurator_general/getFullLink',
				['module' => 'extension/module/assembly_configurator/assembly_configurator_extension/refresh']
			),
			'table' => $this->load->view('extension/module/assembly_configurator/assembly_configurator_extensions_table', ['extensions' => $extensions])
		];

		return $this->load->view('extension/module/assembly_configurator/assembly_configurator_extensions', $data);
	}

	public function refresh() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_extensions');

		$data['extensions'] = $this->checkInstalledExtensions();

		$this->response->setOutput($this->load->view('extension/module/assembly_configurator/assembly_configurator_extensions_table', $data));
	}

	public function install() {
		$this->load->language('extension/module/assembly_configurator/assembly_configurator_extensions');

		if (!$this->user->hasPermission('modify', 'marketplace/install')) {
			$this->errors[] = $this->language->get('error_permission_install');
		}

		if (!$this->errors) {
			$files = $this->request->post['extensions'];
			$extensions = $this->prepareExtensions();

			$this->clear(DIR_UPLOAD);

			foreach ($files as $file) {
				$token = token(10);
				$tmp_file = DIR_UPLOAD . $token . '.tmp';

				// copy($extensions[$file]['file'], $tmp_file);
				if (is_file($extensions[$file]['file'])) {
					$this->load->model('setting/extension');
					$this->load->model('setting/modification');

					$modification = $this->model_setting_modification->getModificationByCode($extensions[$file]['code']);

					$extension_install_id = $modification
						? $modification['extension_install_id']
						: $this->model_setting_extension->addExtensionInstall($file);

					$extension = [
						'modification_id' => $modification ? $modification['modification_id'] : '',
						'extension_install_id' => $extension_install_id,
						'token' => $token,
						'file' => $extensions[$file]['file'],
						'code' => $extensions[$file]['code'],
						'tmp_file' => $tmp_file,
						'tmp_dir' => DIR_UPLOAD . 'tmp-' . $token,
						'xml_file' => DIR_UPLOAD . 'tmp-' . $token . '/install.xml',
					];

					$this->unzip($extension);
					if (!$this->errors) {
						$this->move($extension);

						if (!$this->errors) {
							$this->xml($extension);
						}
					}
				} else {
					$this->errors[] = $this->language->get('error_file_not_found');
				}
			}
		}

		$data = [];
		$errors = count($this->errors);
		if ($errors == 1) {
			$data['status'] = 'error';
			$data['color'] = 'danger';
			$data['text_status'] = $this->language->get('error_status');
			$data['text_message'] = $this->errors[0];
		} elseif ($errors > 1) {
			$data['status'] = 'error';
			$data['color'] = 'danger';
			$data['text_status'] = $this->language->get('error_status');
			$data['text_message'] = $this->language->get('error_message');
			$data['errors'] = $this->errors;
		} else {
			$data['status'] = 'success';
			$data['color'] = 'success';
			$data['text_status'] = $this->language->get('text_success_status');
			$data['text_message'] = $this->language->get('text_success_message');
		}

		$this->response->addHeader('Content-Type: application/json; charset=utf-8');
		$this->response->setOutput(json_encode($data));
	}

	private function clear($dir)
	{
		$includes = new FilesystemIterator($dir);

		foreach ($includes as $include) {
			if(is_dir($include) && !is_link($include)) {
				$this->clear($include);
			} else {
				unlink($include);
			}
		}

		if ($dir !== DIR_UPLOAD) {
			rmdir($dir);
		} else {
			fclose(fopen(DIR_UPLOAD . 'index.html','x'));
		}
	}

	private function unzip($extension) {
		$zip = new ZipArchive();

		if ($zip->open($extension['file'])) {
			$zip->extractTo($extension['tmp_dir']);
			$zip->close();
		} else {
			$this->errors[] = $this->language->get('error_unzip');
		}

		// Remove Zip
//		unlink($extension['tmp_file']);
	}
	private function move($extension) {
		$directory = $extension['tmp_dir'] . '/';

		if (is_dir($directory)) {
			if (is_dir($directory . 'upload/')) {
				$files = [];

				// Get a list of files ready to upload
				$path = [$directory . 'upload/*'];

				while (count($path) != 0) {
					$next = array_shift($path);

					foreach ((array)glob($next) as $file) {
						if (is_dir($file)) {
							$path[] = $file . '/*';
						}

						$files[] = $file;
					}
				}

				// A list of allowed directories to be written to
				$allowed = [
					'admin/controller/extension/',
					'admin/language/',
					'admin/model/extension/',
					'admin/view/image/',
					'admin/view/javascript/',
					'admin/view/stylesheet/',
					'admin/view/template/extension/',
					'catalog/controller/extension/',
					'catalog/language/',
					'catalog/model/extension/',
					'catalog/view/javascript/',
					'catalog/view/theme/',
					'system/config/',
					'system/library/',
					'image/catalog/'
				];

				// First we need to do some checks
				foreach ($files as $file) {
					$destination = str_replace('\\', '/', substr($file, strlen($directory . 'upload/')));

					$safe = false;

					foreach ($allowed as $value) {
						if (strlen($destination) < strlen($value) && substr($value, 0, strlen($destination)) == $destination) {
							$safe = true;

							break;
						}

						if (strlen($destination) > strlen($value) && substr($destination, 0, strlen($value)) == $value) {
							$safe = true;

							break;
						}
					}

					if ($safe) {
						// Check if the copy location exists or not
						if (substr($destination, 0, 5) == 'admin') {
							$destination = DIR_APPLICATION . substr($destination, 6);
						}

						if (substr($destination, 0, 7) == 'catalog') {
							$destination = DIR_CATALOG . substr($destination, 8);
						}

						if (substr($destination, 0, 5) == 'image') {
							$destination = DIR_IMAGE . substr($destination, 6);
						}

						if (substr($destination, 0, 6) == 'system') {
							$destination = DIR_SYSTEM . substr($destination, 7);
						}
					} else {
						$this->errors[] = sprintf($this->language->get('error_allowed'), $destination);

						break;
					}
				}

				if (!$this->errors) {
					$this->load->model('setting/extension');

					foreach ($files as $file) {
						$destination = str_replace('\\', '/', substr($file, strlen($directory . 'upload/')));

						$path = '';

						if (substr($destination, 0, 5) == 'admin') {
							$path = DIR_APPLICATION . substr($destination, 6);
						}

						if (substr($destination, 0, 7) == 'catalog') {
							$path = DIR_CATALOG . substr($destination, 8);
						}

						if (substr($destination, 0, 5) == 'image') {
							$path = DIR_IMAGE . substr($destination, 6);
						}

						if (substr($destination, 0, 6) == 'system') {
							$path = DIR_SYSTEM . substr($destination, 7);
						}

						if (is_dir($file) && !is_dir($path)) {
							if (mkdir($path, 0777)) {
								$this->model_setting_extension->addExtensionPath($extension['extension_install_id'], $destination);
							}
						}

						if (is_file($file)) {
							if (rename($file, $path)) {
								$this->model_setting_extension->addExtensionPath($extension['extension_install_id'], $destination);
							}
						}
					}
				}
			}
		} else {
			$this->errors[] = $this->language->get('error_directory');
		}
	}
	private function xml($extension) {
		$file = $extension['xml_file'];

		if (is_file($file)) {
			$this->load->model('setting/modification');

			// If xml file just put it straight into the DB
			$xml = file_get_contents($file);

			if ($xml) {
				try {
					$dom = new DOMDocument('1.0', 'UTF-8');
					$dom->loadXml($xml);

					$name = $dom->getElementsByTagName('name')->item(0)->nodeValue;
					$code = $dom->getElementsByTagName('code')->item(0)->nodeValue;
					$author = $dom->getElementsByTagName('author')->item(0)->nodeValue;
					$version = $dom->getElementsByTagName('version')->item(0)->nodeValue;
					$link = $dom->getElementsByTagName('link')->item(0)->nodeValue;

					$modification_data = [
						'extension_install_id' => $extension['extension_install_id'],
						'name'                 => $name,
						'code'                 => $code,
						'author'               => $author,
						'version'              => $version,
						'link'                 => $link,
						'xml'                  => $xml,
						'status'               => 1
					];

					if ($extension['code']) {
						$this->model_setting_modification->deleteModification($extension['modification_id']);
					}

					$this->model_setting_modification->addModification($modification_data);
				} catch(Exception $exception) {
					$this->errors[] = sprintf($this->language->get('error_exception'), $exception->getCode(), $exception->getMessage(), $exception->getFile(), $exception->getLine());
				}
			}
		}
	}

	private function prepareExtensions() {
		$files = $this->load->controller(
			'extension/module/assembly_configurator/assembly_configurator_general/getFiles',
			['pattern' => '/.(ocmod).(zip)$/', 'path' => 'ocn/extensions/', 'type' => 'extensions']
		);

		$extensions = [];
		foreach ($files as $name => $path) {
			$zip = new ZipArchive();
			$zip->open($path);
			$xml = simplexml_load_string($zip->getFromName('install.xml'));
			$zip->close();
			$extensions[$name] = [
				'name' => $xml->name,
				'code' => $xml->code,
				'version' => $xml->version,
				'author' => $xml->author,
				'link' => $xml->link,
				'file' => $path,
				'extension_id' => 0,
				'installed' => '',
				'available_installation' => true,
				'available_update' => false,
				'text_status' => $this->language->get('text_available_installation'),
			];
		}

		return $extensions;
	}

	private function checkInstalledExtensions() {
		$this->load->model('setting/modification');

		$files = $this->prepareExtensions();
		foreach ($files as $name => $file) {
			$installed_extension = $this->model_setting_modification->getModificationByCode($file['code']);

			if ($installed_extension) {
				$status_versions = $file['version'] <= $installed_extension['version'];
				$text_status = $status_versions ? 'text_available_installed' : 'text_available_update';

				$files[$name]['extension_id'] = $installed_extension['extension_install_id'];
				$files[$name]['installed'] = $installed_extension['version'];
				$files[$name]['available_installation'] = false;
				$files[$name]['available_update'] = !$status_versions;
				$files[$name]['text_status'] = $this->language->get($text_status);
			}
		}

		return $files;
	}
}
