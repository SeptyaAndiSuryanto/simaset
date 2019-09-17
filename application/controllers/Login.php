<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('User');
    }

    public function index(){
        if($this->session->userdata('role') === '1'){
            redirect('Dashboard');
        }elseif($this->session->userdata('role')==='2'){
            $this->load->view('2');
        }else{
            $this->load->view('template/header');
            $this->load->view('login');
            $this->load->view('template/footer');
        }
    }
    

    public function auth(){
        $this->form_validation->set_rules('username', 'username', 'trim|required');
        $this->form_validation->set_rules('password', 'password', 'trim|required');
        
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
                $role = $data['role'];
                $session_data = array(
                    'nik' => $nik,
                    'usernama' => $username,
                    'role' => $role,
                    'logged_in' => TRUE
                );
                $this->session->set_userdata($session_data);
                if($role === '1'){
                    // echo "Welcome ".$session_data['username'].". You're Admin!";
                    redirect('Roles');
                }else{
                    // echo "Welcome ".$session_data['username'];
                    echo "Who are you?";
                }

            }else{
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
        
        redirect('Login','refresh');
        
    }
}

/* End of file Login.php */
