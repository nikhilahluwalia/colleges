<?php
// Include the database connection
include 'db_connection.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');

// Check if 'college_id' parameter is provided in the POST request
if (isset($_POST['college_id']) && !empty($_POST['college_id'])) {
    $college_id = intval($_POST['college_id']);  // Sanitize input

    // Begin transaction to ensure atomic deletion
    $conn->begin_transaction();

    try {
        // Delete related records from bookmarks table (if applicable)
        $deleteBookmarksQuery = "DELETE FROM bookmarks WHERE college_id = ?";
        $stmt1 = $conn->prepare($deleteBookmarksQuery);
        $stmt1->bind_param("i", $college_id);
        $stmt1->execute();
        $stmt1->close();

        // Delete the college record from the colleges table
        $deleteCollegeQuery = "DELETE FROM colleges WHERE college_id = ?";
        $stmt2 = $conn->prepare($deleteCollegeQuery);
        $stmt2->bind_param("i", $college_id);
        $stmt2->execute();

        if ($stmt2->affected_rows > 0) {
            // Commit transaction if deletion is successful
            $conn->commit();
            echo json_encode(["success" => true, "message" => "College deleted successfully."]);
        } else {
            // Rollback transaction if no rows were deleted
            $conn->rollback();
            echo json_encode(["success" => false, "message" => "Failed to delete college."]);
        }

        $stmt2->close();
    } catch (Exception $e) {
        // Rollback transaction in case of any error
        $conn->rollback();
        echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
    }
} else {
    // If 'college_id' is not provided in the request
    echo json_encode(["success" => false, "message" => "Invalid request. College ID is required."]);
}

// Close the database connection
$conn->close();
?>



<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>