<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure this file connects to the database

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Add a bookmark
    $college_id = intval($_POST['college_id']);
    $query = "INSERT INTO bookmarks (college_id) VALUES ($college_id)";
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => true, "message" => "Bookmark added successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to add bookmark."]);
    }
} elseif ($method === 'DELETE') {
    // Remove a bookmark
    parse_str(file_get_contents("php://input"), $_DELETE);
    $college_id = intval($_DELETE['college_id']);
    $query = "DELETE FROM bookmarks WHERE college_id = $college_id";
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => true, "message" => "Bookmark removed successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to remove bookmark."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}
?>

