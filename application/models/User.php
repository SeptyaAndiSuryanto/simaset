<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Model {
    public function cek_user($username, $password){
        $this->db->where('username', $username);
        $this->db->where('password', md5($password));
        $query = $this->db->get('users');
        return $query->row_array();
        
    }

}

/* End of file User.php */
