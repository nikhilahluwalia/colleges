USE college_directory;
-- Locations Table
CREATE TABLE specialization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert sample specialization
INSERT INTO specialization(name) VALUES('Human Resource Management'),('Marketing Management'),('Financial Management'),('International Business'),('Information Technology'),('Business Analytics'),('Operations & Supply Chain Management'),('Banking '),('Media Management'),('Logistics and Supply Chain Management'),('Entrepreneurship Management'),('Digital Marketing'),('Data Analytics'),('Operations Management'),('Entrepreneurship and New Age Startups'),('Artificial Intelligence'),('Insurance Management'),('Retail Management'),('E-Commerce'),('Agribusiness Management');
