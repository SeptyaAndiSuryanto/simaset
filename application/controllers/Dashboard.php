<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function index()
    {
        $this->load->view('template/header');
        $this->load->view('template/side_nav');
        $this->load->view('template/top_nav');
        $this->load->view('template/content');
        $this->load->view('template/footer');
    }

}

/* End of file Controllername.php */
