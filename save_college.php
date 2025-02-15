<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Retrieve form data
    $name = $_POST['name'] ?? null;
    $university = $_POST['university'] ?? null;
    $location = $_POST['location'] ?? null;
    $budget = $_POST['budget'] ?? null;
    $admission_process = $_POST['admission_process'] ?? null;
    $courses = $_POST['courses'] ?? null;
    $placement = $_POST['placement'] ?? null;
    $placement_details = $_POST['placement_details'] ?? null;
    $specialization = $_POST['specialization'] ?? null;
    $ranking = $_POST['ranking'] ?? null;
    $facilities = $_POST['facilities'] ?? null;
    $usp = $_POST['usp'] ?? null;

    // Check if required fields are empty
    if (!$name || !$university || !$location || !$budget || !$admission_process || !$courses || !$placement_details) {
        echo json_encode(["success" => false, "message" => "Please fill in all required fields."]);
        exit();
    }

    // Handle College PDF Upload (File will be uploaded but NOT stored in the database)
    if (!empty($_FILES['college_pdf']['name'])) {
        $target_dir = "uploads/";
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0777, true); // Create directory if not exists
        }
        move_uploaded_file($_FILES["college_pdf"]["tmp_name"], $target_dir . basename($_FILES["college_pdf"]["name"]));
    }

    // Prepare and execute SQL query (Matching Database Structure)
    $stmt = $conn->prepare("INSERT INTO colleges 
        (name, university, location, budget, admission_process, courses, placement, placement_details, specialization, ranking, facilities, usp) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "SQL Prepare Error: " . $conn->error]);
        exit();
    }

    $stmt->bind_param("ssssssssssss", $name, $university, $location, $budget, $admission_process, $courses, $placement, $placement_details, $specialization, $ranking, $facilities, $usp);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "College saved successfully!"]);
    } else {
        echo json_encode(["success" => false, "message" => "SQL Execution Error: " . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}
?>
