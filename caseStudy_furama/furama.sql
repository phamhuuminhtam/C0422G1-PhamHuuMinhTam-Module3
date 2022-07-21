use furama;
 
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
    coalesce(sum(so_luong),0) AS so_luong_dich_vu_di_kem
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
            where ten_loai_khach  = 'platinium'
            GROUP BY khach_hang.ma_khach_hang
            having tong_tien>1000000            
           )as table1) ;
        
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
    
    
    create view v_nhan_vien_v2 as
    select nhan_vien.* from nhan_vien join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
    where ngay_lam_hop_dong = '2021-09-02' and dia_chi like '%Nguyễn Chí Thanh%';
   --  22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
   set sql_safe_updates =0;
	   UPDATE v_nhan_vien_v2 
SET 
    dia_chi = replace(dia_chi,'Nguyễn Chí Thanh','Liên Chiểu');
     set sql_safe_updates =1;
     
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

create table log_c(
id int auto_increment primary key,
mess varchar(100),
time_log datetime
);

truncate table log_c;

drop trigger if exists tr_xoa_hop_dong;
delimiter $$
  create trigger tr_xoa_hop_dong
  after delete 
  on hop_dong
  for each row
  begin
  declare dem int;
  declare str varchar(50);
  select count(*) into dem from hop_dong; 
  set str = concat('số lượng hợp đồng còn lại sau khi xóa là : ',cast(dem as char));
  insert into log_c(mess,time_log) values (str,now()); 
     end $$
  delimiter ;
  
  
set sql_safe_updates =0;
set foreign_key_checks =0;
delete from hop_dong where hop_dong.ma_hop_dong =9;
set foreign_key_checks =1;
set sql_safe_updates =1;

select * from log_c;



