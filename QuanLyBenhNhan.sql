Create database QuanLyBenhNhan
go

use QuanLyBenhNhan
go

create table NgheNghiep
( MaNN varchar(3) primary key,
TenNN nvarchar(15),) 

create table Que
(MaQ varchar(3) primary key,
TenQ nvarchar(15),) 

create table DanToc
(MaDT varchar(3) primary key,
TenDT nvarchar(15),) 

create table ĐoiTuong
(MaĐT varchar(3) primary key,
TenĐT nvarchar(20),) 

create table BenhNhan
(MaBN varchar(3) primary key,
TenBN nvarchar(5) ,
GT nvarchar(3),
NS date,
MaNN varchar(3),
MaQ varchar(3),
MaDT varchar(3),
MaĐT varchar(3),) 
---------------------------------
 create table ChuyenMon
(MaCM varchar(3) primary key,
TenCM nvarchar(20),) 

create table TrinhĐo
(MaTĐ varchar(3) primary key,
TenTĐ nvarchar(10),) 

create table BacSi 
(MaBS varchar(3) primary key,
TenBS nvarchar(5),
NS date,
GT nvarchar(3),
MaQ varchar(3),
MaCM varchar(3),
MaTĐ varchar(3),
SĐT int,) 
-------------------------------
create table TinhTrang
(MaTT varchar(3) primary key,
TenTT nvarchar(15), ) 

create table PhuongAn
(MaPA varchar(3) primary key,
TenPA nvarchar(2),) 

create table HoSoBenhAn
(MaBA varchar(3) primary key,
MaBN varchar(3),
MaBS varchar(3),
NgayKham date,
LiDoKham nvarchar(10),
MaTT varchar(3),
TienSuBenh nvarchar(6),
HuyetAp int,
CanNang int,
NhietDo int,
MaPA varchar(3),
TienKham int,) 
-----------------------------------
create table CongDung
(MaCD varchar(3) primary key,
TenCD nvarchar (30),) 

create table ĐonViTinh
(MaĐV varchar(3) primary key,
TenĐV nvarchar(5),) 

create table Thuoc
(MaT varchar(3) primary key,
TenT nvarchar (20),
MaCD varchar(3),
MaĐV varchar(3),
ThanhPhan nvarchar(20),
ĐonGia int,) 

create table BenhAnThuoc
(MaBA varchar(3),
MaT varchar(3),
SoLuong int,
SoNgayDung int,
LieuDung nvarchar(7),
CachDung nvarchar(7),
ThanhTien int,
primary key (MaBA,MaT) ) 
-----------------------------------------
create table Benh
(MaB varchar(3) primary key,
TenB nvarchar(15),) 

create table BenhAnKetLuan
(MaBA varchar(3) primary key,
MaB varchar(3),
MaPA varchar(3),
LoiDanBS nvarchar(30),) 
------------------------
create table XetNghiem
(MaXN varchar(3) primary key,
TenXN nvarchar(10),) 

create table KetLuan
(MaKL varchar(3) primary key,
TenKL nvarchar(10), ) 

create table BenhAnXetNghiem
(MaBA varchar(3),
MaXN varchar(3),
NgayXN date,
KetQua nvarchar(20),
MaKL varchar(3),
BacSiXN nvarchar(5),
TienXN int,
primary key (MaBA,MaXN) ) 
-------------------------
Alter table BenhNhan
		add constraint FK_BN_NN
		foreign key (MaNN)
		references NgheNghiep(MaNN)
		go
Alter table BenhNhan
		add constraint FK_BN_Q
		foreign key (MaQ)
		references Que(MaQ)
		go
Alter table BenhNhan
		add constraint FK_BN_DT
		foreign key (MaDT)
		references DanToc(MaDT)
		go
Alter table BenhNhan
		add constraint FK_BN_ĐT
		foreign key (MaĐT)
		references ĐoiTuong(MaĐT)
		go
----------------------------------
Alter table BacSi
		add constraint FK_BS_Q
		foreign key (MaQ)
		references Que(MaQ)
		go
Alter table BacSi
		add constraint FK_BS_CM
		foreign key (MaCM)
		references ChuyenMon(MaCM)
		go
Alter table BacSi
		add constraint FK_BS_TĐ
		foreign key (MaTĐ)
		references TrinhĐo(MaTĐ)
		go
---------------------------------------------
Alter table HoSoBenhAn
		add constraint FK_HSBA_BN
		foreign key (MaBN)
		references BenhNhan(MaBN)
		go
Alter table HoSoBenhAn
		add constraint FK_HSBA_BS
		foreign key (MaBS)
		references BacSi(MaBS)
		go
Alter table HoSoBenhAn
		add constraint FK_HSBA_TT
		foreign key (MaTT)
		references TinhTrang(MaTT)
		go
Alter table HoSoBenhAn
		add constraint FK_HSBA_PA
		foreign key (MaPA)
		references PhuongAn(MaPA)
		go
---------------------------------
Alter table Thuoc
		add constraint FK_T_CD
		foreign key (MaCD)
		references CongDung(MaCD)
		go
Alter table Thuoc
		add constraint FK_T_ĐV
		foreign key (MaĐV)
		references ĐonViTinh(MaĐV)
		go
------------------------------------
Alter table BenhAnKetLuan
		add constraint FK_BAKL_B
		foreign key (MaB)
		references Benh(MaB)
		go
Alter table BenhAnKetLuan
		add constraint FK_BAKL_PA
		foreign key (MaPA)
		references PhuongAn(MaPA)
		go
-----------------------------------
Alter table BenhAnXetNghiem
		add constraint FK_BAXN_KL
		foreign key (MaKL)
		references KetLuan(MaKL)
		go
Alter table BenhAnXetNghiem
		add constraint FK_BAXN_XN
		foreign key (MaXN)
		references XetNghiem(MaXN)
		go
Alter table BenhAnXetNghiem
		add constraint FK_BAXN_HSBA
		foreign key (MaBA)
		references HoSoBenhAn(MaBA)
		go
---------------------------------
Alter table BenhAnThuoc
		add constraint FK_BAT_HSBA
		foreign key (MaBA)
		references HoSoBenhAn(MaBA)
		go
Alter table BenhAnThuoc
		add constraint FK_BAT_T
		foreign key (MaT)
		references Thuoc(MaT)
		go

select * from BenhNhan