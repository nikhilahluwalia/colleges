<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure database connection

$conditions = [];

// 📝 Handle budget range filtering
if (!empty($_GET['budget'])) {
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

    $selectedRange = $_GET['budget'];
    if (isset($budgetRanges[$selectedRange])) {
        [$minBudget, $maxBudget] = $budgetRanges[$selectedRange];
        $conditions[] = "budget BETWEEN $minBudget AND $maxBudget";
    }
}

// 🌍 Handle location filtering
if (!empty($_GET['location'])) {
    $location = mysqli_real_escape_string($conn, $_GET['location']);
    $conditions[] = "location = '$location'";
}

// 🧩 Handle other filters similarly...

// 📝 Build the final SQL query
$sql = "SELECT * FROM colleges";
if (!empty($conditions)) {
    $sql .= " WHERE " . implode(" AND ", $conditions);
}

$result = $conn->query($sql);

$colleges = [];
while ($row = $result->fetch_assoc()) {
    $colleges[] = $row;
}

echo json_encode($colleges);
$conn->close();
?>




<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>