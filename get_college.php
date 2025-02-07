<?php
// Include database connection
include 'db_connection.php';

// Check if 'id' parameter is passed via GET request
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $college_id = intval($_GET['id']);  // Sanitize the 'id' parameter to prevent SQL injection

    // Prepare the SQL query to fetch the college details based on the provided 'id'
    $query = "SELECT * FROM colleges WHERE college_id = $college_id";
    
    // Execute the query
    $result = $conn->query($query);

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
} else {
    // If 'id' parameter is not provided in the GET request, return an error message
    echo json_encode(["success" => false, "message" => "Invalid request. College ID is required."]);
}

// Close the database connection
$conn->close();
?>

