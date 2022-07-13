create database student_management;
create table Class(
id int,
`name` varchar(50)
);
create table Student(
id int,
`name` varchar(55),
age tinyint,
country varchar(40));

alter table Class add primary key (id);
alter table class change column `id` `id` int not null auto_increment;
alter table class change column `id` `id` int null, drop primary key;
alter table class add primary key (id), change column `id` `id` int not null auto_increment;
insert into class (`name`) value ('C0422G1');
insert into class (`name`) value ('C0522G1');
insert into class (`name`) value ('C0622G1');
insert into class (`name`) value ('C0722G1');
select * from class;
delete from class where `id` = 2;
select * from class;
set sql_safe_updates = 0;
delete from class  where `name` = "C0722G1";
set sql_safe_updates = 1;
select * from class;
update class set `name` = "C0722g1" where `id` = 1;
select * from class;
set sql_safe_updates = 0;
update class set `name` = "C0822g1" where `name` = "C0622G1";
set sql_safe_updates = 1;
select * from class;