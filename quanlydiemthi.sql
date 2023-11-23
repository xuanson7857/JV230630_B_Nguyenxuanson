CREATE SCHEMA QUANLYDIEMTHI;
CREATE TABLE STUDENT
(
    studentId   VARCHAR(4) PRIMARY KEY NOT NULL,
    studentName VARCHAR(100)           NOT NULL,
    birthday    DATE                   NOT NULL,
    gender      BIT(1)                 NOT NULL,
    address     TEXT                   NOT NULL,
    phoneNumber VARCHAR(45)
);

CREATE TABLE SUBJECT
(
    subjectId   VARCHAR(4) PRIMARY KEY NOT NULL,
    subjectName VARCHAR(45)            NOT NULL,
    priority    INT(11)                NOT NULL
);

CREATE TABLE  MARK
(
    subjectId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_sbid_mark FOREIGN KEY (subjectId) REFERENCES SUBJECT (subjectId),
    studentId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_stid_mark FOREIGN KEY (studentId) REFERENCES STUDENT (studentId),
    point     DOUBLE
);

drop schema if exists QUANLYDIEMTHI;
CREATE SCHEMA QUANLYDIEMTHI;
USE QUANLYDIEMTHI;
CREATE TABLE STUDENT
(
    studentId   VARCHAR(4) PRIMARY KEY NOT NULL,
    studentName VARCHAR(100)           NOT NULL,
    birthday    DATE                   NOT NULL,
    gender      BIT(1)                 NOT NULL,
    address     TEXT                   NOT NULL,
    phoneNumber VARCHAR(45) UNIQUE
);

CREATE TABLE SUBJECT
(
    subjectId   VARCHAR(4) PRIMARY KEY NOT NULL,
    subjectName VARCHAR(45)            NOT NULL,
    priority    INT(11)                NOT NULL
);

CREATE TABLE  MARK
(
    subjectId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_sbid_mark FOREIGN KEY (subjectId) REFERENCES SUBJECT (subjectId),
    studentId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_stid_mark FOREIGN KEY (studentId) REFERENCES STUDENT (studentId),
    point     DOUBLE
);

INSERT INTO STUDENT
VALUES ('S001', 'Nguyễn Thế Anh', '1999/1/11', 1, 'Hà Nội', 984678082),
       ('S002', 'Đặng Bảo Trâm', '1998/12/22', 0, 'Lào Cai', 904982654),
       ('S003', 'Trần Hà Phương', '2000/5/5', 0, 'Nghệ An', 947645363),
       ('S004', 'Đỗ Tiến Mạnh', '1999/3/26', 1, 'Hà Nội', 983665353),
       ('S005', 'Phạm Duy Nhất', '1998/10/4', 1, 'Tuyên Quang', 978242678),
       ('S006', 'Mai Văn Thái', '2002/6/22', 1, 'Nam Định', 982654268),
       ('S007', 'Giang Gia Hân', '1996/11/10', 0, 'Phú Thọ', 982364753),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999/1/22', 0, 'Hà Nam', 927867453),
       ('S009', 'Nguyễn Tiến Đạt', '1998/8/7', 1, 'Tuyên Quang', 989274673),
       ('S010', 'Nguyễn Thiều Quang', '2000/9/18', 1, 'Hà Nội', 984378291);
       
INSERT INTO SUBJECT
VALUES ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

INSERT INTO MARK
VALUES ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),

       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),

       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),

       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),

       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),

       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),

       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),

       ('MH01', 'S008', 10),
('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 6),
       ('MH05', 'S008', 9.5),

       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),

       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);
-- 2. Cập nhật dữ liệu [10 điểm]: 
-- - Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
UPDATE STUDENT
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';
  
-- - Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
   UPDATE SUBJECT
SET subjectName = 'Ngoại Ngữ'
WHERE subjectId = 'MH05';   

-- - Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
-- MH05 : 9).
UPDATE MARK
SET point = 8.5
WHERE subjectId = 'MH01'
  AND studentId = 'S009';
UPDATE MARK
SET point = 7
where subjectId = 'MH02'
  AND studentId = 'S009';
UPDATE MARK
SET point = 5.5
WHERE subjectId = 'MH03'
  AND studentId = 'S009';
UPDATE MARK
SET point = 6
WHERE subjectId = 'MH04'
  AND studentId = 'S009';
UPDATE MARK
SET point = 9
WHERE subjectId = 'MH05'
  AND studentId = 'S009';
  select * from mark;
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
-- này ở bảng STUDENT.
DELETE FROM MARK WHERE studentId = "S010";
DELETE FROM STUDENT WHERE studentId = "S010";
-- Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
SELECT STUDENT.studentName FROM STUDENT;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
SELECT STUDENT.studentName,MARK.subjectId 
FROM STUDENT 
INNER JOIN MARK 
ON STUDENT.studentId = MARK.studentId;
-- Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]


SELECT 
    s.studentId,
    s.studentName,
    YEAR(CURDATE()) - YEAR(birthday) AS age,
    CASE
        WHEN gender = 1 THEN 'Nam'
        ELSE 'Nữ'
    END AS gender,
    address
FROM STUDENT s;



-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]

SELECT STUDENT.studentName, SUBJECT.subjectName, MARK.point
FROM STUDENT
JOIN MARK ON STUDENT.studentId = MARK.studentId
JOIN SUBJECT ON MARK.subjectId = SUBJECT.subjectId
WHERE SUBJECT.subjectName = 'Toán'
ORDER BY MARK.point DESC;



   --     Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT 
    CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS gender,
    COUNT(*) AS count
FROM student
GROUP BY gender;


-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
SELECT STUDENT.studentId, STUDENT.studentName, SUM(MARK.point) AS 'Tổng điểm', AVG(MARK.point) AS "Điểm trung bình"
FROM STUDENT
JOIN MARK ON STUDENT.studentId = MARK.studentId
GROUP BY student.studentId, student.studentName;


-- Bài 4: Tạo View, Index, Procedure [20 điểm]:

-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán . [3 điểm]


CREATE VIEW STUDENT_VIEW AS
SELECT studentId, studentName, gender, address
FROM Student;

-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học . [3 điểm]

CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT s.studentId, s.studentName, AVG(MARK.point) AS "điểm trung bình"
FROM STUDENT s
JOIN MARK ON s.studentId = MARK.studentId
GROUP BY s.studentId, s.studentName;


-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]

CREATE INDEX IndexName
ON STUDENT (phoneNumber);

-- 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó. [4 điểm]

DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN studentId INT,
    IN studentName VARCHAR(255),
    IN birthday DATE,
    IN gender VARCHAR(10),
    IN address VARCHAR(255),
    IN phoneNumber VARCHAR (45)
)
BEGIN
    -- Câu lệnh INSERT
    INSERT INTO STUDENT (studentId, studentName,birthday, gender, address,phoneNumber)
    VALUES (studentId, studentName,birthday, gender, address,phoneNumber);
  
END //
DELIMITER ;

-- --Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
-- [4 điểm]


DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN subjectId VARCHAR(255),
    IN subjectName VARCHAR(255)
)
BEGIN
    UPDATE SUBJECT
    SET subjectName = SUBJECT.subjectName
    WHERE SUBJECT.subjectId = subjectId;
END //
DELIMITER ;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
-- sinh và trả về số bản ghi đã xóa. [4 điểm]
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(
    IN studentId INT,
    OUT deletedCount INT
)
BEGIN
    DECLARE count INT;
    SET count = 0;
    DELETE FROM MARK
    WHERE studentId = studentId;
    SET count = ROW_COUNT();
    SET deletedCount = count;
    
END //
DELIMITER ;

