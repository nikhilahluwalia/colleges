<?php
// Include database connection
include 'db_connection.php';


//echo $_GET['college_id'];

// Check if 'college_id' parameter is passed via GET request
if (isset($_GET['college_id']) && !empty($_GET['college_id'])) {
    $college_id = intval($_GET['college_id']);  // Sanitize input

    // Prepare the SQL query to fetch the college details
    $stmt = $conn->prepare("SELECT college_id, name, university, location, specialization, budget, admission_process, courses, placement, placement_details, ranking, facilities, usp, college_pdf FROM colleges WHERE college_id = ?");
    //echo $stmt;
    $stmt->bind_param("i", $college_id);
    $stmt->execute();
    $result = $stmt->get_result();
    //var_dump($result);

    // Check if the query returns any results
    if ($result->num_rows > 0) {
        // Fetch the result as an associative array
        $college = $result->fetch_assoc();
        
        // Return the college details as JSON response
        echo json_encode($college);
    } else {
        // If no college is found, return an error message
        echo json_encode(["success" => false, "message" => "College not found"]);
    }

    $stmt->close();
} else {
    // If 'college_id' parameter is not provided, return an error message
    echo json_encode(["success" => false, "message" => "Invalid request. College ID is required."]);
}

// Close the database connection
$conn->close();
?>
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>




<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
