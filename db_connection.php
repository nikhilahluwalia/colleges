<?php
$servername = "localhost";
$username = "root";  
$password = "Asdf@1234";  
$dbname = "college_directory";  // If you named your DB something else, update this

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>


<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>