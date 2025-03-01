<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure database connection is established

$filters = [];
//$categories = ['courses', 'placement','specialization']; // Budget handled separately
$categories = ['courses', 'placement']; // Budget handled separately

// Fetch budget filters from budget table

$budgetRanges = [
    "0-3" => [0, 300000],
    "3.1-5" => [300001, 500000],
    "5.1-7" => [500001, 700000],
    "7.1-9" => [700001, 900000],
    "9.1-11" => [900001, 1100000],
    "11.1-19" => [1100001, 1900000],
    "19.1-30" => [1900001, 3000000],
    "30+" => [3000000, PHP_INT_MAX]
];
$filters['budget'] = array_keys($budgetRanges); // Send range labels


// 🎯 Predefined Specializtion

// Fetch location filters from 'locations' table
$locationQuery = "SELECT name FROM locations ORDER BY name ASC";
$locationResult = mysqli_query($conn, $locationQuery);
$locationValues = [];

while ($row = mysqli_fetch_assoc($locationResult)) {
    $locationValues[] = $row['name'];
}
$filters['location'] = $locationValues;


// Fetch specialization filters from 'specialization' table/
$specializationQuery = "SELECT name FROM specializations ORDER BY name";
$specializationResult = mysqli_query($conn, $specializationQuery);
$specializationValues = [];

while ($row = mysqli_fetch_assoc($specializationResult)) {
  $specializationValues[] = $row['name'];
}
$filters['specialization'] = $specializationValues;
//echo $filters['specialization'] ;



// Fetch other filters from 'colleges' table
foreach ($categories as $category) {
    $query = "SELECT DISTINCT $category FROM colleges ORDER BY $category";
    $result = mysqli_query($conn, $query);

    $filterValues = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $filterValues[] = $row[$category];
    }
    $filters[$category] = $filterValues;
}

echo json_encode($filters);
?>




<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
