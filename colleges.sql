-- Database Schema for College Filtering System


USE college_directory;

-- Colleges Table
CREATE TABLE colleges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(100) NOT NULL,
    budget INT NOT NULL,
    courses TEXT NOT NULL,
    placement TEXT NOT NULL,
    specialization TEXT NOT NULL,
    ranking INT NOT NULL,
    facilities TEXT NOT NULL,
    usp TEXT NOT NULL
);

-- Bookmarks Table
CREATE TABLE bookmarks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    college_id INT NOT NULL,
    FOREIGN KEY (college_id) REFERENCES colleges(id) ON DELETE CASCADE
);

-- PHP Backend Scripts

-- Fetching filtered colleges
CREATE TABLE api_fetch_colleges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filter_type VARCHAR(100) NOT NULL,
    filter_value TEXT NOT NULL
);

-- Managing bookmarks
CREATE TABLE api_manage_bookmarks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    college_id INT NOT NULL,
    FOREIGN KEY (college_id) REFERENCES colleges(id) ON DELETE CASCADE
);

-- Admin Panel Functions (Add/Edit Colleges)
CREATE TABLE admin_manage_colleges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(100) NOT NULL,
    details TEXT NOT NULL
);


