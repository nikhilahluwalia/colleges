<?php
// Include database connection
include 'db_connection.php';

// Function to fetch all colleges with their details (including PDF and Specialization)
function fetch_all_colleges($conn) {
    $sql = "SELECT college_id, name, university, location, specialization, budget, admission_process, courses, placement, placement_details, ranking, facilities, usp, college_pdf FROM colleges ORDER BY name";
    //echo "sql.$sql";
    $result = $conn->query($sql);
    //echo "result=.$result";
    $colleges = [];

    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // If a PDF exists, prepend the path to make it accessible
            $row['college_pdf'] = !empty($row['college_pdf']) ? $row['college_pdf'] : null;
            
            // Convert specialization string to an array for better handling
            $row['specialization'] = !empty($row['specialization']) ? explode(",", $row['specialization']) : [];
            
            $colleges[] = $row;
        }
    } else {
        error_log("No colleges found or query failed: " . $conn->error);
    }

    return $colleges;
    //echo $colleges;
}

// Fetch colleges and return as JSON
echo json_encode(fetch_all_colleges($conn));

// Close the database connection
$conn->close();
?>
