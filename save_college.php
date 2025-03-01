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
    $specialization = isset($_POST['specialization']) ? implode(',', $_POST['specialization']) : null; // Allow multiple specializations
    $ranking = $_POST['ranking'] ?? null;
    $facilities = $_POST['facilities'] ?? null;
    $usp = $_POST['usp'] ?? null;
    $college_id = $_POST['college_id'] ?? null;

    // Check for required fields
    if (!$name || !$university || !$location || !$budget || !$admission_process || !$courses || !$placement_details || !$specialization) {
        echo json_encode(["success" => false, "message" => "Please fill in all required fields, including Specialization."]);
        exit();
    }

    // 📄 Handle College PDF Upload
    $pdfPath = null;
    if (!empty($_FILES['college_pdf']['name'])) {
        $target_dir = "uploads/";
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0777, true); // Create folder if not exists
        }

        $pdfName = uniqid() . "_" . basename($_FILES["college_pdf"]["name"]);
        $pdfPath = $target_dir . $pdfName;

        if (!move_uploaded_file($_FILES["college_pdf"]["tmp_name"], $pdfPath)) {
            echo json_encode(["success" => false, "message" => "Failed to upload PDF."]);
            exit();
        }
    }

    // 📝 Insert or Update Query
    if ($college_id) {
        // Update existing record
        $query = "UPDATE colleges SET name = ?, university = ?, location = ?, budget = ?, admission_process = ?, courses = ?, placement = ?, placement_details = ?, specialization = ?, ranking = ?, facilities = ?, usp = ?" . ($pdfPath ? ", college_pdf = ?" : "") . " WHERE college_id = ?";
        
        if ($pdfPath) {
            $stmt = $conn->prepare($query);
            $stmt->bind_param("sssssssssssssi", $name, $university, $location, $budget, $admission_process, $courses, $placement, $placement_details, $specialization, $ranking, $facilities, $usp, $pdfPath, $college_id);
        } else {
            $stmt = $conn->prepare($query);
            $stmt->bind_param("ssssssssssssi", $name, $university, $location, $budget, $admission_process, $courses, $placement, $placement_details, $specialization, $ranking, $facilities, $usp, $college_id);
        }
    } else {
        // Insert new record
        $query = "INSERT INTO colleges (name, university, location, budget, admission_process, courses, placement, placement_details, specialization, ranking, facilities, usp, college_pdf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("sssssssssssss", $name, $university, $location, $budget, $admission_process, $courses, $placement, $placement_details, $specialization, $ranking, $facilities, $usp, $pdfPath);
    }

    // Execute the query
    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "SQL Prepare Error: " . $conn->error]);
        exit();
    }

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
