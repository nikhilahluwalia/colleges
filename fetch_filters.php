<?php
require 'db_connection.php'; // Ensure database connection is established
header('Content-Type: application/json');

//var_dump($_GET);

$filters = [
    "location" => [],
    "budget" => [],
    "courses" => [],
    "specialization" => [],
    "placement" => []
];

// **🔹 Process Selected Filters for Dynamic Queries**

$conditions = [];


foreach ($_GET as $key => $value) {
	$values = explode("|", $value);
	$escapedValues = array_map(fn($v) => "'" . $conn->real_escape_string(trim($v)) . "'", $values);
	//$conditions[$key] = "(" . implode(", ", $escapedValues) . ")";
	$conditions[$key] = "$key IN (" . implode(", ", $escapedValues) . ")";
	}	

$whereClause = !empty($conditions) ? " WHERE " . implode(" AND ", $conditions) : "";
//echo "<br/>";
//echo $whereClause;


// Fetch location filters from 'locations' table
$locationQuery = "SELECT DISTINCT name FROM locations";
if (!empty($whereClause)) {
	$locationQuery = "SELECT DISTINCT l.name FROM locations l JOIN colleges c ON FIND_IN_SET(l.name, c.location) > 0 $whereClause ORDER BY l.name ASC";
}
//echo "<br/>";
//echo $locationQuery;
$result = $conn->query($locationQuery);
while ($row = $result->fetch_assoc()) {
    $filters["location"][] = $row["name"];
}


// Fetch specialization filters from 'specialization' table/
$specializationQuery = "SELECT DISTINCT name FROM specializations";
if (!empty($whereClause)) {
	$specializationQuery = "SELECT DISTINCT s.name from specializations s JOIN colleges c ON FIND_IN_SET(s.name, c.specialization) > 0 $whereClause ORDER BY s.name ASC";
}

//echo "<br/>";
//echo $specializationQuery;
$result = $conn->query($specializationQuery);
while ($row = $result->fetch_assoc()) {
    $filters["specialization"][] = $row["name"];
}
//echo $filters['specialization'] ;

$budgetQuery = "SELECT DISTINCT value FROM budget";
//echo $budgetQuery;
$result = $conn->query($budgetQuery);
while ($row = $result->fetch_assoc()) {
    $filters["budget"][] = $row["value"];
}

// **🔹 Fetch Courses Based on Selected Filters**
$coursesQuery = "SELECT DISTINCT courses FROM colleges $whereClause";
$result = $conn->query($coursesQuery);
while ($row = $result->fetch_assoc()) {
    $filters["courses"][] = $row["courses"];
}

// **🔹 Fetch Placement Based on Selected Filters**
$placementQuery = "SELECT DISTINCT placement FROM colleges $whereClause";
$result = $conn->query($placementQuery);
while ($row = $result->fetch_assoc()) {
    $filters["placement"][] = $row["placement"];
}

//echo "<br/>";
//var_dump($filters);
echo json_encode($filters);
?>




<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
