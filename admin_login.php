<?php
session_start();
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $conn->real_escape_string(trim($_POST["email"]));
    $password = $_POST["password"];

    // Use prepared statements
    $stmt = $conn->prepare("SELECT name, password, role FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows == 1) {
        $admin = $result->fetch_assoc();
        // Check role is admin and verify password
        if ($admin['role'] === 'admin' && password_verify($password, $admin["password"])) {
            session_regenerate_id(true);
            $_SESSION["user"] = $admin["name"];
            $_SESSION["email"] = $email;
            $_SESSION["role"] = $admin["role"];
            header("Location: admin_dashboard.php");
            exit();
        } else {
            echo "Invalid credentials or not an admin.";
        }
    } else {
        echo "Admin not found!";
    }
    $stmt->close();
}
?>

