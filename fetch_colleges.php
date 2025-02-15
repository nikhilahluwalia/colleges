<?php
include 'db_connection.php';

$conditions = [];
$filter_count = 0;
$valid_filters = ["location", "budget", "courses", "placement", "specialization"];

foreach ($valid_filters as $filter) {
    if (isset($_GET[$filter]) && !empty($_GET[$filter])) {
        $filter_count++;

        $decoded_values = urldecode($_GET[$filter]); 
        $values = explode(',', $decoded_values);

        if ($filter === "location" && in_array("All Locations", $values)) {
            continue; // Ignore location filtering if "All Locations" is selected
        }

        $safe_values = array_map(fn($value) => "'" . $conn->real_escape_string(trim($value)) . "'", $values);

        $conditions[] = "$filter IN (" . implode(',', $safe_values) . ")";
    }
}

$sql = "SELECT * FROM colleges";
if (!empty($conditions)) {
    $sql .= " WHERE " . implode($filter_count > 1 ? " AND " : " OR ", $conditions);
}

$result = $conn->query($sql);
$colleges = $result->num_rows > 0 ? $result->fetch_all(MYSQLI_ASSOC) : [];
echo json_encode($colleges);
$conn->close();
