drop database if exists quanlydonhang;
create database quanlydonhang;
use quanlydonhang;

CREATE TABLE phieu_xuat (
    so_px INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(50)
);

CREATE TABLE chi_tiet_phieu_xuat (
    DG_Xuat DOUBLE NOT NULL,
    SL_Xuat INT NOT NULL,
    so_px INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    PRIMARY KEY (so_px , ma_vat_tu),
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);


CREATE TABLE nha_cung_cap (
    ma_ncc INT PRIMARY KEY,
    ten_ncc VARCHAR(50),
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(20)
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(20) PRIMARY KEY,
    ma_ncc INT,
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc)
);

CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY,
    ngay_don_hang DATE,
    ma_ncc INT,
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc)
);

CREATE TABLE chi_tiet_don_dat_hang (
    so_don_hang INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_don_hang , ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_pn INT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    dg_nhap DOUBLE,
    sl_nhap INT,
    so_pn INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_pn , ma_vat_tu),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn)
);

