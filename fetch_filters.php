<?php
header('Content-Type: application/json');
require 'db_connection.php';  // Ensure database connection is established

// Fetch unique filter categories (location, budget, etc.)
$filters = [];

$categories = ['location', 'budget', 'courses', 'placement', 'specialization']; // Add more categories as needed

foreach ($categories as $category) {
    $query = "SELECT DISTINCT $category FROM colleges";
    $result = mysqli_query($conn, $query);
    $filterValues = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $filterValues[] = $row[$category];
    }

    $filters[$category] = $filterValues;
}

echo json_encode($filters);
?>

