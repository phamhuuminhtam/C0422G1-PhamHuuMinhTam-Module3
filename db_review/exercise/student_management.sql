drop database if exists student_management;
create database student_management;
use student_management;
CREATE TABLE Class (
    id INT,
    `name` VARCHAR(50)
);
CREATE TABLE Student (
    id INT,
    `name` VARCHAR(55),
    age TINYINT,
    country VARCHAR(40)
);

alter table Class 
add primary key (id);

alter table class 
change column `id` `id` int not null auto_increment;

alter table class 
change column `id` `id` int null, drop primary key;

alter table class 
add primary key (id), 
change column `id` `id` int not null auto_increment;

insert into class (`name`) 
value ('C0422G1');

insert into class (`name`) 
value ('C0522G1');

insert into class (`name`) 
value ('C0622G1');

insert into class (`name`)
 value ('C0722G1');
 
SELECT 
    *
FROM
    class;

DELETE FROM class 
WHERE
    `id` = 2;
 
SELECT 
    *
FROM
    class;

set sql_safe_updates = 0;
DELETE FROM class 
WHERE
    `name` = 'C0722G1';
set sql_safe_updates = 1;

SELECT 
    *
FROM
    class;

UPDATE class 
SET 
    `name` = 'C0722g1'
WHERE
    `id` = 1;

SELECT 
    *
FROM
    class;

set sql_safe_updates = 0;
UPDATE class 
SET 
    `name` = 'C0822g1'
WHERE
    `name` = 'C0622G1';
set sql_safe_updates = 1;
SELECT 
    *
FROM
    class;