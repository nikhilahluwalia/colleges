<?php

session_start();

// 🔐 Secure session settings
ini_set("session.cookie_httponly", 1); // Prevent JavaScript from accessing cookies
ini_set("session.cookie_secure", 1); // Force HTTPS-only cookies (enable if using HTTPS)
ini_set("session.use_only_cookies", 1); // Prevent session fixation attacks


//check user session and timeout
function checkUserSession($timeout = 1800) {
    // Start the session if it hasn't already started
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Check if the session has timed out
    if (isset($_SESSION["last_activity"]) && (time() - $_SESSION["last_activity"] > $timeout)) {
        session_unset();
        session_destroy();
        header("Location: login.html");
        exit();
    }
    // Update last activity timestamp
    $_SESSION["last_activity"] = time();

    // Check if user is logged in
    if (!isset($_SESSION["user"])) {
        header("Location: login.html");
        exit();
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
        }
        .header {
            display: flex;
            justify-content: space-between;
            background-color: #007BFF;
            padding: 10px;
            color: white;
            font-size: 18px;
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            color: white;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="header">
        <div>Welcome, <strong><?php echo $_SESSION["user"]; ?></strong></div>
        <form action="logout.php" method="POST">
            <button class="logout-btn" type="submit">Logout</button>
        </form>
    </div>

    <iframe src="colleges.html?internal=true" style="width:100%; height:90vh; border:none;"></iframe>

</body>
</html>

