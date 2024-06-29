<?php
    include_once('config_admin.php');
    session_start();
    if (!isset($_SESSION["isLoggedIn"]) || $_SESSION["isLoggedIn"] !== true) {
       header("location:admin_login.php");
       exit();
    }

    $_isAdminAccount = true;
    include_once($level_config_layout . 'layout.php');
?>