<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('User');
        
    }

    public function index(){
        $this->load->view('template/header');
        // $this->load->view('template/side_nav');
        // $this->load->view('template/top_nav');
        $this->load->view('login');
        $this->load->view('template/footer');
    }
    

    public function login()
    {
        $this->form_validation->set_rules('username', 'username', 'trim|required');
        $this->form_validation->set_rules('password', 'password', 'trim|required');
        $this->form_validation->set_error_delimiters('<div class="error">', '</div');
        $this->form_validation->set_message('required','Enter %s');

        if ($this->form_validation->run() === FALSE) {
            $this->load->view('login');
            
        } else {
            $data = array(
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')),
            );
        }
        
        $login = $this->User->cek_user('$username', $password);
        if(!empty($login)){
            $row = $login->row(1);
            $data = array(
                'nama' => $row->nama
            );
            $this->session->set_userdata( $login );
            
            redirect('Dashboard','refresh');
            
        }else{
            $this->session->set_flashdata('gagal', 'Username atau Password Salah!');
            redirect(base_url('login'));
            
        }
    }

    public function logout(){
        $this->session->sess_destroy();
    }
}

/* End of file Login.php */
