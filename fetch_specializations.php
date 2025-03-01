<?php
include 'db_connection.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

$query = "SELECT name FROM specializations"; 
$result = mysqli_query($conn, $query);

if (!$result) {
    die("SQL Error: " . mysqli_error($conn)); // Show exact SQL error
}

$specializations = [];
while ($row = mysqli_fetch_assoc($result)) {
    $specializations[] = $row;
}

echo json_encode($specializations);
?>
