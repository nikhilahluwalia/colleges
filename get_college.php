<?php
// Include database connection
include 'db_connection.php';

// Check if 'college_id' parameter is passed via GET request
if (isset($_GET['college_id']) && !empty($_GET['college_id'])) {
    $college_id = intval($_GET['college_id']);  // Sanitize input

    // Prepare the SQL query to fetch the college details
    $stmt = $conn->prepare("SELECT * FROM colleges WHERE college_id = ?");
    $stmt->bind_param("i", $college_id);
    $stmt->execute();
    $result = $stmt->get_result();

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
