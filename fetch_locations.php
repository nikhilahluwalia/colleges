<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db_connection.php';

// Run the query and check for errors
$sql = "SELECT * FROM locations ORDER BY name ASC";
$result = $conn->query($sql);

if (!$result) {
    die("SQL Error: " . $conn->error); // ✅ Debugging: Shows SQL error if query fails
}

$locations = [];
while ($row = $result->fetch_assoc()) {
    $locations[] = $row;
}

echo json_encode($locations);
$conn->close();
?>
