-- File: dbDDL.sql

CREATE DATABASE IF NOT EXISTS CareerFairDB;
USE CareerFairDB;


-- Users table to store basic user information
CREATE TABLE Normal_users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_type ENUM('student', 'faculty', 'company') NOT NULL, -- newly added
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Students table to store student-specific information
CREATE TABLE Students (
    user_id INT PRIMARY KEY,
    student_id INT UNIQUE, 
    major VARCHAR(100),
    academic_year ENUM('first', 'second', 'third') NOT NULL,  -- newly added
    resume_uploaded BOOLEAN DEFAULT FALSE, -- newly added
    GPA DECIMAL(3, 2) CHECK (GPA >= 0.0 AND GPA <= 4.0),
    FOREIGN KEY (user_id) REFERENCES Normal_users(user_id)
);


-- Companies table to store company-specific information
CREATE TABLE Companies (
    user_id INT PRIMARY KEY,                                                    
    company_name VARCHAR(255) NOT NULL,              
    industry VARCHAR(100),                           
    contact_name VARCHAR(100),  -- newly added                     
    contact_phone VARCHAR(20),                       
    location VARCHAR(255),                           
    profile TEXT,
    FOREIGN KEY (user_id) REFERENCES Normal_users(user_id)  
);


-- Faculty table to store faculty-specific information
CREATE TABLE Faculty (
    user_id INT PRIMARY KEY,
    faculty_id INT UNIQUE, 
    department VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Normal_users(user_id)
);


-- Admins table to store admin-specific information
CREATE TABLE Admins (
    admin_id INT PRIMARY KEY,
    admin_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);


-- Career Fair table to store career fair event details
CREATE TABLE CareerFair (
    fair_id INT PRIMARY KEY,
    fair_name VARCHAR(100) NOT NULL,
    careerfair_date DATE NOT NULL,
    location VARCHAR(255),
    description TEXT,
    total_students INT, -- newly added
    total_companies INT,  -- newly added
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admins(admin_id)
);


-- Announcement table to store annocement details by admins
CREATE TABLE Announcement (
    ann_id INT PRIMARY KEY,  
    ann_content TEXT NOT NULL,  
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admins(admin_id)
);


CREATE TABLE Position (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    location VARCHAR(255),
    description TEXT,
    company_id INT,
    ng_flag BOOLEAN DEFAULT FALSE,
    intern_flag BOOLEAN DEFAULT FALSE,
    sponsor_flag BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (company_id) REFERENCES Normal_users(user_id)
);


CREATE TABLE Profile (
    user_id INT PRIMARY KEY,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    profile_content TEXT,
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id)
);


CREATE TABLE Report (
    fair_id INT PRIMARY KEY,
    report_content TEXT,
    FOREIGN KEY (fair_id) REFERENCES CareerFair(fair_id)
);


CREATE TABLE Resume (
    resume_id INT,
    user_id INT,
    file_path VARCHAR(255),
    PRIMARY KEY (resume_id, user_id),
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id)
);



-- REGISTER_CAREERFAIR table to track user registrations for career fairs
CREATE TABLE Register_CareerFair (
    fair_id INT,
    user_id INT,
    PRIMARY KEY (fair_id, user_id),
    FOREIGN KEY (fair_id) REFERENCES CareerFair(fair_id),
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id)
);


-- ATTEND_CAREERFAIR table to record user attendance confirmations
CREATE TABLE Attend_careerFair (
    fair_id INT,
    user_id INT,
    status ENUM('confirmed', 'canceled') DEFAULT 'confirmed',  -- newly added
    PRIMARY KEY (fair_id, user_id),
    FOREIGN KEY (fair_id) REFERENCES CareerFair(fair_id),
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id)
);


-- SUBMIT_POSITION table to record student job submissions
CREATE TABLE Submit_position (
    user_id INT,
    position_id INT,
    submission_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, position_id),
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id),
    FOREIGN KEY (position_id) REFERENCES `Position`(`position_id`)
);


-- Trigger to log all new registered users
CREATE TABLE User_Log (
    user_id INT,
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Normal_Users(user_id)
);

DROP TRIGGER IF EXISTS log_user_registration;

-- Trigger to record the log
DELIMITER $$

CREATE TRIGGER log_user_registration
AFTER INSERT ON Normal_Users
FOR EACH ROW
BEGIN
    INSERT INTO User_Log (user_id, description)
    VALUES (NEW.user_id, CONCAT('User registered with name: ', NEW.name, ' and email: ', NEW.email));
END $$

DELIMITER ;


-- Procedure/Function to check a student's name/major/GPA according to one's student id
DELIMITER $$

CREATE PROCEDURE GetStudentById(IN student_user_id INT)
BEGIN
    SELECT 
        s.user_id,
        u.name,
        s.major,
        s.GPA
    FROM 
        Students s
    JOIN 
        Normal_Users u ON s.user_id = u.user_id
    WHERE 
        s.user_id = student_user_id;
END $$

DELIMITER ;


-- View of reading all registered companies
CREATE VIEW RegisteredCompaniesView AS
SELECT 
    c.user_id,
    c.company_name,
    c.industry,
    c.contact_name,
    c.contact_phone,
    c.location,
    c.profile
FROM 
    Companies c
JOIN 
    Normal_Users u ON c.user_id = u.user_id
WHERE 
    u.user_type = 'company';

