<?php
session_start();
if (!isset($_SESSION["user"]) || $_SESSION["role"] !== "admin") {
    header("Location: admin_login.html");
    exit();
}
include 'db_connection.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Create User</title>
    <style>
      /* Basic styles */
      body { font-family: Arial, sans-serif; background: #f4f4f4; }
      .container { width: 500px; margin: 50px auto; background: white; padding: 20px; border-radius: 10px; }
      input, button { width: 100%; margin: 10px 0; padding: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create New User</h2>
        <form action="create_user.php" method="POST">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="text" name="email" placeholder="Email" required>
            <!-- Optionally let admin choose role; default can be 'user' -->
            <input type="hidden" name="role" value="user">
            <button type="submit">Create User</button>
        </form>
        <p><a href="logout.php">Logout</a></p>
    </div>
</body>
</html>

