<?php
// Include database connection
include 'db_connection.php';

// Function to fetch all colleges from the database
function fetch_all_colleges($conn) {
    $sql = "SELECT * FROM colleges";
    
    // Execute the query
    $result = $conn->query($sql);
    
    // Initialize an empty array to hold the colleges
    $colleges = [];
    
    // If the query returns any rows, loop through them and store them in the array
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $colleges[] = $row;  // Add the college details to the array
        }
    }
    
    return $colleges;  // Return the array of colleges
}

// Fetch all colleges
$colleges = fetch_all_colleges($conn);

// Return the result as a JSON response
echo json_encode($colleges);

// Close the database connection
$conn->close();
?>

