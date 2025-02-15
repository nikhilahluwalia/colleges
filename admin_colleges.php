<?php
header('Content-Type: application/json');
require 'db_connection.php'; // Ensure this file connects to the database

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Add a new college
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $location = mysqli_real_escape_string($conn, $_POST['location']);
    $budget = intval($_POST['budget']);
    $courses = mysqli_real_escape_string($conn, $_POST['courses']);
    $placement = mysqli_real_escape_string($conn, $_POST['placement']);
    $specialization = mysqli_real_escape_string($conn, $_POST['specialization']);
    $ranking = intval($_POST['ranking']);
    $facilities = mysqli_real_escape_string($conn, $_POST['facilities']);
    $usp = mysqli_real_escape_string($conn, $_POST['usp']);

    $query = "INSERT INTO colleges (name, location, budget, courses, placement, specialization, ranking, facilities, usp) 
              VALUES ('$name', '$location', $budget, '$courses', '$placement', '$specialization', $ranking, '$facilities', '$usp')";
    
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => true, "message" => "College added successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to add college."]);
    }
} elseif ($method === 'PUT') {
    // Update an existing college
    parse_str(file_get_contents("php://input"), $_PUT);
    $id = intval($_PUT['id']);
    $name = mysqli_real_escape_string($conn, $_PUT['name']);
    $location = mysqli_real_escape_string($conn, $_PUT['location']);
    $budget = intval($_PUT['budget']);
    $courses = mysqli_real_escape_string($conn, $_PUT['courses']);
    $placement = mysqli_real_escape_string($conn, $_PUT['placement']);
    $specialization = mysqli_real_escape_string($conn, $_PUT['specialization']);
    $ranking = intval($_PUT['ranking']);
    $facilities = mysqli_real_escape_string($conn, $_PUT['facilities']);
    $usp = mysqli_real_escape_string($conn, $_PUT['usp']);

    $query = "UPDATE colleges SET name='$name', location='$location', budget=$budget, courses='$courses', 
              placement='$placement', specialization='$specialization', ranking=$ranking, facilities='$facilities', usp='$usp' 
              WHERE id=$id";
    
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => true, "message" => "College updated successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to update college."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}
?>
