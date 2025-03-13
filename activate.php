<?php
include 'db_connection.php';

if (isset($_GET['token'])) {
    $token = $conn->real_escape_string($_GET['token']);
    
    // Look up user with the provided token who is not activated
    $stmt = $conn->prepare("SELECT id, name FROM users WHERE activation_token = ? AND is_activated = 0");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        // Display a form to allow the user to set their password
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Activate Your Account</title>
        </head>
        <body>
            <h2>Hello, <?php echo htmlspecialchars($user["name"]); ?>. Set Your Password to Activate Your Account</h2>
            <form action="activate.php" method="POST">
                <input type="hidden" name="user_id" value="<?php echo $user["id"]; ?>">
                <input type="hidden" name="token" value="<?php echo $token; ?>">
                <input type="password" name="password" placeholder="Enter New Password" required>
                <button type="submit">Activate Account</button>
            </form>
        </body>
        </html>
        <?php
    } else {
        echo "Invalid or expired activation token.";
    }
    $stmt->close();
} elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process password setting and activation
    $user_id = intval($_POST["user_id"]);
    $token = $conn->real_escape_string($_POST["token"]);
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $stmt = $conn->prepare("UPDATE users SET password = ?, is_activated = 1, activation_token = NULL WHERE id = ? AND activation_token = ?");
    $stmt->bind_param("sis", $password, $user_id, $token);
    if ($stmt->execute() && $stmt->affected_rows === 1) {
        echo "Account activated successfully. You may now log in.";
    } else {
        echo "Activation failed. Please try again.";
    }
    $stmt->close();
} else {
    echo "No activation token provided.";
}
?>

