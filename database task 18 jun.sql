CREATE DATABASE IF NOT EXISTS LMS_DB;
USE LMS_DB;

-- 1. Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE,
    country VARCHAR(50)
);

-- 2. Instructors
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100),
    specialization VARCHAR(100),
    joining_date DATE
);

-- 3. Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    course_fee DECIMAL(10,2),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- 4. Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    completion_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 5. Assignments
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    assignment_title VARCHAR(100),
    max_marks INT,
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 6. Assignment_Submissions
CREATE TABLE Assignment_Submissions (
    submission_id INT PRIMARY KEY,
    assignment_id INT,
    student_id INT,
    marks_obtained INT,
    submission_date DATE,
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 7. Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert 20 Students
INSERT INTO Students (student_id, first_name, last_name, email, registration_date, country) VALUES
(1, 'Alice', 'Smith', 'alice.smith@example.com', '2023-01-15', 'USA'),
(2, 'Bob', 'Johnson', 'bob.j@example.com', '2023-02-10', 'UK'),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '2023-03-05', 'Canada'),
(4, 'Diana', 'Prince', 'diana.p@example.com', '2023-04-20', 'Australia'),
(5, 'Evan', 'Wright', 'evan.w@example.com', '2023-05-12', 'USA'),
(6, 'Fiona', 'Gallagher', 'fiona.g@example.com', '2023-06-18', 'Ireland'),
(7, 'George', 'Miller', 'george.m@example.com', '2023-07-22', 'UK'),
(8, 'Hannah', 'Abbott', 'hannah.a@example.com', '2023-08-30', 'Canada'),
(9, 'Ian', 'Somerhalder', 'ian.s@example.com', '2023-09-15', 'USA'),
(10, 'Julia', 'Roberts', 'julia.r@example.com', '2023-10-01', 'Australia'),
(11, 'Kevin', 'Hart', 'kevin.h@example.com', '2023-10-10', 'USA'),
(12, 'Laura', 'Dern', 'laura.d@example.com', '2023-11-05', 'UK'),
(13, 'Michael', 'Scott', 'michael.s@example.com', '2023-11-20', 'USA'),
(14, 'Nina', 'Dobrev', 'nina.d@example.com', '2023-12-01', 'Canada'),
(15, 'Oscar', 'Isaac', 'oscar.i@example.com', '2024-01-15', 'Mexico'),
(16, 'Pam', 'Beesly', 'pam.b@example.com', '2024-02-14', 'USA'),
(17, 'Quinn', 'Fabray', 'quinn.f@example.com', '2024-03-10', 'Australia'),
(18, 'Rachel', 'Green', 'rachel.g@example.com', '2024-04-05', 'USA'),
(19, 'Sam', 'Winchester', 'sam.w@example.com', '2024-05-12', 'USA'),
(20, 'Tina', 'Cohen', 'tina.c@example.com', '2024-06-20', 'UK');

-- Insert 8 Instructors
INSERT INTO Instructors (instructor_id, instructor_name, specialization, joining_date) VALUES
(1, 'Dr. Alan Turing', 'Computer Science', '2022-01-10'),
(2, 'Ada Lovelace', 'Programming', '2022-02-15'),
(3, 'Grace Hopper', 'Software Engineering', '2022-03-20'),
(4, 'Tim Berners-Lee', 'Web Development', '2022-04-25'),
(5, 'Linus Torvalds', 'Systems Programming', '2022-05-30'),
(6, 'Donald Knuth', 'Algorithms', '2022-06-15'),
(7, 'Margaret Hamilton', 'Software Engineering', '2022-07-20'),
(8, 'Yann LeCun', 'Artificial Intelligence', '2022-08-25');

-- Insert 15 Courses
INSERT INTO Courses (course_id, course_name, category, course_fee, instructor_id) VALUES
(1, 'Introduction to Python', 'Programming', 49.99, 2),
(2, 'Advanced Algorithms', 'Computer Science', 149.99, 6),
(3, 'Full Stack Web Development', 'Web Development', 199.99, 4),
(4, 'Machine Learning Basics', 'Artificial Intelligence', 129.99, 8),
(5, 'Operating Systems', 'Computer Science', 99.99, 5),
(6, 'Software Testing and QA', 'Software Engineering', 79.99, 3),
(7, 'Data Structures in C++', 'Programming', 89.99, 2),
(8, 'Frontend Masters', 'Web Development', 159.99, 4),
(9, 'Deep Learning Models', 'Artificial Intelligence', 249.99, 8), -- Highest fee
(10, 'Database Design', 'Software Engineering', 119.99, 7),
(11, 'Cryptography Fundamentals', 'Computer Science', 139.99, 1),
(12, 'Cloud Computing with AWS', 'Systems Programming', 179.99, 5),
(13, 'Agile Methodologies', 'Software Engineering', 59.99, 3),
(14, 'React for Beginners', 'Web Development', 89.99, 4),
(15, 'Natural Language Processing', 'Artificial Intelligence', 199.99, 8);

-- Insert 50 Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_status) VALUES
(1, 1, 1, '2023-01-20', 'Completed'), (2, 2, 3, '2023-02-15', 'Completed'),
(3, 3, 5, '2023-03-10', 'In Progress'), (4, 4, 9, '2023-04-25', 'In Progress'),
(5, 5, 2, '2023-05-15', 'Completed'), (6, 6, 11, '2023-06-20', 'In Progress'),
(7, 7, 4, '2023-07-25', 'Completed'), (8, 8, 7, '2023-09-05', 'Completed'),
(9, 9, 10, '2023-09-20', 'In Progress'), (10, 10, 15, '2023-10-05', 'Completed'),
(11, 11, 1, '2023-10-15', 'Completed'), (12, 12, 12, '2023-11-10', 'In Progress'),
(13, 13, 8, '2023-11-25', 'Completed'), (14, 14, 14, '2023-12-05', 'In Progress'),
(15, 15, 6, '2024-01-20', 'Completed'), (16, 16, 13, '2024-02-18', 'Completed'),
(17, 17, 3, '2024-03-15', 'In Progress'), (18, 18, 2, '2024-04-10', 'Completed'),
(19, 19, 9, '2024-05-15', 'In Progress'), (20, 20, 5, '2024-06-25', 'Completed'),
(21, 1, 3, '2023-03-01', 'In Progress'), (22, 2, 4, '2023-04-01', 'Completed'),
(23, 3, 9, '2023-05-01', 'In Progress'), (24, 4, 1, '2023-06-01', 'Completed'),
(25, 5, 10, '2023-07-01', 'In Progress'), (26, 6, 12, '2023-08-01', 'Completed'),
(27, 7, 15, '2023-09-01', 'In Progress'), (28, 8, 2, '2023-10-01', 'Completed'),
(29, 9, 8, '2023-11-01', 'In Progress'), (30, 10, 6, '2023-12-01', 'Completed'),
(31, 11, 11, '2024-01-01', 'In Progress'), (32, 12, 14, '2024-02-01', 'Completed'),
(33, 13, 5, '2024-03-01', 'In Progress'), (34, 14, 13, '2024-04-01', 'Completed'),
(35, 15, 7, '2024-05-01', 'In Progress'), (36, 16, 4, '2024-06-01', 'Completed'),
(37, 17, 1, '2024-07-01', 'In Progress'), (38, 18, 10, '2024-08-01', 'Completed'),
(39, 19, 12, '2024-09-01', 'In Progress'), (40, 20, 15, '2024-10-01', 'Completed'),
(41, 1, 9, '2024-01-10', 'In Progress'), (42, 2, 15, '2024-02-10', 'In Progress'),
(43, 3, 11, '2024-03-10', 'Completed'), (44, 4, 12, '2024-04-10', 'In Progress'),
(45, 5, 8, '2024-05-10', 'Completed'), (46, 6, 3, '2024-06-10', 'In Progress'),
(47, 7, 14, '2024-07-10', 'Completed'), (48, 8, 5, '2024-08-10', 'In Progress'),
(49, 9, 13, '2024-09-10', 'Completed'), (50, 10, 1, '2024-10-10', 'In Progress');

-- Insert 30 Assignments
INSERT INTO Assignments (assignment_id, course_id, assignment_title, max_marks, due_date) VALUES
(1, 1, 'Python Basics Quiz', 50, '2023-02-01'), (2, 1, 'Loops and Functions', 100, '2023-02-15'),
(3, 2, 'Sorting Algorithms', 100, '2023-06-01'), (4, 2, 'Graph Traversals', 100, '2023-06-15'),
(5, 3, 'HTML/CSS Layout', 50, '2023-03-01'), (6, 3, 'React Components', 100, '2023-04-01'),
(7, 4, 'Linear Regression', 100, '2023-08-01'), (8, 4, 'Neural Networks Intro', 100, '2023-08-15'),
(9, 5, 'Process Scheduling', 50, '2023-04-01'), (10, 5, 'Memory Management', 100, '2023-04-15'),
(11, 6, 'Unit Testing in Java', 50, '2024-02-01'), (12, 6, 'Integration Testing', 100, '2024-02-15'),
(13, 7, 'Pointers and Arrays', 50, '2023-10-01'), (14, 7, 'Linked Lists', 100, '2023-10-15'),
(15, 8, 'JavaScript DOM', 100, '2023-12-01'), (16, 8, 'State Management', 100, '2023-12-15'),
(17, 9, 'CNN Image Classification', 100, '2023-05-15'), (18, 9, 'RNN for NLP', 100, '2023-06-01'),
(19, 10, 'ER Modeling', 50, '2023-10-01'), (20, 10, 'SQL Joins', 100, '2023-10-15'),
(21, 11, 'Public Key Crypto', 100, '2023-07-01'), (22, 11, 'Hashing Algorithms', 50, '2023-07-15'),
(23, 12, 'EC2 Deployment', 100, '2023-12-01'), (24, 12, 'Lambda Functions', 100, '2023-12-15'),
(25, 13, 'Scrum Framework Quiz', 50, '2024-03-01'), (26, 13, 'Sprint Planning', 100, '2024-03-15'),
(27, 14, 'React Hooks', 100, '2024-01-01'), (28, 14, 'Context API', 50, '2024-01-15'),
(29, 15, 'Word Embeddings', 100, '2023-11-01'), (30, 15, 'Transformers', 100, '2023-11-15');

-- Insert 80 Assignment Submissions
INSERT INTO Assignment_Submissions (submission_id, assignment_id, student_id, marks_obtained, submission_date) VALUES
(1, 1, 1, 45, '2023-01-28'), (2, 2, 1, 95, '2023-02-14'),
(3, 5, 2, 48, '2023-02-28'), (4, 6, 2, 85, '2023-03-30'),
(5, 9, 3, 40, '2023-03-25'), (6, 10, 3, 88, '2023-04-10'),
(7, 17, 4, 92, '2023-05-10'), (8, 18, 4, 90, '2023-05-28'),
(9, 3, 5, 80, '2023-05-25'), (10, 4, 5, 75, '2023-06-10'),
(11, 21, 6, 95, '2023-06-28'), (12, 22, 6, 45, '2023-07-10'),
(13, 7, 7, 88, '2023-07-28'), (14, 8, 7, 92, '2023-08-10'),
(15, 13, 8, 45, '2023-09-25'), (16, 14, 8, 85, '2023-10-10'),
(17, 19, 9, 48, '2023-09-28'), (18, 20, 9, 90, '2023-10-12'),
(19, 29, 10, 95, '2023-10-25'), (20, 30, 10, 98, '2023-11-10'),
(21, 1, 11, 42, '2023-10-25'), (22, 2, 11, 85, '2023-11-10'),
(23, 23, 12, 88, '2023-11-25'), (24, 24, 12, 92, '2023-12-10'),
(25, 15, 13, 90, '2023-12-05'), (26, 16, 13, 85, '2023-12-20'),
(27, 27, 14, 95, '2023-12-25'), (28, 28, 14, 48, '2024-01-10'),
(29, 11, 15, 45, '2024-01-25'), (30, 12, 15, 88, '2024-02-10'),
(31, 25, 16, 48, '2024-02-25'), (32, 26, 16, 92, '2024-03-10'),
(33, 5, 17, 40, '2024-03-25'), (34, 6, 17, 85, '2024-04-10'),
(35, 3, 18, 88, '2024-04-25'), (36, 4, 18, 90, '2024-05-10'),
(37, 17, 19, 95, '2024-05-25'), (38, 18, 19, 85, '2024-06-10'),
(39, 9, 20, 45, '2024-07-05'), (40, 10, 20, 88, '2024-07-20'),
(41, 5, 1, 46, '2023-03-15'), (42, 6, 1, 89, '2023-04-05'),
(43, 7, 2, 82, '2023-04-15'), (44, 8, 2, 91, '2023-05-05'),
(45, 17, 3, 85, '2023-05-20'), (46, 18, 3, 88, '2023-06-10'),
(47, 1, 4, 49, '2023-06-20'), (48, 2, 4, 96, '2023-07-05'),
(49, 19, 5, 44, '2023-07-20'), (50, 20, 5, 87, '2023-08-05'),
(51, 23, 6, 90, '2023-08-20'), (52, 24, 6, 94, '2023-09-05'),
(53, 29, 7, 88, '2023-09-20'), (54, 30, 7, 92, '2023-10-05'),
(55, 3, 8, 85, '2023-10-20'), (56, 4, 8, 89, '2023-11-05'),
(57, 15, 9, 91, '2023-11-20'), (58, 16, 9, 95, '2023-12-05'),
(59, 11, 10, 47, '2023-12-20'), (60, 12, 10, 88, '2024-01-05'),
(61, 21, 11, 93, '2024-01-20'), (62, 22, 11, 46, '2024-02-05'),
(63, 27, 12, 90, '2024-02-20'), (64, 28, 12, 49, '2024-03-05'),
(65, 9, 13, 43, '2024-03-20'), (66, 10, 13, 86, '2024-04-05'),
(67, 25, 14, 45, '2024-04-20'), (68, 26, 14, 89, '2024-05-05'),
(69, 13, 15, 48, '2024-05-20'), (70, 14, 15, 92, '2024-06-05'),
(71, 7, 16, 85, '2024-06-20'), (72, 8, 16, 88, '2024-07-05'),
(73, 1, 17, 44, '2024-07-20'), (74, 2, 17, 87, '2024-08-05'),
(75, 19, 18, 46, '2024-08-20'), (76, 20, 18, 90, '2024-09-05'),
(77, 23, 19, 89, '2024-09-20'), (78, 24, 19, 93, '2024-10-05'),
(79, 29, 20, 91, '2024-10-20'), (80, 30, 20, 95, '2024-11-05');

-- Insert 40 Payments
INSERT INTO Payments (payment_id, student_id, amount_paid, payment_date, payment_method) VALUES
(1, 1, 49.99, '2023-01-18', 'Credit Card'), (2, 2, 199.99, '2023-02-12', 'PayPal'),
(3, 3, 99.99, '2023-03-08', 'Credit Card'), (4, 4, 249.99, '2023-04-22', 'Bank Transfer'),
(5, 5, 149.99, '2023-05-14', 'Credit Card'), (6, 6, 139.99, '2023-06-19', 'PayPal'),
(7, 7, 129.99, '2023-07-24', 'Credit Card'), (8, 8, 89.99, '2023-09-04', 'Credit Card'),
(9, 9, 119.99, '2023-09-18', 'PayPal'), (10, 10, 199.99, '2023-10-02', 'Bank Transfer'),
(11, 11, 49.99, '2023-10-12', 'Credit Card'), (12, 12, 179.99, '2023-11-08', 'PayPal'),
(13, 13, 159.99, '2023-11-22', 'Credit Card'), (14, 14, 89.99, '2023-12-03', 'Credit Card'),
(15, 15, 79.99, '2024-01-18', 'PayPal'), (16, 16, 59.99, '2024-02-16', 'Credit Card'),
(17, 17, 199.99, '2024-03-12', 'Bank Transfer'), (18, 18, 149.99, '2024-04-08', 'Credit Card'),
(19, 19, 249.99, '2024-05-13', 'PayPal'), (20, 20, 99.99, '2024-06-22', 'Credit Card'),
(21, 1, 199.99, '2023-02-28', 'Credit Card'), (22, 2, 129.99, '2023-03-30', 'PayPal'),
(23, 3, 249.99, '2023-04-28', 'Credit Card'), (24, 4, 49.99, '2023-05-30', 'Bank Transfer'),
(25, 5, 119.99, '2023-06-28', 'Credit Card'), (26, 6, 179.99, '2023-07-30', 'PayPal'),
(27, 7, 199.99, '2023-08-28', 'Credit Card'), (28, 8, 149.99, '2023-09-28', 'Credit Card'),
(29, 9, 159.99, '2023-10-30', 'PayPal'), (30, 10, 79.99, '2023-11-28', 'Bank Transfer'),
(31, 11, 139.99, '2023-12-30', 'Credit Card'), (32, 12, 89.99, '2024-01-30', 'PayPal'),
(33, 13, 99.99, '2024-02-28', 'Credit Card'), (34, 14, 59.99, '2024-03-30', 'Credit Card'),
(35, 15, 89.99, '2024-04-28', 'PayPal'), (36, 16, 129.99, '2024-05-30', 'Bank Transfer'),
(37, 17, 49.99, '2024-06-28', 'Credit Card'), (38, 18, 119.99, '2024-07-30', 'PayPal'),
(39, 19, 179.99, '2024-08-28', 'Credit Card'), (40, 20, 199.99, '2024-09-30', 'Credit Card');

SELECT DISTINCT s.student_id, s.first_name, s.last_name
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount_paid > (
    SELECT AVG(amount_paid) 
    FROM Payments
);

SELECT course_id, course_name, course_fee
FROM Courses
WHERE course_fee > (
    SELECT AVG(course_fee) 
    FROM Courses
);

SELECT instructor_id, instructor_name, specialization
FROM Instructors
WHERE instructor_id IN (
    SELECT instructor_id
    FROM Courses
    WHERE course_fee = (SELECT MAX(course_fee) FROM Courses)
);

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id IN (
        SELECT course_id
        FROM Courses
        WHERE course_fee = (SELECT MAX(course_fee) FROM Courses)
    )
);

SELECT assignment_id, assignment_title, max_marks
FROM Assignments
WHERE max_marks > (
    SELECT AVG(max_marks) 
    FROM Assignments
);

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id 
    FROM Assignment_Submissions
);

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id NOT IN (
    SELECT student_id 
    FROM Assignment_Submissions 
    WHERE student_id IS NOT NULL
);

SELECT course_id, course_name
FROM Courses
WHERE course_id IN (
    SELECT course_id 
    FROM Enrollments
);

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT course_id 
    FROM Enrollments 
    WHERE course_id IS NOT NULL
);

SELECT instructor_id, instructor_name
FROM Instructors
WHERE instructor_id NOT IN (
    SELECT instructor_id 
    FROM Courses 
    WHERE instructor_id IS NOT NULL
);

SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE (
    
    SELECT SUM(amount_paid)
    FROM Payments p
    WHERE p.student_id = s.student_id
) > (
    
    SELECT AVG(amount_paid)
    FROM Payments
);