drop database if exists demo_view_index_sp;
create database demo_view_index_sp;
use demo_view_index_sp;

CREATE TABLE product (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(20),
    product_name VARCHAR(20),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(60),
    product_status BIT(2)
);

insert into product(product_code,product_name,product_price,product_amount,product_description,product_status) values (1,'product1',20000,20,'khong có mô tả',1),
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

create index i_product_code on product(product_code);
create index i_product_name_price on product(product_name,product_price);
drop index i_product_code on product;
drop index i_product_name_price on product;

explain select  product_code from product where product_code ='14';
explain select  product_name from product where product_name ="product11";


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

set sql_safe_updates=0;
UPDATE product_sub_view 
SET 
    product_name = 'productVIP'
WHERE
    product_status = 1;
set sql_safe_updates=1;

SELECT 
    *
FROM
    product;

insert into product_sub_view(product_Code, product_Name, product_Price, product_Status) values (20,"productcheap",1000,0);

drop view product_sub_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id
delimiter $$
create procedure get_info_product()
begin
select * from product;
end $$
delimiter ;

delimiter $$
create procedure insert_info_product(IN p_code varchar(20),p_name  varchar(20),p_price double,p_amount int ,p_description  varchar(60),p_status bit(2))
begin
insert into product(product_code,product_name,product_price,product_amount,product_description,product_status) value (p_code,p_name,p_price,p_amount,p_description,p_status);
end $$
delimiter ;

delimiter $$
create procedure update_info_product_by_id(IN p_id int, p_code varchar(20),p_name  varchar(20),p_price double,p_amount int ,p_description  varchar(60),p_status bit(2))
begin
update  product set product_code = p_code, product_name=p_name, product_price=p_price, product_amount=p_amount,product_description=p_description, product_status=p_status where Id =p_id;
end $$
delimiter ;

delimiter $$
create procedure delete_product_by_id(IN p_id int)
begin
delete from  product where Id =p_id;
end $$
delimiter ;

SELECT 
    *
FROM
    product;
    
call get_info_product();
call insert_info_product(100,'productIns',990000,100,'có mô tả',1);
call update_info_product_by_id(17,15,'productChange',90000,200,'không có mô tả',0);
call delete_product_by_id(10);
