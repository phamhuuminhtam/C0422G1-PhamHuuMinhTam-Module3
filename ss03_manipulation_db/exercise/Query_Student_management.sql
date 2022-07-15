USE quanlysinhvien;

SELECT 
    *
FROM
    student
WHERE
    StudentName LIKE 'H%';

SELECT 
    *
FROM
    class
WHERE
    MONTH(StartDate) = 12;

SELECT 
    *
FROM
    subject
WHERE
    Credit BETWEEN 3 AND 5;

SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET 
    classid = 2
WHERE
    studentname = 'Hung';
SET SQL_SAFE_UPDATES = 1;
SELECT 
    *
FROM
    student;

SELECT 
    studentName, subname, mark
FROM
    student
        JOIN
    mark ON student.StudentId = mark.StudentId
        JOIN
    subject ON mark.SubId = subject.SubId
ORDER BY Mark DESC , StudentName ASC;


