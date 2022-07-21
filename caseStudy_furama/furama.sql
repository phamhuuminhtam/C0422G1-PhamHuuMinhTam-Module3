drop database if exists furama;
create database furama;
use furama;
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL
);
CREATE TABLE vi_tri (
    ma_vi_tri INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ma_vi_tri),
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    ma_trinh_do INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    ma_bo_phan INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE khach_hang (
    ma_khach_hang INT NOT NULL,
    PRIMARY KEY (ma_khach_hang),
    ma_loai_khach INT NOT NULL,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ma_loai_khach),
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE hop_dong (
    ma_hop_dong INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ma_hop_dong),
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL
);
CREATE TABLE dich_vu (
    ma_dich_vu INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ma_dich_vu),
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(45) NOT NULL,
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL
);

alter table nhan_vien add foreign key (ma_vi_tri) references vi_tri(ma_vi_tri);
alter table nhan_vien add foreign key (ma_trinh_do) references trinh_do(ma_trinh_do);
alter table nhan_vien add foreign key (ma_bo_phan) references bo_phan(ma_bo_phan);
alter table hop_dong add foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien);
alter table hop_dong add foreign key (ma_khach_hang) references khach_hang(ma_khach_hang);
alter table hop_dong add foreign key (ma_dich_vu) references dich_vu(ma_dich_vu);
alter table khach_hang add foreign key (ma_loai_khach) references loai_khach(ma_loai_khach);
alter table dich_vu	add foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue);
alter table dich_vu add foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu);
alter table hop_dong_chi_tiet add foreign key (ma_hop_dong) references hop_dong(ma_hop_dong);
alter table hop_dong_chi_tiet add foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem);



insert into vi_tri(ten_vi_tri) 
values ("Quản lý");

insert into vi_tri(ten_vi_tri)
values ("Nhân viên");
select * from vi_tri;
select * from trinh_do;
INSERt into trinh_do (ma_trinh_do, ten_trinh_do) VALuEs ('1', 'Trung Cấp');
INSErT into trinh_do (ma_trinh_do, ten_trinh_do) VALUEs ('2', 'cao đẳng');
INSERT iNTo trinh_do (ma_trinh_do, ten_trinh_do) VALUES ('3', 'đại Học');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES ('4', 'Sau đại học');
select * from trinh_do;
select * from bo_phan;
insert into bo_phan(ten_bo_phan) values ("Sale-Marketing");
insert into bo_phan(ten_bo_phan) values ("Hành chính");
insert into bo_phan(ten_bo_phan) values ("Phục vụ");
insert into bo_phan(ten_bo_phan) values ("Quản lý");
select * from bo_phan;

INSeRT into nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) VALUES
 ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
 ('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên bái, Đà Nẵng', '1', '2', '2'),
 ('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
 ('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, quảng Trị', '1', '4', '4'),
 ('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà nẵng', '2', '1', '1'),
 ('6', 'Khúc Nguyễn An nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
 ('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
 ('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
 ('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, đà nẵng', '2', '4', '4'),
 ('10', 'Nguyễn công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà khánh, đồng Nai', '2', '3', '2');
select * from nhan_vien;
select * from loai_khach;
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) vALUEs ('1', 'diamond');
iNSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALuES ('2', 'Platinium');
INSERT INTo loai_khach (ma_loai_khach, ten_loai_khach) VaLUES ('3', 'Gold');
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES ('4', 'Silver');
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUeS ('5', 'Member');
select * from loai_khach;
InSERT INTO khach_hang (ma_khach_hang, ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) 
VaLUES
('1', '5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, quảng Trị'),
('3', '1', 'Trương Đình Nghệ', '1990-02-27',1 , '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
('5', '4', 'Hoàng trần nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
('6', '4', 'Tôn Nữ Mộc châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà nẵng'),
('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, hồ Chí Minh'),
('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
('9', '1', 'Trần đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng ngãi'),
('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô quyền, Đà Nẵng');

SELECT * FROM khach_hang;
 INSERT INTO kieu_thue(ten_kieu_thue) 
 VALUES ("year"),("month"),("day"),("hour");
 
 sELECt * FROM kieu_thue;
 
 insert into loai_dich_vu(ten_loai_dich_vu) 
 values ("Villa"),("House"),("Room");
 select * from loai_dich_vu;

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem) 
VALUES 
('1', 'Villa Beach Front', '25000', 1000000, '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', NULL),
('2', 'House Princess 01', '14000', 5000000, '7', '2', '2', 'vip', 'Có thêm bếp nướng', NULL, '3', NULL),
('3', 'Room Twin 01', '5000', 1000000, '2', '4', '3', 'normal', 'Có tivi', NULL, NULL, '1 Xe máy, 1 Xe đạp'),
('4', 'Villa No Beach Front', '22000', 9000000, '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3', NULL),
('5', 'House Princess 02', '10000', 4000000, '5', '3', '2', 'normal', 'Có thêm bếp nướng', NULL, '2', NULL),
('6', 'Room Twin 02', '3000', 900000, '2', '4', '3', 'normal', 'Có tivi', NULL, NULL, '1 Xe máy');

INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) 
VALUES 
 ('1', 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
 ('2', 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
 ('3', 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
 ('4', 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
 ('5', 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
 ('6', 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) 
VALUES  
 ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
 ('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
 ('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
 ('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
 ('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
 ('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
 ('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
 ('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
 ('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
 ('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
 ('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
 ('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, ma_hop_dong, ma_dich_vu_di_kem, so_luong)
 VALUES 
 ('1', '2', '4', 5),
 ('2', '2', '5', 8),
 ('3', '2', '6', 15),
 ('4', '3', '1', 1),
 ('5', '3', '2', 11),
 ('6', '1', '3', 1),
 ('7', '1', '2', 2),
 ('8', '12', '2', 2);
 
-- câu 2-- 
select * from nhan_vien where nhan_vien.ho_ten regexp "^[HTK]" and char_length(ho_ten) <=15;

-- câu 3-- class
select	* from khach_hang where (timestampdiff(year,ngay_sinh,curdate()) >=18 and timestampdiff(year,ngay_sinh,curdate()) <=50) and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");

-- câu 4-- 	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    COUNT(*) AS so_lan_dat_phong
FROM
    loai_khach
        JOIN
    khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
WHERE
    loai_khach.ma_loai_khach = '1'
GROUP BY hop_dong.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- câu 5-- ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien -- 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).-- 
SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    CASE
        WHEN hop_dong_chi_tiet.so_luong IS NULL THEN dich_vu.chi_phi_thue
        ELSE dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)
    END AS tong_tien
FROM
    loai_khach
        LEFT JOIN
    khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        LEFT JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY CASE
    WHEN hop_dong.ma_hop_dong IS NULL THEN ho_ten
    ELSE hop_dong.ma_hop_dong
END;

-- câu 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).-- 
SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    (SELECT 
			ten_dich_vu,
            hop_dong.ma_dich_vu,
            ngay_lam_hop_dong,
            dich_vu.dien_tich,
            dich_vu.chi_phi_thue
    FROM
        hop_dong
    JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    WHERE
        (MONTH(ngay_lam_hop_dong) IN (1 , 2, 3)
            AND YEAR(ngay_lam_hop_dong) = 2021)) AS table1
    RIGHT JOIN dich_vu ON table1.ten_dich_vu = dich_vu.ten_dich_vu
        JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE
    table1.ten_dich_vu IS NULL;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
SELECT 
    table1.ma_dich_vu,
    table1.ten_dich_vu,
    table1.dien_tich,
    table1.so_nguoi_toi_da,
    table1.chi_phi_thue,
    table1.ten_loai_dich_vu
FROM
    (SELECT 
        ten_dich_vu,
            hop_dong.ma_dich_vu,
            ngay_lam_hop_dong,
            dich_vu.dien_tich,
            dich_vu.chi_phi_thue,
            dich_vu.so_nguoi_toi_da,
            loai_dich_vu.ten_loai_dich_vu AS ten_loai_dich_vu
    FROM
        hop_dong
    JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
    WHERE
        YEAR(ngay_lam_hop_dong) = 2020
    GROUP BY ten_dich_vu) AS table1
        LEFT JOIN
    (SELECT 
        ten_dich_vu,
            hop_dong.ma_dich_vu,
            ngay_lam_hop_dong,
            dich_vu.dien_tich,
            dich_vu.chi_phi_thue,
            dich_vu.so_nguoi_toi_da,
            loai_dich_vu.ten_loai_dich_vu AS ten_loai_dich_vu
    FROM
        hop_dong
    JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
    WHERE
        YEAR(ngay_lam_hop_dong) = 2021
    GROUP BY ten_dich_vu) AS table2 ON table1.ten_dich_vu = table2.ten_dich_vu
WHERE
    table2.ten_dich_vu IS NULL;
    
    
    
  --   8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
  
  SELECT 
        ho_ten
    FROM
        khach_hang
    GROUP BY ho_ten
    HAVING COUNT(*) > 1 ;
  
   SELECT DISTINCT
    ho_ten
FROM
    khach_hang
 HAVING COUNT(*) > 1 ; 
 
 SELECT 
        ho_ten
    FROM
        khach_hang
        union 
        SELECT 
        ho_ten
    FROM
        khach_hang;
 
--   9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT 
    MONTH(ngay_lam_hop_dong) as thang, COUNT(ma_hop_dong) as so_luong
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY MONTH(ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 

SELECT 
    hop_dong.ma_hop_dong,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    tien_dat_coc,
    SUM(so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY ma_hop_dong;

--  11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dich_vu_di_kem.ma_dich_vu_di_kem,
    dich_vu_di_kem.ten_dich_vu_di_kem
FROM
    loai_khach
        JOIN
    khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
WHERE
    loai_khach.ten_loai_khach ='Diamond'
        AND (dia_chi LIKE '%Vinh'
        OR dia_chi LIKE '%Quảng Ngãi');
        
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT 
    table1.ma_hop_dong,
    table1.ho_ten_nhan_vien,
    table1.ho_ten_khach_hang,
    table1.so_dien_thoai,
    table1.ma_dich_vu,
    table1.ten_dich_vu,
    table1.so_luong_dich_vu_di_kem,
    table1.tien_dat_coc
FROM
    (SELECT 
        hop_dong.ma_hop_dong,
            nhan_vien.ho_ten AS ho_ten_nhan_vien,
            khach_hang.ho_ten AS ho_ten_khach_hang,
            khach_hang.so_dien_thoai,
            dich_vu.ten_dich_vu,
            dich_vu.ma_dich_vu,
            SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem,
            hop_dong.tien_dat_coc,
            hop_dong.ngay_lam_hop_dong
    FROM
        loai_khach
    LEFT JOIN khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
    LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
    LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
    LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
    LEFT JOIN nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
    LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    WHERE
        MONTH(ngay_lam_hop_dong) IN (10 , 11, 12)
            AND YEAR(ngay_lam_hop_dong) = 2020
    GROUP BY khach_hang.ho_ten) AS table1
        LEFT JOIN
    (SELECT 
        dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong
    FROM
        hop_dong
    LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    WHERE
        (MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6)
            AND YEAR(ngay_lam_hop_dong) = 2021) AS table2 ON table1.ten_dich_vu = table2.ten_dich_vu
WHERE
    table2.ten_dich_vu IS NULL;
  --   --cách 2--
    SELECT 
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten,
    khach_hang.ho_ten,
    khach_hang.so_dien_thoai,
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem,
    hop_dong.tien_dat_coc
FROM
    loai_khach
        LEFT JOIN
    khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        LEFT JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE
    MONTH(ngay_lam_hop_dong) IN (10 , 11, 12)
        AND YEAR(ngay_lam_hop_dong) = 2020
        AND dich_vu.ten_dich_vu NOT IN 
        (SELECT 
            dich_vu.ten_dich_vu
        FROM
            hop_dong
                LEFT JOIN
            dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        WHERE
            (MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6)
                AND YEAR(ngay_lam_hop_dong) = 2021)
GROUP BY khach_hang.ma_khach_hang;
       
	
   --  13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT 
    hop_dong_chi_tiet.ma_dich_vu_di_kem,
    ten_dich_vu_di_kem,
    SUM(so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong_chi_tiet
        JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (SELECT 
        MAX(table1.tong)
    FROM
        (SELECT 
            SUM(so_luong) AS tong
        FROM
            hop_dong_chi_tiet
        GROUP BY ma_dich_vu_di_kem) AS table1);
       
        
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
 SELECT 
    hop_dong.ma_hop_dong,
    loai_dich_vu.ten_loai_dich_vu,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    table1.so_lan_su_dung
FROM
    loai_dich_vu
        JOIN
    dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
        JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    (SELECT 
        ma_dich_vu_di_kem,
            COUNT(ma_dich_vu_di_kem) AS so_lan_su_dung
    FROM
        hop_dong_chi_tiet
    GROUP BY ma_dich_vu_di_kem) AS table1 ON table1.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE
    so_lan_su_dung = 1
ORDER BY ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT 
    nhan_vien.ma_nhan_vien,
    ho_ten,
    ten_trinh_do,
    ten_bo_phan,
    so_dien_thoai,
    dia_chi
FROM
    nhan_vien
        JOIN
    trinh_do ON trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
        JOIN
    bo_phan ON bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
        JOIN
    hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
        RIGHT JOIN
    (SELECT 
        ma_nhan_vien, COUNT(ma_nhan_vien) AS so_lan
    FROM
        hop_dong
    WHERE
        YEAR(ngay_lam_hop_dong) IN (2020 , 2021)
    GROUP BY ma_nhan_vien
    HAVING so_lan <= 3) AS table1 ON nhan_vien.ma_nhan_vien = table1.ma_nhan_vien;
    
--     16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        temp.ma_nhan_vien
    FROM
        (SELECT 
            nhan_vien.ma_nhan_vien
        FROM
            hop_dong
        LEFT JOIN nhan_vien ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
        
        WHERE
            YEAR(ngay_lam_hop_dong) IN (2019,2020,2021)
        GROUP BY ma_nhan_vien)  as temp);
    set sql_safe_updates =1;
SELECT 
    *
FROM
    nhan_vien;
 
--  17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang = (SELECT 
            table1.ma_khach_hang
        FROM
            (SELECT 
                ten_loai_khach,
                    khach_hang.ma_khach_hang,
                    CASE
                        WHEN hop_dong_chi_tiet.so_luong IS NULL THEN SUM(dich_vu.chi_phi_thue)
                        ELSE dich_vu.chi_phi_thue +SUM( hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)
                    END AS tong_tien
            FROM
                loai_khach
            LEFT JOIN khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
            LEFT JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
            LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
            LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
            LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
            GROUP BY CASE
                WHEN hop_dong.ma_hop_dong IS NULL THEN ho_ten
                ELSE hop_dong.ma_hop_dong
            END) AS table1
        WHERE
            table1.tong_tien > 10000000
                AND table1.ten_loai_khach = 'platinium');
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).-- 
 set sql_safe_updates = 0;
 set foreign_key_checks =0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        hop_dong
    
    WHERE
        YEAR(ngay_lam_hop_dong) < 2021);
  set foreign_key_checks =1;
  set sql_safe_updates = 1;
SELECT 
    *
FROM
    khach_hang;
    
    
--  19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
 set sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet
                JOIN
            hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2020
        GROUP BY ma_dich_vu_di_kem
        HAVING SUM(so_luong) > 10);
   set sql_safe_updates =1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien AS ID,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien 
UNION ALL SELECT 
    ma_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;
    -- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
    CREATE VIEW v_nhan_vien_1 AS
    SELECT * FROM
    NHAN_VIEN
    WHERE NHAN_VIEN.DIA_CHI  like '%Nguyễn Chí Thanh%';
    CREATE VIEW v_nhan_vien_2 AS
    SELECT * FROM
    hop_dong
    WHERE ngay_lam_hop_dong ='2021-09-02';
    
    create view v_nhan_vien as
    select v_nhan_vien_2.ma_nhan_vien, dia_chi from v_nhan_vien_1 join v_nhan_vien_2 on v_nhan_vien_2.ma_nhan_vien = v_nhan_vien_1.ma_nhan_vien;
    select * from v_nhan_vien;
    
   --  22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
   set sql_safe_updates =0;
	   UPDATE v_nhan_vien 
SET 
    dia_chi = replace(dia_chi,'Nguyễn Chí Thanh','Liên Chiểu');
     set sql_safe_updates =1
     
  --    23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
  delimiter $$
  create Procedure sp_xoa_khach_hang(in ma_khach_hang_in int)
  begin
  set sql_safe_updates =0;
  set foreign_key_checks = 0;
  delete from khach_hang where ma_khach_hang = ma_khach_hang_in;
  set foreign_key_checks = 1;
  set sql_safe_updates =1;
  end $$
  delimiter ;
  
call sp_xoa_khach_hang(5);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter $$
  create Procedure sp_them_moi_hop_dong(in ngay_lam_hop_dong_in date, ngay_ket_thuc_in date , tien_dat_coc_in double, ma_nhan_vien_in int , ma_khach_hang_in int , ma_dich_vu_in int)
  begin
  if (ma_nhan_vien_in not in (select ma_nhan_vien from nhan_vien) or ma_khach_hang_in not in (select ma_khach_hang from khach_hang) or ma_dich_vu_in not in (select ma_dich_vu from dich_vu)) 
  then signal sqlstate '45000' set message_text = 'mã nhân viên/mã khách hàng/mã dịch vụ chưa tồn tại, vui lòng nhập lại';
  else
    insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    value (ngay_lam_hop_dong_in, ngay_ket_thuc_in , tien_dat_coc_in, ma_nhan_vien_in, ma_khach_hang_in  , ma_dich_vu_in ) ;
    end if;
   end $$
  delimiter ;
  call sp_them_moi_hop_dong('2021-06-07','2021-07-07', 1000000,3,9,3);
  
--   25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

create view cout as
select count(*)  from hop_dong;

drop trigger if exists tr_xoa_hop_dong;

delimiter $$
  create trigger tr_xoa_hop_dong
  after delete 
  on hop_dong
  for each row
  begin
  declare dem int default 0;
  declare str varchar(100);
  set dem = (select *  from cout);
  set str = concat('số lượng hợp đồng sau khi xóa là : ',cast(dem as char));
 signal sqlstate '45000' set message_text = str;
   end $$
  delimiter ;
  
  
set sql_safe_updates =0;
set foreign_key_checks =0;
delete from hop_dong where ma_hop_dong='12';
set foreign_key_checks =1;
set sql_safe_updates =1;





