
-- Insert data into Normal_Users table (Superclass)
INSERT INTO Normal_Users (user_type, name, email, password) VALUES
('student', 'Mickey Mouse', 'mickey.mouse@example.com', 'password123'),  
('student', 'Donald Duck', 'donald.duck@example.com', 'password123'),    
('student', 'Goofy Goof', 'goofy.goof@example.com', 'password123'),     
('faculty', 'Elsa Arendelle', 'elsa@university.edu', 'password123'),    
('faculty', 'Mufasa Lion', 'mufasa@university.edu', 'password123'),     
('company', 'Buzz Lightyear', 'buzz@techcorp.com', 'password123'),  
('company', 'Simba Lion', 'simba@financeinc.com', 'password123'),     
('student', 'Belle Beauty', 'belle@example.com', 'password123'),         
('student', 'Cinderella', 'cinderella@example.com', 'password123'),     
('student', 'Peter Pan', 'peter.pan@example.com', 'password123'),       
('faculty', 'Anna Arendelle', 'anna@university.edu', 'password123'),    
('faculty', 'Rafiki', 'rafiki@university.edu', 'password123'),           
('company', 'Woody', 'woody@pixar.com', 'password123'),                  
('company', 'Minnie Mouse', 'minnie.mouse@disneyplus.com', 'password123'), 
('company', 'Zurg', 'zurg@starcommand.com', 'password123'),           
('company', 'Scar', 'scar@lionco.com', 'password123'),                  
('student', 'Ariel Mermaid', 'ariel@example.com', 'password123'),        
('faculty', 'Hercules', 'hercules@university.edu', 'password123'),      
('company', 'Pluto', 'pluto@toontown.com', 'password123'),       
('student', 'Tiana', 'tiana@example.com', 'password123'),     
('faculty', 'Kristoff Bjorgman', 'kristoff@university.edu', 'password123');

-- insert data into Students table (Subclass)
INSERT INTO Students (user_id, student_id, major, academic_year, resume_uploaded, GPA) VALUES
(1, 1001, 'Computer Science', 'first', TRUE, 3.9), 
(2, 1002, 'Information Systems', 'second', FALSE, 3.5),
(3, 1003, 'Software Engineering', 'third', TRUE, 3.7),
(8, 1004, 'Data Science', 'first', TRUE, 3.8),
(9, 1005, 'Cybersecurity', 'second', FALSE, 3.6),
(10, 1006, 'Computer Engineering', 'third', TRUE, 3.2),
(17, 1007, 'Business Analytics', 'second', FALSE, 3.3);

-- insert data into Students table (Subclass)
INSERT INTO Faculty (user_id, faculty_id, department) VALUES
(4, 2001, 'Computer Science'),
(5, 2002, 'Information Systems'),
(11, 2003, 'Artificial Intelligence'),
(12, 2004, 'Cybersecurity'),
(18, 2005, 'Data Science'),
(21, 2006, 'Finance'),
(20, 2007, 'Software Engineering');

-- Insert data into Companies table (Subclass)
INSERT INTO Companies (user_id, company_name, industry, contact_name, contact_phone, location, profile) VALUES
(6, 'TechCorp', 'Technology', 'Buzz Lightyear', '123-456-7890', 'San Francisco, CA', 'Leading tech company.'),
(7, 'FinanceInc', 'Finance', 'Simba Lion', '987-654-3210', 'New York, NY', 'Top financial services provider.'),
(13, 'Pixar', 'Animation', 'Woody', '111-222-3333', 'Los Angeles, CA', 'Leading animation studio.'),
(14, 'Disney+', 'Entertainment', 'Minnie Mouse', '444-555-6666', 'Orlando, FL', 'Streaming platform.'),
(15, 'Star Command', 'Aerospace', 'Zurg', '777-888-9999', 'Houston, TX', 'Space technology company.'),
(16, 'LionCo', 'Agriculture', 'Scar', '666-777-8888', 'Savannah, Africa', 'Agricultural solutions provider.'),
(19, 'ToonTown', 'Entertainment', 'Pluto', '123-123-1234', 'Orlando, FL', 'Amusement park.');

-- Insert data into Admins table
INSERT INTO Admins (admin_id, admin_name, email) VALUES
(1, 'Jane Admin', 'admin@example.com'),
(2, 'Bob Admin', 'bob.admin@example.com'),
(3, 'Alice Admin', 'alice.admin@example.com'),
(4, 'Tom Admin', 'tom.admin@example.com'),
(5, 'Jerry Admin', 'jerry.admin@example.com'),
(6, 'Daisy Admin', 'daisy.admin@example.com'),
(7, 'Anna Admin', 'anna.admin@example.com');


-- Insert data into CareerFair table
INSERT INTO CareerFair (fair_id, fair_name, careerfair_date, location, description, total_students, total_companies, admin_id) VALUES
(1, 'Fall Career Fair', '2024-11-15', 'Main Hall', 'Annual career fair.', 200, 50, 1),
(2, 'Tech Career Fair', '2024-12-05', 'Tech Building', 'Focused on tech roles.', 300, 70, 2),
(3, 'Finance Career Fair', '2025-01-20', 'Finance Hall', 'For finance students.', 100, 20, 3),
(4, 'Startup Career Fair', '2025-02-10', 'Tech Building', 'Focused on tech roles.', 150, 30, 4),
(5, 'Healthcare Career FairTech Career Fair', '2025-05-15', 'Medical Center', 'Healthcare roles.', 120, 35, 7),
(6, 'Engineering Career Fair', '2025-06-20', 'Engineering Hall', 'Engineering-focused fair.', 220, 80, 2),
(7, 'Global Career Fair', '2025-07-15', 'International Hall', 'Global companies.', 300, 100, 1);

-- Insert data into Announcement table
INSERT INTO Announcement (ann_id, ann_content, admin_id) VALUES
(1, 'Fall Career Fair registration is now open!', 1),
(2, 'Submit your resumes before the fair.', 2),
(3, 'Tech Career Fair registration ends soon!', 3),
(4, 'Finance Career Fair coming up next month.', 4),
(5, 'New internship positions available.', 5),
(6, 'Startup fair deadline extended.', 6),
(7, 'AI Fair will feature top companies.', 7);

-- Insert data into Position table
INSERT INTO Position (position_id, position_name, salary, location, description, company_id, ng_flag, intern_flag, sponsor_flag) VALUES
(1, 'Software Engineer', 90000.00, 'San Francisco, CA', 'Full-time engineering role.', 6, True, True, TRUE),
(2, 'Data Analyst Intern', 25000.00, 'Remote', '6-month internship.', 7, FALSE, TRUE, FALSE),
(3, 'Marketing Specialist', 60000.00, 'New York, NY', 'Marketing and communication role.', 7, TRUE, True, True),
(4, 'UX Designer', 75000.00, 'Los Angeles, CA', 'Designing user interfaces.', 13, True, FALSE, True),
(5, 'AI Researcher', 120000.00, 'San Francisco, CA', 'AI research position.', 6, True, FALSE, TRUE),
(6, 'Mechanical Engineer', 85000.00, 'Houston, TX', 'Aerospace engineering role.', 15, True, FALSE, True),
(7, 'Financial Analyst', 70000.00, 'Chicago, IL', 'Financial services role.', 7, True, FALSE, True);

INSERT INTO Profile (user_id, profile_content) VALUES
(1, 'Mickey Mouse - passionate about AI and Machine Learning.'),
(2, 'Donald Duck - experienced in cloud computing.'),
(3, 'Goofy Goof - interested in software engineering.'),
(8, 'Belle Beauty - data science enthusiast.'),
(9, 'Cinderella - cybersecurity analyst in training.'),
(17, 'Ariel Mermaid - business analytics student.'),
(20, 'Tiana - aspiring software engineer.');

INSERT INTO Report (fair_id, report_content) VALUES
(1, 'Report on Fall Career Fair 2024.'),
(2, 'Summary of Tech Career Fair.'),
(3, 'Overview of Finance Career Fair 2025.'),
(4, 'Details of Startup Career Fair.'),
(5, 'Insights from Healthcare Career Fair.'),
(6, 'Engineering Career Fair Review.'),
(7, 'Global Career Fair Report.');

INSERT INTO Resume (resume_id, user_id, file_path) VALUES
(1, 1, '/resumes/mickey.pdf'),
(2, 2, '/resumes/donald.pdf'),
(3, 3, '/resumes/goofy.pdf'),
(4, 8, '/resumes/belle.pdf'),
(5, 9, '/resumes/cinderella.pdf'),
(6, 17, '/resumes/ariel.pdf'),
(7, 20, '/resumes/tiana.pdf');

INSERT INTO Submit_Position (user_id, position_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(8, 4), 
(9, 5), 
(17, 6), 
(20, 7),
(1, 2);

INSERT INTO Register_CareerFair (fair_id, user_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 8), (3, 9), (4, 17), (5, 20);


-- Insert data into Attend_CareerFair table based on registered users
INSERT INTO Attend_CareerFair (fair_id, user_id, status) VALUES
(1, 1, 'confirmed'),
(1, 2, 'canceled'),
(1, 3, 'confirmed'),
(1, 8, 'confirmed'),
(1, 9, 'confirmed'),
(2, 17, 'confirmed'),
(2, 20, 'confirmed'),
(2, 3, 'confirmed'),
(2, 8, 'confirmed'),
(3, 9, 'confirmed'),
(3, 17, 'confirmed'),
(3, 20, 'confirmed'),
(4, 6, 'confirmed'),
(4, 7, 'confirmed'),
(4, 13, 'confirmed'),
(4, 19, 'confirmed'),
(5, 7, 'confirmed'),
(5, 14, 'confirmed'),
(5, 15, 'confirmed'),
(6, 16, 'confirmed'),
(6, 14, 'confirmed'),
(6, 7, 'confirmed'),
(7, 19, 'confirmed'),
(7, 6, 'confirmed'),
(7, 16, 'confirmed'),
(7, 1, 'confirmed'),
(7, 8, 'confirmed'),
(5, 2, 'confirmed'),
(5, 3, 'confirmed'),
(6, 17, 'confirmed'),
(6, 20, 'confirmed');



Select * FROM User_Log;

-- Update the email of Donald Duck
UPDATE Normal_Users
SET email = 'ddn@example.com'
WHERE user_id = 2;

SELECT * FROM Normal_Users WHERE user_id = 2;



















