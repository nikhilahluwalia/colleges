<?php
// Include the database connection
include 'db_connection.php';

// Check if 'id' parameter is provided in the GET or POST request
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $college_id = intval($_GET['id']);  // Sanitize the 'id' to prevent SQL injection

    // Begin transaction to ensure atomic deletion
    $conn->begin_transaction();

    try {
        // Delete from the bookmarks table (optional if you want to remove associated bookmarks)
        $deleteBookmarksQuery = "DELETE FROM bookmarks WHERE college_id = $college_id";
        $conn->query($deleteBookmarksQuery);

        // Delete the college record from the colleges table
        $deleteCollegeQuery = "DELETE FROM colleges WHERE college_id = $college_id";
        $result = $conn->query($deleteCollegeQuery);

        if ($result) {
            // Commit the transaction if both delete operations are successful
            $conn->commit();
            echo json_encode(["success" => true, "message" => "College deleted successfully."]);
        } else {
            // Rollback the transaction if there was an error in deleting the college
            $conn->rollback();
            echo json_encode(["success" => false, "message" => "Failed to delete college."]);
        }
    } catch (Exception $e) {
        // Rollback the transaction in case of any error
        $conn->rollback();
        echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
    }
} else {
    // If the 'id' is not provided in the request
    echo json_encode(["success" => false, "message" => "Invalid request. College ID is required."]);
}

// Close the database connection
$conn->close();
?>

