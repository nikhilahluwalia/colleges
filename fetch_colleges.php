<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure database connection

$filters = [];


// 🌍 Handle location filtering
//if (!empty($_GET['location'])) {
  //  $location = mysqli_real_escape_string($conn, $_GET['location']);
   // $filters[] = "location = '$location'";
//}

// 🧩 Handle other filters similarly...
//for displaying colleges
foreach ($_GET as $key => $value) {
	//Cover the OR values into array
	$values = explode("|", $value);
	//handling for budget
	if ($key === "budget") {
		$budgetConditions = [];
		foreach ($values as $budgetRange) {
			$rangeParts = explode("-", $budgetRange);
			if (count($rangeParts) === 2) {
				$minBudget = floatval(trim($rangeParts[0])) * 100000; // Convert lakhs to full amount
            			$maxBudget = floatval(trim($rangeParts[1])) * 100000;
            			$budgetConditions[] = "(budget BETWEEN $minBudget AND $maxBudget)";
        		}
    		}
		if (!empty($budgetConditions)) {
        		$filters[] = "(" . implode(" OR ", $budgetConditions) . ")";
    		}
	
	// handling for specializtion 
	} elseif ($key === "specialization") {
        	// Handle specialization filtering using LIKE
        	$specializationConditions = [];
        	foreach ($values as $specialization) {
            		$escapedSpecialization = $conn->real_escape_string(trim($specialization));
            		$specializationConditions[] = "specialization LIKE '%$escapedSpecialization%'";
        	}
        	if (!empty($specializationConditions)) {
            		$filters[] = "(" . implode(" OR ", $specializationConditions) . ")";
        	}
	} else {
		$escapedValues = array_map(fn($v) => "'" . trim($conn->real_escape_string($v)) . "'", $values);
		$filters[] = "$key IN (" . implode(", ", $escapedValues) . ")";
	}
}

// 📝 Build the final SQL query
$query = "SELECT * FROM colleges";
if (!empty($filters)) {
    $query .= " WHERE " . implode(" AND ", $filters);
}

// Debugging: Output the generated query
//echo json_encode(["debug_query" => $query]);
//exit; // Stop script execution to only return query for debugging


$result = $conn->query($query);

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
