<?php
class Connect
{
    private $servername = "database";
    private $port = "3306";
    private $username = "root";
    private $password = "tiger";
    private $database = "fizook-development-db";
    public $conn;

    function __construct(){
        $this->conn = new PDO("mysql:host=$this->servername;port=$this->port;dbname=$this->database", $this->username, $this->password);
    }

    function disconnect(){
        $conn = null;
    }
}
/* 
$servername = "database";
$port = "3306";
$username = "root";
$password = "tiger";
$database = "rantea-development-db";

try {
    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$database", $username, $password);

    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //echo "Connected successfully";
} catch (PDOException $e) {
    //echo "Connection failed: " . $e->getMessage();
}
 */