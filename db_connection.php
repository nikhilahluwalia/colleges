<?php
// Database connection settings
$servername = "localhost"; // Usually 'localhost'
$username = "root"; // Your MySQL username
$password = "Asdf@1234"; // Your MySQL password
$dbname = "college_directory"; // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    //echo "Connection was successful";
    // You can now use $conn to run queries
}
?>

