drop database if exists quanlydonhang;
create database quanlydonhang;
use quanlydonhang;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date not null);

create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(50)
);

create table chi_tiet_phieu_xuat(
DG_Xuat double not null,
SL_Xuat int not null,
so_px int not null, 
ma_vat_tu int not null,
primary key(so_px,ma_vat_tu),
foreign key (so_px) references phieu_xuat(so_px)  ,
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu) 
);


create table nha_cung_cap(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50),
so_dien_thoai varchar(20)
);

create table so_dien_thoai(
so_dien_thoai varchar(20) primary key,
ma_ncc int,
foreign key (ma_ncc) references nha_cung_cap(ma_ncc)
);

create table don_dat_hang(
so_don_hang int primary key,
ngay_don_hang date,
ma_ncc int,
foreign key (ma_ncc) references nha_cung_cap(ma_ncc)
);

create table chi_tiet_don_dat_hang(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang,ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int,
so_pn int,
ma_vat_tu int,
primary key(so_pn,ma_vat_tu),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn)
);

