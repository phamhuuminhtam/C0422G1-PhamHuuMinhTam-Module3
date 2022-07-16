use quanlybanhang;

INSERT INTO customer (c_id, c_name, c_age) VALUES ('1', 'Minh Quan', '10'),
 ('2', 'Ngoc Oanh', '20'),
 ('3', 'Hong Ha', '50');

INSERT INTO `order` (o_id, c_id, o_date) VALUES ('1', '1', '2006/03/21'),
 ('2', '2', '2006/03/23'),
 ('3', '1', '2006/03/13');

INSERT INTO product (p_id, p_name, p_price) VALUES ('1', 'May Giat', '3'),
 ('2', 'Tu Lanh', '5'),
('3', 'Dieu Hoa', '7'),
 ('4', 'Quat', '1'),
('5', 'Bep Dien', '2');

INSERT INTO order_detail (o_id, p_id, od_qty) VALUES ('1', '1', '3'),
 ('1', '3', '7'),
 ('1', '4', '2'),
 ('2', '1', '1'),
('3', '1', '8'),
('2', '5', '4'),
('2', '3', '3');

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, c_id, o_date 
from `order`; 

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c_name AS Ten_KH, p_name AS Ten_SP, od_qty AS So_luong
FROM
    customer
        JOIN
    `order` ON customer.c_id = `order`.c_id
        JOIN
    order_detail ON `order`.o_id = order_detail.o_id
        JOIN
    product ON order_detail.p_id = product.p_id;
    

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    c_name AS Ten_KH 
FROM
    customer
       left JOIN
    `order` ON customer.c_id = `order`.c_id
WHERE o_id IS  NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    `order`.o_id as  ma_san_pham , o_date as ngay_ban, SUM(od_qty * p_price) AS total
FROM
    `order`
        JOIN
    order_detail ON `order`.o_id = order_detail.o_id
        JOIN
    product ON order_detail.p_id = product.p_id
GROUP BY ma_san_pham;






