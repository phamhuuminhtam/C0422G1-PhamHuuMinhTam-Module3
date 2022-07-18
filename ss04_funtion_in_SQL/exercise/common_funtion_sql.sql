use QuanLySinhVien ;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    `subject`
WHERE
    credit = (SELECT 
            MAX(Credit)
        FROM
            `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    `subject`.subid, subname, credit, `status`, mark AS max_mark
FROM
    `subject`
        JOIN
    mark ON `subject`.subid = mark.subid
WHERE
    mark = (SELECT 
            MAX(mark)
        FROM
            mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    student.StudentId,
    student.StudentName,
    Address,
    Phone,
    `Status`,
    ClassId,
    AVG(mark) AS average_mark
FROM
    student
        LEFT JOIN
    mark ON student.StudentId = mark.StudentId
GROUP BY student.StudentId
ORDER BY average_mark DESC;
