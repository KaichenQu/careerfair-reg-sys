-- Drop the trigger first to avoid dependencies
DROP TRIGGER IF EXISTS log_user_registration;

-- Drop view
DROP VIEW IF EXISTS RegisteredCompaniesView;

-- Drop tables in reverse order of dependency to handle foreign keys properly
DROP TABLE IF EXISTS User_Log;
DROP TABLE IF EXISTS SUBMIT_POSITION;
DROP TABLE IF EXISTS Attend_careerFair;
DROP TABLE IF EXISTS Register_CareerFair;
DROP TABLE IF EXISTS Resume;
DROP TABLE IF EXISTS Report;
DROP TABLE IF EXISTS Profile;
DROP TABLE IF EXISTS Position;
DROP TABLE IF EXISTS Announcement;
DROP TABLE IF EXISTS CareerFair;
DROP TABLE IF EXISTS Admins;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Normal_users;

-- Finally, drop the database itself
DROP DATABASE IF EXISTS CareerFairDB;
