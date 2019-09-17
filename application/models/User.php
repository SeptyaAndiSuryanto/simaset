<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Model {
    public function cek_user($username, $password){
        $this->db->where('username', $username);
        $this->db->where('password', $password);
        $result = $this->db->get('user',1);
        return $result;
        
    }

}

/* End of file User.php */
