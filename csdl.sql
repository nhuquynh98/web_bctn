use master
go
drop database BCTN
go
create database BCTN
go
use BCTN
go
--Bảng thông tin
create table thongtin(
	id varchar(50) primary key,
	giatri nvarchar(400),
	mota nvarchar(400),
)
go
insert into thongtin (id,giatri,mota)
values
('ttsdt',N'0969826419',N'sdt'),
('ttmail',N'lethinhuquynh365@gmail.com',N'mail'),
('ttlogo',N'https://drive.google.com/uc?id=1DBsdCw8Fow8AJJWSzysLtph8BKgiaQWS',N'ảnh logo'),
('ttlogo2',N'https://drive.google.com/uc?id=1A_HniGPOrc-P5Uw6evhIA5t9mJfaCKer',N'ảnh logo2');

---Bảng sale
--create table sale(
--id int primary key identity (1,1),
--mota nvarchar(400),
--hinh1 nvarchar(200),
--hinh2 nvarchar(200),
--mucsale int,
--)
--go
--insert into sale(mota,hinh1,hinh2,mucsale)
--values
--(N'Phiên bản có sự cải tiến về công nghệ để mang đến những trải nghiệm tốt nhất cho người dùng với nhiều tính năng chăm sóc sức khỏe, nhận cuộc gọi trực tiếp cũng như nhiều tính năng tiện ích khác.',
--N'https://drive.google.com/uc?id=1R3NLDC27qKuEKiR2YLE-WvWP47qtJl6g',
--N'https://drive.google.com/uc?id=1eVGKD9L5ziQkEjiz_fJ9pXSrMdCXrZYc',
--35)

--Bảng tài khoản
CREATE TABLE TaiKhoan(
makh int primary key identity(1,1),
TenDangnhap nvarchar(200),
Ten nvarchar(200),
Ho nvarchar(200),
Ngaysinh date,
Sdt nvarchar(12),
Email nvarchar(200),
Matkhau nvarchar(200),
Phanquyen int,
)
insert into taikhoan(Ten,Ho,Ngaysinh,Sdt,Email,Matkhau,Phanquyen)
values(N'LETHINHUQUYNH',N'QUYNH',N'08/08/1998',N'0333333333',N'lethinhuquynh365@gmail.com',N'20082f0616bb14881ff22770279e6e14',1)
---Bảng loại sp
create table LoaiSanPham
(
MaLSP varchar(50) primary key,
TenLSP nvarchar(400),
mota nvarchar(400),
)
go
insert into LoaiSanPham(MaLSP,TenLSP) values
('spdt',N'Điện thoại'),
('spmtb',N'Máy tính bảng'),
('spdh',N'Đồng hồ'),
('sptn',N'Tai phone'),
('spp',N'Sạc dự phòng'),
('spl',N'Loa');

create table muahang(
	id int primary key identity,
	makhachhang int,
	masp int,
	gia int,
	soluongdamua int,
	ngaymua datetime,
)

create table giohang(
	id int primary key identity,
	makhachhang int,
	masp int,
	gia int,
	soluongdamua int,
	ngaymua datetime,
)

--Bảng chi tiết đơn hàng
create table ChitietDonhang(
masp int,
madh int,
soluong int,
dongia nvarchar,
primary key(masp,madh),
)

--Bảng đơn hàng
create table donhang(
madh int,
makh int,
thanhtoan nvarchar(50),
tinhtranggiaohang nvarchar(50),
ngaydat date,
ngaygiao date,
primary key(madh,makh),
)

go

create table yeuthich(
	id int primary key identity,
	makhachhang int,
	masp int,
	ngayyeuthich datetime,
	trangthai int,
)

create table binhluan(
	id int primary key identity,	
	makhachhang int, 
	masp int,
	noidung nvarchar(500),
	ngayyeuthich datetime,
	trangthai int,
)

--Bảng sản phẩm
create table sanpham(
	masp int primary key identity(1,1),
	tensp nvarchar(200),
	MaLSP varchar(50),
	gia int,
	donvi varchar(10),
	mota nvarchar (500),
	slsp int,
	trangthai int
	--FOREIGN KEY (MaLSP)
   --REFERENCES LoaiSanPham(MaLSP)
)
go
SET IDENTITY_INSERT sanpham ON
insert into sanpham(
masp,
tensp,
MaLSP,
gia,
donvi,
mota,
slsp,
trangthai)
values(
1,
N'Samsung Galaxy Fold',
'spdt',
50000000,
N'VNĐ',
N'Sau rất nhiều chờ đợi thì Samsung Galaxy Fold - chiếc smartphone 
màn hình gập đầu tiên của Samsung cũng đã chính thức trình làng với thiết kế mới lạ.',
20,
1
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
'spdt',
36000000,
N'VNĐ',
N'chiếc điện thoại Samsung Galaxy Z Flip đã được Samsung ra mắt tại sự kiện Unpacked 2020. 
Siêu phẩm với thiết kế màn hình gập vỏ sò độc đáo, hiệu năng tuyệt đỉnh cùng nhiều công nghệ thời thượng, dẫn dầu 2020.',
20,
1
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
'spdt',
26990000,
N'VNĐ',
N'Trông ngoại hình khá giống nhau, tuy nhiên Samsung Galaxy Note 10+ sở hữu khá nhiều điểm khác biệt so với Galaxy Note 10 và đây được xem 
là một trong những chiếc máy đáng mua nhất trong năm 2019, đặc biệt dành cho những người thích một chiếc máy màn hình lớn, camera chất lượng hàng đầu.',
20,
1
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
'spdt',
19990000,
N'VNĐ',
N'Samsung Galaxy S10+ 128GB là một trong những chiếc smartphone được trông chờ nhiều nhất trong năm 2019 
và không phụ sự kỳ vọng của mọi người thì chiếc Galaxy S thứ 10 của Samsung thực sự gây ấn tượng mạnh cho người dùng.',
20,
1
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
'spdt',
22990000,
N'VNĐ',
N'Nếu như từ trước tới nay dòng Galaxy Note của Samsung thường ít được các bạn nữ sử dụng bởi kích thước màn hình khá lớn 
khiến việc cầm nắm trở nên khó khăn thì Samsung Galaxy Note 10 sẽ là chiếc smartphone nhỏ gọn, phù hợp với cả những bạn có bàn tay nhỏ.',
20,
1
),
(
6,
N'SAMSUNG GALAXY TAB S6',
'spmtb',
18490000,
N'VNĐ',
N'Samsung Galaxy Tab S6 là chiếc máy tính bảng 2 trong 1, được thiết kế để giúp cho 
những người cần một sản phẩm đủ gọn gàng nhưng mạnh mẽ.',
20,
1
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
'spmtb',
16890000,
N'VNĐ',
N'Sau thành công của Galaxy Tab S6, Samsung tiếp tục ra mắt Galaxy Tab S6 Lite để chinh chiến ở phân khúc máy tính bảng giá rẻ hơn. 
Thiết bị vẫn hỗ trợ bút S Pen thần thánh, thiết kế kim loại cao cấp và màn hình, âm thanh giải trí đỉnh cao.',
20,
1
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
'spmtb',
7490000,
N'VNĐ',
N'Samsung Galaxy Tab A 10.1 T515 (2019) là chiếc máy tính bảng có màn hình lớn 
cùng cấu hình vừa phải đáp ứng tốt cho bạn trong hầu hết các nhu cầu giải trí hằng ngày.',
20,
1
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
'spmtb',
3690000,
N'VNĐ',
N'điện thoại bảng lần đầu tiên xuất hiện với Samsung Galaxy Tab A 8.0 (2019). 
Đây là chiếc máy tính bảng có khả năng nghe gọi và sử dụng cả ngày với màn hình cùng viên pin cực lớn.',
20,
1
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
'spmtb',
2790000,
N'VNĐ',
N'Samsung Galaxy Tab A8 8 inch T295 (2019) là một chiếc máy tính bảng gọn nhẹ, 
với màn hình vừa đủ có thể giúp bạn giải trí hay hỗ trợ trẻ nhỏ trong việc học tập.',
20,
1
),
(
11,
N'Samsung Galaxy Fit e R375',
'spdh',
490000,
N'VNĐ',
N'Samsung Galaxy Fit e là một trong những vòng tay thông minh nhỏ gọn có tính năng cơ bản cùng mức giá mềm. 
Thiết bị này phù hợp những ai muốn có một vòng đeo chất lượng, giá thành thấp và đến từ một nhà sản xuất lớn và uy tín.',
20,
1
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',
'spdh',
9490000,
N'VNĐ',
N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 40mm với những cải tiến về mặt thiết kế cũng như 
nâng cấp thêm một số tính năng hữu ích khác sẽ là người bạn đồng hành chăm sóc sức khỏe hằng ngày của bạn.',
20,
1
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',
'spdh',
7490000,
N'VNĐ',
N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 40 mm là phiên bản nhỏ gọn của dòng sản phẩm. 
Với các tính năng chăm sóc sức khỏe, màn hình cải tiến với viền cảm ứng mang lại trải nghiệm hoàn hảo cho người dùng.',
20,
1
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',
'spdh',
7990000,
N'VNĐ',
N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 cải tiến hơn với màn hình chống chói, hiển thị thông tin sắc nét. 
Các tiện ích khác cũng được nâng cấp nhằm mang lại sự tiện lợi nhất cho người dùng.',
20,
1
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',
'spdh',
990000,
N'VNĐ',
N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 44mm là phiên bản có sự cải tiến về công nghệ để mang đến những trải nghiệm 
tốt nhất cho người dùng với nhiều tính năng chăm sóc sức khỏe, nhận cuộc gọi trực tiếp cũng như nhiều tính năng tiện ích khác.',
20,
1
),
(
16,
N'Tai nghe Gaming Rapoo VH500 7.1',
'sptn',
799000,
N'VNĐ',
N'Tai nghe Gaming Rapoo VH500 7.1 có thiết kế chụp tai ôm trọn đầu, kiểu dáng đậm chất gaming, mang lại cảm giác thoải mái cho game thủ. 
Ngoài ra, sản phẩm được tích hợp đèn led RGB cho tai nghe trở nên huyền ảo và lung linh.',
20,
1
),
(
17,
N'Tai nghe Bluetooth True Wireless Aukey EP-K01',
'sptn',
1490000,
N'VNĐ',
N'Tai nghe Bluetooth TWS Aukey EP-K01 thiết kế nhỏ gọn, tinh tế cùng màu sắc sang trọng, 
dễ dàng cất vào túi và mang theo sử dụng bất cứ đâu.',
20,
1
),
(
18,
N'Tai nghe Bluetooth True Wireless JBL REFFLOW',
'sptn',
3590000,
N'VNĐ',
N'Tai nghe True Wireless JBL REFFLOWBLK có thiết kế sang trọng, nhỏ gọn và tinh tế, 
không chiếm nhiều diện tích, dễ dàng mang theo khi di chuyển.',
20,
1
),
(
19,
N'Tai nghe Bluetooth Mozard Z702',
'sptn',
600000,
N'VNĐ',
N'Tai nghe Bluetooth Mozard Z702 có thiết kế gọn gàng, dạng vòng cổ, thích hợp với mọi đối tượng thoải mái hoạt động mà không sợ rơi tai nghe hay khó chịu. 
Trang bị đầu hít nam châm giúp người dùng cất tai nghe gọn gàng, không bị rối dây mỗi khi không sử dụng.',
20,
1
),
(
20,
N'Tai nghe Bluetooth True Wireless Sony WF-1000XM3BME',
'sptn',
5490000,
N'VNĐ',
N'Tai nghe Bluetooth True Wireless Sony WF-1000XM3BME với hộp sạc được thiết kế có nam châm dễ dàng đóng mở, 
cùng kiểu dáng tinh tế với lớp vỏ chất liệu cao đảm bảo an toàn cho tai nghe.',
20,
1
),
(
21,
N'Sạc dự phòng Polymer 10.000 mAh Type C eSaver PJ JP106S',
'spp',
650000,
N'VNĐ',
N'Sạc dự phòng Polymer 10.000 mAh có thiết kế vỏ bằng nhôm chắc chắn
Kích thước pin không quá lớn, không gây cồng kềnh hay nặng tay khi sử dụng.',
20,
1
),
(
22,
N'Sạc dự phòng 7.500mAh AVA LJ JP195',
'spp',
300000,
N'VNĐ',
N'Sạc dự phòng 7.500 mAh AVA LJ JP195 với thiết kế nhỏ gọn, tiện lợi sử dụng và bỏ túi quần hoặc balo để mang theo mọi lúc mọi nơi.',
20,
1
),
(
23,
N'Sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST',
'spp',
700000,
N'VNĐ',
N'Sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST có kích thước gọn gàng cùng màu sắc đẹp mắt, 
dễ dàng mang theo đến nhiều nơi và sử dụng khi cần.',
20,
1
),
(
24,
N'Sạc dự phòng Polymer 20.000mAh Type C Anker PowerCore Metro Essential A1268',
'spp',
1200000,
N'VNĐ',
N'Sạc dự phòng Polymer 20.000mAh Type C Anker PowerCore Metro Essential A1268 Đen có thiết kế mỏng và nhẹ 
với lớp vỏ bọc vải cao cấp cho người dùng thoải mái cầm nắm và đem theo khi đi xa.',
20,
1
),
(
25,
N'Sạc dự phòng Polymer 10.000mAh Type C PD QC3.0 Mbest DS506-WB',
'spp',
700000,
N'VNĐ',
N'Sạc dự phòng Polymer 10.000mAh Type C PD QC3.0 Mbest DS506-WB gold có thiết kế sang trọng, 
tinh tế với màu vàng đồng, nhỏ gọn, dễ dàng mang theo.',
20,
1
),
(
26,
N'Loa Bluetooth JBL Pulse 4',
'spl',
4990000,
N'VNĐ',
N'Với vẻ ngoài nhỏ gọn, bạn có thể thuận tiện để mang chiếc loa Bluetooth JBL Pulse 4 đen theo trong các chuyến du lịch cùng gia đình, bạn bè.',
20,
1
),
(
27,
N'Loa Bluetooth Mozard E7',
'spl',
700000,
N'VNĐ',
N'Loa Bluetooth Mozard E7 có thiết kế độc đáo, lạ mắt với dạng hình trụ được bo tròn đầy thẩm mĩ',
20,
1
),
(
28,
N'Loa Bluetooth MozardX BM01',
'spl',
150000,
N'VNĐ',
N'Loa Bluetooth MozardX BM01 có thiết kế năng động, trẻ trung, với quai cầm tiện ích, dễ dàng mang theo khi đi du lịch, cắm trại',
20,
1
),
(
29,
N'Loa Bluetooth JBL GO2',
'spl',
690000,
N'VNĐ',
N'Loa Bluetooth JBL GO2BLK có thiết kế trẻ trung, màu sắc bắt mắt, đi cùng kích thước nhỏ gọn, 
nhẹ nhàng, tính di động cao là một phụ kiện thích hợp để khuấy động các buổi tiệc',
20,
1
),
(
30,
N'Loa Bluetooth Mozard H8030D',
'spl',
850000,
N'VNĐ',
N'Loa Bluetooth Mozard có thiết kế nhỏ gọn, chắc chắn, dễ dàng mang theo bên mình khi đi du lịch, dã ngoại,...',
20,
1
)


create table chitietsanpham (
	id int primary key identity,
	masp int,
	mausp nvarchar(100),
	mota nvarchar(800),
	hinh240x190 nvarchar(400),
	hinh270x281 nvarchar(400),
	hinh270x290 nvarchar(400),
	hinh270x307 nvarchar(400),
	hinh270x357 nvarchar(400),
	hinh277x290 nvarchar(400),
	hinh315x255 nvarchar(400),
	hinh320x240 nvarchar(400),
	hinh320x320 nvarchar(400),
	hinh355x212 nvarchar(400),
	hinh370x285 nvarchar(400),
	hinh370x420 nvarchar(400),
	hinh370x600 nvarchar(400),
	hinh378x238 nvarchar(400),
	hinh400x300 nvarchar(400),
	hinh435x265 nvarchar(400),
	hinh445x265 nvarchar(400),
	hinh565x480 nvarchar(400),
	hinh565x566 nvarchar(400),
	hinh570x437 nvarchar(400),
	hinh570x603 nvarchar(400),
	hinh582x343 nvarchar(400),
	hinh592x378 nvarchar(400),
	hinh87x113 nvarchar(400),
)
 insert into chitietsanpham(
 masp,
 mausp,
 mota,
hinh240x190,
hinh270x281,
hinh270x290,
hinh270x307,
hinh270x357,
hinh277x290,
hinh315x255,
hinh320x240,
hinh320x320,
hinh355x212,
hinh370x285,
hinh370x420,
hinh370x600,
hinh378x238,
hinh400x300,
hinh435x265,
hinh445x265,
hinh565x480,
hinh565x566,
hinh570x437,
hinh570x603,
hinh582x343,
hinh592x378,
hinh87x113
 )
 values(
 1,
 N'Đen',
 N'Thiết kế 2 màn hình, màn hình uốn dẻo, Thoải mái sử dụng nhiều ứng dụng cùng lúc, Hiệu năng đứng đầu bảng, 
 Có tới 6 camera trên máy, Dung lượng pin lớn',
 'https://drive.google.com/uc?id=1lkUJ4_44bSWsyqZ1y0y4B8l32VmzYsb_',
 'https://drive.google.com/uc?id=17b6XnqW-GmrcSP5B3dWXOzqrUv5xD3xL',
 'https://drive.google.com/uc?id=1BeU8EqBtSo4kJe1vaFrpCApkxyjLcUMz',
 'https://drive.google.com/uc?id=1v9s3CERCvreg6CP-oQ8UQTN_giZ2kEFi',
 'https://drive.google.com/uc?id=1jfdCnTnzBTl3bBsFI5g9KDexzPirq9-6',
 'https://drive.google.com/uc?id=1Fa4dYfd7lUVEwSAVm0AUrdOFiHqSdacl',
 'https://drive.google.com/uc?id=1fEOkxDR-xDXdMsIvLstD9p17vKADK3K5',
 'https://drive.google.com/uc?id=1wqxzj0bW3UQdYegsWzRG-KRyc-0LJXW_',
 'https://drive.google.com/uc?id=1C0i9_h56vJaE7QsNuauwxWQzAIPTmSJQ',
 'https://drive.google.com/uc?id=1x943FPAsD7LLJduhiMipp6KuCocCEODl',
 'https://drive.google.com/uc?id=1hoY8BjuoF5WxIW8cZqPjBLmut9zmTw_X',
 'https://drive.google.com/uc?id=1H0d0B4r4UoIjC-Q2mK-A5d5mfnqwSvNg',
 'https://drive.google.com/uc?id=1qD807wl3PPzkyxgMlB6JN3jOK5vZ3r-P',
 'https://drive.google.com/uc?id=1p_wet2-ngFT3h56UHvFiu4DfDMikPaV_',
 'https://drive.google.com/uc?id=1zlxOmu1doqM5dVnSfwaBd8ZssfMsLth5',
 'https://drive.google.com/uc?id=1P8OKj2kqA7cfi3d9sndGyHRQ61FsXJ7h',
 'https://drive.google.com/uc?id=1fzOBot_zvThi_wffqUnh6Fy2LHArybJu',
 'https://drive.google.com/uc?id=1Oza_zBCB4k557mWN5Wc_7Ekgu9VlKw-I',
 'https://drive.google.com/uc?id=1__hqj6mawKQNe4i_-qz8IyzwsSLHhO-6',
 'https://drive.google.com/uc?id=1ESXkZIoixS9lv0sTSOXfeBP3BqwLgmOp',
 'https://drive.google.com/uc?id=1bS2TFTavXFYEo6UDmZIkpNoV7IR87BeH',
 'https://drive.google.com/uc?id=1FEAGaVVWMqsm_eMVej7gj7kFUPk3GKOh',
 'https://drive.google.com/uc?id=1kYVwngyvBcM-EPUZqjym1bzHNXxIqUoV',
 'https://drive.google.com/uc?id=1ewYtmMpDSkoSI8DOa-0zCA5xHtHTl7B2'
 ),
 (
 2,
 N'Tím, Vàng,Đen',
 N'Đột phá với thiết kế màn hình gập, Nâng cấp camera kép, chụp ảnh ban đêm ấn tượng, Hiệu năng đỉnh cao với Snapdragon 855 Plus
 Thời lượng pin tốt đi kèm sạc không dây thời thượng',
'https://drive.google.com/uc?id=1bHtjnI3swpQRznDq0npD9CF6yLuyhasg',
 'https://drive.google.com/uc?id=1LQk4SGp2KwjPGGEZ4ii23S9fctsHM0kg',
 'https://drive.google.com/uc?id=1e9e_XvqsJ3GxHJZhBoFHJ8k_mNpm8f8p',
 'https://drive.google.com/uc?id=1pBrA3HIam5RNozfg1ePHe_tMdcFzPEw6',
 'https://drive.google.com/uc?id=1bjq7nKpSH-n_g6pv7KIgsRlGjWCeKGIw',
 'https://drive.google.com/uc?id=1WGRf7_HlUDyle-IfC4yQX8XPqkpKkVXR',
 'https://drive.google.com/uc?id=1u4gd-3EKG3MXx2gf9bu1sYU_smxXcMb9',
 'https://drive.google.com/uc?id=1trb8ZVglznUAmPq4031JBWge4Wgx9SEz',
 'https://drive.google.com/uc?id=1dlzflN60KmJvXh9EVZnHbUjr1zLdK4SS',
 'https://drive.google.com/uc?id=101FUjV_vbRO4OGKKVr-9k-QUU2oTs-wW',
 'https://drive.google.com/uc?id=1BcunsuQdO9TQwjLkXtadnpVvJAcGG7Ax',
 'https://drive.google.com/uc?id=1JkPI1um40jB8SNa-fcxs2MxyuMZeYqwA',
 'https://drive.google.com/uc?id=1_OzEOjJj3UdZQWpvkGAUidZTfLYoxwln',
 'https://drive.google.com/uc?id=1afkjB_9N5S6VhmSGA8UWV2JJx86Yvl4r',
 'https://drive.google.com/uc?id=15hfUDh2dm5ubhqzo0q8d7olF0LjIl4JR',
 'https://drive.google.com/uc?id=1JVvI5RRhDeFAuOK-P_TtJnU7VnKVF5sK',
 'https://drive.google.com/uc?id=1ADGlwh2tCQYVDOx3RB7CoFfzxEq7lGQK',
 'https://drive.google.com/uc?id=1tS9KCH5gDVXAp-4Nt-WFS5kck3cq0lNa',
 'https://drive.google.com/uc?id=1fU-8z527X2MU_vRQIH2UV8iTDA9opj8-',
 'https://drive.google.com/uc?id=1H0ZRx7vHFKjDtpfM5jOch0ZR3RpIJaET',
 'https://drive.google.com/uc?id=1TnOPMlsUJszzWcx36btW9kltbbZ4Lg8B',
 'https://drive.google.com/uc?id=1f3uq6srphjg5M-_yrM4qB1oy2ErJ-M3Q',
 'https://drive.google.com/uc?id=1a8r59Ur-lEpUWoyELIBGBZM0GABv47CI',
 'https://drive.google.com/uc?id=1jU5_gvdoGDZzJ37QyaiAGYuUU40lYN-h'
 ),
 (
 3,
 N'Trắng, Xanh dương, Đen, Bạc',
 N'Camera đứng đầu thế giới, Công nghệ sạc nhanh Superfast Charge 45W, Màn hình lớn thoải mái sử dụng,
 Bút S Pen ngày càng nhiều tính năng và Nhiều trang bị cao cấp khác nữa',
 'https://drive.google.com/uc?id=1P5enGOzovQ_jNayhp0ebTuGQExf7vIRr',
 'https://drive.google.com/uc?id=1fmOJ_VP1yPUJaJAJNmQGzeaZ-6q0qN5X',
 'https://drive.google.com/uc?id=1lymR5NuZ-OG58OJXFIUBRLt_F6ct1N_4',
 'https://drive.google.com/uc?id=1v9s3CERCvreg6CP-oQ8UQTN_giZ2kEFi',
 'https://drive.google.com/uc?id=1_YD17z2_ZkTdlCrdbxFXxFY6273yhYWP',
 'https://drive.google.com/uc?id=1-0-SW7t8KKm6EEDs7fiknT8Hz-X2b4kW',
 'https://drive.google.com/uc?id=1WkUVOqr1QLv6jC5I0CphmatJ_56iHGwY',
 'https://drive.google.com/uc?id=1ooEKODxGbBfUNYmGko26eQ5Ji8JQr_Bh',
 'https://drive.google.com/uc?id=1GXsUkTjc8XUvXeMUsmiNAibEpRegtoe4',
 'https://drive.google.com/uc?id=1TJAeFIkmQZU-HVxTfF6hBSKcHge512td',
 'https://drive.google.com/uc?id=1c8vK2J78NTwgMUMB2TLk66emKjvjfRAj',
 'https://drive.google.com/uc?id=1_negH4MGSnkMLpsg9l7IcUq4rm_17LyJ',
 'https://drive.google.com/uc?id=1QfvyMiJG7R9-HZlbJIVHyUH_jkvuzETT',
 'https://drive.google.com/uc?id=1Wa3NwEId3aY1TCCKUHZubBXXUUYtYfHI',
 'https://drive.google.com/uc?id=1W1jTQWkh6zHu7QpVx60HkJshhsArw_zy',
 'https://drive.google.com/uc?id=1mN8Tx3btAt6a_q1_NStYLlN0FXVlwvby',
 'https://drive.google.com/uc?id=1qk5hzjJLjAnI4UU9a2N2EvAKZJ4Moelh',
 'https://drive.google.com/uc?id=1W52jh-5DRDl4RGJhfDw8xwalswF-ONDg',
 'https://drive.google.com/uc?id=1QYWdAxFycsymQcwlJK532YfCw1vnmHaG',
 'https://drive.google.com/uc?id=1Hwg908YGtVbctIStmR-qsf-oc0nYw67E',
 'https://drive.google.com/uc?id=1hDN6aLQgzgd5V8J3Z4On5qtYEdYKwFbH',
 'https://drive.google.com/uc?id=1ZirqGmmcE5F0Hlqx9KCY1OCIxiQFA1bm',
 'https://drive.google.com/uc?id=1wND7fwEsOOEzGrW3Jb5HnkZeuKx-XJgM',
 'https://drive.google.com/uc?id=1Kv46U72xuAOvESIXoGBGSjP_aJ9hqicv'
 ),
 (
 4,
 N'Đen, Trắng, Bạc, Xanh lá',
 N'Thiết kế sang trọng, bóng bẩy, Trải nghiệm màn hình vô cực độc đáo, Cảm biến vân tay siêu âm bên dưới màn hình, Camera chất lượng hàng đầu thế giới, 
 Hiệu năng mạnh mẽ nhất thế giới Android',
'https://drive.google.com/uc?id=1_AKeANEDeUlEZqpA24aNAIgxcAff1Vnj',
 'https://drive.google.com/uc?id=1q7LbNoe-7fD-CyX6LRd3abX5bz8wLzKv',
 'https://drive.google.com/uc?id=1KapEHBC1s97i_rOWTdShtKngzD0tt1v-',
 'https://drive.google.com/uc?id=1C-D5oB7N8k7wrshLfzonqM8xzEFnUe3l',
 'https://drive.google.com/uc?id=1zd8QJ_ou_8btqtk0csR90D2eWBcqZUw3',
 'https://drive.google.com/uc?id=1MZr57NiM5c6CmiEKD9f_nCqm18QdfYXR',
 'https://drive.google.com/uc?id=1-3LLTKvgBAPHHz2do6teXraVwMw9ZouK',
 'https://drive.google.com/uc?id=1_RnQEg3LhtPI_0jOX3qxnVzOysHAcHN7',
 'https://drive.google.com/uc?id=1UlmQzY0en8gRLS2haJNcqUSed_MmwqBb',
 'https://drive.google.com/uc?id=1reSK6M6hGGzIQWod0JuXccVDhium5w7L',
 'https://drive.google.com/uc?id=1czpymlQceof7pVd3Ymu4q94HhXgbGD2u',
 'https://drive.google.com/uc?id=1QzaTfARYNVkGOtmfYp2agXrEAqcuV-KX',
 'https://drive.google.com/uc?id=186AhahxhCNpGTdD_WbgovOTYlg9bxj5G',
 'https://drive.google.com/uc?id=1U4F6mqKiiN-Q7jVfTes2_LFzrYqHf8Wb',
 'https://drive.google.com/uc?id=1mnACyQcJXAhhn2pmSzIXbtUEXgYIE3Mp',
 'https://drive.google.com/uc?id=1teH55hD24SFwPQNkXPcBCQBFf0gp3xk8',
 'https://drive.google.com/uc?id=1B0aZL0ZqJ4Oi6SkZnoD8shsXPMkpUJLd',
 'https://drive.google.com/uc?id=1CggOXtTGDcaBE5mhZMQT1FAzm8CwLBMw',
 'https://drive.google.com/uc?id=1-2mhtrjDje4ltqHlZ3n9XRKD-6oTGMdY',
 'https://drive.google.com/uc?id=1eTZ6_JoqbrTFx_ndMQ4EJxJqWe7pgLOc',
 'https://drive.google.com/uc?id=1MfBBy_O1WK_O2wOEaVMZVHOELGFQRQxy',
 'https://drive.google.com/uc?id=1TwTn9gLgtFjC0zVnddV9h5DsEbiGc888',
 'https://drive.google.com/uc?id=16AWHV3Ebnrv5vRgjDyA7jIaNKcdEVzMc',
 'https://drive.google.com/uc?id=1-oE-jBMj2C_XjbIcQgmPumIL96Ccc40n'
 ),
 (
 5,
 N'Đỏ, Bạc, Đen',
 N'Màn hình tràn viền tuyệt đẹp, Thiết kế với màu gradient bóng bẩy, Bút S Pen “thần thánh” ngày càng nhiều "phép", 
 Camera cải tiến rõ rệt với Hiệu năng hàng đầu thế giới',
'https://drive.google.com/uc?id=1EqPuM30T-3lrYQpYoI0ufKKsog7LnXWR',
 'https://drive.google.com/uc?id=1qHnk-Da4bsATh64K9ZLTCY071RBjYrcX',
 'https://drive.google.com/uc?id=1xD2PW-TFdm5I2ZRvvAPrEHOEWakGxkHZ',
 'https://drive.google.com/uc?id=1YzmvwuZGoiBiwcSHjbyB1izW4_Is-Iky',
 'https://drive.google.com/uc?id=1cJPj_qByAZT0kVVg4-3d_Vx-SpOGV6ZW',
 'https://drive.google.com/uc?id=1P_DI6LZ7-X-vARciySu8ka7vbgJV1eZj',
 'https://drive.google.com/uc?id=10tsedAFXbsJsg4frwks6BokvQWgi9Pp1',
 'https://drive.google.com/uc?id=11RKw3ZdWOwgFz54orCs97sutMn9hTOB6',
 'https://drive.google.com/uc?id=1ip-02WPruf23UuuwyeifKuLpDwdY6Fbw',
 'https://drive.google.com/uc?id=1bNgPVttvU2mrWM3WiFpVwGIFF9Bng7yR',
 'https://drive.google.com/uc?id=1Mgz1Xco8peRZpLmfBRdXIetGZ1bj4uDh',
 'https://drive.google.com/uc?id=1tnNalJoSDjUHrc8b8fxDUoh9mkj5oD8J',
 'https://drive.google.com/uc?id=1kLeWuX6UrOXyRdsPHwalSuEYIgB62bKr',
 'https://drive.google.com/uc?id=1Kb7-yCDCW-8piMHOMvte64wS6-tjLJsc',
 'https://drive.google.com/uc?id=1omuZqJ1a_HOV-8xprKxXqlFy4J83H8xh',
 'https://drive.google.com/uc?id=1lURkdWOtM5k4xreIUlTQmi4Fu0hnMDUl',
 'https://drive.google.com/uc?id=1vff6QdcZZBYCdXKr8NUj62ufTKX-q_-i',
 'https://drive.google.com/uc?id=1Gsok6AA7cM49SpFdsOKYwdxnIwOy1mig',
 'https://drive.google.com/uc?id=1obKNZi-MGp_Q1KmRn_mPe3nFC2Hfa2Ce',
 'https://drive.google.com/uc?id=1I9844Oo1q-ZqVlXNnjSmd47_aS89fnhi',
 'https://drive.google.com/uc?id=1qJi2Ypdb8ThH2qGNP6jabD4-VqUl_JnY',
 'https://drive.google.com/uc?id=1kg1zAB-Reb4bBsL-TJdXT5L7NxwvPeye',
 'https://drive.google.com/uc?id=1smzYs1GcVv2ZOfmvCyps_2t9Jqq-QFzZ',
 'https://drive.google.com/uc?id=1aDfj77n7sd9bfRMBSVYF-4cSDYS-O1h4'
 ),
 (
 6,
 N'Xanh dương',
 N'Ngoại hình mỏng nhẹ, đẹp mắt, Chiếc tablet đầu tiên có camera kép, Bút S Pen nhiều tính năng, Hiệu năng hàng đầu thế giới Android',
 'https://drive.google.com/uc?id=1ZI4oHPICAzWNhunpmlQDBvbqv40a4O6v',
 'https://drive.google.com/uc?id=1f1hyRuNokqVyjIbCOYQmM25QIenBidkD',
 'https://drive.google.com/uc?id=1xAsr9xIoLTE3cJlszINpaD5l-B1Qpm9Z',
 'https://drive.google.com/uc?id=1fl4KrOOSefb8oCqm0TQy38Jy1XRspqwX',
 'https://drive.google.com/uc?id=1MBCuFmJuPjxVeNBc49UFEjVOXIAnE2Pl',
 'https://drive.google.com/uc?id=1P56PP-_Dtj5HYozYE1Y69d7fZqaXg0ZO',
 'https://drive.google.com/uc?id=1IYYnThRAszpXal7Br5H5IJnwft7NtwjW',
 'https://drive.google.com/uc?id=1n-hiW8A2Pg_1CxqlVKiEFQHVHne1-sI-',
 'https://drive.google.com/uc?id=1ciQ9TtFyQHbrQNCzaCak56-0E5_1dUhp',
 'https://drive.google.com/uc?id=10KbnfOJXDGsBT6cNh0s6Gc8xvIzFpYGs',
 'https://drive.google.com/uc?id=1ybFP1-IAFRdXrtFqbeREChKc5_FKPiKM',
 'https://drive.google.com/uc?id=1s8oZzJ1ra2PZCytzmk9Drt8Vy-i77vDe',
 'https://drive.google.com/uc?id=1ZShGK5LJX4-CTyo_N0tIYPFMqwMsdHJn',
 'https://drive.google.com/uc?id=19TJtHYPY-de9tG5kkQZ3wllIb2gdeITV',
 'https://drive.google.com/uc?id=1Ofxf51pS4IdakVFi0IoXxEJSNtcHLUTC',
 'https://drive.google.com/uc?id=12ZiH6SM-vZ6FqfXq5_i3nTl5bDQtam65',
 'https://drive.google.com/uc?id=1oMFPXk9ZEwfGgDmEb7jc1eWe9E3w-Mok',
 'https://drive.google.com/uc?id=1ETD6kRsnsxAyvoPhBIXcWVafA0HEcDX5',
 'https://drive.google.com/uc?id=1kskUm8axzWc-8wBKPbv8U3Mn5hSvQFLV',
 'https://drive.google.com/uc?id=1E37zS-oJy7-67sl9_3rdNqdWdoYmLLcx',
 'https://drive.google.com/uc?id=1bz2XJAR2ICKsw7eIzQmeV71JNCuMGwBn',
 'https://drive.google.com/uc?id=1veW2p57jZDB8n5nT9xmObyVSNcp9Q8aD',
 'https://drive.google.com/uc?id=11mWZs_NDEhpAyV9ukY5DDmroD47h_Gwa',
 'https://drive.google.com/uc?id=1HMnIOGhdr_khGJU-pFX9Ton-henZz6M5'
 ),
 (
 7,
 N'Xanh dương, Đen',
 N'Thiết kế thời thượng và cao cấp, Bút S Pen mới tối ưu hiệu suất sử dụng, Trải nghiệm giải trí đỉnh cao',
'https://drive.google.com/uc?id=14ZmCfLg23NXqe5y_GZD1Ptr_ldUutsui',
 'https://drive.google.com/uc?id=1Mly_XKuCYbLoqqn1nmAivIdMztQxudNU',
 'https://drive.google.com/uc?id=1i2P9wLtpx6rK12MnkuduF_AKfKwTOBKV',
 'https://drive.google.com/uc?id=1r7Pco8pUzt1p55MvxZ2gSu4v1mOHTGTU',
 'https://drive.google.com/uc?id=1kVBNoykXy8_U15OqD7oLQU2wVvccgbau',
 'https://drive.google.com/uc?id=1SDSX_nigdHHgT39WmRMMPPNRgpJV4kMB',
 'https://drive.google.com/uc?id=1rz4SCC6akyV6vDz2Jjbd1azcuatnwCWJ',
 'https://drive.google.com/uc?id=17JBNPxBDAXw9fZsMPBB3L5CJsIYp1K0i',
 'https://drive.google.com/uc?id=1hyzDAsuGjTU3dNaCHsaV1t7Q5kNloRB_',
 'https://drive.google.com/uc?id=1VTmzuxjhOHFmWvd5MG7gmogr1h9j5qQL',
 'https://drive.google.com/uc?id=1hEHWTrvsT90LTDgGCjrmQiGANagvy3Xl',
 'https://drive.google.com/uc?id=1Q1ObiwBdhar47MkPEXyFfNg38RXJJOgP',
 'https://drive.google.com/uc?id=1UxcVvyU-TeCtgQkU65IyRYwjyFHWaIcB',
 'https://drive.google.com/uc?id=1MZtwUxVdvtwGY0QkU_r0GX9jyZbmtANS',
 'https://drive.google.com/uc?id=1_cV-3P8qzDH7D4vYU30aTuXckC6bq2Mu',
 'https://drive.google.com/uc?id=1FGiWkOxCQgis0bu7buBL3XG1JqBKDj9s',
 'https://drive.google.com/uc?id=1OEWAW7WxObkzWOR6aES1jqypE6VyWVtG',
 'https://drive.google.com/uc?id=1bXYrX6WPJuHJyYFOI5LZaxJ5wqeAm3w3',
 'https://drive.google.com/uc?id=1sYZ6DEm2TIe2XLgikRJgg6VNIsQ0cmz4',
 'https://drive.google.com/uc?id=1FreiJbxLpl329XhhZ0TFlkHYHFZCignn',
 'https://drive.google.com/uc?id=1s5TFpWS8w4jqvbi8soGheMjHBOlNLLIE',
 'https://drive.google.com/uc?id=1CfNUc-YyIQErKnA0Y6G48qKJHY5MQysY',
 'https://drive.google.com/uc?id=17qqqeUc33eh_5WmUwDgL_2x7x8SfK63-',
 'https://drive.google.com/uc?id=1D0kJie-DRLB8s5Cpqj-j7FrCkD9owzEu'
 ),
(
 8,
 N'Vàng, Đen',
 N'Màn hình kích thước lớn, sử dụng thoải mái, Giao diện mới với nhiều tính năng, Âm thanh chất lượng, giải trí cực đã',
 'https://drive.google.com/uc?id=1UkQMpK8HbZv-yIsdavjylfpQSiL3sHxh',
 'https://drive.google.com/uc?id=1OxRaFxptfYqOT4Q0Iucy1ivBz8yKUZ_d',
 'https://drive.google.com/uc?id=1FvRmVRcvIqrPsyHDtJkfWOJinvmksIYV',
 'https://drive.google.com/uc?id=1OjkDWOwN9fWMP3Rj34OuRwvyEbZsUC0D',
 'https://drive.google.com/uc?id=1FzGqa2iztBMcMuF6zZA52XW5pALcIcgr',
 'https://drive.google.com/uc?id=1C8TPSJwExU50xe0B6I5w10RxuZr0Vz41',
 'https://drive.google.com/uc?id=11olAEilB1mU5NocVwLV2lqAUF3Ei7h0L',
 'https://drive.google.com/uc?id=1dObiw6f2PHXP5oBrFpqHRoVBvK3SoQsI',
 'https://drive.google.com/uc?id=1JJ33gMeLnIovdia36-AQgSJXIYwnqmNM',
 'https://drive.google.com/uc?id=1ymHa7AtqNpUBSopfle0fT1opCfkpqDvE',
 'https://drive.google.com/uc?id=1sKcx2J96vviR5gHTX9x-XB1THj6BKGvc',
 'https://drive.google.com/uc?id=1cvtB5PeLl0N9MKeaYJI0j8OrfZOh5Xbb',
 'https://drive.google.com/uc?id=1IhW-jHmcmzIjL39SsXi_T59WP8N-xulO',
 'https://drive.google.com/uc?id=1mdtVn41NjxKrvVfGOsnk6ptLwoKbvafc',
 'https://drive.google.com/uc?id=1OkC7K9nx3PoSQ_N9yjwKSdgb3uBHLD7F',
 'https://drive.google.com/uc?id=10K5oSEqWEPrVdyLiCgbUkf0JuuAujoSM',
 'https://drive.google.com/uc?id=1yAjMgBEUNvENu3VvLcmjqn2cc8TuLz7B',
 'https://drive.google.com/uc?id=1NJp1vPpzS4SxgV83h6txC5sSlIggQ2ai',
 'https://drive.google.com/uc?id=12Pcb-H4wpZpKdlwH0T1jpMHO719uzEEb',
 'https://drive.google.com/uc?id=1UXX3GTotynZwj_SukIR2ftpRMcpP4JFZ',
 'https://drive.google.com/uc?id=11MOi7Izv85QTIaUeKF4DYRy9IiFCli_F',
 'https://drive.google.com/uc?id=1ueD6LgXSls-kfiFw_hqhXFm1rhk-fBLs',
 'https://drive.google.com/uc?id=1ZE_JQiEhy53Gj81gXQw7vusnqypPm3-c',
 'https://drive.google.com/uc?id=1xn9DeJ1tJ6uJSdR29ueVrpfZskEVffYn'
 ),
 (
 9,
 N'Bạc, Đen',
 N'Thiết kế sang trọng và cao cấp, Trải nghiệm màn hình cực lớn, Thời lượng pin siêu dài, Phần cứng mạnh mẽ, phần mềm tuyệt đỉnh,
 Trải nghiệm âm thanh chân thực',
 'https://drive.google.com/uc?id=1jL5QjN9ddKB2oqzvhhEAAg9V6qdlAjO3',
 'https://drive.google.com/uc?id=1hJEE0yTIPGX7Yu_esY47YW6eLyT90mut',
 'https://drive.google.com/uc?id=1V-0nvLBNSeGEutsopuup0Mc0-4a4bCxZ',
 'https://drive.google.com/uc?id=1Ws_6f8cNBQG-XuDbMxm_rWMBz2eor-Ea',
 'https://drive.google.com/uc?id=1lXgX9_u4MZGLIis0Y4vaTe6kPnqWEE7D',
 'https://drive.google.com/uc?id=1FUyANVDccweM5WtV6LhpWzvqBJQC_WR_',
 'https://drive.google.com/uc?id=1GTXZwsEjQyhS2QZZuO9CyeixK4-kN5gK',
 'https://drive.google.com/uc?id=1oHTORQywmdT3cWzlDctzV4Me310beGTO',
 'https://drive.google.com/uc?id=13t6aFZLLhMhuCw3Qh06vAv7N9bQsSPlk',
 'https://drive.google.com/uc?id=1Aq8s1O5tbj0RCvJokyPPjn7xHBXnH2La',
 'https://drive.google.com/uc?id=1hyI-ckF9zT01ZfwOBTTzibsBsmWFCVuD',
 'https://drive.google.com/uc?id=1M2DKUhv8nyb9D8l9-4sZ1OA6rwO_E27L',
 'https://drive.google.com/uc?id=1l541C_JhR7XewkhWVSb13e_dPMcuW9F7',
 'https://drive.google.com/uc?id=11C9R00k3bLa0Z1WEmOiBTsiwEyfy6mgH',
 'https://drive.google.com/uc?id=1TMTn80SIgENQfeGXQN2I1RkUjymbxOZu',
 'https://drive.google.com/uc?id=1AXXHVAhtS_08dmTOVklQFFqHo8FAo4Xf',
 'https://drive.google.com/uc?id=1fRNh1E6Hb_5PAJQCkWZpFdyKQQst-EXE',
 'https://drive.google.com/uc?id=1VjkCjVdQSJ68WRihxUTd95PjJroOeBnu',
 'https://drive.google.com/uc?id=1szYpgGj_ysbmz5Kk6vhQcgonc4-57Voh',
 'https://drive.google.com/uc?id=1iP9VioZe6HzKcAfEcvL9gFOol6NwZeVo',
 'https://drive.google.com/uc?id=13olXe2it9Kw8cOjiUFPLbES0Gn87Ht13',
 'https://drive.google.com/uc?id=1jWPXx0ZeS0uzFRPV7VQNdyTFF3SaOMae',
 'https://drive.google.com/uc?id=1AlD5HVuXAb2P5PLcoBGIquAyTrlgc2WI',
 'https://drive.google.com/uc?id=1wpJ799V7ePEmNbJfaxAJgRFRct4j1fLv'
 ),
 (
 10,
 N'Bạc, Đen',
 N'Màn hình lớn thoải mái sử dụng, Hỗ trợ kết nối 3G/4G, Camera có độ sắc nét cao',
 'https://drive.google.com/uc?id=1hE_cJJ6h4D_GXD83MxYjxjC7Kkis2fRg',
 'https://drive.google.com/uc?id=rCRcBWToUgDfeOLtP4cQAdo90N1XJK6y',
 'https://drive.google.com/uc?id=1NnJysY_7kEBIDBMM7vSExpZiIRiyJJou',
 'https://drive.google.com/uc?id=17er5zJoc9frWDJV2Lvyy8MXIZljTzfCt',
 'https://drive.google.com/uc?id=1TojwAiPXVzN4EAf91hPGDvV068hyfvwv',
 'https://drive.google.com/uc?id=1sG8zw81nYZ1cucgQwesxIj8l-n_4KDcR',
 'https://drive.google.com/uc?id=1Zuznzvoe95Ia0Gz-Mgho4xWhdD5TSCfI',
 'https://drive.google.com/uc?id=1x4sxWZtyBLnBa2rwJvHvJ-OE46KNtdGv',
 'https://drive.google.com/uc?id=1M-OFq4t9jE0pOjeUfzrT0mklqEW5_iKG',
 'https://drive.google.com/uc?id=1yQxGfXNNbyTWy2LHXAux6m9qiWFFCJs_',
 'https://drive.google.com/uc?id=1tTXtIqujugkeliz6brYcmoAKdNP6y_jt',
 'https://drive.google.com/uc?id=1A0c_vtVeBwe-uAZRWYhHyZ4RBtIeFEOO',
 'https://drive.google.com/uc?id=1mLOXQeAfSIg27ltCItggT-3F1RHvqS8Z',
 'https://drive.google.com/uc?id=1278ttly4mG4k3WLDirslfN1NAMqlfI23',
 'https://drive.google.com/uc?id=1AVGGIqHwfSCDb1je01V-jL6fWm3XoMCv',
 'https://drive.google.com/uc?id=1c1oQybugNSq9swOrd3xlzR6kdd7AOEcv',
 'https://drive.google.com/uc?id=1kZ_W6GO03bIsM_ds3BP0mzWvoy4nnFdX',
 'https://drive.google.com/uc?id=1dO14e78FpmLgnJ4eWhCGBGRpgfWnWhlu',
 'https://drive.google.com/uc?id=11vFvhhp99zT7hsbpi7ABR4eRpF9RdtlB',
 'https://drive.google.com/uc?id=1BHeCfGHm035Ci72QkLz7eD02cRJorNXF',
 'https://drive.google.com/uc?id=1QpcXfVENUCiLxOcNvj3RJhDe1X_h9AHl',
 'https://drive.google.com/uc?id=1xJha8X6XyyH9wqNSliPmrGyu7B8-bDMI',
 'https://drive.google.com/uc?id=197axBeuofkGIVysq4lM3_HF_l6CJlbt5',
 'https://drive.google.com/uc?id=1jAB2AMWS_E5nTwc7JY1lLaPVQRNROhHB'
 ),
 (
 11,
 N'Trắng, Đen, Vàng',
 N'Mỏng nhẹ bất ngờ, thoải mái khi đeo, Màn hình PMOLED hiển thị tốt, Thỏa sức tập luyện, sức khỏe dồi dào, Theo dõi xuyên suốt và cải thiện sức khỏe,
 Sử dụng liên tục 24/7, Kết nối với điện thoại bằng ứng dụng Samsung Galaxy Watch',
 'https://drive.google.com/uc?id=1eJe4mzTqKIRTUZDmHtfsHOctlovufU2p',
 'https://drive.google.com/uc?id=19nsS06lPDQ1EpRvMX8NIP2qbW1eprga4',
 'https://drive.google.com/uc?id=1-I13TnvLB5TnYPURabPb3T5m8m7yT2M9',
 'https://drive.google.com/uc?id=1WYbOcY02ptBAyBDM6Ag2tApgwv796MsO',
 'https://drive.google.com/uc?id=18yQgkSN4fJgnZ4mBEBBbHmA8EWqYKwhc',
 'https://drive.google.com/uc?id=18XYCMznfs-hympVeS_tyaSOaUK2wjiR3',
 'https://drive.google.com/uc?id=1NafUKqpQiUH4PrM4M0bMbxzfHOSgg06W',
 'https://drive.google.com/uc?id=1tyD2j907kozS5aSIwrVoi2QLbZSZCEZo',
 'https://drive.google.com/uc?id=1lC-eNK9flp2OdNoc2_Ym7LtakVfe0YHV',
 'https://drive.google.com/uc?id=1A6iP-VdDBCYR41JItFoJ2BM4w3EMZANd',
 'https://drive.google.com/uc?id=1Wvt9g50gRQv6BZaQdEYWPkK9J94nZNjT',
 'https://drive.google.com/uc?id=1nZFOhJHESOM3YqKg6la4asK59rwUssJS',
 'https://drive.google.com/uc?id=16elMguS-vDHUQggdwUqiSYiSQDxi1EXv',
 'https://drive.google.com/uc?id=1vUxr9W-cS6O1q7EXl5er6NO5EfqPhj3a',
 'https://drive.google.com/uc?id=1CefjsqE44IDTEY31e8wIeMKQ3dtlK6KM',
 'https://drive.google.com/uc?id=1zZAJz-niB8A1Ndks-lYU7ksZ2pGrPOol',
 'https://drive.google.com/uc?id=1VscuxroWtmfB8I5sbgmGA6Mb-Q-F1eft',
 'https://drive.google.com/uc?id=1tl14U6vG8LNydKTxV1sUIzdrkP7hpIrO',
 'https://drive.google.com/uc?id=1lrU4NUKfen3eRXWVp4hou71LNAypmKJi',
 'https://drive.google.com/uc?id=1_13tAUjE3AZy_CTLuYgUjCFkV4A8XUzQ',
 'https://drive.google.com/uc?id=1oFMlyaDAXyfuIYVtFQApFM5NWDFbEDMy',
 'https://drive.google.com/uc?id=1wZ4n66mjr6qDL88gqFp8TKoIepU8UVDq',
 'https://drive.google.com/uc?id=1uS1nn-BufNx4ysNe0MYBdal2Lh2X6doZ',
 'https://drive.google.com/uc?id=1mSf2GYvrAl7O_zikpESLwraOyFhW-YWo												'
 ),
 (
 12,
 N'Hồng, Đen',
 N'Thiết kế tinh tế, Màn hình sắc nét với độ phân giải cao, Tích hợp 7 chế độ tập luyện, Theo dõi nhịp tim của bạn 24/24,
 Nghe gọi trực tiếp trên đồng hồ, Là thiết bị điều khiển từ xa',
 'https://drive.google.com/uc?id=1eMu7jyCCw9mcpR5KFcEFLbfR6SCIG4yi',
 'https://drive.google.com/uc?id=1vYU3xkpfUCIN9zGmyuq6csKS-TKjnHfK',
 'https://drive.google.com/uc?id=1IlhnkS8e6zmIhLo7nC5giUGFAt2m5hvx',
 'https://drive.google.com/uc?id=1Cmfjs3MKqCvUk1WrQhm8nZEjheCib7f7',
 'https://drive.google.com/uc?id=1IBLQRqYvAi-XbCchPMvBJAXQR8MarCcX',
 'https://drive.google.com/uc?id=1eS6bLPPfn3ZHo7SkQTV46IP7kewqjgm9',
 'https://drive.google.com/uc?id=1gFsYXUzitQFgCrNam5_Bv822_XAofUdV',
 'https://drive.google.com/uc?id=14NiIaykSkYtRRryOe18u9LqbmtuHvH1z',
 'https://drive.google.com/uc?id=1SK04lfjpHLtYrjZRHQwXSXBJvJdFf5cb',
 'https://drive.google.com/uc?id=1rA8150cmb1i9alCA9tcb5utZwgOTyBW7',
 'https://drive.google.com/uc?id=1osDLmoq8f3iG_vFpYWa6Z7sgErHwbVzQ',
 'https://drive.google.com/uc?id=1N4etFfm9jY1vmqet9KWv7jPSYH439Nx_',
 'https://drive.google.com/uc?id=1chakA4d7FbgXjxuEtt4tJvBPsjj5xKlk',
 'https://drive.google.com/uc?id=12H8uCr6T1F2HnivC9GCaOdbrVKkRDldr',
 'https://drive.google.com/uc?id=1FF_4UUrJpIUj1hcr3ZLngDcAgfOVlg8V',
 'https://drive.google.com/uc?id=1Td4gUvkOS2nYnDDb5FlmYGJg1lKEvY4t',
 'https://drive.google.com/uc?id=1IvfMHI8ENH0ljB-wbTzju_dfiNFDdU2H',
 'https://drive.google.com/uc?id=16PiVSVIKJWzDfLJaBpq-KaH8IBx4Pjc-',
 'https://drive.google.com/uc?id=1F1q9ddP1aimlXhjB8TOF2fT4S6poOaKo',
 'https://drive.google.com/uc?id=1ib7oHS416y6dBgFIM2xyoEX71gPAkSLM',
 'https://drive.google.com/uc?id=14cJly2eVcVdgTaERcpw2nhg5EKsQRVQF',
 'https://drive.google.com/uc?id=1s_b--hWjQfuSf5Q2YI1CT_RRiwqscFVy',
 'https://drive.google.com/uc?id=13RK-zmkjJMc69x9Rc283IUeDVJvcREPP',
 'https://drive.google.com/uc?id=1IGoF2xGT6APn52SNGVTkZh0QVSBNmXU2'
),
(
 13,
 N'Hồng, Đen',
 N'Thiết kế năng động, thời trang, Màn hình chống trầy, hiển thị sắc nét, Nhận thông báo, nghe và từ chối cuộc gọi, Có các tiện ích chăm sóc sức khỏe,
 Nghe nhạc trên đồng hồ',
 'https://drive.google.com/uc?id=1cYvKMFhiIxZIWX5pPcnXBNV_yJLnVpIr',
 'https://drive.google.com/uc?id=1IPA2A4o_1I_T1sCjCiGXFp-WOmeSbVTC',
 'https://drive.google.com/uc?id=1CPiRzhnL7vTx5ToHfQaQ81DDgd_bDOfa',
 'https://drive.google.com/uc?id=1GQTfSlM9MZGveRb08S5q2DtRdfD_TPgZ',
 'https://drive.google.com/uc?id=13d717dOUI7Xjo013Bwx-Nd-3b79_gRLZ',
 'https://drive.google.com/uc?id=1Hxbd3w4nPlxIjt4TKbpB4AF3RM8fiKa9',
 'https://drive.google.com/uc?id=1NZB55ux3e8rLqxlr6PYuTjAnXQBYiv9r',
 'https://drive.google.com/uc?id=161lSbQxCx3zLDY5eINw0z6aAfJ31Eu8r',
 'https://drive.google.com/uc?id=15vPaGFe0Ta19Liod4fyk7HcmgJjGaUEl',
 'https://drive.google.com/uc?id=1B2k_f5DZmeOaq6OFS_Cma38YUFVLDRqa',
 'https://drive.google.com/uc?id=1ZEaceF8REAbyY3NeVHm4tG4fONJ7vQzC',
 'https://drive.google.com/uc?id=1MtFJ9RwB6RufRydQb7x0jXb7IF5brtyL',
 'https://drive.google.com/uc?id=1rFpTCtwwuOYD6IsMO2fPOxjUfL1JnPfy',
 'https://drive.google.com/uc?id=1F6mZGLlLdMyhVIm6XapP8hFsovB-9nt8',
 'https://drive.google.com/uc?id=1aIFQvVHpAFSMJHT5qNZNdubc-x2IvkWZ',
 'https://drive.google.com/uc?id=1PsJ4hLUsHpcs2shLQG1KeFDwfJzBCUe5',
 'https://drive.google.com/uc?id=1j6OV5uPn9D1qLkQ0bH-315N69ZOd3P-C',
 'https://drive.google.com/uc?id=1KeS2jjg54k5SSasKhhSwS-lUtFkdubSI',
 'https://drive.google.com/uc?id=1WBNqy5btM-GmHq00D46ESI32wctPr9f2',
 'https://drive.google.com/uc?id=16qOBO6oXicIo6Vpu7aXZ3tDF0DbBy6B8',
 'https://drive.google.com/uc?id=1M2NqWJsDn3O6Ia-DWlRbubqgsV0e8wxZ',
 'https://drive.google.com/uc?id=1EYq14uMKSBqtmlHSY4ueVxE4GOjGaYGX',
 'https://drive.google.com/uc?id=1byf29Tx44Sino35sGG3V6aLlaME3JViz',
 'https://drive.google.com/uc?id='
 ),
 (
 14,
 N'Xanh dương, Hồng, Đen',
 N'Sang trọng, thời trang, Tối ưu hóa hiển thị, Chăm sóc sức khỏe cá nhân và Là huấn luyện viên của riêng bạn, Kết nối với điện thoại dễ dàng,
 Sạc không dây tiện lợi',
 'https://drive.google.com/uc?id=1KqrQwGvjdosiPOWaN6IJkEs2UeUsNiYQ',
 'https://drive.google.com/uc?id=1HZ5FQIqPrvh4N-QByhoCxQDzmatZ6xfr',
 'https://drive.google.com/uc?id=12BIpdNpwiDfEw9DXr64cXo-3P97ukVNG',
 'https://drive.google.com/uc?id=1wxxw9o8IVpKgD8O9WzxtmVCIQGv3f0tr',
 'https://drive.google.com/uc?id=1tGKgJH5IOVOYKmjsnG9xnh5T4HenaiFK',
 'https://drive.google.com/uc?id=1SV58GHNklMkVs7f4bjA3XUZXwZJjoKjw',
 'https://drive.google.com/uc?id=1FmcNGpEruIh-mzpry_5UTaA8o-iOWWUO',
 'https://drive.google.com/uc?id=1KKKKSMs9qQovnSWm90aUiUugXasq9YrZ',
 'https://drive.google.com/uc?id=1bjgRKh6_43qLLTmUDbjeggsHDhqpShBW',
 'https://drive.google.com/uc?id=1AeBkt2BgkeQCGINJQBHpdFx8ty1r7ulz',
 'https://drive.google.com/uc?id=1MZrVqX1L4W_SX2Kb5Lqwywv9o587zeju',
 'https://drive.google.com/uc?id=1ltozT7mf5pluYrs-Psy1bDM9Lko6lp3x',
 'https://drive.google.com/uc?id=1hBh07NFyhOokltRgHoXfGwG2lKqWPaMN',
 'https://drive.google.com/uc?id=1hs-B-2dnPZ74uSDloEKWKF0TFJpx0pW0',
 'https://drive.google.com/uc?id=1qTMeNcHxqLZT9_vTFDZF_ts1Y-ZJZAJ0',
 'https://drive.google.com/uc?id=1FC_Ss-YT4nBK_bcQ2YmlsNyQgNS--GbE',
 'https://drive.google.com/uc?id=1GMA7ZUJCphvThu-NGRCzAOpeFC8NgVe3',
 'https://drive.google.com/uc?id=1TTcwAaQoQbJ9tPjb6LUbq5ipsc-cINMS',
 'https://drive.google.com/uc?id=1rAMGhG-cB8x5YXGpyjhxX9NTlp8PorEJ',
 'https://drive.google.com/uc?id=1fGIjmWE4Q_wEPFuCQqPf4A_AcReZu-BM',
 'https://drive.google.com/uc?id=110YHGDo_HrxvO7rN2fWo1AUAuJp8xM0o',
 'https://drive.google.com/uc?id=1JaJm-ORxTuXgZVhLvVpjObNF2VMcv2Pt',
 'https://drive.google.com/uc?id=1o5VdO9qnlKoLWDBdlq50Q7JZ8e0UjUlh',
 'https://drive.google.com/uc?id='
 ),
 (
 15,
 N'Đen',
 N'7 chế độ luyện tập nâng cao sức khỏe, Theo dõi giấc ngủ - đo nhịp tim - cảnh báo stress, Thiết kế với những đường nét tinh tế,
 Gọi điện trực tiếp trên đồng hồ',
 'https://drive.google.com/uc?id=1N-XLUKWJPEyf5nJFtRw-MvM5lfNsBUH7',
 'https://drive.google.com/uc?id=1HGv-x7m3_ogghQa98U8s688r-SFN8OQy',
 'https://drive.google.com/uc?id=10DFTcMSFTdntFcS48r72mPa6Hydy-dHo',
 'https://drive.google.com/uc?id=1wQHtHchgsZXeBV8rAuo9aMLeRmJSX19p',
 'https://drive.google.com/uc?id=1b-j9WdWiMnv33N5tN9CuT9w8nnH0uX9A',
 'https://drive.google.com/uc?id=1Ld-qQUSlvkntzVZfi956Cdr5yX6LFacS',
 'https://drive.google.com/uc?id=1xn2D4WGarP79nHgPzcg0RWts7ul7WSWt',
 'https://drive.google.com/uc?id=1a256cYxE61onkjVGghAPmKKJDcWLo5ay',
 'https://drive.google.com/uc?id=18i2MiiXWERQZcXy2UUVNh_a7N70sYvVi',
 'https://drive.google.com/uc?id=1AJFm-NXPLBq5__cR5UefDAz5erR52DMD',
 'https://drive.google.com/uc?id=1mk5o4Z5gCIPl-ODQu9J3--fB_ho8QK_g',
 'https://drive.google.com/uc?id=1r38tGYeNf5eO5oY4F7As3wcIlm-AE6JK',
 'https://drive.google.com/uc?id=19RLlAP_AQiG3lqIGJjTHWAnRu20ntXJU',
 'https://drive.google.com/uc?id=1ie4xRGDv9d6stV6H6DBBx9yE15EFPpDM',
 'https://drive.google.com/uc?id=1rPw_ByM9oTXs1BU7wziBAQG-HaB8cFH7',
 'https://drive.google.com/uc?id=1ODgdzHaMb_-QFQPZsl3mkCY3s3DKi-Sv',
 'https://drive.google.com/uc?id=1_QTFBDBkGT_X8WXI_DD5WKsbktNEs_DG',
 'https://drive.google.com/uc?id=11kmo6ElRJgfa8Rvi6SBcPiEu7OmsQ4jE',
 'https://drive.google.com/uc?id=1wMX582nHjo1GDHrTV-eyEuGgU-ocu6AI',
 'https://drive.google.com/uc?id=18UT-Z5cGMloJAWxDaNOKp3GCwuOLquxb',
 'https://drive.google.com/uc?id=1y5Q_hYHosMS0tqHPJxNBo_alwhS8b96J',
 'https://drive.google.com/uc?id=1RFR1RdSQ0DiNuuoewsIG4ihmLvwY7l2n',
 'https://drive.google.com/uc?id=1wEjdiu1gJRCwpfSRQDQ1tpbXCeMVGk9Y',
 'https://drive.google.com/uc?id='
 ),
(
 16,
 N'Đen',
 N'Thiết kế năng động, gọn nhẹ, Sử dụng âm thanh vòm 7.1 tạo môi trường âm thanh 3D, Khả năng lọc tạp âm tốt,
 Sử dụng Jack kết nối USB thông dụng, Dễ dàng điều chỉnh âm lượng với nút điều chỉnh ngay trên chụp tai',
'https://drive.google.com/uc?id=1GWJ-xmOgTKxMrcrOtr2__NBzBjvHa2ct',
 'https://drive.google.com/uc?id=19GHon7RmCcV1jCVjDOvfh3qs4NX6dlT-',
 'https://drive.google.com/uc?id=1vO4sL9zjpCrGhaDaTOSO3LgFeryfZCln',
 'https://drive.google.com/uc?id=1EhEQy0orxJR3SkxMfsqGtytoF-UBpwi5',
 'https://drive.google.com/uc?id=1evrT2gJxJA3UNu6wTPNvO_m27cj_7oXo',
 'https://drive.google.com/uc?id=1pNEvP6DdFRSP0mTyWRslewO7OqX7W6st',
 'https://drive.google.com/uc?id=1X4WV5EQCeAVl7cUp5cgu2hdSGbx2nZnO',
 'https://drive.google.com/uc?id=1Lfr7OokFx1tRLxPn79ocYFJP-KYMbEuD',
 'https://drive.google.com/uc?id=1nbBmJywXNWs2PV2afLhpUiLIDnGFHD_t',
 'https://drive.google.com/uc?id=1CmwUVxoJ6sSBV-E11B_U-G9WKx72TPZQ',
 'https://drive.google.com/uc?id=1XVM1PiDUaPiKVoJqUX3pe651YoTjlwF8',
 'https://drive.google.com/uc?id=1zHJNQ01vS9lSIprgDgmLJmj5E8vXnLSE',
 'https://drive.google.com/uc?id=1LBj8-E0_Ko-4Uk27ntMghXEcxQK3vCuF',
 'https://drive.google.com/uc?id=1hmxR2PpTsruR8wT6oDBf-Xb3-ijzQ-BG',
 'https://drive.google.com/uc?id=1kc8I_x7_u-Cmot3xJ6shBGozTpRzUGSV',
 'https://drive.google.com/uc?id=1-l40iEEOFpBGou7_oGwCI8ujp6CVQYau',
 'https://drive.google.com/uc?id=15o0xuV4orsofxuuhsnVe5-voeXk2QqQt',
 'https://drive.google.com/uc?id=1pzS9T1g_V68AMqSvnZdYZbc9apRBdy5u',
 'https://drive.google.com/uc?id=1AJQBxb6JDREg7vivNGqyQXfVBA5MTvUr',
 'https://drive.google.com/uc?id=1AdourAQMHa_m1-KZpDUEe-MtsItlZU0N',
 'https://drive.google.com/uc?id=1PkhP15I-Ai7sUXrv7b6QoSCy89r7vK6x',
 'https://drive.google.com/uc?id=1DOb-EMBqmBJYhANQW3LIcX3uEhC9rGxa',
 'https://drive.google.com/uc?id=1hJKdZPtCK0V_gWHJDAPe6CBXqcddcCCV',
 'https://drive.google.com/uc?id=1O_-KCw9lhMwMfsXc8ZfbfRSLTZfK5xF6'
),
(
 17,
 N'Đen',
 N'Thiết kế nhỏ gọn, dễ dàng mang theo, Kết nối nhanh và ổn định nhờ công nghệ Bluetooth 5.0, Công nghệ âm thanh Titanium-Enhanced cho âm thanh mạnh mẽ, chân thực,
 Khả năng chống nước và mồ hôi tốt, Sạc qua cổng Type - C khá phổ biến hiện nay, Tổng thời gian sử dụng cao lên đến 30 tiếng kèm với hộp sạc',
 'https://drive.google.com/uc?id=14dMWtw4ZxKK_0luiyOtj_SELdrGbQdgg',
 'https://drive.google.com/uc?id=1p5MtKfwNDfJDz64YenecCA-e5ngpSp0d',
 'https://drive.google.com/uc?id=1xVRlPUFfmWqbfocDuZs3Exd5mt5FbGQU',
 'https://drive.google.com/uc?id=1lN3-u5LOqIV1YTIyghzr7lWfxTHJBim9',
 'https://drive.google.com/uc?id=1_VX6rdcGHn_r1PjPVqADpFOhGSXJ9SBQ',
 'https://drive.google.com/uc?id=1jcUh96dcDkTwZteSs3EjEEPFkldIUqPQ',
 'https://drive.google.com/uc?id=1f6x_jlSyK3a4dgjOJIWHzJP7SxqecjUp',
 'https://drive.google.com/uc?id=1yIjzu65dr1TnGB7JrkkXpKbONirDvSlz',
 'https://drive.google.com/uc?id=1pggpqhVurHy70pdB0qcgivz398rPGSMU',
 'https://drive.google.com/uc?id=1dVywxUSrnmv4jAOgZNCX8UXPMGcdMsC5',
 'https://drive.google.com/uc?id=10WF8u5404Cypsoq9ViY3nKoxgh3efCPg',
 'https://drive.google.com/uc?id=1W_CivRtYGsBiuDLsl3df2dFIby68DIT8',
 'https://drive.google.com/uc?id=1UKayD_vjFYpZHftP5ubbiCN1uyZ6RGBX',
 'https://drive.google.com/uc?id=1usV1aB8xh99skUwQlABiYbMnb1by2dNG',
 'https://drive.google.com/uc?id=1ZH8qUsEHMqXmkKpTx9cnpWsnNm5lNM4_',
 'https://drive.google.com/uc?id=1WMEnEpQ2XNv1bWeXlhu0cO6Dm-iODhdt',
 'https://drive.google.com/uc?id=1JCdqsherjYKzQS68bC7hvxICQBmQRIAm',
 'https://drive.google.com/uc?id=15hShLN4Ov4PJ1jQe4SjpwXyjsWOSyvi4',
 'https://drive.google.com/uc?id=1r60Ss9Q01nKTUDWBTJi_eXF_twAgTnfK',
 'https://drive.google.com/uc?id=1PElZPLGgQXgoUJIN6ABN7gAvI2soj4Y2',
 'https://drive.google.com/uc?id=1HoYHH5x3ocp53EUAlwrgbMg67rjurohk',
 'https://drive.google.com/uc?id=1UjumIh-wM_XsWppzZK_lKf2XKE6gw3yL',
 'https://drive.google.com/uc?id=1Wb05lbQnQwa5ybwEV2Od2CBvKbSitgOf',
 'https://drive.google.com/uc?id=1GwmGiKVKtO_NvR9gW27Wt-sLKgQfh7aq'
 ),
(
 18,
 N'Đen',
 N'Thiết kế sang trọng, tiện lợi khi mang theo, Dễ dàng sạc pin qua cổng sạc Micro USB khá phổ biến, Sạc lại pin nhanh chóng, thời lượng pin lớn,
 Nhiều kích cỡ đệm tai, Có chuẩn chống nước IP67, Kết nối Bluetooth 5.0',
 'https://drive.google.com/uc?id=1f8bsit7EMv3yEntyulpShuH8Pd77Syrg',
 'https://drive.google.com/uc?id=1tTiyEmXbT8zemFu2dMeJXq_rBOcYga2F',
 'https://drive.google.com/uc?id=1mY1ze_zb5uWnhvpg67ACZ78ZiEPHkRFa',
 'https://drive.google.com/uc?id=1n9ZHZjEyup18G46Xck6myZ30lHvSMl7D',
 'https://drive.google.com/uc?id=1nPK5KiUUl7gYomqzQ36K7Bng3GFQnDJi',
 'https://drive.google.com/uc?id=1paptYjEFiphMxTg8eXzVi1PakIXf5lmh',
 'https://drive.google.com/uc?id=19vJzt5iEUaK0jqNrouhpyR14krP3ch5q',
 'https://drive.google.com/uc?id=1iWofiZEK02xDHasxcy9PMJ7ub9fywfuN',
 'https://drive.google.com/uc?id=1hBMrNQBl-c0NcIfRdtXtYtqnrtU2v6_W',
 'https://drive.google.com/uc?id=1WMea9SGD98FmcFGticOPX9mQIyeBtJYb',
 'https://drive.google.com/uc?id=1646xCMXUxhLZaZ5FnQHWfSVMlx1wqOLK',
 'https://drive.google.com/uc?id=1vveeMQQW-y47m4Qo_JyTjIl4AEX_O3Lh',
 'https://drive.google.com/uc?id=1vFX5g-1Z_KmWvwXGSIiSPkDzjgZZVPe2',
 'https://drive.google.com/uc?id=1b_jwguIBNPjH79qjw_0YFufhOPt14MnL',
 'https://drive.google.com/uc?id=166XHGZYuDqpEhT3jCtWoYtsGKyTPbhqv',
 'https://drive.google.com/uc?id=1GwERMSv0H6QC3KmqQIOxxBwA-VpZF6fH',
 'https://drive.google.com/uc?id=1rIrj2EdtGacR_zG7ViYEaSwqa8BwplLi',
 'https://drive.google.com/uc?id=1Eunxc7Q5uNHVN2cxudH7CIYhpUiEeQdr',
 'https://drive.google.com/uc?id=16gU8h94CzvWHFneWF9YpNxFZ-DGIenVt',
 'https://drive.google.com/uc?id=1obXSECmIcw859UgndLgjWiWJRlWE0Gbm',
 'https://drive.google.com/uc?id=1C-2ax0OQ5HjjId0GSSdvZgmwpEDsjGZL',
 'https://drive.google.com/uc?id=1Nx8pQtN3MxuGeEdhrRCYREXw0GTWl4nv',
 'https://drive.google.com/uc?id=1uQ-kALFJdq4X67pCEsAnk8Ym-oAJj-kQ',
 'https://drive.google.com/uc?id=1XuH7NxRAURU97QW4jXrYgm69albQag8M'
 ),
(
 19,
 N'Xanh',
 N'Thiết kế tiện lợi, Kết nối được với nhiều thiết bị, Sạc pin dễ dàng, Kết nối ổn định hơn,
 Dễ dàng sử dụng với các phím bấm',
 'https://drive.google.com/uc?id=1WkbAghx6obXY_jAtdXTgR2bbyOF1plZi',
 'https://drive.google.com/uc?id=1UNhoJeEt5icAXT1RUmVWKQyHWD2SnfNA',
 'https://drive.google.com/uc?id=1F9vbp23bxY1FdAWaK-esDXV6i93LgsYA',
 'https://drive.google.com/uc?id=1IxaQfctuLbIVE93XP9ugA4AYHikgUz63',
 'https://drive.google.com/uc?id=1gF_n67X71XnZAPeiTKc5t-jIPDk_WVlx',
 'https://drive.google.com/uc?id=1kLz9iCBvL7CROoaX3a_QeRVYj1BcJfsl',
 'https://drive.google.com/uc?id=1GVNnv06gjGX8d-rXkOCGR6pCW_MlcZec',
 'https://drive.google.com/uc?id=1WZ9U3ffoKBQmwkLAn67opuhwzsPDk9K8',
 'https://drive.google.com/uc?id=14q_9PJLIzpLGWplwPLpPD9r8RmVdkEt4',
 'https://drive.google.com/uc?id=1Sibslzd38r5zKPfoxjxa8rNQVkQO-Ja7',
 'https://drive.google.com/uc?id=1s2Oc4NeW9L4nZd13Zt9l-87hm1xiQSt8',
 'https://drive.google.com/uc?id=1yLTG02ABFT7w5EYpE_xPbo4dK5GjMsnY',
 'https://drive.google.com/uc?id=1hlm8ttGf0ZFEnSMTSgt1LmMqrUvSXyVB',
 'https://drive.google.com/uc?id=1ToJA-ZEtnMpuk63xNgDQlT1KO-qo7KiM',
 'https://drive.google.com/uc?id=1B_bX95bSMNYo7RfhXri7VPNYG5a5vEZM',
 'https://drive.google.com/uc?id=1R4dIBOtZj4e5TEScu5EQ5rRhSLZ3Ee20',
 'https://drive.google.com/uc?id=1oOagi0ShekKfNFAVPfM961GdEzo_r04P',
 'https://drive.google.com/uc?id=1iPrGmzYR-xOmMMkS2fdy8P1YQOqO6tbs',
 'https://drive.google.com/uc?id=1GuKpztOhBsYKf6AwGQrFrS3SQ8fYqrZQ',
 'https://drive.google.com/uc?id=1KH0jHM3C9R9oQ3aTQTi8EEzVFW7wFmyt',
 'https://drive.google.com/uc?id=1ql7OK7P7HGxvUnPztUr9AwWvbIBgzCw8',
 'https://drive.google.com/uc?id=1bvyabYiRZG1jc8nEF_FaLQ92dJQZyi6m',
 'https://drive.google.com/uc?id=1C0m5Az75KfddCqEvIKQnrYmOY1y75Ohr',
 'https://drive.google.com/uc?id=1lXt1TUfiPLr90UrEoCGyez4x0Wi2MEtk'
 ),
(
 20,
 N'Đen',
 N'Thoải mái suốt ngày dài với đệm tai cao su cao cấp, Khả năng chống ồn vượt trội, Chuẩn Bluetooth 5.0 và NFC ổn định kết nối với độ phủ sóng xa, 
 Công nghệ HX (DSEE HX™) mang đến chất lượng âm thanh tuyệt vời,Nâng tầm trải nghiệm người dùng với tính năng thông minh vượt trội, 
 Thời gian sử dụng liên tục đến khoảng 8 giờ, thoải mái sử dụng cho ngày dài, Dễ dàng nhận cuộc gọi, phát nhạc, điều chỉnh tính năng,... ngay trên tai nghe, 
 Dễ dàng tiếp nhận thông tin hơn với trợ lý ảo, Kiểm soát dễ dàng với ứng dụng Sony | Headphones Connect',
 'https://drive.google.com/uc?id=1PkSo5ERpWvBvQMr17Z3vXzGFRW1JQ1M5',
 'https://drive.google.com/uc?id=1byYghvNgdD9ncCsPuamE2mSSWB3tvUmM',
 'https://drive.google.com/uc?id=15jY8MEPMToNqbcmK--dMf4U9qP7EBhHn',
 'https://drive.google.com/uc?id=198vB7ZabritH5GsuFWvtZmQdggPqiLS9',
 'https://drive.google.com/uc?id=16jHc1jz6ue39bhd0OEpgfVm8vHeKbV0e',
 'https://drive.google.com/uc?id=12O6N_IqqUD85c3ccO0F_fUEXx7OQTVmG',
 'https://drive.google.com/uc?id=1-v1hdCpTBGtSlUC3xFFc1MWYGKSddkmd',
 'https://drive.google.com/uc?id=1mlAtP3VGZNr8bMFRUb9nGjL0WqGMSEAR',
 'https://drive.google.com/uc?id=1pZr6Fr5-SftXIAZPAqogC2AxiHjaaKa9',
 'https://drive.google.com/uc?id=11JgYre9wOrzGSXELRK3jnbwQ5QhhLwa7',
 'https://drive.google.com/uc?id=1MVHi6pOnCsw_eJJ2OoNVwxyxnhiHRXns',
 'https://drive.google.com/uc?id=1Ys2xtuaf4qIrTEbHLKmSlYEsXmwpO3YE',
 'https://drive.google.com/uc?id=1a4fJT-UZ4u6RUlNocKJBAoTy7rE02HsC',
 'https://drive.google.com/uc?id=1HMT__gNNP-Ly4holkL1pi2Y2fctzoIxU',
 'https://drive.google.com/uc?id=1iZIyGPaPQ9EvxMFMFe1gfIwleiQPPpW_',
 'https://drive.google.com/uc?id=1K1KDhK_l8NYAGlmJqywlt27FBIQ-QAzr',
 'https://drive.google.com/uc?id=1YFrp9NldhHI0Qr5t5zIUk2iHW-gsPC_i',
 'https://drive.google.com/uc?id=1cSLlxG5lucJWesNBRM32TD_quK7gWhDf',
 'https://drive.google.com/uc?id=1lWRC5-7LeG1sP0dpXeu8OJa0nfbPttzM',
 'https://drive.google.com/uc?id=1VCt7spE1YjrCQyjV2-COMbIFjEa3zlZh',
 'https://drive.google.com/uc?id=1IPlKGSUyuJ7pflgrQMuVxyR8dWGxN5a1',
 'https://drive.google.com/uc?id=1-Mu_NeOBMh0dBoqEEF3sPWzw9Cg38Z0L',
 'https://drive.google.com/uc?id=1qp2pCyRA_x4cQdpOswoYe_l8tCOGLsLu',
 'https://drive.google.com/uc?id=1uV2XyNA9Xab29Zip89zH1dnxWQlTZfkI'
 ),
(
 21,
 N'Bạc, Sám',
 N'Dung lượng pin cao 10.000 mAh cho nhiều lần sạc, Sạc song song nhiều thiết bị khác nhau như phụ kiện loa, tai nghe Bluetooth...,
 Sạc lại bằng cáp sạc điện thoại hoặc Laptop tùy bạn chọn',
 'https://drive.google.com/uc?id=1HjsHuWnRzDuqWx36_U8oWXSuhrLWIjnG',
 'https://drive.google.com/uc?id=1udeulNwJHco_y6c9jEshDCPfCs3QvzNS',
 'https://drive.google.com/uc?id=1quKzsRlQ_PkMuvKmip6IxZ7qh1Ht38r9',
 'https://drive.google.com/uc?id=1HZx8VrGV6Zr2Tyg2GMc2i9Pq2YNV5PF2',
 'https://drive.google.com/uc?id=1pfqrIRyN1FQQHHmERJgBFRyYD-tG1fPf',
 'https://drive.google.com/uc?id=1GmI_H2L1YfT7HmdE8v8JsOudQ8oXBPgD',
 'https://drive.google.com/uc?id=1zLYLO8jDNh4Mjp0TzQerVlB4oajIspeN',
 'https://drive.google.com/uc?id=1z1lmCB8M7cOOjDsDD1m5KnQuLGnP9R6F',
 'https://drive.google.com/uc?id=1SgUCjbfQ__zVqPHXXOzphoerqWuWEKAK',
 'https://drive.google.com/uc?id=16VEw5Gzc4cLw_Sj588D-XV6w_Dskly5J',
 'https://drive.google.com/uc?id=1NGRQ7V7QUnro3lBnimwIUHP2EDsTpQtS',
 'https://drive.google.com/uc?id=1mhDb9hg_9R8l9_BvSjOzx7I0m5cYRBcn',
 'https://drive.google.com/uc?id=1vVX1bpuTNdwzgY1m7S1CEy5d3nOmRgGU',
 'https://drive.google.com/uc?id=1IJGkZy0UL1uYFnsNRqr9nFBL66ICap40',
 'https://drive.google.com/uc?id=1r2SAnMy9FWp0DebtLOKLW6UF-x1l56jc',
 'https://drive.google.com/uc?id=1EN8z81FqjtP7xuVrFv1DW92cEMAk0UOu',
 'https://drive.google.com/uc?id=1IRyLlxpJlOKGPlYDlsI6bYtzM5llMFeS',
 'https://drive.google.com/uc?id=1mLJmULA56mle1Zz-NMBwjWs4gGycSCBP',
 'https://drive.google.com/uc?id=1VHnVzu_7qNdIaYjOgfr9bqson_c74U0j',
 'https://drive.google.com/uc?id=1vgFnZwV7tuf4sDotlmjJweH4BKOt2QzE',
 'https://drive.google.com/uc?id=1rrsNgdY6yrp9nuAfiBbdVijFOweDuOId',
 'https://drive.google.com/uc?id=1Uj5dTMNFLlwFUtMSer3BsVc5B8tNbx4Y',
 'https://drive.google.com/uc?id=1J9Iqxh70ZuZhYKiNfL3GdAU9ZJiz6dFh',
 'https://drive.google.com/uc?id=1eRn9EtP8qDmkiYXZbUSiuA5KSp9bfuDM'
 ),
(
 22,
 N'Trắng, Xanh dương',
 N'Trang bị 2 cổng ra USB và 1 cổng vào Micro USB, với thông số 5V - 2A, cho tốc độ sạc nhanh hơn, Dung lượng 7.500 mAh với hiệu suất sạc lên đến 64%',
 'https://drive.google.com/uc?id=1J5qTVtgCS8aTzDJBRut8RcdJHDnBU7is',
 'https://drive.google.com/uc?id=1U_q7Guu08y8gO7-DKN9MRvvDky3eLwtL',
 'https://drive.google.com/uc?id=1uC6DgLPhIDSAwBP0Hfx_26od3IqUyDCf',
 'https://drive.google.com/uc?id=11ZgLjBXPMDXGMRifyVGTXWRfpWLIIw1n',
 'https://drive.google.com/uc?id=1_XMQOX_cwqLkVNbOSea8lIRbvZXbvq-V',
 'https://drive.google.com/uc?id=18aFtnTt3hLkN-sRk5IXbckpr0Nf_xF8m',
 'https://drive.google.com/uc?id=1kCwHAcXId5LYIzlxT9qFOeeh8L4yYGFK',
 'https://drive.google.com/uc?id=1-VCCf7BxxEa8A-KuDMGTUuq6iNiC_J4i',
 'https://drive.google.com/uc?id=1_xDNeXrSS5FgPdUCoMSFKvCDc-hEL5pf',
 'https://drive.google.com/uc?id=1CMBL4xJrgGnVGc8fssYd-MYSNDIobyLG',
 'https://drive.google.com/uc?id=1jKDWEtHQtluqNIGwwcq6_mI5WDLtsIs4',
 'https://drive.google.com/uc?id=1wp0w4KWp4cZMkXHw0_XyJrTjp0P1P_X2',
 'https://drive.google.com/uc?id=1yXkM-e3QSFa82yi5QXryIpYCbxOvsrCi',
 'https://drive.google.com/uc?id=1daPO7l0HFK33Fi8IctQ6qLy9n2oNiKl5',
 'https://drive.google.com/uc?id=1_w8da1yURwuP-Mkic4YxuV_Ba1DGep_5',
 'https://drive.google.com/uc?id=1rd5YNG2aNg3B3JGIn0sQVnq2rcVt-SAO',
 'https://drive.google.com/uc?id=1CUX-cACr-m1rztIHnSo1jZsNp0HtvS8U',
 'https://drive.google.com/uc?id=1gMbYmt0F_7__KSeeV0oJc7kgXOGk8bd9',
 'https://drive.google.com/uc?id=1ThO2TStgOF7PZVABwgghhiR_-ZzeyUHa',
 'https://drive.google.com/uc?id=1SD6pB6bWyWugJmBeomvWh_BGcPnusSeU',
 'https://drive.google.com/uc?id=10tximj1DjnrNxgA6RO5-yemXfItXWLcT',
 'https://drive.google.com/uc?id=1150e6foHETVsLfYMLN1dGSdoJ5XsuTn1',
 'https://drive.google.com/uc?id=1mwuErXUJjCMEOYLxNSn1iN61Lkor5fOc',
 'https://drive.google.com/uc?id=11Gj302comRgB2atcRP9Ko4r8auxbFcuA'
),
(
 23,
 N'Xanh dương đậm',
 N'Kích thước gọn gàng cùng màu sắc đẹp mắt, dễ dàng mang theo đến nhiều nơi và sử dụng khi cần, 
 Có thể sạc được nhiều lần cho các thiết bị di động phổ biến trên thị trường hiện nay.',
 'https://drive.google.com/uc?id=1gQh_bjA93toNUXtxDf7UlythJNeHsFP1',
 'https://drive.google.com/uc?id=1M6oh5SQWGd6UU_9UCSlLXJiiFexE_Z2L',
 'https://drive.google.com/uc?id=1KHsDIeV93h0Se3WeoSUHF8cdlxIN6TGo',
 'https://drive.google.com/uc?id=11QVbJtBDY0ovOQ_DcYo-84IzDPwjh1FE',
 'https://drive.google.com/uc?id=1CpzqR9mL7vIMXaKuAQ3b_EURXvo9ZL7-',
 'https://drive.google.com/uc?id=1Qf4K6Z9ecXTfwtNjHg9NUg6LFXbFLu3C',
 'https://drive.google.com/uc?id=1S7ZNjKWo_iOMukxtTeh-VzRSqKP6YVI_',
 'https://drive.google.com/uc?id=1Y4QvackF9NM6kEleYEBvryBf8URZ8KO2',
 'https://drive.google.com/uc?id=1W7LaHwpzGECXJUFlDxTCB2sK-T28UNq5',
 'https://drive.google.com/uc?id=11NdNtLHd3Ln1IdujyWxTYen0WIj12rfm',
 'https://drive.google.com/uc?id=1aWYSJ5rJYWZoQSh6oLEGVv0n1w8n41II',
 'https://drive.google.com/uc?id=1l4reJfkjT-1B169wMipnnOoBSvxJHS-h',
 'https://drive.google.com/uc?id=15_42L5zMxTvwUf43o7nFiYCghiA1m2sG',
 'https://drive.google.com/uc?id=12I62rwIsyjc3vWNtRn7n6mCLjPxo8RK3',
 'https://drive.google.com/uc?id=1IDaFVBt7PqVxxKqKX3kGz9TYDE9vDGsW',
 'https://drive.google.com/uc?id=1WZV37TArHoNcwfvDSbDjpfQ2_ZHDOaea',
 'https://drive.google.com/uc?id=15n8ITRgEUDnlxbuMtLxS73-PtHOXdduC',
 'https://drive.google.com/uc?id=1Uu7etUPNDOzrsFPxPJYCiHHOCw5UaCvM',
 'https://drive.google.com/uc?id=1e2n_x-Hd_CCFO5t10d55Kb0tTc8Mm9JV',
 'https://drive.google.com/uc?id=1weni3YVMImxSiGc1bla2A_ZkL5L4AsGw',
 'https://drive.google.com/uc?id=1KQ8wgzgctNjaxIuRUni49jxC--DH7IoN',
 'https://drive.google.com/uc?id=1tlok33LyyCNuoLQ65YGJ-zEnakzo7p6D',
 'https://drive.google.com/uc?id=1T1AMHEiS63pJZOna77x4qGy3_0NUGv4K',
 'https://drive.google.com/uc?id=1VlgDxgioLod5-WTWSsZKyon1uhXch6Bc'
 ),
(
 24,
 N'Đen',
 N'Thiết kế đơn giản, kiểu dáng mỏng nhẹ, Dung lượng pin lớn đến 20.000 mAh, Dễ dàng sạc hai thiết bị cùng lúc với công suất tối đa,
 Bảo vệ an toàn cho thiết bị và chính bạn',
 'https://drive.google.com/uc?id=1CShE5CSeZi6UtpR8BQl5GJ2nwUj7_7SB',
 'https://drive.google.com/uc?id=1wtRKMjaWyo90RjQZ5rzD4-93mKq4grtD',
 'https://drive.google.com/uc?id=1P5DLFtdXpaAADUJVU9mVNKwkvvntTSLm',
 'https://drive.google.com/uc?id=1HjNjRrp6jEneR2W8YBHhGteImhtOC8gc',
 'https://drive.google.com/uc?id=1m1ZPN1th2GP1ayqvSOUQRwH754AvYxzh',
 'https://drive.google.com/uc?id=1XjMGsHYwwWMTUt6iFEu8OZAF1xOZ_HOa',
 'https://drive.google.com/uc?id=1znYceArXsfBULfNKk0SkmMiW_xOC7QRW',
 'https://drive.google.com/uc?id=15Ebpv5prCHCHVf2vsInl8sj4hH0zkogA',
 'https://drive.google.com/uc?id=1ZqRnbDZcIiUUz0kWR7Wc_hDCWEK3nZie',
 'https://drive.google.com/uc?id=1L0VNNyRtCIZ2Xn3dXrfXDgQMa5nO1ZyC',
 'https://drive.google.com/uc?id=1K9tJ2b15bEQguf-Wpe3VPEQjPgR2hRTS',
 'https://drive.google.com/uc?id=1adcmQofW8LLoeI3QxaR5PABOJ5U9bYBI',
 'https://drive.google.com/uc?id=1IugbfxvkauYouQoGVGjsDTE04pxJBExy',
 'https://drive.google.com/uc?id=19XCx4YGpDzq9Q4Bi1p1Tsfd21SQq0WvK',
 'https://drive.google.com/uc?id=1n34POGBRHMOtriEZVlA_qbv7ekienw6E',
 'https://drive.google.com/uc?id=1R_gXLMZScYklgmVkYuW1RG5rpEDRPjZZ',
 'https://drive.google.com/uc?id=1ISLdLk0cktyVg6zuWfFDhg1Elk_0sM6b',
 'https://drive.google.com/uc?id=1PFnjR6nSKIBOn4YXYGnyUpyXQO-QSR9B',
 'https://drive.google.com/uc?id=1_j6rr0o2GrwEBawtqgiXAb55YK9vAdcS',
 'https://drive.google.com/uc?id=1Rg4aYC6Ik9xetCr4YdzOl6VTkp35_VM3',
 'https://drive.google.com/uc?id=15n0GC625vVb-uj9XMPJ4WE2ZGRv-tmUT',
 'https://drive.google.com/uc?id=1sa7tRp0FttaO-HbT3hckJeW1xYx2abYS',
 'https://drive.google.com/uc?id=1IwmVkn6Xwkq9OBAy4RBSTg4EJwAuw1hK',
 'https://drive.google.com/uc?id='
 ),
 (
 25,
 N'Vàng đồng',
 N'Thiết kế sang trọng, tinh tế với màu vàng đồng, nhỏ gọn, dễ dàng mang theo, Sạc được hai thiết bị cùng lúc, thời gian sạc lại nhanh chóng,
 Tích hợp công nghệ sạc thông minh Power Delivery và USB Quick Charge 3.0 giúp tối ưu dòng điện và sạc đầy nhanh chóng,  Màn hình điện tử hiện thị số.',
 'https://drive.google.com/uc?id=1ElN00KfzViFa2yDsflKSfiLb5KsQITjD',
 'https://drive.google.com/uc?id=1F_6oUN60vif04al1Tg0ESEWdHyAcvAU3',
 'https://drive.google.com/uc?id=1w43eOtUycHDp2-_XJFIib21--EGYeAr9',
 'https://drive.google.com/uc?id=1YrqKg5WR2UhR9AvvQupnsm18kjTsqvxY',
 'https://drive.google.com/uc?id=1P-N5vu_RWHWFUuoK2ifn_HlryIejq5d4',
 'https://drive.google.com/uc?id=16J5t5Iz6Ph2rzU0XMdkxs5xfUoeRZCr9',
 'https://drive.google.com/uc?id=1AI-mqMp783mcoKpBQgEjXo8KWt0CLRUi',
 'https://drive.google.com/uc?id=1kaBppOELl5LPJ5KP4srK1tvBuKdgeGJ-',
 'https://drive.google.com/uc?id=1ui9x3J3fimNgQb8bq6Wq2QO5aJdYFP5A',
 'https://drive.google.com/uc?id=1guou-TX-XG8IbgRd7uZbche5b0jlVVDA',
 'https://drive.google.com/uc?id=1mTHMf3vQNUERvb3DagCfDpx1TGRXffgx',
 'https://drive.google.com/uc?id=1zZSOUdlw_oXzVqFFGstqBabs4lgF7PjA',
 'https://drive.google.com/uc?id=15zTg-hjUtmk_2LC2EwZcg98sYtX7x3sO',
 'https://drive.google.com/uc?id=1hNWdQAjAt_oO4_4ywopCNA38K-IygulJ',
 'https://drive.google.com/uc?id=1wSwEt2SoSIWc7khqnLv2ONgNEMi_Gz8w',
 'https://drive.google.com/uc?id=1U0rjOD77v9YKk2BHR9r_stub0po3gLrj',
 'https://drive.google.com/uc?id=1znS2tTH2H94NBX3m1IEGNPPITQ00wxBE',
 'https://drive.google.com/uc?id=1r7AEHQ5X-NtbQ6J0XmWqYTDgzcKUFRpI',
 'https://drive.google.com/uc?id=13VpQ6ScPadYjBUsutZA79iSKmZ9kT-jU',
 'https://drive.google.com/uc?id=1Gka2BRs7oBuf1kAns1uGK1qfvs9ob2QS',
 'https://drive.google.com/uc?id=1jc_k2m6ioE3Z_r1f0xyzTpN0RIuvlFZQ',
 'https://drive.google.com/uc?id=1FjsqZYi3FhrvohdwhnkPmiV785_J3izi',
 'https://drive.google.com/uc?id=1oCO4KajJ868-_sDcqt_yfDXmbPGheheK',
 'https://drive.google.com/uc?id=1t6faT3glgCjaIZrJZ5l3p6Ii31bXqvR2'
),
(
 26,
 N'Đen',
 N'Trang bị công nghệ Signature Sound, giúp âm bass được tăng cường để mọi bản nhạc trở nên sôi động và trong trẻo hơn, 
 Công suất lên đến 20 W, loa JBL này cho khả năng chơi nhạc sống động và chất lượng âm thanh cao, Đèn LED trên loa được tích hợp đến 5 kiểu đèn',
'https://drive.google.com/uc?id=1gTKt0MWWuQwRidn6LsL7_kHzIXcAOak-',
 'https://drive.google.com/uc?id=11Uqi3qNkAb5KIsBsdDbfDuce8rYgrKtW',
 'https://drive.google.com/uc?id=1WZIQsN3NtiyzjQ7MPvA-kAFC3Nz_7WhL',
 'https://drive.google.com/uc?id=1r78TYQv0Rv1jGfjDcTBi1AXSMqIKtDNH',
 'https://drive.google.com/uc?id=1Z0SaftPuFHtATHeaB7nhX1LRmvuOUnbV',
 'https://drive.google.com/uc?id=1P5yNRLdWl972p9oV06rWXGV5h62Q7w49',
 'https://drive.google.com/uc?id=1qiURDsPqMuVCfsqXrhDnwSp35H4ADvSN',
 'https://drive.google.com/uc?id=1GcDI487iyjFIwsHvlZJ0sPmeFH7USDf-',
 'https://drive.google.com/uc?id=1Jkl6z1PuzUFfPz3fyCzV5PLsy-Da18VN',
 'https://drive.google.com/uc?id=1XjKhtJxnEzQtK-L9lFEHtQenBltxe-ll',
 'https://drive.google.com/uc?id=1crkyV-TaAeQObw_Jz4CjxveN9vb2tcAQ',
 'https://drive.google.com/uc?id=1SUboayYKnxZrY2L0tkREQRHf6emJj63t',
 'https://drive.google.com/uc?id=1rFicIVG2W9h1iXtaLBF2F4cjBUgiz9sM',
 'https://drive.google.com/uc?id=17W93O0mvDM2gVzoUzxV9I6oQbyb9vGDZ',
 'https://drive.google.com/uc?id=1oYv_H35wNkuQ2BXZZUtHTgSu4ppEjzCa',
 'https://drive.google.com/uc?id=19oEw5GT060uctYRb8aAN0fPMiNSkDZSN',
 'https://drive.google.com/uc?id=1z5qlnb0E31b18OjydEy4CBXlMVGacGhp',
 'https://drive.google.com/uc?id=1uT8uL0nkGvoS4CRuUI6NAgW5_Gut5-5G',
 'https://drive.google.com/uc?id=1818RyDUEuVO4q_5RmyJsoMvkx1yzpjzf',
 'https://drive.google.com/uc?id=1bz_BP_Fg7mg8DJGL0f4cmavbsHZnq9Ra',
 'https://drive.google.com/uc?id=1HR6ywlE0Z_bZmCe7HmbVM_5WCW9YdFsl',
 'https://drive.google.com/uc?id=1M4SLu84z5sNhjZR1iyeyEhOBZMNbt4JD',
 'https://drive.google.com/uc?id=13UJL7i5BzfkoULJ4jgKV0jhHnYQbwqIS',
 'https://drive.google.com/uc?id='
 ),
(
 27,
 N'Đỏ, Đen',
 N'Công nghệ Bluetooth cho tín hiệu kết nối ổn định, ngay cả khi loa ở xa thiết bị, Trang bị tính năng TWS giúp kết nối 2 loa với nhau,
 Dung lượng pin 1.500 mAh với thời gian sạc khoảng 3 giờ, cho thời gian nghe nhạc khoảng 3 - 8 giờ tùy vào âm lượng của loa khi nghe nhạc',
 'https://drive.google.com/uc?id=1fCe09Y2Yr5EipQW8Ka7V6Q1mfqpWRkcV',
 'https://drive.google.com/uc?id=10VHBGsR7p0ZtfgoZnKIJ4-tzz_bkh1Fs',
 'https://drive.google.com/uc?id=13PBDrPdi_LjqhaIgifSU12DJ7WaxqqAp',
 'https://drive.google.com/uc?id=1ULInn8For5-UjWj3GPEsYhVHeNs5T93B',
 'https://drive.google.com/uc?id=1rIO7RyWNZIAOA3BMw6ws_zpcno7HSjWu',
 'https://drive.google.com/uc?id=1Fm5gKcMpt-_d1ppa4N0rqN8xIsrtOMbV',
 'https://drive.google.com/uc?id=1N8X5oCgYuvVrW-hb1DvSJtAdIoGGbMvK',
 'https://drive.google.com/uc?id=1L0S2kkmUlcsXx1jf0O4Y6rq5pY5CoN1w',
 'https://drive.google.com/uc?id=1aKEDy5FpDa0Tc0YHtclq-AUzUQQQsIqo',
 'https://drive.google.com/uc?id=1z12-xuvTzcCQcLCi48UrCP67Nc7AHUqZ',
 'https://drive.google.com/uc?id=12tB4W06t2PiK6rvkOEsT4r-VPpfvyjsJ',
 'https://drive.google.com/uc?id=1f_TzJEB0bDrtFwVz5UhP_Wv5QYI9kdwj',
 'https://drive.google.com/uc?id=1Za5_LRW8pHJFLE-jY6Eb_zKGFPG3ZTtV',
 'https://drive.google.com/uc?id=1WQMyzxYjFVI0PIZHn3CNVZHlA6LR69Eq',
 'https://drive.google.com/uc?id=1WlWH3SFIP1aGq5YmzEegN3_AY6ZKqiZt',
 'https://drive.google.com/uc?id=1qkholNTtxVhPZVZSBD6mztExmDGBCUZx',
 'https://drive.google.com/uc?id=1l5BuMFQPxdp8Q8cbK5-la2TBE37mf9ca',
 'https://drive.google.com/uc?id=1sjfG9Ydsqtdf7ncYzieStu6fuV8mzAVc',
 'https://drive.google.com/uc?id=1E1qdJ5WWTa2QFNu1caIZiaXtNYM549Yo',
 'https://drive.google.com/uc?id=1Bdsg3Fy-xOEPus6m5hyCAauQtzydM4lY',
 'https://drive.google.com/uc?id=1GU7_tvMyEYkxwy5imOczbZV0zatlFI0v',
 'https://drive.google.com/uc?id=1FfZljk8v4KsR_ZNsq-an4Bg9A0se9jlh',
 'https://drive.google.com/uc?id=1BVg-2PG47WCMZ7AcOK2GGawQ5_90YWra',
 'https://drive.google.com/uc?id=1Jn2kpJdt0__chiu_CO7SLbGug4amDB0y'
 ),
(
 28,
 N'Đen',
 N'Thiết kế năng động, trẻ trung, với quai cầm tiện ích, dễ dàng mang theo khi đi du lịch, cắm trại, Có đèn Led đổi màu theo nhịp điệu,
 Công nghệ Bluetooth 5.0 cho kết nối ổn định trong khoảng cách 10 m, giúp bạn tiện lợi hơn khi kết nối, 
 Trang bị khả năng chống nước IPX5 giúp loa Bluetooth chống lại tia nước áp suất thấp trong ít nhất 3 phút',
 'https://drive.google.com/uc?id=1h7nuZYLB1fk_XQNa2pxOE51brWb1G0wP',
 'https://drive.google.com/uc?id=1DMV_JDl3PijW2oIMs8Dzbhlun5Ipx_Eh',
 'https://drive.google.com/uc?id=10XR7xWPzYE9FbUJEj_vL4PaqJniPAcuO',
 'https://drive.google.com/uc?id=1YoPSLgJ3yXrL3p3glwQ4htO-QNlQxmUZ',
 'https://drive.google.com/uc?id=1mOm8pbEj8yqi5O1pE0I-1CggjJjN7aFE',
 'https://drive.google.com/uc?id=1MS95oe94zIaI6ocXBB1ozrGd_gO9tksi',
 'https://drive.google.com/uc?id=1z8si3yad3mLV-ztNneP65NCm3UWyqa9c',
 'https://drive.google.com/uc?id=1uYNTdizYoBIJSqRVULa6JYdjg_zDg5D0',
 'https://drive.google.com/uc?id=139_nC_WYRjo2JAjYAtJKkonBM7apmBUN',
 'https://drive.google.com/uc?id=12RxZrDBCY4xgIZCZBKmnJXxL_mwScFdZ',
 'https://drive.google.com/uc?id=1qVD7dfTtGTrSU4uk73c7p5Z65ZjM-IJx',
 'https://drive.google.com/uc?id=117yw8TGnSfS_BRJErztEwX3gUnvgnfmd',
 'https://drive.google.com/uc?id=1Du6OXczHYc_T8Yu8pYuSGsgPAGi9_HVC',
 'https://drive.google.com/uc?id=1UoPj5MQtlHYt5Ge4YKsVXpOtMJMxB9Qb',
 'https://drive.google.com/uc?id=1pM4mI-cvPPwYiBU4-KffEGDw8CP7ZvBe',
 'https://drive.google.com/uc?id=1HJ6rzbQgHHKlUB16QLTyQm4blC31HWbl',
 'https://drive.google.com/uc?id=1xey4-Xjhim2sVXKZznpK-urqbLE3uGkr',
 'https://drive.google.com/uc?id=1ZNsIpHVTHv6w6-6Jqu8GIMv17K2apfno',
 'https://drive.google.com/uc?id=18L2CuhJI0je15GtEdYTJ5soNON5nq65k',
 'https://drive.google.com/uc?id=1dz9B9Gttrmco1N2fSh2CiSkR0O4zZcMa',
 'https://drive.google.com/uc?id=1SFJGvsB_ZCx9vvG6aEcICOZg75tq-8hc',
 'https://drive.google.com/uc?id=1eQ6BBphmuaJTnC5L4kY5hihFdZep-Xe_',
 'https://drive.google.com/uc?id=1mfKJyQ9aPPiy7wF3hdzXurk_6oxhZFUN',
 'https://drive.google.com/uc?id=119O5b_pSYhH_89whrCjh-HpPLXH6nNue'
 ),
 (
 29,
 N'Đỏ, Xanh dương, Đen',
 N'Công nghệ kết nối Bluetooth 4.1, cho khả năng kết nối với thiết của bạn bị ở khoảng cách 10 m, Kết nối với điện thoại để nghe nhạc, xem phim, hay nhận thông báo với âm thanh lớn hơn,
 Loa Bluetooth mini có khả năng kết nối với nhiều thiết bị như điện thoại, máy tính bảng, laptop,... được trang bị Bluetooth',
'https://drive.google.com/uc?id=1v0PYAVaY4OST044wKY35baLxph1Z6kkK',
 'https://drive.google.com/uc?id=1HJnpUs-65tgBrX4tJEiMCZdjP5blwX0J',
 'https://drive.google.com/uc?id=1ajL5yoGmF2AhgJw3nwoIH8jQ-8C7-auz',
 'https://drive.google.com/uc?id=1CAA3JC5cxCpUJfkuHNQ5fVUCEnMtnbOG',
 'https://drive.google.com/uc?id=1aSMfw2uX2TzYwmGDX48jovJrd3OAT15U',
 'https://drive.google.com/uc?id=1SvgPKv5tA_RSX8M5ngHq1ef72tEGtOUA',
 'https://drive.google.com/uc?id=1LOYO6iu2wme6e601Hxt_0c650N95NeOx',
 'https://drive.google.com/uc?id=1LC-1yMyXHcUUQHbfIbsFYCL0Xv_dIFTw',
 'https://drive.google.com/uc?id=1bxbDHaHysOxSDBun3YG9wafAihQxA2To',
 'https://drive.google.com/uc?id=1Qrm4UqWpwPl5UYSKO7iEtEbhLgp4uJKX',
 'https://drive.google.com/uc?id=1sB5V4OUSbmGno53TCqPHv5NPlD7T18l-',
 'https://drive.google.com/uc?id=1742IzsDd_m6oSMR7M6oKg2NilrCCLgtU',
 'https://drive.google.com/uc?id=18ld867Da9FmQN1zMSWOcYyf-KwGlB8Iw',
 'https://drive.google.com/uc?id=10w5rTk2noVhLMG2LN97r3l666yW2Y7Bk',
 'https://drive.google.com/uc?id=1Dvpk9uZXmOFvHRQR4woZS5dz_PpfgJV8',
 'https://drive.google.com/uc?id=11ADHNOn4BVSqIKR2Typ41_AlLJtc7sTv',
 'https://drive.google.com/uc?id=1JrhdylZbKA2YUUKMu0ogs2JuI55302UU',
 'https://drive.google.com/uc?id=1XNnh6wFq-w5olUMItIY-PmuD5vyVA9YV',
 'https://drive.google.com/uc?id=13Z9ltx2QFmyZA_94tY4HUfz8PAHlOK7Z',
 'https://drive.google.com/uc?id=1A_0wIYRRNeJRO0uKkoLB46IcqqwMRfRN',
 'https://drive.google.com/uc?id=17unoQ5KQ0PiRAgdBQHdcZoNu8PTnRrX5',
 'https://drive.google.com/uc?id=1sSBQM5JRt2Bc1Ls7ytiD-La33K4gMGEC',
 'https://drive.google.com/uc?id=1BxnYNwHULr9O0WtEvaujQkwbKHXTo_fm',
 'https://drive.google.com/uc?id=1DC2QweAlnDOkkndotCz-ynRsVe1ZpluB'
 ),
 (
 30,
 N'Đen',
 N'Thiết kế nhỏ gọn, chắc chắn, dễ dàng mang theo bên mình khi đi du lịch, dã ngoại,..., Dung lượng pin 2.000 mAh, cho thời gian sử dụng từ 3 đến 5 giờ, thời gian sạc 3 giờ,
 Công suất 10W mang đến trải nghiệm âm thanh sống động, rõ nét, Loa Mozard Kết nối được nhiều thiết bị: Máy tính, Laptop, điện thoại, máy tính bảng, Tivi,
 Công nghệ bluetooth 4.2, âm thanh mượt mà, ổn định với khoảng cách kết nối lên đến 10 m',
'https://drive.google.com/uc?id=18Bzou3UKI_x9mtali2kJfhxsSFNyq---',
 'https://drive.google.com/uc?id=1miB-L_bIbBL8xFHDwWbB5D5W6F_FhCwH',
 'https://drive.google.com/uc?id=1AqK45ul2UISoanEaPM00NRt5-ZAJYY4N',
 'https://drive.google.com/uc?id=1SBeQJLujeiMMZeSFs5BCrhY-km_u401q',
 'https://drive.google.com/uc?id=1_FXGpBaOvsdYbn8RQKjuINs0WK986bYX',
 'https://drive.google.com/uc?id=1cJJ4JwJAepb-b7xB0oj5NL10l7poV82S',
 'https://drive.google.com/uc?id=1PwSQObtfrooeHwuujgNyMjiaKld_42N4',
 'https://drive.google.com/uc?id=1SFahezplYZ1Wql_75XXOrgPGH9ptTjzh',
 'https://drive.google.com/uc?id=1UBLVwYjYzqGlQMNG5ceeAWqHZYbpHN9X',
 'https://drive.google.com/uc?id=1U5xlnM_paWV6u4YToUaI7rJFoGdeyzdp',
 'https://drive.google.com/uc?id=1oGNwse3efOUX1Og0a1m3UBcVrKeqNL-A',
 'https://drive.google.com/uc?id=1V9qAyUxPVinpdCqFF-SPRGvL7TEzL-rP',
 'https://drive.google.com/uc?id=1stdFyZKHPAmToV4fHaRuDjKVtYKd4D44',
 'https://drive.google.com/uc?id=1oqgZzJWNSwYj14-OGD9791KPMY3DX2Pw',
 'https://drive.google.com/uc?id=13tIh1iBTUv1pzdLMPckJL9kY5VdGhYB0',
 'https://drive.google.com/uc?id=1J2HqDSNybpNLO_3zdQhxAuxqjgLsGXIg',
 'https://drive.google.com/uc?id=1s62PcuRLNcLunBnSPw3VFzud1vnYy2Fg',
 'https://drive.google.com/uc?id=1BFTAgSMGMu0O-jDzlv11OUjGsr4FGTTX',
 'https://drive.google.com/uc?id=1oreM_UBjsxJm4eKrKKTCq_sBukaSrhb1',
 'https://drive.google.com/uc?id=10mmPQbINYo6oljnS08iiXwdwu2ULZ57T',
 'https://drive.google.com/uc?id=1NO2LtSH38dVOoApi0zqCAw0ySlBpVL2n',
 'https://drive.google.com/uc?id=1NsRr8Y0WA6KyfHGZbXmSj6coR1fpWK40',
 'https://drive.google.com/uc?id=1Gw5lLvSxyI2PmpwPxnNF72EqD6usxFwa',
 'https://drive.google.com/uc?id=19Yjw0-Kpg71Hy30ezFH5zz_BRXVON8nG'
 )

create table manhinh(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	congnghemanhinh nvarchar(200),
	dophangiai 	nvarchar(200),
	manhinhrong	nvarchar(200),
	matkinhcamung	nvarchar(200),
)
insert into manhinh(maSp,tensp,congnghemanhinh,dophangiai,manhinhrong,matkinhcamung)
values(
1,
N'Samsung Galaxy Fold',
N'Chính:Dynamic AMOLED, phụ:Super AMOLED',N'2152 x 1536 Pixels',N'Chính 7.3" & Phụ 4.6"',
N'Kính cường lực Corning Gorilla Glass 6'
),
(
2, 
N'SAMSUNG GALAXY Z FLIP',
N'Chính: Dynamic AMOLED,phụ: Super AMOLED',N'Full HD+ (1080 x 2636 Pixels)',N'6.7"',
N'Kính siêu mỏng Ultra Thin Glass (UTG)'
),
(
3, 
N'SAMSUNG GALAXY NOTE 10 PLUS',N'Dynamic AMOLED',N'2K+ (1440 x 3040 Pixels)',N'6.8"',
N'Kính cường lực Corning Gorilla Glass'
),
(
4, 
N'SAMSUNG GALAXY S10 PLUS',N'	Dynamic AMOLED',N'2K+ (1440 x 3040 Pixels)',N'6.4"',
N'	Kính cường lực Corning Gorilla Glass 6'),
(
5,
N'SAMSUNG GALAXY NOTE 10',N'Dynamic AMOLED',N'Full HD+ (1080 x 2280 Pixels)',N'6.3"',
N'Kính cường lực Corning Gorilla Glass'),
(
6,
N'SAMSUNG GALAXY TAB S6',N'Super AMOLED',N'2560 x 1600 pixels',N'10.5"',N''),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',N'PLS LCD',N'1200 x 2000 Pixels',N'10.4"',N''),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',N'TFT LCD',N'1920 x 1200 pixels',N'10.1"',N''),
(
9,
N'SAMSSUNG GALAXY TAB A8',N'TFT LCD',N'1280 x 800 pixels',N'8"',N''),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',N'TFT LCD',N'1280 x 800 pixels',N'8"',N''),
(
11,
N'Samsung Galaxy Fit e R375',N'PMOLED',N'0.74 inch',N'64 x 128 pixels',N'Mặt kính thường'),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',N'SUPER AMOLED',N'1.2 inch',N'360 x 360 pixels',
N'Kính cường lực Gorilla Glass Dx+'),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',N'SUPER AMOLED',
N'1.2 inch',N'360 x 360 pixels',N'	Kính cường lực Gorilla Glass Dx+'),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',N'SUPER AMOLED',
N'1.4 inch',N'360 x 360 pixels',N'Kính cường lực Gorilla Glass Dx+'),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',N'SUPER AMOLED',N'1.4 inch',
N'360 x 360 pixels',N'Kính cường lực Gorilla Glass Dx+')


create table cameraSau(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	dophangiai	nvarchar(200),
	quayphim	nvarchar(200),
	denflash	nvarchar(200),
	chupanhnangcao	nvarchar(400),
)
INSERT INTO cameraSau(maSp,tensp,dophangiai,quayphim,denflash,chupanhnangcao)
values(
1,
N'Samsung Galaxy Fold',
N'Chính 12 MP & Phụ 12 MP,16 MP',
N'Quay phim HD 720p@960fps, Quay phim FullHD 1080p@60fps,Quay phim FullHD 1080p@240fps,Quay phim 4K 2160p@60fps',
N'Có',
N'A.I Camera, Ban đêm (Night Mode), Trôi nhanh thời gian (Time Lapse), Quay chậm (Slow Motion), Làm đẹp, Góc rộng (Wide), Góc siêu rộng (Ultrawide), Quay siêu chậm (Super Slow Motion), Xoá phông, 
Tự động lấy nét (AF), Chạm lấy nét, Nhận diện khuôn mặt, HDR, Toàn cảnh (Panorama), Chống rung quang học (OIS), Làm đẹp (Beautify),Chuyên nghiệp (Pro)'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',N'Chính 12 MP & Phụ 12 MP',
N'Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, 
Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps',
N'	Có',
N'Quay chậm (Slow Motion), Xoá phông, Zoom quang học, Chụp bằng cử chỉ, Góc rộng (Wide), Góc siêu rộng (Ultrawide), Trôi nhanh thời gian (Time Lapse), Ban đêm (Night Mode), A.I Camera, 
Tự động lấy nét (AF), Chạm lấy nét, Nhận diện khuôn mặt, HDR, Toàn cảnh (Panorama), Chống rung quang học (OIS), Làm đẹp (Beautify), Chuyên nghiệp (Pro)'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',N'Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D',
N'Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps',
N'Có',
N'Quay siêu chậm (Super Slow Motion), Lấy nét theo pha (PDAF), A.I Camera, Trôi nhanh thời gian (Time Lapse), Quay chậm (Slow Motion), Xoá phông, Zoom quang học, Làm đẹp, Góc rộng (Wide), 
Góc siêu rộng (Ultrawide), Tự động lấy nét (AF), Chạm lấy nét, Nhận diện khuôn mặt, HDR, Toàn cảnh (Panorama), Chống rung quang học (OIS), Làm đẹp (Beautify), Chuyên nghiệp (Pro)'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',N'Chính 12 MP & Phụ 12 MP, 16 MP',
N'Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps',
N'Có',
N'Quay chậm (Slow Motion), Quay siêu chậm (Super Slow Motion), Điều chỉnh khẩu độ, Lấy nét theo pha (PDAF), A.I Camera, Ban đêm (Night Mode), Trôi nhanh thời gian (Time Lapse), Xoá phông, 
Zoom quang học, Tự động lấy nét (AF), Chạm lấy nét, Nhận diện khuôn mặt, HDR, Toàn cảnh (Panorama), Chống rung quang học (OIS), Làm đẹp (Beautify), Chuyên nghiệp (Pro)'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',N'Chính 12 MP & Phụ 12 MP, 16 MP',
N'Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps',
N'Có',
N'Quay siêu chậm (Super Slow Motion), Lấy nét theo pha (PDAF), A.I Camera, Trôi nhanh thời gian (Time Lapse), Quay chậm (Slow Motion), Xoá phông, Zoom quang học, Làm đẹp, Góc rộng (Wide), 
Góc siêu rộng (Ultrawide), Tự động lấy nét (AF), Chạm lấy nét, Nhận diện khuôn mặt, HDR, Toàn cảnh (Panorama), Chống rung quang học (OIS), Làm đẹp (Beautify), Chuyên nghiệp (Pro)'
),
(
6,
N'SAMSUNG GALAXY TAB S6',N'	Chính 13 MP & Phụ 5 MP',N'4K 2160p@30fps',N'không',
N'Chế độ làm đẹp, Chụp hình góc rộng, Chụp hình góc siêu rộng, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama'
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',N'8 MP',N'FullHD 1080p@30fps',N'không',
N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama'
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',N'	8 MP',N'FullHD 1080p@30fps',N'không',
N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt'
),
(
9,
N'SAMSSUNG GALAXY TAB A8',N'8 MP',N'FullHD 1080p@30fps',N'không',
N'Tự động lấy nét, Nhận diện khuôn mặt'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',N'8 MP',N'FullHD 1080p@30fps',N'không',
N'Tự động lấy nét, Nhận diện khuôn mặt'
)


create table cameraTruoc(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	dophangiai nvarchar(200),
	videocall	nvarchar(200),
	thongtinkhac	nvarchar(200),
)
insert into cameraTruoc(maSp,tensp,dophangiai,videocall,thongtinkhac)
values(
1,
N'Samsung Galaxy Fold',N'Trong: 10 MP, 8 MP; Ngoài: 10 MP',N'Hỗ trợ VideoCall thông qua ứng dụng',
N'HDR, Xoá phông, Quay phim 4K, Nhãn dán (AR Stickers), Quay video HD, Nhận diện khuôn mặt, 
Làm đẹp (Beautify), Quay video Full HD, Tự động lấy nét (AF)'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'10 MP',
N'Hỗ trợ VideoCall thông qua ứng dụng',
N'Xoá phông, Nhãn dán (AR Stickers), Nhận diện khuôn mặt, Làm đẹp (Beautify), 
Quay video Full HD, Tự động lấy nét (AF), HDR, A.I Camera'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',N'10 MP',N'	Hỗ trợ VideoCall thông qua ứng dụng',
N'Flash màn hình, Quay video HD, Nhận diện khuôn mặt, Làm đẹp (Beautify), Quay video Full HD, Tự động lấy nét (AF)'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',N'Chính 10 MP & Phụ 8 MP',N'Có',
N'Tự động lấy nét (AF), Quay video Full HD, HDR, Xoá phông, Quay phim 4K, Nhãn dán (AR Stickers), Flash màn hình, Chụp bằng cử chỉ, Nhận diện khuôn mặt, Làm đẹp (Beautify)'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',N'10 MP',N'Hỗ trợ VideoCall thông qua ứng dụng',
N'Flash màn hình, Quay video HD, Nhận diện khuôn mặt, Làm đẹp (Beautify), Quay video Full HD, Tự động lấy nét (AF)'
),
(
6,
N'SAMSUNG GALAXY TAB S6',N'8 MP',N'',N''
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',N'5 MP',N'',N''
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',N'5 MP',N'',N''
),
(
9,
N'SAMSSUNG GALAXY TAB A8',N'2 MP',N'',N''
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',N'2 MP',N'',N''
)

create table hedieuhanh(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	hedieuhanh nvarchar(200),
	chipset	nvarchar(200),
	tocdoCPU nvarchar(200),
	chipdohoa nvarchar(200),
)
insert into hedieuhanh(maSp,tensp,hedieuhanh,chipset,tocdoCPU,chipdohoa)
values(
1,
N'Samsung Galaxy Fold',
N'Android 9.0 (Pie)',
N'Snapdragon 855 8 nhân',
N'1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz',
N'	Adreno 640'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'Android 10',
N'Snapdragon 855+ 8 nhân',
N'1 nhân 2.96 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz',
N'Adreno 640 (700 Hz)'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'Android 9.0 (Pie)',
N'Exynos 9825 8 nhân',
N'2 nhân 2.73 GHz, 2 nhân 2.4 GHz & 4 nhân 1.9 GHz',
N'Mali-G76 MP12'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'Android 9.0 (Pie)',
N'Exynos 9820 8 nhân',
N'2 nhân 2.7 GHz, 2 nhân 2.3 GHz & 4 nhân 1.9 GHz',
N'Mali-G76 MP12'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'Android 9.0 (Pie)',
N'Exynos 9825 8 nhân',
N'2 nhân 2.73 GHz, 2 nhân 2.4 GHz & 4 nhân 1.9 GHz',
N'Mali-G76 MP12'
),
(6,
N'SAMSUNG GALAXY TAB S6',
N'Android 9.0 (Pie)',
N'Snapdragon 855 8 nhân',
N'1 nhân 2.84 GHz, 3 nhân 2.41 GHz & 4 nhân 1.78 GHz',
N'Adreno 640'
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
N'Android 10',
N'Exynos 9611 8 nhân',
N'4 nhân 2.3 GHz & 4 nhân 1.7 GHz',
N'Mali-G72 MP3'
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'	Android 9.0 (Pie)',
N'Exynos 7904 8 nhân',
N'2 nhân 1.8 GHz & 6 nhân 1.6 GHz',
N'G71 MP2'
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'Android 9.0 (Pie)',N'Snapdragon 429',
N'4 nhân 2.0 GHz',
N'Adreno 504'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'Android 9.0 (Pie)',
N'Snapdragon 429',
N'4 nhân 2.0 GHz',N'	
Adreno 504'
),
(
11,
N'Samsung Galaxy Fit e R375',N'FreeRTOS',N'',N'Đang cập nhật',N''
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',N'OS TIZEN',
N'',N'Exynos 9110',N''
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',
N'OS TIZEN',N'',N'Exynos 9110',N''
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',
N'OS TIZEN',N'',N'Exynos 9110',N''
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',
N'OS TIZEN',N'',N'Exynos 9110',N''
)

create table bonho(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	ram	nvarchar(200),
	bonhotrong	nvarchar(200),
	bonhokhadung	nvarchar(200),
	thenhongoai	nvarchar(200),	
	hotrothetoida	nvarchar(200),	
)
insert into bonho(maSp,tensp,ram,bonhotrong,bonhokhadung,thenhongoai,hotrothetoida)
values(
1,
N'Samsung Galaxy Fold',
N'12 GB',N'512 GB',N'Khoảng 461 GB',N'	Không',
N''
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'8 GB',N'256 GB',N'Khoảng 223 GB',N'Không',N''
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'12 GB',N'256 GB',N'Khoảng 223 GB',N'MicroSD, hỗ trợ tối đa 1 TB',N''
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'8 GB',N'128 GB',N'Khoảng 108 GB',N'MicroSD, hỗ trợ tối đa 512 GB',N''
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'8 GB',
N'256 GB',
N'Khoảng 223 GB',
N'Không',
N''
),
(
6,
N'SAMSUNG GALAXY TAB S6',
N'6 GB',N'128 GB',N'Đang cập nhật',N'Micro SD',N'512 GB'
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
N'4 GB',N'64 GB',N'Đang cập nhật',N'Micro SD',N'1 TB'
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'3 GB',
N'32 GB',
N'Khoảng 26 GB',
N'Micro SD',
N'512 GB'
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'2 GB',
N'4 MB',
N'32 GB',
N'Micro SD',
N'512 GB'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'2 GB',
N'32 GB',
N'Khoảng 26 GB',
N'Micro SD',
N'512 GB'
),
(
11,
N'Samsung Galaxy Fit e R375',
N'',N'4 MB',N'',N'',N''
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',
N'',N'4 GB',N'',N'',N''
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',
N'',N'4 GB',N'',N'',N''
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',
N'',N'4 GB',N'',N'',N''
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',
N'',N'4 GB',N'',N'',N''
)


create table ketnoi(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	mangdidong nvarchar(200),
	sim	nvarchar(200),
	wifi nvarchar(200),
	GPS 	nvarchar(200),
	Bluetooth 	nvarchar(200),
	boSac	nvarchar(200),
	jackTaiNghe	nvarchar(200),
	ketNoiKhac	nvarchar(200),
)
INSERT INTO ketnoi(maSp,tensp,mangdidong,sim,wifi,GPS,Bluetooth,bosac,jackTainghe,ketnoikhac)
values(
1,
N'Samsung Galaxy Fold',
N'Hỗ trợ 4G',N'	1 eSIM & 1 Nano SIM',
N'Wi-Fi 802.11 b/g/n, Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot',
N'BDS, A-GPS, GLONASS',N'A2DP, LE, apt-X, v5.0',
N'USB Type-C',N'Không',N'NFC, OTG'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'Hỗ trợ 4G',N'1 eSIM & 1 Nano SIM',
N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot',
N'BDS, A-GPS, GLONASS',N'apt-X, A2DP, LE, v5.0',
N'USB Type-C',N'USB Type-C',N'NFC, OTG'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'Hỗ trợ 4G',N'2 SIM Nano (SIM 2 chung khe thẻ nhớ)',
N'Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi Direct, Wi-Fi hotspot',
N'BDS, A-GPS, GLONASS',N'A2DP, LE, apt-X, v5.0',
N'2 đầu Type-C',N'USB Type-C',N'NFC, OTG'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'Hỗ trợ 4G',N'2 SIM Nano (SIM 2 chung khe thẻ nhớ)',
N'Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot',
N'BDS, A-GPS, GLONASS',N'A2DP, apt-X, LE, v5.0',
N'USB Type-C',N'3.5 mm',N'NFC, OTG'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'Hỗ trợ 4G',N'2 Nano SIM',
N'Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi Direct, Wi-Fi hotspot',
N'BDS, A-GPS, GLONASS',N'LE, A2DP, apt-X, v5.0',
N'2 đầu Type-C',N'USB Type-C',N'NFC, OTG'
),
(
6,
N'SAMSUNG GALAXY TAB S6',
N'Có 3G,4G LTE',N'Nano Sim',
N'Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Dual-band, Wi-Fi hotspot',
N'GPS, GLONASS',N'LE, A2DP, 5.0',
N'USB Type-C',N'Không',N'OTG'
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
N'Có 3G,4G LTE',N'Nano Sim',
N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot',
N'GPS, GLONASS',N'5.0, LE',
N'USB Type-C',N'3.5 mm',N'OTG'
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'Có 3G,4G LTE',N'Nano Sim',
N'Wi-Fi 802.11 a/b/g/n/ac',
N'A-GPS',N'	5.0',
N'USB Type-C',N'3.5 mm',N'Không'
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'Có 3G,4G LTE',
N'Nano SIM',
N'Wi-Fi 802.11 b/g/n',
N'Đang cập nhật',
N'v4.2',
N'Micro USB',
N'3.5 mm',
N'Đang cập nhật'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'Có 3G,4G LTE',
N'Nano Sim',
N'Wi-Fi 802.11 b/g/n',
N'Không',
N'4.2',
N'Micro USB',
N'3.5 mm',
N'Không'
),
(
11,
N'Samsung Galaxy Fit e R375',N'',N'',N'','',N'',N'',N'',N'Bluetooth'
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',
N'',N'',N'','',N'',N'',N'',N'Wifi, Bluetooth v5.0, GPS, NFC'
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',
N'',N'',N'','',N'',N'',N'',N'Wifi, Bluetooth v5.0, GPS, NFC'
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',
N'',N'',N'','',N'',N'',N'',N'Wifi, Bluetooth v5.0, GPS, NFC'
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',
N'',N'',N'','',N'',N'',N'',N'Wifi, Bluetooth v5.0, GPS, NFC'
),
(
16,
N'Tai nghe Gaming Rapoo VH500 7.1',
N'',N'',N'','',N'',N'',N'',N'1 thiết bị'
),
(
17,
N'Tai nghe Bluetooth True Wireless Aukey EP-K01',
N'',N'',N'','',N'',N'',N'',N'1 thiết bị'
),
(
18,
N'Tai nghe Bluetooth True Wireless JBL REFFLOW',
N'',N'',N'','',N'',N'',N'',N'1 thiết bị'
),
(
19,
N'Tai nghe Bluetooth Mozard Z702',
N'',N'',N'','',N'',N'',N'',N'1 thiết bị'
),
(
20,
N'Tai nghe Bluetooth True Wireless Sony WF-1000XM3BME',
N'',N'',N'','',N'',N'',N'',N'Bluetooth'
),
(
26,
N'Loa Bluetooth JBL Pulse 4',N'',N'',N'','',N'',N'',N'',N'Bluetooth'
),
(
27,
N'Loa Bluetooth Mozard E7',
N'',N'',N'','',N'',N'',N'',N'Bluetooth,Thẻ nhớ Micro SDJack 3.5 mm'
),
(
28,
N'Loa Bluetooth MozardX BM01',
N'',N'',N'','',N'',N'',N'',N'Bluetooth 5.0,Jack 3.5 mm,Thẻ nhớ USB'
),
(
29,
N'Loa Bluetooth JBL GO2',
N'',N'',N'','',N'',N'',N'',N'Bluetooth 4.1,Jack 3.5 mm'
),
(
30,
N'Loa Bluetooth Mozard H8030D',
N'',N'',N'','',N'',N'',N'',N'Bluetooth,Jack 3.5 mmUSB'
)

create table thietketrongluong(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	thietke	nvarchar(200),
	chatlieu	nvarchar(200),
	kichthuoc	nvarchar(200),
	trongluong	nvarchar(200),
)
insert into thietketrongluong(maSp,tensp,thietke,chatlieu,kichthuoc,trongluong)
values
(
1,
N'Samsung Galaxy Fold',
N'Nguyên khối',
N'Khung kim loại & Mặt lưng kính cường lực',
N'Mở: Dài 160.9 mm - Ngang 117.8 mm - Dày 6.9 mm; Gập: Dài 160.9 mm - Ngang 62.8 mm - Dày 16.8 mm',
N'269 g'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'Nguyên khối',
N'Khung kim loại & Mặt lưng kính cường lực',
N'Dài 167.3 mm - Ngang 73.6 mm - Dày 7.2 mm',
N'183 g'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'Nguyên khối',
N'Khung kim loại & Mặt lưng kính cường lực',
N'Dài 162.3 mm - Ngang 77.2 mm - Dày 7.9 mm',
N'196 g'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'Nguyên khối',
N'Khung kim loại & Mặt lưng kính cường lực',
N'Dài 157.6 mm - Ngang 74.1 mm - Dày 7.8 mm',
N'175 g'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'Nguyên khối',
N'Khung kim loại & Mặt lưng kính cường lực',
N'Dài 151 mm - Ngang 71.8 mm - Dày 7.9 mm',
N'168 g'
),
(
6,
N'SAMSUNG GALAXY TAB S6',
N'',
N'Kim loại',
N'	Dài 244.5 mm - Ngang 159.5 mm - Dày 5.7 mm',
N'	420 g'
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
N'',
N'Kim loại',
N'Dài 244.5 mm - Ngang 154.3 mm - Dày 7.0 mm',
N'467 g'
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'',
N'Kim loại',
N'Dài 245.2 mm - Ngang 149.4 mm - Dày 7.5 mm',
N'470 g'
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'',
N'Nhựa',
N'Dài 210 mm - Ngang 124.4 mm - Dày 8 mm',
N'347 g'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'',
N'Kim loại',
N'Dài 210 mm - Ngang 124.4 mm - Dày 8 mm',
N'347 g'
),
(
11,
N'Samsung Galaxy Fit e R375',
N'',
N'Không',
N'	Dài 40.2 - Rộng 10.9 mm - Dày 16 mm',
N'15 g'
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',
N'',
N'Thép không gỉ',
N'Đang cập nhật',
N'37 gram'
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',
N'',
N'Nhôm',
N'Đang cập nhật',
N'37 gram'
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',
N'',
N'Nhôm',
N'Đang cập nhật',
N'42 gram'
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',
N'',
N'Thép không gỉ',
N'Đang cập nhật',
N'42 gram'
),
(
16,
N'Tai nghe Gaming Rapoo VH500 7.1',N'',N'',N'',N'520g (kèm hộp)'
),
(
17,
N'Tai nghe Bluetooth True Wireless Aukey EP-K01',N'',N'',N'',N'34g (kèm hộp)'
),
(
18,
N'Tai nghe Bluetooth True Wireless JBL REFFLOW',N'',N'',N'',N'85g'
),
(
19,
N'Tai nghe Bluetooth Mozard Z702',N'',N'',N'',N'31g'
),
(
20,
N'Tai nghe Bluetooth True Wireless Sony WF-1000XM3BME',N'',N'',N'',N'8,5g/ 1 tai nghe, 77g/hộp sạc'
),
(
21,
N'Sạc dự phòng Polymer 10.000 mAh Type C eSaver PJ JP106S',N'',N'',
N'Dài 14 cm - Ngang 7.2 cm - Dày 1.4 cm',N'254.6 g'
),
(
22,
N'Sạc dự phòng 7.500mAh AVA LJ JP195',N'',N'',N'',N'172g'
),
(
23,
N'Sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST',N'',N'',
N'Dài 11.2cm - Rộng 6.7cm - Dài 1.6cm',N'217g'
),
(
24,
N'Sạc dự phòng Polymer 20.000mAh Type C Anker PowerCore Metro Essential A1268',N'',N'',N'',
N'342.5 g'
),
(
25,
N'Sạc dự phòng Polymer 10.000mAh Type C PD QC3.0 Mbest DS506-WB',N'',N'',
N'Dài 14.5 cm - Rộng 6.85 cm - Dày 1.35 cm',N'235g'
)

create table thongtinsac(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	dungluongpin	nvarchar(200),
	loaipin	nvarchar(200),
	congnghePin	nvarchar(200),
)
INSERT INTO thongtinsac(maSp,tensp,dungluongpin,loaipin,congnghepin)
values(
1,
N'Samsung Galaxy Fold',
N'4380 mAh',
N'Pin chuẩn Li-Po',
N'Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'3300 mAh',
N'Pin chuẩn Li-Po',
N'Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây, Sạc ngược không dây'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'4300 mAh',
N'Pin chuẩn Li-Ion',
N'Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'4100 mAh',
N'Pin chuẩn Li-Ion',
N'Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây, Sạc ngược không dây'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'3500 mAh',
N'Pin chuẩn Li-Ion',
N'Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây'
),
(
6,
N'SAMSUNG GALAXY TAB S6',
N'7040 mAh',
N'Li-Po',
N''
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',
N'7040 mAh',
N'Pin chuẩn Li-Ion',
N''
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'6150 mAh',
N'Lithium - Ion',
N''
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'5100 mAh',
N'Lithium-ion',
N''
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'5100 mAh',
N'Lithium - Ion',
N''
),
(
11,
N'Samsung Galaxy Fit e R375',N'70 mAh',N'',N''
),
(
12,
N'Samsung Galaxy Watch Active 2 40mm viền thép dây da',N'247 mAh',N'',N''
),
(
13,
N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone',N'247 mAh',N'',N''
),
(
14,
N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone',N'340 mAh',N'',N''
),
(
15,
N'Samsung Galaxy Watch Active 2 LTE 44mm viền thép dây da',N'340 mAh',N'',N''
),
(
21,
N'Sạc dự phòng Polymer 10.000 mAh Type C eSaver PJ JP106S',N'',
N'Pin Polymer (Li-Po)',N''
),
(
22,
N'Sự phòng 7.500mAh AVA LJ JP195',N'',N'Pin Li-Ion',N''
),
(
23,
N'Sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST',N'',
N'Pin Polymer (Li-Po)',N''
),
(
24,
N'Sạc dự phòng Polymer 20.000mAh Type C Anker PowerCore Metro Essential A1268',N'',
N'Pin Polymer (Li-Po)',N''
),
(
25,
N'Sạc dự phòng Polymer 10.000mAh Type C PD QC3.0 Mbest DS506-WB',N'',
N'Pin Polymer (Li-Po)',N''
)

create table Tienich(
	id int primary key identity,
	maSp int,
	tensp nvarchar(200),
	baomatnangcao	nvarchar(200),
	tinhnangdacbiet	nvarchar(800),
	ghiam	nvarchar(100),
	radio	nvarchar(100),
	xemphim nvarchar(200),
	nghenhac	nvarchar(200),	
)
insert into Tienich(maSp,tensp,baomatnangcao,tinhnangdacbiet,ghiam,radio,xemphim,nghenhac)
values(
1,
N'Samsung Galaxy Fold',
N'Mở khóa bằng vân tay, Mở khoá khuôn mặt',
N'Dolby Audio™, Đèn pin, Sạc pin không dây, Chạm 2 lần sáng màn hình, Sạc pin nhanh, Chặn cuộc gọi, Chặn tin nhắn, 
Màn hình luôn hiển thị AOD, Trợ lý ảo Samsung Bixby, Samsung Pay, Nhân bản ứng dụng, Samsung DeX, Không gian trò chơi',
N'Có, microphone chuyên dụng chống ồn',
N'Không',
N'MP4, WMV, H.263, H.264(MPEG4-AVC), DivX, Xvid',
N'MP3, WAV, WMA, eAAC+, FLAC'
),
(
2,
N'SAMSUNG GALAXY Z FLIP',
N'Mở khoá khuôn mặt, Mở khoá vân tay cạnh viền',
N'Âm thanh AKG, Dolby Audio™, Màn hình phụ, Đèn pin, Sạc pin không dây, Sạc pin nhanh, Chặn cuộc gọi, Ghi âm cuộc gọi, 
Chặn tin nhắn, Trợ lý ảo Samsung Bixby, Samsung Pay, Đa cửa sổ (chia đôi màn hình), Samsung DeX',
N'Có, microphone chuyên dụng chống ồn',
N'Không',
N'MP4, WMV, H.263, H.264(MPEG4-AVC), DivX, Xvid',
N'MP3, WAV, WMA, eAAC+, FLAC'
),
(
3,
N'SAMSUNG GALAXY NOTE 10 PLUS',
N'Mở khoá khuôn mặt, Mở khoá vân tay dưới màn hình',
N'Siêu tiết kiệm pin, Màn hình luôn hiển thị AOD, Trợ lý ảo Samsung Bixby, Mặt kính 2.5D, Chặn tin nhắn, Chặn cuộc gọi, Sạc pin nhanh, Sạc pin không dây, 
Đèn pin, Sạc pin cho thiết bị khác, Chuẩn Kháng nước, Chuẩn kháng bụi, Dolby Audio™, Samsung Pay, Âm thanh AKG, Nhân bản ứng dụng, Thu nhỏ màn hình sử dụng một tay, 
Samsung DeX, Đa cửa sổ (chia đôi màn hình), Tản nhiệt nước carbon',
N'Có, microphone chuyên dụng chống ồn',
N'Không',
N'H.265, 3GP, MP4, AVI, H.263, H.264(MPEG4-AVC), DivX, Xvid',
N'Midi, AMR, MP3, WAV, AAC++, eAAC+, FLAC'
),
(
4,
N'SAMSUNG GALAXY S10 PLUS',
N'Mở khoá khuôn mặt, Mở khoá vân tay dưới màn hình',
N'Ghi âm cuộc gọi, Chặn cuộc gọi, Sạc pin nhanh, Chạm 2 lần sáng màn hình, Màn hình luôn hiển thị AOD, Chuẩn Kháng nước, Chuẩn kháng bụi, 
Đèn pin, Trợ lý ảo Samsung Bixby, Thu nhỏ màn hình sử dụng một tay, Samsung Pay, Nhân bản ứng dụng, Samsung DeX, Chặn tin nhắn, Dolby Audio™',
N'Có, microphone chuyên dụng chống ồn',
N'Không',
N'H.265, 3GP, MP4, AVI, WMV, H.264(MPEG4-AVC), DivX, WMV9, Xvid',
N'Midi, Lossless, MP3, WAV, WMA, AAC++, eAAC+, OGG, AC3, FLAC'
),
(
5,
N'SAMSUNG GALAXY NOTE 10',
N'Mở khoá khuôn mặt, Mở khoá vân tay dưới màn hình',
N'Siêu tiết kiệm pin, Màn hình luôn hiển thị AOD, Trợ lý ảo Samsung Bixby, Mặt kính 2.5D, Chặn tin nhắn, Chặn cuộc gọi, Sạc pin nhanh, Sạc pin không dây, 
Đèn pin, Sạc pin cho thiết bị khác, Chuẩn Kháng nước, Chuẩn kháng bụi, Dolby Audio™, Samsung Pay, Âm thanh AKG, Nhân bản ứng dụng, 
Thu nhỏ màn hình sử dụng một tay, Samsung DeX, Đa cửa sổ (chia đôi màn hình), Tản nhiệt nước carbon',
N'Có, microphone chuyên dụng chống ồn',
N'Không',
N'H.265, 3GP, MP4, AVI, H.263, H.264(MPEG4-AVC), DivX, Xvid',
N'AMR, Midi, MP3, WAV, AAC++, eAAC+, FLAC'
),
(
6,
N'SAMSUNG GALAXY TAB S6',N'',
N'Dolby Atmos, Hỗ trợ bút S Pen, Sạc pin nhanh, Âm thanh AKG, Mở khoá vân tay dưới màn hình, Samsung DeX',
N'Có',N'Không',N'',N''
),
(
7,
N'SAMSUNG GALAXY TAB S6 LITE',N'',
N'Sạc pin nhanh, Mở khóa bằng khuôn mặt (Face ID)',
N'Có',N'Không',N'',N''
),
(
8,
N'SAMSUNG GALAXY TAB A 10.1 T515 (2019)',
N'',N'Dolby Atmos',N'Không',N'Không',N'',N''
),
(
9,
N'SAMSSUNG GALAXY TAB A8',
N'',N'',N'Không',N'',N'True',N'True'
),
(
10,
N'SAMSSUNG GALAXY TAB A8 T290',
N'',N'Không',N'Không',N'Không',N'',N''
)



