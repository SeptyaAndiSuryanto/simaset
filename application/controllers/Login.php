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
    

    public function auth(){
        $this->form_validation->set_rules('username', 'username', 'trim|required|min_length[5]|max_length[20]');
        $this->form_validation->set_rules('password', 'password', 'trim|required|min_length[5]|max_length[50]');
        
        if ($this->form_validation->run() == FALSE) {
            
            redirect('Login','refresh');
            
        } else {
            $username = $this->input->post('username',TRUE);
            $password = md5($this->input->post('password',TRUE));
            $validate = $this->User->cek_user($username,$password);
            if($validate->num_rows()>0){
                $data = $validate->row_array();
                $nik = $data['nik'];
                $username = $data['username'];
                $session_data = array(
                    'nik' => $nik,
                    'usernama' => $username,
                    'logged_in' => TRUE
                );
                $this->session->set_userdata($session_data);
            }
            else{
                echo $this->session->set_flashdata('msg1','
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Username or password is incorrect.
              </div>
              ');
            redirect('Login','refresh');
            }
        }
        
        
    }

    public function logout(){
        $this->session->sess_destroy();
    }
}

/* End of file Login.php */
