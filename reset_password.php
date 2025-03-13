<?php
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["token"])) {
    $token = $conn->real_escape_string(trim($_GET["token"]));
    // Verify the token
    $stmt = $conn->prepare("SELECT id, name, password_reset_expires FROM users WHERE password_reset_token = ?");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows != 1) {
        echo "Invalid password reset token.";
        exit();
    }
    $user = $result->fetch_assoc();
    $expiry = strtotime($user["password_reset_expires"]);
    if (time() > $expiry) {
        echo "Password reset token has expired.";
        exit();
    }
    // Display form to set new password
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>Reset Password</title>
      <style>
        body { font-family: Arial, sans-serif; text-align: center; background: #f4f4f4; }
        .container { width: 300px; margin: 100px auto; background: white; padding: 20px; border-radius: 10px; }
        input, button { width: 100%; margin: 10px 0; padding: 10px; }
        button { background: #007BFF; color: white; border: none; cursor: pointer; }
        button:hover { background: #0056b3; }
      </style>
    </head>
    <body>
      <div class="container">
        <h2>Reset Password for <?php echo htmlspecialchars($user["name"]); ?></h2>
        <form action="reset_password.php" method="POST">
          <input type="hidden" name="token" value="<?php echo htmlspecialchars($token); ?>">
          <input type="password" name="new_password" placeholder="Enter new password" required>
          <button type="submit">Set New Password</button>
        </form>
      </div>
    </body>
    </html>
    <?php
    exit();
} elseif ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["token"])) {
    $token = $conn->real_escape_string(trim($_POST["token"]));
    $new_password = password_hash($_POST["new_password"], PASSWORD_DEFAULT);
    
    // Update the user record: set the new password and clear reset token and expiry
    $stmt = $conn->prepare("UPDATE users SET password = ?, password_reset_token = NULL, password_reset_expires = NULL WHERE password_reset_token = ?");
    $stmt->bind_param("ss", $new_password, $token);
    if ($stmt->execute() && $stmt->affected_rows === 1) {
        echo "Your password has been reset successfully. You may now log in.";
    } else {
        echo "Failed to reset password. Please try again.";
    }
    $stmt->close();
} else {
    echo "No password reset token provided.";
}
?>

