<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include the database connection
include 'db_connection.php';

// Query to fetch all locations
$sql = "SELECT * FROM locations ORDER BY name ASC";
$result = $conn->query($sql);

// Check if query was successful
if ($result) {
    $locations = [];
    while ($row = $result->fetch_assoc()) {
        $locations[] = $row;
    }
    echo json_encode($locations); // Return locations as JSON
} else {
    echo json_encode(["success" => false, "message" => "Failed to fetch locations.", "error" => $conn->error]);
}

$conn->close();
?>




<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>