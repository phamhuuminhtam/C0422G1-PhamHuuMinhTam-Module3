DROP DATABASE IF exists demo_view_index_sp;
CREATE DATABASE demo_view_index_sp;
USE demo_view_index_sp;

CREATE TABLE product (
Id INT PRIMARY KEY AUTO_INCREMENT,
product_code VARCHAR(20),
product_name VARCHAR(20),
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(60),
product_status BIT(2)
);

INSERT INTO product(product_code,product_name,product_price,product_amount,product_description,product_status) VALUES (1,'product1',20000,20,'khong có mô tả',1),
(2,'product1',20000,210,'khong có mô tả',0),
(3,'product2',30000,220,'khong có mô tả',0),
(4,'product3',40000,230,'có mô tả',0),
(5,'product4',50000,230,'khong có mô tả',1),
(6,'product2',60000,230,'có mô tả',1),
(7,'product2',70000,220,'khong có mô tả',0),
(8,'product3',80000,200,'có mô tả',1),
(9,'product8',90000,210,'có mô tả',1),
(10,'product9',220000,120,'khong có mô tả',0),
(11,'product10',120000,320,'có mô tả',1),
(12,'product11',220000,420,'có mô tả',0),
(13,'product1',230000,220,'có mô tả',0),
(14,'product11',240000,210,'khong có mô tả',1),
(15,'product14',250000,200,'có mô tả',0);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

CREATE index i_product_code ON product(product_code);
CREATE index i_product_name_price ON product(product_name,product_price);
DROP index i_product_code ON product;
DROP index i_product_name_price ON product;

explain SELECT product_code FROM product WHERE product_code ='14';
explain SELECT product_name FROM product WHERE product_name ="product11";


-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

CREATE VIEW product_sub_view AS
SELECT
product_Code, product_Name, product_Price, product_Status
FROM
product;

SELECT
*
FROM
product_sub_view;

SET sql_safe_updates=0;
UPDATE product_sub_view
SET
product_name = 'productVIP'
WHERE
product_status = 1;
SET sql_safe_updates=1;

SELECT
*
FROM
product;

INSERT INTO product_sub_view(product_Code, product_Name, product_Price, product_Status) VALUES (20,"productcheap",1000,0);

DROP view product_sub_view;

-- Tạo store PROCEDURE lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store PROCEDURE thêm một sản phẩm mới
-- Tạo store PROCEDURE sửa thông tin sản phẩm theo id
-- Tạo store PROCEDURE xoá sản phẩm theo id
delimiter $$
CREATE PROCEDURE get_info_product()
BEGIN
SELECT * FROM product;
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE insert_info_product(IN p_code varchar(20),p_name varchar(20),p_price double,p_amount int ,p_description varchar(60),p_status bit(2))
BEGIN
INSERT INTO product(product_code,product_name,product_price,product_amount,product_description,product_status) value (p_code,p_name,p_price,p_amount,p_description,p_status);
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE update_info_product_by_id(IN p_id int, p_code varchar(20),p_name varchar(20),p_price double,p_amount int ,p_description varchar(60),p_status bit(2))
BEGIN
UPDATE product SET product_code = p_code, product_name=p_name, product_price=p_price, product_amount=p_amount,product_description=p_description, product_status=p_status WHERE Id =p_id;
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE delete_product_by_id(IN p_id int)
BEGIN
DELETE FROM product WHERE Id =p_id;
END $$
delimiter ;

SELECT
*
FROM
product;

CALL get_info_product();
CALL insert_info_product(100,'productIns',990000,100,'có mô tả',1);
CALL update_info_product_by_id(17,15,'productChange',90000,200,'không có mô tả',0);
CALL delete_product_by_id(10);