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

CREATE TABLE IF NOT EXISTS locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO locations (name) VALUES 
('Greater Noida, Uttar Pradesh'),
('Lucknow, Uttar Pradesh'), 
('Ghaziabad, Uttar Pradesh'),  
('Faridabad, Haryana'), 
('Gurugram, Haryana'),
('Mumbai, Maharashtra'), 
('Pune, Maharashtra'), 
('Dehradun, Uttarakhand'),
('Delhi, Delhi'),
('Bangalore, Karnataka');
