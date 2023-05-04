/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     4/27/2023 6:51:42 PM                         */
/*==============================================================*/

--QLKS
USE master
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDATPHONG') and o.name = 'FK_CHITIETD_CHITIETDA_PHONG')
alter table CHITIETDATPHONG
   drop constraint FK_CHITIETD_CHITIETDA_PHONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDATPHONG') and o.name = 'FK_CHITIETD_CHITIETDA_PHIEUDAT')
alter table CHITIETDATPHONG
   drop constraint FK_CHITIETD_CHITIETDA_PHIEUDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDV') and o.name = 'FK_CHITIETD_CHITIETDV_KHUNGGIO')
alter table CHITIETDV
   drop constraint FK_CHITIETD_CHITIETDV_KHUNGGIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDV') and o.name = 'FK_CHITIETD_CHITIETDV_DICHVU')
alter table CHITIETDV
   drop constraint FK_CHITIETD_CHITIETDV_DICHVU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DANHGIA') and o.name = 'FK_DANHGIA_DANHGIA_PHONG')
alter table DANHGIA
   drop constraint FK_DANHGIA_DANHGIA_PHONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DANHGIA') and o.name = 'FK_DANHGIA_DANHGIA2_THONGTIN')
alter table DANHGIA
   drop constraint FK_DANHGIA_DANHGIA2_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HANHLI') and o.name = 'FK_HANHLI_CO_THONGTIN')
alter table HANHLI
   drop constraint FK_HANHLI_CO_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HANHLI') and o.name = 'FK_HANHLI_THUOC_PHONG')
alter table HANHLI
   drop constraint FK_HANHLI_THUOC_PHONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONDV') and o.name = 'FK_HOADONDV_DK_PHIEU_DK')
alter table HOADONDV
   drop constraint FK_HOADONDV_DK_PHIEU_DK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONDV') and o.name = 'FK_HOADONDV_LAPHD2_NHANVIEN')
alter table HOADONDV
   drop constraint FK_HOADONDV_LAPHD2_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONDV') and o.name = 'FK_HOADONDV_TRA2_THONGTIN')
alter table HOADONDV
   drop constraint FK_HOADONDV_TRA2_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONPHONG') and o.name = 'FK_HOADONPH_LAPHD_NHANVIEN')
alter table HOADONPHONG
   drop constraint FK_HOADONPH_LAPHD_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONPHONG') and o.name = 'FK_HOADONPH_QUANLI_PHIEUDAT')
alter table HOADONPHONG
   drop constraint FK_HOADONPH_QUANLI_PHIEUDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADONPHONG') and o.name = 'FK_HOADONPH_TRA_THONGTIN')
alter table HOADONPHONG
   drop constraint FK_HOADONPH_TRA_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDATPHONG') and o.name = 'FK_PHIEUDAT_DANGKY_THONGTIN')
alter table PHIEUDATPHONG
   drop constraint FK_PHIEUDAT_DANGKY_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDATPHONG') and o.name = 'FK_PHIEUDAT_LAPPDK_NHANVIEN')
alter table PHIEUDATPHONG
   drop constraint FK_PHIEUDAT_LAPPDK_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDKTOUR') and o.name = 'FK_PHIEUDKT_DANGKY3_THONGTIN')
alter table PHIEUDKTOUR
   drop constraint FK_PHIEUDKT_DANGKY3_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDKTOUR') and o.name = 'FK_PHIEUDKT_DKTOUR_TOUR')
alter table PHIEUDKTOUR
   drop constraint FK_PHIEUDKT_DKTOUR_TOUR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDKTOUR') and o.name = 'FK_PHIEUDKT_LAPPDK3_NHANVIEN')
alter table PHIEUDKTOUR
   drop constraint FK_PHIEUDKT_LAPPDK3_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUVCHL') and o.name = 'FK_PHIEUVCH_DANGKY4_THONGTIN')
alter table PHIEUVCHL
   drop constraint FK_PHIEUVCH_DANGKY4_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUVCHL') and o.name = 'FK_PHIEUVCH_LAPPDK4_NHANVIEN')
alter table PHIEUVCHL
   drop constraint FK_PHIEUVCH_LAPPDK4_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_DKDV_SP') and o.name = 'FK_PHIEU_DK_DANGKY2_THONGTIN')
alter table PHIEU_DKDV_SP
   drop constraint FK_PHIEU_DK_DANGKY2_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_DKDV_SP') and o.name = 'FK_PHIEU_DK_DK2_SANPHAM')
alter table PHIEU_DKDV_SP
   drop constraint FK_PHIEU_DK_DK2_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_DKDV_SP') and o.name = 'FK_PHIEU_DK_LAPPDK2_NHANVIEN')
alter table PHIEU_DKDV_SP
   drop constraint FK_PHIEU_DK_LAPPDK2_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_DKDV_SP') and o.name = 'FK_PHIEU_DK_RELATIONS_CHITIETD')
alter table PHIEU_DKDV_SP
   drop constraint FK_PHIEU_DK_RELATIONS_CHITIETD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_SDDV') and o.name = 'FK_PHIEU_SD_GOM_PHIEU_DK')
alter table PHIEU_SDDV
   drop constraint FK_PHIEU_SD_GOM_PHIEU_DK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEU_SDDV') and o.name = 'FK_PHIEU_SD_SUDUNG_THONGTIN')
alter table PHIEU_SDDV
   drop constraint FK_PHIEU_SD_SUDUNG_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TOUR') and o.name = 'FK_TOUR_CUNGCAP_DOITACLU')
alter table TOUR
   drop constraint FK_TOUR_CUNGCAP_DOITACLU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UUDAI') and o.name = 'FK_UUDAI_UUDAI_KHUYENMA')
alter table UUDAI
   drop constraint FK_UUDAI_UUDAI_KHUYENMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UUDAI') and o.name = 'FK_UUDAI_UUDAI2_THONGTIN')
alter table UUDAI
   drop constraint FK_UUDAI_UUDAI2_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VANCHUYEN') and o.name = 'FK_VANCHUYE_VANCHUYEN_HANHLI')
alter table VANCHUYEN
   drop constraint FK_VANCHUYE_VANCHUYEN_HANHLI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VANCHUYEN') and o.name = 'FK_VANCHUYE_VANCHUYEN_PHIEUVCH')
alter table VANCHUYEN
   drop constraint FK_VANCHUYE_VANCHUYEN_PHIEUVCH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDATPHONG')
            and   name  = 'CHITIETDATPHONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDATPHONG.CHITIETDATPHONG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDATPHONG')
            and   name  = 'CHITIETDATPHONG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDATPHONG.CHITIETDATPHONG2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETDATPHONG')
            and   type = 'U')
   drop table CHITIETDATPHONG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDV')
            and   name  = 'CHITIETDV_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDV.CHITIETDV_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDV')
            and   name  = 'CHITIETDV2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDV.CHITIETDV2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETDV')
            and   type = 'U')
   drop table CHITIETDV
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DANHGIA')
            and   name  = 'DANHGIA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DANHGIA.DANHGIA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DANHGIA')
            and   name  = 'DANHGIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DANHGIA.DANHGIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANHGIA')
            and   type = 'U')
   drop table DANHGIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DICHVU')
            and   type = 'U')
   drop table DICHVU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOITACLUHANH')
            and   type = 'U')
   drop table DOITACLUHANH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HANHLI')
            and   name  = 'CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index HANHLI.CO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HANHLI')
            and   name  = 'THUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index HANHLI.THUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HANHLI')
            and   type = 'U')
   drop table HANHLI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONDV')
            and   name  = 'TRA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONDV.TRA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONDV')
            and   name  = 'LAPHD2_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONDV.LAPHD2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONDV')
            and   name  = 'DK_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONDV.DK_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADONDV')
            and   type = 'U')
   drop table HOADONDV
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONPHONG')
            and   name  = 'TRA3_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONPHONG.TRA3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONPHONG')
            and   name  = 'LAPHD_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONPHONG.LAPHD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADONPHONG')
            and   name  = 'QUANLI_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADONPHONG.QUANLI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADONPHONG')
            and   type = 'U')
   drop table HOADONPHONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHUNGGIODV')
            and   type = 'U')
   drop table KHUNGGIODV
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHUYENMAI')
            and   type = 'U')
   drop table KHUYENMAI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHANVIEN')
            and   type = 'U')
   drop table NHANVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDATPHONG')
            and   name  = 'DANGKY_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDATPHONG.DANGKY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDATPHONG')
            and   name  = 'LAPPDK_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDATPHONG.LAPPDK_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUDATPHONG')
            and   type = 'U')
   drop table PHIEUDATPHONG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDKTOUR')
            and   name  = 'DANGKY3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDKTOUR.DANGKY3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDKTOUR')
            and   name  = 'LAPPDK3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDKTOUR.LAPPDK3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDKTOUR')
            and   name  = 'DKTOUR_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDKTOUR.DKTOUR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUDKTOUR')
            and   type = 'U')
   drop table PHIEUDKTOUR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUVCHL')
            and   name  = 'DANGKY4_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUVCHL.DANGKY4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUVCHL')
            and   name  = 'LAPPDK4_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUVCHL.LAPPDK4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUVCHL')
            and   type = 'U')
   drop table PHIEUVCHL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_DKDV_SP')
            and   name  = 'DANGKY2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_DKDV_SP.DANGKY2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_DKDV_SP')
            and   name  = 'LAPPDK2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_DKDV_SP.LAPPDK2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_DKDV_SP')
            and   name  = 'RELATIONSHIP_23_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_DKDV_SP.RELATIONSHIP_23_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_DKDV_SP')
            and   name  = 'DK2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_DKDV_SP.DK2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEU_DKDV_SP')
            and   type = 'U')
   drop table PHIEU_DKDV_SP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_SDDV')
            and   name  = 'SUDUNG_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_SDDV.SUDUNG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEU_SDDV')
            and   name  = 'GOM_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEU_SDDV.GOM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEU_SDDV')
            and   type = 'U')
   drop table PHIEU_SDDV
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHONG')
            and   type = 'U')
   drop table PHONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANPHAM')
            and   type = 'U')
   drop table SANPHAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THONGTINDOAN')
            and   type = 'U')
   drop table THONGTINDOAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TOUR')
            and   name  = 'CUNGCAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index TOUR.CUNGCAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TOUR')
            and   type = 'U')
   drop table TOUR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UUDAI')
            and   name  = 'UUDAI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index UUDAI.UUDAI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UUDAI')
            and   name  = 'UUDAI_FK'
            and   indid > 0
            and   indid < 255)
   drop index UUDAI.UUDAI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UUDAI')
            and   type = 'U')
   drop table UUDAI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VANCHUYEN')
            and   name  = 'VANCHUYEN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index VANCHUYEN.VANCHUYEN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VANCHUYEN')
            and   name  = 'VANCHUYEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index VANCHUYEN.VANCHUYEN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VANCHUYEN')
            and   type = 'U')
   drop table VANCHUYEN
go

if db_id ('QLKS') is not null
	drop database QLKS
go

create database QLKS
go

use QLKS
go

/*==============================================================*/
/* Table: CHITIETDATPHONG                                       */
/*==============================================================*/
create table CHITIETDATPHONG (
   MAPDK                varchar(15)          not null,
   MAPHONG              varchar(8)           not null,
   NOTE                 nvarchar(50)          null,
   constraint PK_CHITIETDATPHONG primary key (MAPDK, MAPHONG)
)
go

/*==============================================================*/
/* Index: CHITIETDATPHONG2_FK                                   */
/*==============================================================*/




create nonclustered index CHITIETDATPHONG2_FK on CHITIETDATPHONG (MAPDK ASC)
go

/*==============================================================*/
/* Index: CHITIETDATPHONG_FK                                    */
/*==============================================================*/




create nonclustered index CHITIETDATPHONG_FK on CHITIETDATPHONG (MAPHONG ASC)
go

/*==============================================================*/
/* Table: CHITIETDV                                             */
/*==============================================================*/
create table CHITIETDV (
   MAKG         varchar(15)          not null,
   MADV                 varchar(15)          not null,
   GIA                  float                not null,
   constraint PK_CHITIETDV primary key (MAKG, MADV)
)
go

/*==============================================================*/
/* Index: CHITIETDV2_FK                                         */
/*==============================================================*/




create nonclustered index CHITIETDV2_FK on CHITIETDV (MADV ASC)
go

/*==============================================================*/
/* Index: CHITIETDV_FK                                          */
/*==============================================================*/




create nonclustered index CHITIETDV_FK on CHITIETDV (MAKG ASC)
go

/*==============================================================*/
/* Table: DANHGIA                                               */
/*==============================================================*/
create table DANHGIA (
   MAPHONG              varchar(8)           not null,
   MAKH                 varchar(15)          not null,
   DIEM                 float                not null,
   constraint PK_DANHGIA primary key (MAPHONG, MAKH)
)
go

/*==============================================================*/
/* Index: DANHGIA_FK                                            */
/*==============================================================*/




create nonclustered index DANHGIA_FK on DANHGIA (MAPHONG ASC)
go

/*==============================================================*/
/* Index: DANHGIA2_FK                                           */
/*==============================================================*/




create nonclustered index DANHGIA2_FK on DANHGIA (MAKH ASC)
go

/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
create table DICHVU (
   MADV                 varchar(15)          not null,
   TENDV                nvarchar(30)          not null,
   constraint PK_DICHVU primary key (MADV)
)
go

/*==============================================================*/
/* Table: DOITACLUHANH                                          */
/*==============================================================*/
create table DOITACLUHANH (
   MADT                 varchar(15)          not null,
   TENDT                nvarchar(30)          not null,
   SDT                  varchar(15)          not null,
   DIACHI               nvarchar(50)          not null,
   constraint PK_DOITACLUHANH primary key (MADT)
)
go

/*==============================================================*/
/* Table: HANHLI                                                */
/*==============================================================*/
create table HANHLI (
   MAHL                 varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   MAPHONG              varchar(8)           not null,
   constraint PK_HANHLI primary key (MAHL)
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/




create nonclustered index THUOC_FK on HANHLI (MAPHONG ASC)
go

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/




create nonclustered index CO_FK on HANHLI (MAKH ASC)
go

/*==============================================================*/
/* Table: HOADONDV                                              */
/*==============================================================*/
create table HOADONDV (
   MAHD                 varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   NGAY_LAP             datetime             not null,
   THANHTIEN            float                not null,
   PTTT                 nvarchar(20)          not null,
   TINHTRANG            nvarchar(20)          not null,
   MANV                 varchar(8)           not null,
   MAKG         varchar(15)          not null,
   MADV                 varchar(15)          not null,
   MAPDK                varchar(15)          not null,
   STT                  int                  not null,
   NOTE                 nvarchar(50)          null,
   constraint PK_HOADONDV primary key (MAHD)
)
go

/*==============================================================*/
/* Index: DK_FK                                                 */
/*==============================================================*/




create nonclustered index DK_FK on HOADONDV (MAKG ASC,
  MADV ASC,
  MAPDK ASC,
  STT ASC)
go

/*==============================================================*/
/* Index: LAPHD2_FK                                             */
/*==============================================================*/




create nonclustered index LAPHD2_FK on HOADONDV (MANV ASC)
go

/*==============================================================*/
/* Index: TRA2_FK                                               */
/*==============================================================*/




create nonclustered index TRA2_FK on HOADONDV (MAKH ASC)
go

/*==============================================================*/
/* Table: HOADONPHONG                                           */
/*==============================================================*/
create table HOADONPHONG (
   MAPDK                varchar(15)          not null,
   MANV                 varchar(8)           not null,
   MAKH                 varchar(15)          not null,
   MAHD                 varchar(15)          not null,
   NGAY_LAP             datetime             not null,
   THANHTIEN            float                not null,
   PTTT                 nvarchar(20)          not null,
   TINHTRANG            nvarchar(20)          not null,
   NOTE                 nvarchar(50)          null,
   constraint PK_HOADONPHONG primary key (MAHD)
)
go

/*==============================================================*/
/* Index: QUANLI_FK                                             */
/*==============================================================*/




create nonclustered index QUANLI_FK on HOADONPHONG (MAPDK ASC)
go

/*==============================================================*/
/* Index: LAPHD_FK                                              */
/*==============================================================*/




create nonclustered index LAPHD_FK on HOADONPHONG (MANV ASC)
go

/*==============================================================*/
/* Index: TRA3_FK                                               */
/*==============================================================*/




create nonclustered index TRA3_FK on HOADONPHONG (MAKH ASC)
go

/*==============================================================*/
/* Table: KHUNGGIODV                                            */
/*==============================================================*/
create table KHUNGGIODV (
   MAKG         varchar(15)          not null,
   GIOBD                time             not null,
   GIOKT                time             not null,
   NGAY                 nvarchar(10)          not null,
   SLTD                 int                  not null,
   constraint PK_KHUNGGIODV primary key (MAKG)
)
go

/*==============================================================*/
/* Table: KHUYENMAI                                             */
/*==============================================================*/
create table KHUYENMAI (
   MAKM                 varchar(15)          not null,
   TENKM                nvarchar(30)          not null,
   NGAYBD               date            not null,
   NGAYKT               date             not null,
   GIOBD                time             not null,
   GIOKT                time             not null,
   constraint PK_KHUYENMAI primary key (MAKM)
)
go

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 varchar(8)           not null,
   HOTEN                nvarchar(30)          not null,
   DIACHI               nvarchar(50)          not null,
   EMAIL                varchar(30)          not null,
   SDT                  varchar(15)          not null,
   BOPHAN               nvarchar(15)          not null,
   constraint PK_NHANVIEN primary key (MANV)
)
go

/*==============================================================*/
/* Table: PHIEUDATPHONG                                         */
/*==============================================================*/
create table PHIEUDATPHONG (
   MAPDK                varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   NGAYLAP              datetime             not null,
   MANV                 varchar(8)           not null,
   NGAYDEN              datetime             not null,
   NGAYDI               datetime             not null,
   SODEMLUUTRU          int                  not null,
   THANHTIEN            float                not null,
   constraint PK_PHIEUDATPHONG primary key (MAPDK)
)
go

/*==============================================================*/
/* Index: LAPPDK_FK                                             */
/*==============================================================*/




create nonclustered index LAPPDK_FK on PHIEUDATPHONG (MANV ASC)
go

/*==============================================================*/
/* Index: DANGKY_FK                                             */
/*==============================================================*/




create nonclustered index DANGKY_FK on PHIEUDATPHONG (MAKH ASC)
go

/*==============================================================*/
/* Table: PHIEUDKTOUR                                           */
/*==============================================================*/
create table PHIEUDKTOUR (
   MAPDK                varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   NGAYLAP              datetime             not null,
   MANV                 varchar(8)           not null,
   MATOUR               varchar(15)          not null,
   NGAYBD				datetime             not null,
   NGAYKT               datetime             not null,
   SOLUONG              int                  not null,
   NOTE                 nvarchar(50)          null,
   constraint PK_PHIEUDKTOUR primary key (MAPDK)
)
go

/*==============================================================*/
/* Index: DKTOUR_FK                                             */
/*==============================================================*/




create nonclustered index DKTOUR_FK on PHIEUDKTOUR (MATOUR ASC)
go

/*==============================================================*/
/* Index: LAPPDK3_FK                                            */
/*==============================================================*/




create nonclustered index LAPPDK3_FK on PHIEUDKTOUR (MANV ASC)
go

/*==============================================================*/
/* Index: DANGKY3_FK                                            */
/*==============================================================*/




create nonclustered index DANGKY3_FK on PHIEUDKTOUR (MAKH ASC)
go

/*==============================================================*/
/* Table: PHIEUVCHL                                             */
/*==============================================================*/
create table PHIEUVCHL (
   MAPDK                varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   NGAYLAP              datetime             not null,
   MANV                 varchar(8)           not null,
   SOLUONG         int                  not null,
   constraint PK_PHIEUVCHL primary key (MAPDK)
)
go

/*==============================================================*/
/* Index: LAPPDK4_FK                                            */
/*==============================================================*/




create nonclustered index LAPPDK4_FK on PHIEUVCHL (MANV ASC)
go

/*==============================================================*/
/* Index: DANGKY4_FK                                            */
/*==============================================================*/




create nonclustered index DANGKY4_FK on PHIEUVCHL (MAKH ASC)
go

/*==============================================================*/
/* Table: PHIEU_DKDV_SP                                         */
/*==============================================================*/
create table PHIEU_DKDV_SP (
   MADV                 varchar(15)          not null,
   MAKG         varchar(15)          not null,
   MAPDK                varchar(15)          not null,
   STT                  int                  not null,
   MANV                 varchar(8)           not null,
   MAKH                 varchar(15)          not null,
   NGAYLAP              datetime             not null,
   MASP                 varchar(15)          null,
   NOTE                 nvarchar(50)          null,
   THANHTIEN            float                not null,
   SOLUONG              int                  not null,
   constraint PK_PHIEU_DKDV_SP primary key (MAKG, MADV, MAPDK, STT)
)
go

/*==============================================================*/
/* Index: DK2_FK                                                */
/*==============================================================*/




create nonclustered index DK2_FK on PHIEU_DKDV_SP (MASP ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_23_FK on PHIEU_DKDV_SP (MAKG ASC,
  MADV ASC)
go

/*==============================================================*/
/* Index: LAPPDK2_FK                                            */
/*==============================================================*/




create nonclustered index LAPPDK2_FK on PHIEU_DKDV_SP (MANV ASC)
go

/*==============================================================*/
/* Index: DANGKY2_FK                                            */
/*==============================================================*/




create nonclustered index DANGKY2_FK on PHIEU_DKDV_SP (MAKH ASC)
go

/*==============================================================*/
/* Table: PHIEU_SDDV                                            */
/*==============================================================*/
create table PHIEU_SDDV (
   MAKH                 varchar(15)          not null,
   MAKG         varchar(15)          null,
   MADV                 varchar(15)          null,
   MAPDK                varchar(15)          null,
   STT                  int                  not null,
   NGAYLAP              datetime             not null
)
go

/*==============================================================*/
/* Index: GOM_FK                                                */
/*==============================================================*/




create nonclustered index GOM_FK on PHIEU_SDDV (MAKG ASC,
  MADV ASC,
  MAPDK ASC,
  STT ASC)
go

/*==============================================================*/
/* Index: SUDUNG_FK                                             */
/*==============================================================*/




create nonclustered index SUDUNG_FK on PHIEU_SDDV (MAKH ASC)
go

/*==============================================================*/
/* Table: PHONG                                                 */
/*==============================================================*/
create table PHONG (
   MAPHONG              varchar(8)           not null,
   MOTA                 nvarchar(50)          not null,
   IMG                  text                 not null,
   LOAIPHONG            nvarchar(20)          not null,
   GIA                  float                not null,
   constraint PK_PHONG primary key (MAPHONG)
)
go

/*==============================================================*/
/* Table: SANPHAM                                               */
/*==============================================================*/
create table SANPHAM (
   MASP                 varchar(15)          not null,
   TENSP                nvarchar(30)          not null,
   GIA                  float                not null,
   constraint PK_SANPHAM primary key (MASP)
)
go

/*==============================================================*/
/* Table: THONGTINDOAN                                          */
/*==============================================================*/
create table THONGTINDOAN (
   MAKH                 varchar(15)          not null,
   TENKH                nvarchar(30)          not null,
   CCCD                 varchar(15)          not null,
   DIACHI               nvarchar(50)          null,
   SDT                  varchar(15)          not null,
   FAX                  varchar(20)          null,
   EMAIL                varchar(30)          null,
   TENDOAN              nvarchar(30)          not null,
   SOLUONG              int                  not null,
   constraint PK_THONGTINDOAN primary key (MAKH)
)
go

/*==============================================================*/
/* Table: TOUR                                                  */
/*==============================================================*/
create table TOUR (
   MATOUR               varchar(15)          not null,
   MADT                 varchar(15)          not null,
   DIADIEM              nvarchar(30)          not null,
   GIA                  float                not null,
   constraint PK_TOUR primary key (MATOUR)
)
go

/*==============================================================*/
/* Index: CUNGCAP_FK                                            */
/*==============================================================*/




create nonclustered index CUNGCAP_FK on TOUR (MADT ASC)
go

/*==============================================================*/
/* Table: UUDAI                                                 */
/*==============================================================*/
create table UUDAI (
   MAKM                 varchar(15)          not null,
   MAKH                 varchar(15)          not null,
   REMAIN               int                  not null,
   constraint PK_UUDAI primary key (MAKM, MAKH)
)
go

/*==============================================================*/
/* Index: UUDAI_FK                                              */
/*==============================================================*/




create nonclustered index UUDAI_FK on UUDAI (MAKM ASC)
go

/*==============================================================*/
/* Index: UUDAI2_FK                                             */
/*==============================================================*/




create nonclustered index UUDAI2_FK on UUDAI (MAKH ASC)
go

/*==============================================================*/
/* Table: VANCHUYEN                                             */
/*==============================================================*/
create table VANCHUYEN (
   MAPDK                varchar(15)          not null,
   MAHL                 varchar(15)          not null,
   constraint PK_VANCHUYEN primary key (MAPDK, MAHL)
)
go

/*==============================================================*/
/* Index: VANCHUYEN_FK                                          */
/*==============================================================*/




create nonclustered index VANCHUYEN_FK on VANCHUYEN (MAHL ASC)
go

/*==============================================================*/
/* Index: VANCHUYEN2_FK                                         */
/*==============================================================*/




create nonclustered index VANCHUYEN2_FK on VANCHUYEN (MAPDK ASC)
go

alter table CHITIETDATPHONG
   add constraint FK_CHITIETD_CHITIETDA_PHONG foreign key (MAPHONG)
      references PHONG (MAPHONG)
go

alter table CHITIETDATPHONG
   add constraint FK_CHITIETD_CHITIETDA_PHIEUDAT foreign key (MAPDK)
      references PHIEUDATPHONG (MAPDK)
go

alter table CHITIETDV
   add constraint FK_CHITIETD_CHITIETDV_KHUNGGIO foreign key (MAKG)
      references KHUNGGIODV (MAKG)
go

alter table CHITIETDV
   add constraint FK_CHITIETD_CHITIETDV_DICHVU foreign key (MADV)
      references DICHVU (MADV)
go

alter table DANHGIA
   add constraint FK_DANHGIA_DANHGIA_PHONG foreign key (MAPHONG)
      references PHONG (MAPHONG)
go

alter table DANHGIA
   add constraint FK_DANHGIA_DANHGIA2_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table HANHLI
   add constraint FK_HANHLI_CO_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table HANHLI
   add constraint FK_HANHLI_THUOC_PHONG foreign key (MAPHONG)
      references PHONG (MAPHONG)
go

alter table HOADONDV
   add constraint FK_HOADONDV_DK_PHIEU_DK foreign key (MAKG, MADV, MAPDK, STT)
      references PHIEU_DKDV_SP (MAKG, MADV, MAPDK, STT)
go

alter table HOADONDV
   add constraint FK_HOADONDV_LAPHD2_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table HOADONDV
   add constraint FK_HOADONDV_TRA2_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table HOADONPHONG
   add constraint FK_HOADONPH_LAPHD_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table HOADONPHONG
   add constraint FK_HOADONPH_QUANLI_PHIEUDAT foreign key (MAPDK)
      references PHIEUDATPHONG (MAPDK)
go

alter table HOADONPHONG
   add constraint FK_HOADONPH_TRA_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table PHIEUDATPHONG
   add constraint FK_PHIEUDAT_DANGKY_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table PHIEUDATPHONG
   add constraint FK_PHIEUDAT_LAPPDK_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEUDKTOUR
   add constraint FK_PHIEUDKT_DANGKY3_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table PHIEUDKTOUR
   add constraint FK_PHIEUDKT_DKTOUR_TOUR foreign key (MATOUR)
      references TOUR (MATOUR)
go

alter table PHIEUDKTOUR
   add constraint FK_PHIEUDKT_LAPPDK3_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEUVCHL
   add constraint FK_PHIEUVCH_DANGKY4_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table PHIEUVCHL
   add constraint FK_PHIEUVCH_LAPPDK4_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEU_DKDV_SP
   add constraint FK_PHIEU_DK_DANGKY2_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table PHIEU_DKDV_SP
   add constraint FK_PHIEU_DK_DK2_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table PHIEU_DKDV_SP
   add constraint FK_PHIEU_DK_LAPPDK2_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEU_DKDV_SP
   add constraint FK_PHIEU_DK_RELATIONS_CHITIETD foreign key (MAKG, MADV)
      references CHITIETDV (MAKG, MADV)
go

alter table PHIEU_SDDV
   add constraint FK_PHIEU_SD_GOM_PHIEU_DK foreign key (MAKG, MADV, MAPDK, STT)
      references PHIEU_DKDV_SP (MAKG, MADV, MAPDK, STT)
go

alter table PHIEU_SDDV
   add constraint FK_PHIEU_SD_SUDUNG_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table TOUR
   add constraint FK_TOUR_CUNGCAP_DOITACLU foreign key (MADT)
      references DOITACLUHANH (MADT)
go

alter table UUDAI
   add constraint FK_UUDAI_UUDAI_KHUYENMA foreign key (MAKM)
      references KHUYENMAI (MAKM)
go

alter table UUDAI
   add constraint FK_UUDAI_UUDAI2_THONGTIN foreign key (MAKH)
      references THONGTINDOAN (MAKH)
go

alter table VANCHUYEN
   add constraint FK_VANCHUYE_VANCHUYEN_HANHLI foreign key (MAHL)
      references HANHLI (MAHL)
go

alter table VANCHUYEN
   add constraint FK_VANCHUYE_VANCHUYEN_PHIEUVCH foreign key (MAPDK)
      references PHIEUVCHL (MAPDK)
go

INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV01', N'Hẹn giờ')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV02', N'Bar')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV03', N'Xông hơi & Spa')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV04', N'Ăn tối')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV05', N'Ăn trưa')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV06', N'Hồ bơi')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV07', N'Combo 3 bữa')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV08', N'Ăn sáng')
INSERT [dbo].[DICHVU] ([MADV], [TENDV]) VALUES (N'DV09', N'Massage')

INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG01', CAST(N'00:49:53.0697857' AS Time), CAST(N'11:40:01.4377014' AS Time), N'Thứ Hai', 6)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG02', CAST(N'17:58:53.2773584' AS Time), CAST(N'06:01:18.8097616' AS Time), N'Thứ Ba', 3)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG03', CAST(N'02:00:00.8392799' AS Time), CAST(N'04:58:09.9621957' AS Time), N'Thứ Năm', 10)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG04', CAST(N'01:07:01.3738042' AS Time), CAST(N'13:39:18.9209502' AS Time), N'Thứ Hai', 6)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG05', CAST(N'15:02:33.5499467' AS Time), CAST(N'01:47:45.6486183' AS Time), N'Thứ Sáu', 2)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG06', CAST(N'23:16:24.9955948' AS Time), CAST(N'06:18:56.3641546' AS Time), N'Thứ Tư', 7)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG07', CAST(N'21:34:51.4132345' AS Time), CAST(N'18:33:16.1837319' AS Time), N'Thứ Ba', 1)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG08', CAST(N'03:35:48.1805086' AS Time), CAST(N'08:43:09.6497112' AS Time), N'Thứ Bảy', 10)
INSERT [dbo].[KHUNGGIODV] ([MAKG], [GIOBD], [GIOKT], [NGAY], [SLTD]) VALUES (N'KG09', CAST(N'08:56:30.9667895' AS Time), CAST(N'01:43:03.5291667' AS Time), N'Chủ Nhật', 7)
GO
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM01', N'St. Louis SRD', CAST(N'2002-03-22' AS Date), CAST(N'1954-03-05' AS Date), CAST(N'07:27:20.5064901' AS Time), CAST(N'14:29:51.8750499' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM02', N'Corpus Christi IQD', CAST(N'2016-03-01' AS Date), CAST(N'1962-09-05' AS Date), CAST(N'08:32:17.0515608' AS Time), CAST(N'13:39:38.5207634' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM03', N'Austin AWG', CAST(N'2007-11-30' AS Date), CAST(N'1970-08-13' AS Date), CAST(N'17:03:06.9192453' AS Time), CAST(N'03:53:15.2871611' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM04', N'Colorado GNF', CAST(N'2009-10-19' AS Date), CAST(N'1989-05-01' AS Date), CAST(N'05:35:52.5282387' AS Time), CAST(N'22:22:25.0906160' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM05', N'Kansas MNT', CAST(N'2013-09-21' AS Date), CAST(N'1954-02-19' AS Date), CAST(N'03:22:10.0737809' AS Time), CAST(N'06:20:19.1966967' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM06', N'Norfolk FKP', CAST(N'2019-05-09' AS Date), CAST(N'1985-06-19' AS Date), CAST(N'23:29:55.0554541' AS Time), CAST(N'11:32:20.5878573' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM07', N'Lubbock NIO', CAST(N'2013-03-05' AS Date), CAST(N'1975-08-23' AS Date), CAST(N'18:44:38.8857222' AS Time), CAST(N'05:29:50.9843939' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM08', N'Columbus GEL', CAST(N'1989-03-18' AS Date), CAST(N'1956-09-25' AS Date), CAST(N'13:51:22.2926857' AS Time), CAST(N'02:23:39.8398317' AS Time))
INSERT [dbo].[KHUYENMAI] ([MAKM], [TENKM], [NGAYBD], [NGAYKT], [GIOBD], [GIOKT]) VALUES (N'KM09', N'Stockton EGP', CAST(N'1996-10-28' AS Date), CAST(N'1988-04-01' AS Date), CAST(N'09:24:50.7140382' AS Time), CAST(N'06:23:15.4845356' AS Time))
GO
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV00', N'Marcy Mccall', N'517, Lincoln, Colorado', N'Richards@gmail.com', N'0902480418', N'Kế toán')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV01', N'Roger Jensen', N'456, Memphis, Florida', N'Villa@gmail.com', N'0963977404', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV04', N'Daphne Wells', N'659, Houston, Mississippi', N'Mendez@gmail.com', N'0973369952', N'Buồng phòng')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV13', N'Matthew Meza', N'387, Mesa, South Dakota', N'Bruce@gmail.com', N'0915752672', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV14', N'Heidi Conner', N'807, Milwaukee, Kansas', N'Crane@gmail.com', N'0981855064', N'Kế toán')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV15', N'Faith Owen', N'328, Richmond, Washington', N'Bolton@gmail.com', N'0976077016', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV21', N'Gabrielle Valenzuela', N'692, Portland, Maryland', N'Pollard@gmail.com', N'0946311695', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV27', N'Maria Michael', N'389, Baton Rouge, Virginia', N'Howell@gmail.com', N'0993814656', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV30', N'Kerri Dudley', N'855, Columbus, California', N'Holder@gmail.com', N'0951917596', N'Kế toán')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV31', N'Bart Pitts', N'370, San Diego, West Virginia', N'Atkinson@gmail.com', N'0998692426', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV36', N'Yolanda Burke', N'067, Wichita, New Hampshire', N'Richardson@gmail.com', N'0934038819', N'Buồng phòng')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV38', N'Chastity Ward', N'179, Arlington, Illinois', N'Rose@gmail.com', N'0926052455', N'Bellman')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV41', N'Joel Singh', N'005, Louisville, Idaho', N'Briggs@gmail.com', N'0925431325', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV43', N'Nina Stafford', N'096, Phoenix, Alaska', N'Suarez@gmail.com', N'0965582109', N'Kế toán')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV47', N'Susana Velez', N'667, Arlington, Mississippi', N'Blair@gmail.com', N'0989160105', N'Bellman')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV52', N'Kristie Keith', N'311, Buffalo, Oklahoma', N'Morrow@gmail.com', N'0954025672', N'Buồng phòng')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV67', N'Yvonne Graves', N'210, Portland, Texas', N'Giles@gmail.com', N'0915743453', N'Bellman')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV74', N'Blake Atkins', N'408, Las Vegas, Kentucky', N'Johns@gmail.com', N'0952559564', N'Kế toán')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV85', N'Loretta Small', N'521, Fort Wayne, Alaska', N'Mercer@gmail.com', N'0928077795', N'Lễ tân')
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [DIACHI], [EMAIL], [SDT], [BOPHAN]) VALUES (N'NV93', N'Shad Mcfarland', N'310, Spokane, Arkansas', N'Frost@gmail.com', N'0904917083', N'Bellman')
GO

INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P001', N'Texas', N'3.png', N'Không đảm bảo', 800000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P002', N'Idaho', N'2.png', N'Ðảm bảo', 1050000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P003', N'Washington', N'2.png', N'Không đảm bảo', 1850000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P004', N'Florida', N'5.png', N'Không đảm bảo', 1650000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P005', N'Iowa', N'5.png', N'Không đảm bảo', 1550000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P006', N'Ohio', N'3.png', N'Không đảm bảo', 1000000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P007', N'Georgia', N'0.png', N'Không đảm bảo', 1450000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P008', N'California', N'5.png', N'Không đảm bảo', 1750000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P009', N'Arkansas', N'4.png', N'Không đảm bảo', 1300000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P101', N'Connecticut', N'3.png', N'Ðảm bảo', 1250000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P102', N'Arkansas', N'1.png', N'Ðảm bảo', 550000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P103', N'North Dakota', N'0.png', N'Ðảm bảo', 1100000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P104', N'Maine', N'6.png', N'Không đảm bảo', 1700000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P105', N'Minnesota', N'8.png', N'Ðảm bảo', 950000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P106', N'South Carolina', N'2.png', N'Không đảm bảo', 350000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P107', N'Ohio', N'3.png', N'Ðảm bảo', 250000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P108', N'Virginia', N'0.png', N'Ðảm bảo', 1150000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P109', N'Alaska', N'7.png', N'Ðảm bảo', 850000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P201', N'Missouri', N'7.png', N'Ðảm bảo', 200000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P202', N'Ohio', N'9.png', N'Ðảm bảo', 1200000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P203', N'Wisconsin', N'5.png', N'Ðảm bảo', 1500000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P204', N'Mississippi', N'2.png', N'Ðảm bảo', 700000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P205', N'Arkansas', N'7.png', N'Ðảm bảo', 1400000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P206', N'Montana', N'2.png', N'Không đảm bảo', 750000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P207', N'Maine', N'2.png', N'Ðảm bảo', 400000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P208', N'Tennessee', N'0.png', N'Ðảm bảo', 300000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P209', N'North Dakota', N'1.png', N'Không đảm bảo', 150000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P301', N'Vermont', N'7.png', N'Không đảm bảo', 1600000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P302', N'Nebraska', N'6.png', N'Không đảm bảo', 1350000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P303', N'Texas', N'8.png', N'Không đảm bảo', 1900000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P304', N'Nevada', N'0.png', N'Không đảm bảo', 500000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P305', N'Kansas', N'7.png', N'Ðảm bảo', 450000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P306', N'South Dakota', N'4.png', N'Ðảm bảo', 900000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P307', N'Indiana', N'6.png', N'Không đảm bảo', 600000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P308', N'Rhode Island', N'7.png', N'Không đảm bảo', 1800000)
INSERT [dbo].[PHONG] ([MAPHONG], [MOTA], [IMG], [LOAIPHONG], [GIA]) VALUES (N'P309', N'New York', N'3.png', N'Ðảm bảo', 650000)
GO

INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP10', N'M&M''s 45g', 17000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP12', N'Red Bull 250ml', 9000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP21', N'Mirinda 500ml', 12000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP23', N'Sting 330ml', 14000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP43', N'Pepsi 500ml', 13000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP46', N'Lay''s 184g', 19000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP58', N'Aquafina 500ml', 10000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP61', N'7Up 500ml', 6000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP66', N'Oreo 137g', 8000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP67', N'Pringles 158g', 11000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP68', N'Coca 500m', 20000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP70', N'Twix 50g', 7000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP73', N'Snickers 50g', 15000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP74', N'Monster Energy 473ml', 18000)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [GIA]) VALUES (N'SP85', N'KitKat 45g', 16000)
GO

INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH125271', N'Edwin Raymond', N'07377315322', N'668, Glenfinnan, Preston', N'0380217805', N'119745-0363', N'Rusty048@gmail.com', N'Michael', 53)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH192662', N'Sonia Osborn', N'07120794923', N'016, Porthcawl, Milton Keynes', N'0877229820', N'352-412-2205', N'Stuart438@gmail.com', N'Lucas', 47)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH290647', N'Margarita Hayes', N'07442296230', N'997, Godstone, Oldham', N'0339670387', N'2803242422', N'Regina486@gmail.com', N'Rusty', 15)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH304356', N'Alvin Carrillo', N'07783258117', N'936, Huntly, Bournemouth', N'0680098239', N'317786-8541', N'Jo765@gmail.com', N'Theodore', 35)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH499070', N'Suzanne Casey', N'07220952623', N'265, Clerkenwell, Milton Keynes', N'0372220480', N'649-707-3119', N'Joseph600@gmail.com', N'Kelly', 62)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH533624', N'Trisha Manning', N'07537946249', N'696, Gordon, Newcastle upon Tyne', N'0117190072', N'067438-0288', N'Samantha781@gmail.com', N'Mikel', 28)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH561714', N'Gustavo Dominguez', N'07634823474', N'934, Burry Port, Stockport', N'0267568362', N'949552-6124', N'Brandon853@gmail.com', N'Solomon', 11)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH606532', N'Hilary Swanson', N'07515108097', N'671, Leven, Eastbourne', N'0719676226', N'944-868-6439', N'Celeste505@gmail.com', N'Brady', 27)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH628311', N'Cassandra Gilmore', N'07410368713', N'332, Brampton, Brighton', N'0550559695', N'9972531798', N'Jimmy692@gmail.com', N'Van', 9)
INSERT [dbo].[THONGTINDOAN] ([MAKH], [TENKH], [CCCD], [DIACHI], [SDT], [FAX], [EMAIL], [TENDOAN], [SOLUONG]) VALUES (N'KH739842', N'Joe Duke', N'07285226530', N'889, Pembroke, Stoke-on-Trent', N'0103417428', N'063-7338848', N'Nora074@gmail.com', N'Reginald', 48)
GO

INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT001', N'Melrose', N'0954832444', N'893, Caithness, Huddersfield')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT002', N'Milton Keynes', N'0956868593', N'502, Roxburghshire, Sutton Coldfield')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT003', N'Lairg', N'0972059278', N'243, Cromartyshire, Stoke-on-Trent')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT004', N'Stalybridge', N'0997918079', N'892, Powys, Brighton')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT005', N'Tenby', N'0968841069', N'990, Leicestershire, Kingston upon Hull')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT006', N'Penarth', N'0902367536', N'151, Fermanagh, Newcastle upon Tyne')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT007', N'Stanford-le-Hope', N'0917085052', N'011, Lanarkshire, Wolverhampton')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT008', N'Arthog', N'0990557656', N'755, Fife, Bradford')
INSERT [dbo].[DOITACLUHANH] ([MADT], [TENDT], [SDT], [DIACHI]) VALUES (N'DT009', N'Rannoch', N'0963519946', N'023, Hampshire, Blackburn')
GO

INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour01', N'DT008', N'Coventry', 1600000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour02', N'DT008', N'Sheffield', 1500000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour03', N'DT008', N'Peterborough', 1800000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour04', N'DT005', N'Plymouth', 2300000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour05', N'DT008', N'Wolverhampton', 1900000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour06', N'DT008', N'Stoke-on-Trent', 2100000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour07', N'DT008', N'Wolverhampton', 2200000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour08', N'DT008', N'Exeter', 2000000)
INSERT [dbo].[TOUR] ([MATOUR], [MADT], [DIADIEM], [GIA]) VALUES (N'Tour09', N'DT008', N'Telford', 1700000)
GO

INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM01', N'KH290647', 10)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM02', N'KH192662', 5)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM03', N'KH533624', 10)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM04', N'KH304356', 3)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM05', N'KH499070', 8)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM06', N'KH561714', 4)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM07', N'KH125271', 0)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM07', N'KH606532', 0)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM08', N'KH628311', 6)
INSERT [dbo].[UUDAI] ([MAKM], [MAKH], [REMAIN]) VALUES (N'KM09', N'KH739842', 0)
GO

INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL027100', N'KH499070', N'P107')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL250938', N'KH290647', N'P008')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL408053', N'KH606532', N'P209')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL518373', N'KH606532', N'P301')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL536554', N'KH628311', N'P303')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL608689', N'KH533624', N'P203')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL779066', N'KH739842', N'P306')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL785700', N'KH290647', N'P101')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL931645', N'KH739842', N'P309')
INSERT [dbo].[HANHLI] ([MAHL], [MAKH], [MAPHONG]) VALUES (N'HL949502', N'KH533624', N'P203')
GO

INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG01', N'DV01', 900000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG01', N'DV03', 1800000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG02', N'DV02', 600000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG02', N'DV05', 1500000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG03', N'DV03', 1000000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG03', N'DV07', 1900000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG04', N'DV02', 1400000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG04', N'DV04', 500000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG05', N'DV05', 700000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG05', N'DV09', 1600000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG06', N'DV04', 1300000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG06', N'DV06', 400000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG07', N'DV06', 200000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG07', N'DV07', 200000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG07', N'DV08', 1100000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG08', N'DV04', 300000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG08', N'DV06', 1200000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG08', N'DV08', 300000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG09', N'DV01', 1700000)
INSERT [dbo].[CHITIETDV] ([MAKG], [MADV], [GIA]) VALUES (N'KG09', N'DV09', 800000)
GO

INSERT [dbo].[PHIEU_DKDV_SP] ([MADV], [MAKG], [MAPDK], [STT], [MANV], [MAKH], [NGAYLAP], [MASP], [NOTE], [THANHTIEN], [SOLUONG]) VALUES (N'DV05', N'KG02', N'PDK106093', 77, N'NV14', N'KH290647', CAST(N'2023-04-28T11:16:08.160' AS DateTime), N'SP43', NULL, 586900.2124233637, 15)
INSERT [dbo].[PHIEU_DKDV_SP] ([MADV], [MAKG], [MAPDK], [STT], [MANV], [MAKH], [NGAYLAP], [MASP], [NOTE], [THANHTIEN], [SOLUONG]) VALUES (N'DV09', N'KG05', N'PDK317899', 35, N'NV38', N'KH533624', CAST(N'2023-04-04T15:49:25.440' AS DateTime), N'SP58', NULL, 1836145.1623198323, 3)
INSERT [dbo].[PHIEU_DKDV_SP] ([MADV], [MAKG], [MAPDK], [STT], [MANV], [MAKH], [NGAYLAP], [MASP], [NOTE], [THANHTIEN], [SOLUONG]) VALUES (N'DV07', N'KG07', N'PDK288315', 49, N'NV52', N'KH606532', CAST(N'2023-04-23T02:57:24.280' AS DateTime), N'SP66', NULL, 401391.933952175, 18)
INSERT [dbo].[PHIEU_DKDV_SP] ([MADV], [MAKG], [MAPDK], [STT], [MANV], [MAKH], [NGAYLAP], [MASP], [NOTE], [THANHTIEN], [SOLUONG]) VALUES (N'DV08', N'KG07', N'PDK632229', 71, N'NV47', N'KH606532', CAST(N'2023-04-29T00:45:28.950' AS DateTime), N'SP73', N'quo rarendum', 1143547.3326796419, 2)
INSERT [dbo].[PHIEU_DKDV_SP] ([MADV], [MAKG], [MAPDK], [STT], [MANV], [MAKH], [NGAYLAP], [MASP], [NOTE], [THANHTIEN], [SOLUONG]) VALUES (N'DV06', N'KG08', N'PDK216667', 4, N'NV67', N'KH628311', CAST(N'2023-05-10T08:29:35.370' AS DateTime), N'SP66', NULL, 1655758.1328580892, 3)
GO

INSERT [dbo].[PHIEU_SDDV] ([MAKH], [MAKG], [MADV], [MAPDK], [STT], [NGAYLAP]) VALUES (N'KH606532', N'KG07', N'DV08', N'PDK632229', 71, CAST(N'2023-05-25T22:31:23.500' AS DateTime))
INSERT [dbo].[PHIEU_SDDV] ([MAKH], [MAKG], [MADV], [MAPDK], [STT], [NGAYLAP]) VALUES (N'KH628311', N'KG08', N'DV06', N'PDK216667', 4, CAST(N'2023-05-20T13:20:27.610' AS DateTime))
INSERT [dbo].[PHIEU_SDDV] ([MAKH], [MAKG], [MADV], [MAPDK], [STT], [NGAYLAP]) VALUES (N'KH606532', N'KG07', N'DV08', N'PDK632229', 71, CAST(N'2023-04-27T01:41:54.310' AS DateTime))
INSERT [dbo].[PHIEU_SDDV] ([MAKH], [MAKG], [MADV], [MAPDK], [STT], [NGAYLAP]) VALUES (N'KH533624', N'KG07', N'DV07', N'PDK288315', 49, CAST(N'2023-04-26T03:19:28.090' AS DateTime))
INSERT [dbo].[PHIEU_SDDV] ([MAKH], [MAKG], [MADV], [MAPDK], [STT], [NGAYLAP]) VALUES (N'KH290647', N'KG05', N'DV09', N'PDK317899', 35, CAST(N'2023-04-20T12:49:11.210' AS DateTime))
GO

INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK291457', N'KH533624', CAST(N'2023-04-15T20:13:47.960' AS DateTime), N'NV38', CAST(N'2023-04-22T17:00:51.950' AS DateTime), CAST(N'2023-04-24T20:32:04.750' AS DateTime), 3, 1235.993179136884)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK307709', N'KH290647', CAST(N'2023-04-13T15:15:14.560' AS DateTime), N'NV14', CAST(N'2023-04-18T11:38:56.350' AS DateTime), CAST(N'2023-04-20T01:03:28.340' AS DateTime), 3, 1992.1736596115743)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK386502', N'KH606532', CAST(N'2023-04-14T01:30:05.260' AS DateTime), N'NV47', CAST(N'2023-04-20T05:56:22.830' AS DateTime), CAST(N'2023-04-23T13:36:25.680' AS DateTime), 4, 862.85653843677449)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK405906', N'KH499070', CAST(N'2023-05-09T04:56:33.730' AS DateTime), N'NV30', CAST(N'2023-05-12T10:42:29.820' AS DateTime), CAST(N'2023-05-18T16:42:59.110' AS DateTime), 7, 1756.8467360720256)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK576861', N'KH739842', CAST(N'2023-04-07T05:38:03.170' AS DateTime), N'NV93', CAST(N'2023-04-11T07:29:05.180' AS DateTime), CAST(N'2023-04-16T03:09:01.930' AS DateTime), 6, 1767.9985369406634)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK625962', N'KH606532', CAST(N'2023-04-05T03:23:56.650' AS DateTime), N'NV52', CAST(N'2023-04-07T06:54:59.680' AS DateTime), CAST(N'2023-04-13T15:05:18.090' AS DateTime), 7, 576.11170158540449)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK713728', N'KH739842', CAST(N'2023-04-15T15:32:27.920' AS DateTime), N'NV85', CAST(N'2023-04-20T17:02:21.410' AS DateTime), CAST(N'2023-04-22T11:03:27.490' AS DateTime), 3, 42.477888074926049)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK773095', N'KH533624', CAST(N'2023-04-28T21:48:10.130' AS DateTime), N'NV38', CAST(N'2023-05-01T10:39:49.290' AS DateTime), CAST(N'2023-05-03T05:21:57.070' AS DateTime), 3, 1755.3396130704041)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK880470', N'KH628311', CAST(N'2023-04-18T06:47:48.300' AS DateTime), N'NV67', CAST(N'2023-04-20T22:07:01.430' AS DateTime), CAST(N'2023-04-25T07:41:22.770' AS DateTime), 6, 306.62331837537852)
INSERT [dbo].[PHIEUDATPHONG] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [NGAYDEN], [NGAYDI], [SODEMLUUTRU], [THANHTIEN]) VALUES (N'PDK997915', N'KH290647', CAST(N'2023-05-07T08:03:51.490' AS DateTime), N'NV15', CAST(N'2023-05-13T22:16:58.490' AS DateTime), CAST(N'2023-05-16T17:36:06.060' AS DateTime), 4, 76.650104521145167)
GO

INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK291457', N'P201', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK307709', N'P009', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK386502', N'P309', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK405906', N'P105', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK576861', N'P303', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK625962', N'P301', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK713728', N'P307', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK773095', N'P202', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK880470', N'P209', NULL)
INSERT [dbo].[CHITIETDATPHONG] ([MAPDK], [MAPHONG], [NOTE]) VALUES (N'PDK997915', N'P007', NULL)
GO

INSERT [dbo].[PHIEUDKTOUR] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [MATOUR], [NGAYBD], [NGAYKT], [SOLUONG], [NOTE]) VALUES (N'PDK224030', N'KH290647', CAST(N'2023-05-08T02:56:46.860' AS DateTime), N'NV14', N'Tour01', CAST(N'2023-06-03T01:19:59.290' AS DateTime), CAST(N'2023-06-05T23:01:47.450' AS DateTime), 436, NULL)
INSERT [dbo].[PHIEUDKTOUR] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [MATOUR], [NGAYBD], [NGAYKT], [SOLUONG], [NOTE]) VALUES (N'PDK449643', N'KH606532', CAST(N'2023-05-23T07:51:48.060' AS DateTime), N'NV52', N'Tour07', CAST(N'2023-06-01T13:28:05.900' AS DateTime), CAST(N'2023-06-06T03:20:17.970' AS DateTime), 189, NULL)
INSERT [dbo].[PHIEUDKTOUR] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [MATOUR], [NGAYBD], [NGAYKT], [SOLUONG], [NOTE]) VALUES (N'PDK549225', N'KH606532', CAST(N'2023-04-16T21:13:22.220' AS DateTime), N'NV47', N'Tour07', CAST(N'2023-06-15T05:23:40.620' AS DateTime), CAST(N'2023-06-17T16:16:34.680' AS DateTime), 439, NULL)
INSERT [dbo].[PHIEUDKTOUR] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [MATOUR], [NGAYBD], [NGAYKT], [SOLUONG], [NOTE]) VALUES (N'PDK961814', N'KH533624', CAST(N'2023-05-26T01:50:43.770' AS DateTime), N'NV38', N'Tour06', CAST(N'2023-05-03T13:17:48.710' AS DateTime), CAST(N'2023-05-08T20:26:31.320' AS DateTime), 486, N'pladior gravis')
INSERT [dbo].[PHIEUDKTOUR] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [MATOUR], [NGAYBD], [NGAYKT], [SOLUONG], [NOTE]) VALUES (N'PDK971433', N'KH628311', CAST(N'2023-05-23T01:28:18.600' AS DateTime), N'NV67', N'Tour08', CAST(N'2023-06-14T09:45:09.900' AS DateTime), CAST(N'2023-06-14T14:24:33.690' AS DateTime), 174, NULL)
GO

INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK160740', N'KH628311', CAST(N'2023-04-20T03:53:04.310' AS DateTime), N'NV67', 10)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK193639', N'KH533624', CAST(N'2023-04-29T13:49:36.040' AS DateTime), N'NV38', 6)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK265617', N'KH533624', CAST(N'2023-04-23T23:54:53.640' AS DateTime), N'NV38', 50)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK381465', N'KH606532', CAST(N'2023-05-08T21:55:24.390' AS DateTime), N'NV52', 36)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK582810', N'KH290647', CAST(N'2023-05-27T17:28:20.350' AS DateTime), N'NV14', 15)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK651659', N'KH499070', CAST(N'2023-04-20T09:30:49.730' AS DateTime), N'NV30', 42)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK762957', N'KH739842', CAST(N'2023-05-29T03:12:52.470' AS DateTime), N'NV85', 15)
INSERT [dbo].[PHIEUVCHL] ([MAPDK], [MAKH], [NGAYLAP], [MANV], [SOLUONG]) VALUES (N'PDK906400', N'KH606532', CAST(N'2023-04-14T15:49:07.140' AS DateTime), N'NV47', 40)
GO

INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK160740', N'HL250938')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK160740', N'HL779066')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK193639', N'HL608689')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK265617', N'HL949502')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK381465', N'HL518373')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK582810', N'HL785700')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK651659', N'HL027100')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK762957', N'HL931645')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK906400', N'HL408053')
INSERT [dbo].[VANCHUYEN] ([MAPDK], [MAHL]) VALUES (N'PDK906400', N'HL536554')
GO

INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P007', N'KH192662', 3.7589983659605486)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P009', N'KH125271', 1.0672731213584883)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P105', N'KH290647', 4.4760182194765736)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P201', N'KH304356', 0.58084445799740236)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P202', N'KH499070', 0.24694246949951282)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P209', N'KH606532', 3.4906867884521775)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P301', N'KH561714', 3.4670158421932795)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P303', N'KH628311', 1.6274570960679358)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P307', N'KH739842', 2.1112856115732739)
INSERT [dbo].[DANHGIA] ([MAPHONG], [MAKH], [DIEM]) VALUES (N'P309', N'KH533624', 2.9839280098601839)
GO

INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD156940', N'KH499070', CAST(N'2023-06-05T03:36:38.110' AS DateTime), 900000, N'Ví Momo', N'Chưa thanh toán', N'NV30', N'KG07', N'DV07', N'PDK288315', 49, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD182286', N'KH533624', CAST(N'2023-05-14T20:29:44.100' AS DateTime), 700000, N'Tiền mặt', N'Chưa thanh toán', N'NV38', N'KG07', N'DV07', N'PDK288315', 49, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD502371', N'KH739842', CAST(N'2023-04-28T21:53:18.600' AS DateTime), 1000000, N'Internet banking', N'Ðã trả trước 30%', N'NV93', N'KG08', N'DV06', N'PDK216667', 4, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD557768', N'KH533624', CAST(N'2023-05-02T00:42:57.370' AS DateTime), 500000, N'Ví Momo', N'Chưa thanh toán', N'NV38', N'KG07', N'DV07', N'PDK288315', 49, N'linguens plorum volcans nomen fecit,')
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD577595', N'KH290647', CAST(N'2023-05-21T16:07:36.180' AS DateTime), 1100000, N'Internet banking', N'Ðã trả trước 30%', N'NV15', N'KG05', N'DV09', N'PDK317899', 35, N'et plorum Versus Sed')
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD666863', N'KH739842', CAST(N'2023-05-25T07:46:52.300' AS DateTime), 800000, N'Internet banking', N'Chưa thanh toán', N'NV85', N'KG08', N'DV06', N'PDK216667', 4, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD704318', N'KH606532', CAST(N'2023-05-16T06:46:38.550' AS DateTime), 200000, N'Internet banking', N'Chưa thanh toán', N'NV47', N'KG07', N'DV08', N'PDK632229', 71, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD894589', N'KH628311', CAST(N'2023-04-14T18:55:02.510' AS DateTime), 300000, N'Ví Momo', N'Chưa thanh toán', N'NV67', N'KG08', N'DV06', N'PDK216667', 4, N'novum plurissimum')
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD980750', N'KH290647', CAST(N'2023-04-04T01:34:58.910' AS DateTime), 600000, N'Ví Momo', N'Ðã thanh toán', N'NV14', N'KG05', N'DV09', N'PDK317899', 35, NULL)
INSERT [dbo].[HOADONDV] ([MAHD], [MAKH], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [MANV], [MAKG], [MADV], [MAPDK], [STT], [NOTE]) VALUES (N'HD992727', N'KH606532', CAST(N'2023-06-01T08:28:53.550' AS DateTime), 400000, N'Tiền mặt', N'Ðã trả trước 30%', N'NV52', N'KG07', N'DV08', N'PDK632229', 71, N'et quad venit. nomen')
GO
 
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK713728', N'NV85', N'KH739842', N'HD078065', CAST(N'2023-05-01T05:31:37.740' AS DateTime), 750000, N'Tiền mặt', N'Ðã trả trước 30%', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK405906', N'NV14', N'KH290647', N'HD214398', CAST(N'2023-04-22T11:08:28.400' AS DateTime), 550000, N'Tiền mặt', N'Ðã thanh toán', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK576861', N'NV67', N'KH628311', N'HD293126', CAST(N'2023-04-18T16:24:02.190' AS DateTime), 250000, N'Ví Momo', N'Chưa thanh toán', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK773095', N'NV30', N'KH499070', N'HD387995', CAST(N'2023-05-13T20:42:10.250' AS DateTime), 850000, N'Internet banking', N'Chưa thanh toán', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK405906', N'NV15', N'KH290647', N'HD405086', CAST(N'2023-06-18T10:32:34.950' AS DateTime), 1050000, N'Ví Momo', N'Chưa thanh toán', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK386502', N'NV38', N'KH533624', N'HD531163', CAST(N'2023-04-13T14:58:55.580' AS DateTime), 650000, N'Ví Momo', N'Ðã trả trước 30%', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK386502', N'NV38', N'KH533624', N'HD625527', CAST(N'2023-05-01T09:51:04.320' AS DateTime), 450000, N'Ví Momo', N'Chưa thanh toán', N'esset quad estum.')
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK880470', N'NV47', N'KH606532', N'HD655487', CAST(N'2023-05-16T23:15:15.040' AS DateTime), 150000, N'Internet banking', N'Chưa thanh toán', N'esset pladior Sed')
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK880470', N'NV52', N'KH606532', N'HD656040', CAST(N'2023-06-14T14:39:51.470' AS DateTime), 350000, N'Tiền mặt', N'Chưa thanh toán', NULL)
INSERT [dbo].[HOADONPHONG] ([MAPDK], [MANV], [MAKH], [MAHD], [NGAY_LAP], [THANHTIEN], [PTTT], [TINHTRANG], [NOTE]) VALUES (N'PDK713728', N'NV93', N'KH739842', N'HD915668', CAST(N'2023-04-23T10:41:27.750' AS DateTime), 950000, N'Internet banking', N'Ðã thanh toán', NULL)
GO