<?php
session_start();
if (!isset($_SESSION["user"]) || $_SESSION["role"] !== "admin") {
    header("Location: admin_login.html");
    exit();
}
include 'db_connection.php';

// Process the form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $conn->real_escape_string(trim($_POST["name"]));
    $email = $conn->real_escape_string(trim($_POST["email"]));
    $role = $conn->real_escape_string(trim($_POST["role"])); // typically "user"
    
    // Generate activation token
    $activation_token = bin2hex(random_bytes(16));
    $is_activated = 0; // not activated yet
    $dummy_password = password_hash("", PASSWORD_DEFAULT);

    
    // Insert new user
    //$stmt = $conn->prepare("INSERT INTO users (name, email, role, activation_token, is_activated, password) VALUES (?, ?, ?, ?, ?, ?)");
    //$stmt->bind_param("ssssi", $name, $email, $role, $activation_token, $is_activated, $dummy_password);
	$stmt = $conn->prepare("INSERT INTO users (name, email, role, activation_token, is_activated, password) VALUES (?, ?, ?, ?, ?, ?)");
	$stmt->bind_param("ssssis", $name, $email, $role, $activation_token, $is_activated, $dummy_password);


    if ($stmt->execute()) {
        // Send activation email using PHP's mail() function
        $activation_link = "http://yourdomain.com/activate.php?token=" . $activation_token;
        $subject = "Activate Your Account";
        $message = "Hi $name,\n\nYour account has been created. Please click the link below to activate your account and set your password:\n\n$activation_link\n\nThank you!";
        $headers = "From: info@navyut.com\r\n";
        mail($email, $subject, $message, $headers);
        echo "User created successfully. Activation email sent.";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}
?>

