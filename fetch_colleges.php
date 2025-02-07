<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure this file connects to the database

// Retrieve filters from GET parameters
$filters = [];
if (!empty($_GET['location'])) {
    $filters[] = "location = '" . mysqli_real_escape_string($conn, $_GET['location']) . "'";
}
if (!empty($_GET['budget'])) {
    $filters[] = "budget <= " . intval($_GET['budget']);
}
if (!empty($_GET['courses'])) {
    $filters[] = "courses LIKE '%" . mysqli_real_escape_string($conn, $_GET['courses']) . "%'";
}
if (!empty($_GET['placement'])) {
    $filters[] = "placement LIKE '%" . mysqli_real_escape_string($conn, $_GET['placement']) . "%'";
}
if (!empty($_GET['specialization'])) {
    $filters[] = "specialization LIKE '%" . mysqli_real_escape_string($conn, $_GET['specialization']) . "%'";
}
if (!empty($_GET['ranking'])) {
    $filters[] = "ranking <= " . intval($_GET['ranking']);
}
if (!empty($_GET['facilities'])) {
    $filters[] = "facilities LIKE '%" . mysqli_real_escape_string($conn, $_GET['facilities']) . "%'";
}

// Build query
$query = "SELECT * FROM colleges";
if (!empty($filters)) {
    $query .= " WHERE " . implode(" AND ", $filters);
}

$result = mysqli_query($conn, $query);

$colleges = [];
while ($row = mysqli_fetch_assoc($result)) {
    $colleges[] = $row;
}

echo json_encode($colleges);
?>

