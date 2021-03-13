<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['text_project'] = $this->language->get('text_project');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_project_re'] = $this->language->get('text_project_re');
		$data['text_support_re'] = $this->language->get('text_support_re');

		return $this->load->view('common/footer', $data);
	}
}
