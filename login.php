<?php
session_start();
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $conn->real_escape_string($_POST["email"]);
    $password = $_POST["password"];

    $stmt = $conn->prepare("SELECT name, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    

    if ($result->num_rows == 1) {
    	$user = $result->fetch_assoc();
	    
	// 🔐 Verify hashed password
        if (password_verify($password, $user["password"])) {
        	session_regenerate_id(true); // 🔐 Prevent session fixation attacks
               	$_SESSION["user"] = htmlspecialchars($user["name"]); // Prevent XSS
               	$_SESSION["email"] = $user["email"];
               	header("Location: colleges.php");
        } else {
            echo "Invalid password!";
        }
    } else {
        echo "User not found!";
    }
    $stmt->close();
}
?>
