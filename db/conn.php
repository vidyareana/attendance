<?php
    $host = '127.0.0.1';
    $db = 'attendance_db';
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';

    $dsn = "mysql:host = $host;dbname=$db;charset=$charset";

    try{
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
       // echo "Hello database";
    }catch(PDOException $e){
        throw new Exception($e->getMessage());
        //echo "<h1 class='text-danger'>NO database found</h1>";
    }

    require_once 'crud.php';
    require_once 'user.php';
    $crud = new crud($pdo);
    $user = new user($pdo);

    //$user->insertUser("admin","password");
?>