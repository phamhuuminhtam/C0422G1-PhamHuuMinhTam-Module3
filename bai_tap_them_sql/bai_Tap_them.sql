-- 1.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
SELECT 
    instructor_id, instructor_name, faculty_name
FROM
    instructor
        JOIN
    faculty ON faculty.faculty_id = instructor.faculty_id;

-- 2.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
SELECT 
    instructor_id, instructor_name, faculty_name
FROM
    instructor
        JOIN
    faculty ON faculty.faculty_id = instructor.faculty_id
WHERE
    faculty_name LIKE 'DIA LY va QLTN';
-- 3.	Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
SELECT 
    COUNT(*) AS so_luong_sv_khoa_CONG_NGHE_SINH_HOC
FROM
    student
        JOIN
    faculty ON faculty.faculty_id = student.faculty_id
WHERE
    faculty_name LIKE 'CONG NGHE SINH HOC';
-- 4.	Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
SELECT 
    student_id, student_name, year(now())- date_of_birth as tuoi
FROM
    student
        JOIN
    faculty ON faculty.faculty_id = student.faculty_id
WHERE
    faculty_name LIKE 'TOAN';
-- 5.	Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
SELECT 
    COUNT(*) AS 'số giảng viên của khoa ‘CONG NGHE SINH HOC’'
FROM
    instructor
        JOIN
    faculty ON faculty.faculty_id = instructor.faculty_id
WHERE
    faculty_name LIKE 'CONG NGHE SINH HOC';
-- 6.	Cho biết thông tin về sinh viên không tham gia thực tập
SELECT 
    *
FROM
    student
WHERE
    student_id NOT IN (SELECT 
            student_id
        FROM
            instructor_student);
-- 7.	Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT 
    faculty.faculty_id, faculty_name, COUNT(*) AS so_giang_vien
FROM
    instructor
        JOIN
    faculty ON faculty.faculty_id = instructor.faculty_id
GROUP BY faculty_id;
-- 8.	Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
SELECT 
   faculty_name, phone
FROM
    student
        JOIN
    faculty ON faculty.faculty_id = student.faculty_id
WHERE
    student_name LIKE 'Le van son';
    
--     Phần 2.
-- 1.	Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
select instructor_name, project.project_id,project_name from instructor join instructor_student on instructor.instructor_id = instructor_student.instructor_id
join project on project.project_id = instructor_student.project_id
where instructor.instructor_id =15;

-- 2.	Cho biết tên đề tài không có sinh viên nào thực tập
select project.project_name from project
where project_id not in
(select project.project_id from student join instructor_student on student.student_id = instructor_student.student_id
join project on project.project_id = instructor_student.project_id);
-- 3.	Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
select *, count(instructor.instructor_id) as dem from instructor join instructor_student
on  instructor.instructor_id =instructor_student.instructor_id 
group by instructor.instructor_id
having dem >2;
-- 4.	Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
SELECT 
    *
FROM
    project
WHERE
    expense IN (SELECT 
            MAX(expense)
        FROM
            project);
-- 5.	Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập

select project.project_id, project_name  from project join instructor_student on project.project_id = instructor_student.project_id
group by project_id
having count(instructor_student.student_id)>2 ;


-- 6.	Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’

-- 7.	Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
-- 8.	Cho biết thông tin về các sinh viên thực tập tại quê nhà
-- 9.	Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
-- 10.	 Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0

