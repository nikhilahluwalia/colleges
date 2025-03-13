<?php
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $conn->real_escape_string(trim($_POST["email"]));
    
    // Check if an activated account exists with that email
    $stmt = $conn->prepare("SELECT id, name FROM users WHERE email = ? AND is_activated = 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows != 1) {
        echo "No activated account found with that email.";
        exit();
    }
    $user = $result->fetch_assoc();
    $user_id = $user["id"];
    
    // Generate a password reset token and expiry (valid for 1 hour)
    $token = bin2hex(random_bytes(16));
    $expiry = date("Y-m-d H:i:s", time() + 3600);  // 1 hour from now

    // Update the user record with the token and expiry
    $stmt = $conn->prepare("UPDATE users SET password_reset_token = ?, password_reset_expires = ? WHERE id = ?");
    $stmt->bind_param("ssi", $token, $expiry, $user_id);
    
    if ($stmt->execute()) {
        // Send the reset email
        $reset_link = "http://yourdomain.com/reset_password.php?token=" . $token;
        $subject = "Password Reset Request";
        $message = "Hello " . $user["name"] . ",\n\nWe received a request to reset your password. Please click the link below to reset your password:\n\n" . $reset_link . "\n\nIf you did not request a password reset, please ignore this email.\n\nThank you!";
        $headers = "From: no-reply@yourdomain.com\r\n";
        if (mail($email, $subject, $message, $headers)) {
            echo "A password reset link has been sent to your email.";
        } else {
            echo "Failed to send the password reset email. Please try again.";
        }
    } else {
        echo "Error updating token: " . $stmt->error;
    }
    $stmt->close();
}
?>

