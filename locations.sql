USE college_directory;
-- Locations Table
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert sample locations
INSERT INTO locations(name) VALUES('Greater Noida, Uttar Pradesh'),('Lucknow, Uttar Pradesh'),('Ghaziabad, Uttar Pradesh'),('Faridabad, Haryana'),('Gurugram, Haryana'),('Mumbai, Maharashtra'),('Pune, Maharashtra'),('Dehradun, Uttarakhand'),('Delhi, Delhi'),(
'Bangalore, Karnataka');
