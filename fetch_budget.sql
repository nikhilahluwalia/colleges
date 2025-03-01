<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db_connection.php';

// Run the query and check for errors
$sql = "SELECT * FROM budget ORDER BY budget";
$result = $conn->query($sql);

if (!$result) {
    die("SQL Error: " . $conn->error); // ✅ Debugging: Shows SQL error if query fails
}

$budget = [];
while ($row = $result->fetch_assoc()) {
    $budget[] = $row;
}

echo json_encode($budget);
$conn->close();
?>
