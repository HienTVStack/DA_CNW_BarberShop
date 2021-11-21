--1. Khách hàng (Lưu thông tin của khách hàng) => OK
--	+ Mã khách hàng
--	+ Tên khách hàng
--	+ Số điện thoại
--	+ Email
--	+ Địa chỉ
--	+ Brithday
--	+ Mật khẩu
--	+ Điểm số (Sẽ tăng khi khách hàng sử dụng dịch vụ tại 30shine) nhằm có những khuyến mãi
--2. Nhân viên (lưu thông tin của nhân viên) => OK
--	+ Mã nhân viên
--	+ Tên nhân viên
--	+ Ngày sinh
--	+ Số điện thoại
--	+ Email
--	+ Giới tính
--	+ Mật khẩu
--	+ Chức vụ
--	+ Lương
--	+ Ngày vào làm
--	+ Trạng thái (tài khoản được sử dụng hoặc không)
--Ví dụ: 1 sản phẩm thuộc 1 nhóm sản phẩm nào đó rồi thuộc cả danh mục nào đó
--	=> Sáp vuốt tóc GLANZEN FOX thuộc danh mục sáp vuốt tóc thuộc nhóm tạo kiểu tóc
--https://shop.30shine.com/
--3. Nhóm sản phẩm
--	+ Mã nhóm sản phẩm
--	+ Tên nhóm sản phẩm
--	+ Mô tả nhóm sản phẩm
--4. Danh mục sản phẩm
--	+ Mã danh mục sản phẩm
--	+ Mã nhóm sản phẩm
--	+ Tên danh mục sản phẩm
--	+ Mô tả danh mục sản phẩm
--5. Sản phẩm
--	+ Mã sản phẩm
--	+ Mã danh mục sản phẩm
--	+ Mã hình ảnh => Mỗi một sản phẩm có thể có nhiều ảnh sản phẩm
--	+ Mã chương trình giảm giá => Lưu chương trình giảm giá
--	+ Tên sản phẩm
--	+ Mô tả sản phẩm
--	+ Giá bán
--	+ Đánh giá => Lưu đánh giá của khách hàng (1, 2, ..5 sao)
--	+ Trạng thái hiển thị => Sản phẩm có được hiển thị hay là không
--	+ Hình ảnh
--	+ Số lượng còn
--	+ Số lượng xem
--	+ Trạng thái
--Ví dụ dịch vụ nhuộm thì nó lại có nhiều dịch vụ ở trong đó nhuộm hồng, xanh, trắng, ...
--6. Loại dịch vụ
--	+ Mã loại dịch vụ
--	+ Tên loại dịch vụ
--	+ Mô tả
--7. Combo dịch vụ
--	+ Mã combo
--	+ Tên combo
--	+ Mô tả
--	+ Giảm giá
--	+ Trạng thái 
--8. Dịch vụ
--	+ Mã dịch vụ
--	+ Mã giảm giá
--	+ Mã hình ảnh
--	+ Tên dịch vụ
--	+ Mô tả
--	+ Giá 
--	+ Hình ảnh
--	+ Thời gian thực hiện
--	+ Đánh giá dịch vụ (1, 2, ..5 sao)
--	+ Trạng thái
--9. Bảng nhóm tin
--	+ Mã nhóm tin
--	+ Tên nhóm tin
--	+ Mô tả
--10. Bảng nhóm danh mục tin
--	+ Mã danh mục tin
--	+ Mã nhóm tin
--	+ Tên danh mục tin
--	+ Mô tả
--11. Tin tức
--	+ Mã tin
--	+ Mã danh mục tin
--	+ Mã tài khoản nhân viên => Nhân viên tạo tin này
--	+ Mã hình ảnh => Link tới những hình ảnh liên quan
--	+ Tiêu đề tin
--	+ Mô tả tin	
--	+ Ngày tạo
--	+ Trạng thái
--12. Đặt lịch
--	+ Mã đặt lịch
--	+ Mã dịch vụ
--	+ Mã nhân viên (Có thể chỉ định nhân viên phục vụ)
--	+ Mã khách hàng
--	+ Thời gian tạo
--	+ Thời gian bắt đầu thực hiện
--	+ Địa điểm
--	+ Ghi chú
--13. Đặt hàng
--	+ Mã đặt hàng
	
--	+ Mã khách hàng
--	+ Địa chỉ giao
--	+ Ngày đặt hàng
--	+ Ngày giao hàng
--	+ Ghi chú
--	+ Trang thái (Được giao hay chưa)

--=> tẠO THÊM BẢNG CHI TIẾT ĐẶT HÀNG
--14. Đơn hàng
--	+ Mã đơn hàng
--	+ Mã khách hàng
--	+ Mã đặt lịch
--	+ Mã đơn hàng
--	+ Tổng số tiền
--	+ Trạng thái thanh toán
--15. Chi tiết đơn hàng
--	+ Mã chi tiết đơn hàng
--	+ Mã đơn hàng
--	+ Mã dịch vụ
--	+ Mã sản phẩm
--16. Hình thức thanh toán
--	+ Mã hình thức thanh toán
--	+ Tên hình thức thanh toán
--	+ Mô tả
--	+ Trạng thái


		drop database DB_BARBER_SHOP_TEST6

CREATE DATABASE DB_BARBER_SHOP_TEST1
GO
USE DB_BARBER_SHOP_TEST1
GO
CREATE TABLE tblCustomer --Khách hàng
(
	PK_iCustomerID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL, -- Mã khách hàng
	sNameCustomer nvarchar(50) NOT NULL,
	sPhoneNumber CHAR(11) NOT NULL, 
	sGmail nvarchar(50),
	sAddress nvarchar(50),
	dBrithDay DATE,
	sPassword varchar(50),
	iCoin INT DEFAULT 0,
	sSex BIT,
	sStatus BIT DEFAULT 1, -- Trạng thái tài khoản (mở / không)
)

select * from tblStaff
GO
CREATE TABLE tblStaff -- Lưu thông tin của nhân viên
(
	PK_iStaffID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sNameStaff nvarchar(50) NOT NULL,
	dBirthday DATE,
	sPhone CHAR(11),
	sGmail VARCHAR(150),
	sSex BIT, --1 LÀ NAM, 0 LÀ NỮ
	sPassword VARCHAR(50),
	sPosition NVARCHAR(50), -- CHỨC VỤ
	sSalary float, -- LƯƠNG
	dDayWork DATE, -- NGÀY VÀO LÀM
	sStatus BIT DEFAULT 1, -- Trạng thái tài khoản (mở / không)
)

GO
CREATE TABLE tblDiscount (-- Lưu thông tin của chương trình giảm giá
	PK_iDiscountID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	sNameDiscount NVARCHAR(200) NOT NULL,
	fRatioDiscount FLOAT NOT NULL, --MỨC GIẢM GIÁ TÍNH THEO %
	dStartDiscount DATE,
	dEndDiscount DATE,
	sDescription NVARCHAR(200)
)

GO
CREATE TABLE tblImage -- lưu ảnh
(
	PK_iImageID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_iProductID INT,
	FK_iServiceID INT,
	FK_iPostID INT,
	FK_iComboServiceID INT,
	sImage NVARCHAR(200),
)
GO
select * from tblImage
insert into tblImage(sImage) values ('30SEEI72-Sữa rửa mặt tràm trà Skin&Dr Tea tree dành cho nam – Khắc tinh dành cho da mụn 2.png'),
												('30shine-detox-3.jpg'),
												('30shine-lot-mun-cam-3.jpg'),
												('30shine-massage-covaigay-3.jpg'),
												('30shine-nhuom-den-2.jpg'),
												('30shine-nhuom-nau-2.jpg'),
												('210814_Banner_toa_sang_w.jpg'),
												('banner-dich-vu.jpg'),
												('DV1.PNG'),
												('DV2.PNG'),
												('DV3.PNG'),
												('Gel Đặc Trị Mụn Acsys 1.png'),
												('GelDacTriMun4.jpg'),
												('mat-na-sui-bot-tay-da-chet-3.jpg'),
												('GelDacTriMun4.jpg')



CREATE TABLE tblGroupProduct( --Lưu thông tin nhóm sản phẩm
	PK_sGroupProductID VARCHAR(50) NOT NULL PRIMARY KEY,
	sGroupName NVARCHAR(100) NOT NULL,
	sDescription NVARCHAR(500) --Mô tả cho nhóm bài viết
)

GO
CREATE TABLE tblCategoryProduct( -- Lưu thông tin loại/danh mục sản phẩm
	PK_sCategoryProductID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_sGroupProductID VARCHAR(50) NOT NULL,
	sCategoryName NVARCHAR(100),
	sDescription NVARCHAR(300)
)

GO
create table tblProduct  -- Lưu thông tin sản phẩm
(
	PK_iProductID INT IDENTITY(1, 1) primary key NOT NULL,
	FK_iCategoryProductID INT NOT NULL, 
	FK_iDiscountID INT, -- Khóa ngoại của giảm giá
	sProductName nvarchar(150) not null,
	sDescription NVARCHAR(MAX),
	fPrice float, -- Giá
	sStar INT DEFAULT 0, 
	sImage VARCHAR(150),
	iQuantityInStock INT DEFAULT 0, --Số lượng tồn
	iViewNumber INT DEFAULT 0, --Số lượng xem
	bStatus INT DEFAULT 1,
)



GO
CREATE TABLE tblTypeService (
	PK_iTypeServiceID INT IDENTITY NOT NULL PRIMARY KEY,
	sNameTypeService NVARCHAR(150),
	sDesciption NVARCHAR(300)
)
select * from tblTypeService
 --=> Uốn, nhuộm, cắt tỉa, massage, 
GO
CREATE TABLE tblComboService (
	PK_iComboServiceID INT IDENTITY NOT NULL PRIMARY KEY,
	FK_iDiscountID INT NOT NULL ,
	sNameComboService NVARCHAR(150),
	sDescription NVARCHAR(500),
	sImage VARCHAR(200),
	bStatus BIT DEFAULT 1,
)
select * from tblComboService
GO
CREATE TABLE tblService -- lƯu thông tin dịch vụ:
(
	 PK_iServiceID INT IDENTITY(1, 1) primary key NOT NULL,
	 FK_iDiscountID INT,
	 FK_iTypeServiceID INT, 
	 sNameService nvarchar(150) NOT NULL,
	 sDescription NVARCHAR(2000),
	 fPrice FLOAT,
	 sImage varchar(200),
	 sStar INT DEFAULT 0,
	 bStatus BIT DEFAULT 1,
)
select * from tblService
GO
create table tblStore -- Lưu cửa hàng  => Khỏi cần nhập thêm 
(
	PK_iStoreID INT IDENTITY(1, 1) primary key NOT NULL,
	sDescription nvarchar(400),
	dOpenStore DATE,
	dCloseStore DATE,
	sAddress nvarchar(50),
)
INSERT INTO tblStore(sAddress)--Nhap Roi
VALUES (N'Quận 12'),
		(N'Quận Tân Phú'),
		(N'Quận Phú Nhuận'),
		(N'Quận Thủ Đức')
GO
CREATE TABLE tblGroupPosts( --Lưu thông tin nhóm bài viết
	PK_sGroupPostID VARCHAR(50) NOT NULL PRIMARY KEY,
	sGroupName NVARCHAR(300),
	sDescription NVARCHAR(500) --Mô tả cho nhóm bài viết
)
insert into tblGroupPosts values(1,N'Tư vấn về dịch vụ',N'Giúp bạn hiểu và biết thêm về những loại dịch vụ 30Shine'),
								(2,N'Tư Vấn về những combo',N'Giúp bạn đưa ra các lựa chọn phù hợp')
select *from tblGroupPosts
GO
CREATE TABLE tblCategoryPost( -- Lưu thông tin loại/danh mục bài viết
	PK_sCategoryPostID VARCHAR(50) NOT NULL PRIMARY KEY,
	FK_sGroupPostID VARCHAR(50) NOT NULL,
	sCategoryName NVARCHAR(100),
	sDescription NVARCHAR(300)
)
select * from tblCategoryPost
GO
CREATE TABLE tblPosts (
	PK_iPostID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_sCategoryPostID VARCHAR(50),
	FK_iStaffID INT, --Lưu thông tin nhân viên tạo cái bài post này
	sPostName NVARCHAR(300) NOT NULL, --Tiêu đề
	sDesciption NVARCHAR(1000),
	sImage NVARCHAR(300),
	dCreationTime DATETIME,
	bStatus BIT, -- Trạng thái hiển thị hoặc khong được hiển thị
)
select * from tblPosts 
insert into tblPosts(PK_iPostID,FK_iStaffID,sPostName,sDesciption,sImage,bStatus)
values(1,1,1,N'Trải nghiệm cùng 30shine',N'30shine luôn đồng hành cùng bạn mọi lúc giúp bạn tỏa đó là niềm vui của chúng tôi','banner-dich-vu.jpg',1),
	(2,2,2,N'Tỏa sáng cùng 30shine',N'Bạn luôn cảm thấy tự ti về bản thân thấy mình ko đẹp trai.không sao vì đã có 30shine ở đây chúng tôi sẽ cho bạn lột xác trở thành phiên bản của chính bạn','210814_Banner_toa_sang_w.jpg',0)
GO
CREATE TABLE tblBookAdvance ( -- => bỎ QUA	
	PK_iBookAdvanceID INT IDENTITY NOT NULL PRIMARY KEY,
	FK_iStaffID INT, -- Chỉ định nhân viên thực hiện ( Có thể có hoặc không)
	FK_iCustomerID INT,
	FK_iStoreID INT,
	dCreateTime DATE,
	dExecutionTime DATE,
	sNote NVARCHAR(500)
)
GO
CREATE TABLE tblDetailBookAdvance (
	PK_iDetailBookAdvanceID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_iBookAdvanceID INT NOT NULL,
	FK_iServiceID INT,
	CONSTRAINT FK_tblDetailBookAdvance_tblBookAdvance FOREIGN KEY (FK_iBookAdvanceID) REFERENCES tblBookAdvance (PK_iBookAdvanceID),
	CONSTRAINT FK_tblDetailBookAdvance_tblService FOREIGN KEY (FK_iServiceID) REFERENCES tblService (PK_iServiceID),
)
insert into tblDetailBookAdvance(FK_iBookAdvanceID,FK_iServiceID)
values()
select * from tblDetailBookAdvance
GO
CREATE TABLE tblOrderProduct ( -- Bỏ qua
	PK_iOrderID int identity (1, 1) not null primary key,
	FK_iCustomerID int not null,
	dNgayDatHang date not null,
	dNgayGiaoHang date not null,
	sAddressDelivery nvarchar(150) not null,
	sDescription nvarchar(150),
	bTinhTrangGiaoHang bit default 0, -- là dã giao
	--fTongTien float	
)
GO
CREATE TABLE tblDeatailOrder ( -- bỏ qua
	PK_iDetailOrderID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_iOrderID INT NOT NULL,
	FK_iProductID INT NOT NULL,
	iSoLuong INT,
)
GO
CREATE TABLE tblReceipt (
	PK_iReceiptID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	FK_iOrderID INT,
	FK_iServiceID INT,
	FK_iStaffID INT,
	FK_iPayMentID INT,
	fTotalAmount FLOAT,
	dCompletionTime DATE -- Thời gian hoàn thành
)

select * from tblReceipt
GO
CREATE TABLE tblPayments ( -- Không cần nhập thêm
	PK_iPaymentsID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	sPaymentName NVARCHAR(50) NOT NULL,
	sDescription NVARCHAR(200),
	bStatus bit default 1,
)
INSERT INTO tblPayments(sPaymentName)
VALUES (N'Tiền mặt'),
	('MOMO'),
	('VNPay'),
	(N'Thẻ tín dụng')
GO

GO
ALTER TABLE tblCategoryProduct
ADD	CONSTRAINT FK_tblCategoryProduct_tblGroupProduct FOREIGN KEY (FK_sGroupProductID) REFERENCES tblGroupProduct(PK_sGroupProductID)
GO
ALTER TABLE tblProduct
ADD CONSTRAINT FK_tblProduct_tblCategoryProduct FOREIGN KEY (FK_iCategoryProductID) REFERENCES tblCategoryProduct(PK_sCategoryProductID)
GO
--ALTER TABLE tblProduct 
--ADD CONSTRAINT FK_tblProduct_tblImage FOREIGN KEY (FK_iImageID) REFERENCES tblImage(PK_iImageID)
GO
ALTER TABLE tblProduct
ADD CONSTRAINT FK_tblProduct_tblDiscount FOREIGN KEY (FK_iDiscountID) REFERENCES tblDiscount(PK_iDiscountID)
GO
ALTER TABLE tblComboService
ADD CONSTRAINT FK_tblComboService_tblDiscount FOREIGN KEY (FK_iDiscountID) REFERENCES tblDiscount(PK_iDiscountID)
GO
--ALTER TABLE tblComboService
--ADD CONSTRAINT FK_tblComboService_tblImage FOREIGN KEY (FK_iImageID) REFERENCES tblImage(PK_iImageID)
GO
ALTER TABLE tblService
ADD CONSTRAINT FK_tblService_tblDiscount FOREIGN KEY (FK_iDiscountID) REFERENCES tblDiscount(PK_iDiscountID)
GO
--ALTER TABLE tblService
--ADD CONSTRAINT FK_tblService_tblImage FOREIGN KEY (FK_iImageID) REFERENCES tblImage(PK_iImageID)
GO
ALTER TABLE tblService
ADD CONSTRAINT FK_tblService_tblTyeService FOREIGN KEY (FK_iTypeServiceID) REFERENCES tblTypeService(PK_iTypeServiceID)
GO
ALTER TABLE tblCategoryPost
ADD CONSTRAINT FK_tblCategoryPost_tblGroupPosts FOREIGN KEY (FK_sGroupPostID) REFERENCES tblGroupPosts(PK_sGroupPostID)
GO
ALTER TABLE tblPosts
ADD CONSTRAINT FK_tblPosts_tblCategoryPost FOREIGN KEY (FK_sCategoryPostID) REFERENCES tblCategoryPost(PK_sCategoryPostID)
GO 
ALTER TABLE tblPosts
ADD CONSTRAINT FK_tblPosts_tblStaff FOREIGN KEY (FK_iStaffID) REFERENCES tblStaff(PK_iStaffID)
GO
--ALTER TABLE tblBookAdvance
--ADD CONSTRAINT FK_tblBookAdvance_tblService FOREIGN KEY (FK_iServiceID) REFERENCES tblService(PK_iServiceID)
GO
GO
ALTER TABLE tblBookAdvance
ADD CONSTRAINT FK_tblBookAdvance_tblCustomer FOREIGN KEY (FK_iCustomerID) REFERENCES tblCustomer(PK_iCustomerID)
GO
ALTER TABLE tblBookAdvance
ADD CONSTRAINT FK_tblBookAdvance_tblStore FOREIGN KEY (FK_iStoreID) REFERENCES tblStore(PK_iStoreID)
GO
ALTER TABLE tblOrderProduct
ADD CONSTRAINT FK_tblOrderProduct_tblCustomer FOREIGN KEY (FK_iCustomerID) REFERENCES tblCustomer(PK_iCustomerID)
GO 
ALTER TABLE tblDeatailOrder
ADD CONSTRAINT FK_tblOrderProduct_tblDeatailOrder FOREIGN KEY (FK_iOrderID) REFERENCES tblOrderProduct(PK_iOrderID)
GO
ALTER TABLE tblDeatailOrder
ADD CONSTRAINT FK_tblProduct_tblDeatailOrder FOREIGN KEY (FK_iProductID) REFERENCES tblProduct(PK_iProductID)
GO
ALTER TABLE tblReceipt
ADD CONSTRAINT FK_tblReceipt_tblOrderProduct FOREIGN KEY (FK_iOrderID) REFERENCES tblOrderProduct(PK_iOrderID)
GO
ALTER TABLE tblReceipt
ADD CONSTRAINT FK_tblReceipt_tblService FOREIGN KEY (FK_iServiceID) REFERENCES tblService(PK_iServiceID)
GO
ALTER TABLE tblReceipt
ADD CONSTRAINT FK_tblReceipt_tblStaff FOREIGN KEY (FK_iStaffID) REFERENCES tblStaff(PK_iStaffID)
GO
ALTER TABLE tblReceipt
ADD CONSTRAINT FK_tblReceipt_tblPayments FOREIGN KEY (FK_iPayMentID) REFERENCES tblPayments(PK_iPaymentsID)
GO
ALTER TABLE tblImage
ADD CONSTRAINT FK_tblImage_tblProduct FOREIGN KEY (FK_iProductID) REFERENCES tblProduct(PK_iProductID)
GO
ALTER TABLE tblImage
ADD CONSTRAINT FK_tblImage_tblService FOREIGN KEY (FK_iServiceID) REFERENCES tblService(PK_iServiceID)
GO
ALTER TABLE tblImage
ADD CONSTRAINT FK_tblImage_tblPost FOREIGN KEY (FK_iPostID) REFERENCES tblPosts(PK_iPostID)
GO
ALTER TABLE tblImage
ADD CONSTRAINT FK_tblImage_tblComboService FOREIGN KEY (FK_iComboServiceID) REFERENCES tblComboService(PK_iComboServiceID)
--NHÁP
--CREATE TABLE tblReceipt(
--	PK_iReceiptID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
--	FK_iOrderProductID INT, 
--	FK_iOrderScheduleID INT,
--	FK_iSatffID INT,
--	fSumMoney FLOAT,

--)

--GO
--create table tblOrderSchedule
--(
--	PK_iOrderScheduleID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	FK_iCustomerID INT NOT NULL,
--	dTimeOrder datetime,
--	dTimePerform datetime,
--	FK_iStoreID INT NOT NULL,
--	FK_iStaffID INT,
--	FK_iServiceID INT,
--	constraint FK_tblOrderSchedule_tblCustomer foreign key(FK_iCustomerID) references tblCustomer(PK_iCustomerID),
--	constraint FK_tblOrderSchedule_tblStaff foreign key(FK_iStaffID) references tblStaff(PK_iStaffID),
--	constraint FK_tblOrderSchedule_tblServiceCustomer foreign key(FK_iServiceID) references tblServiceCustomer(PK_iServiceID)
--)


--GO
--CREATE TABLE tblPay (
--	PK_iPayID int identity (1, 1) not null primary key,
--	FK_iPaymentsID int, -- Hình thức thanh toán
--	FK_iStaffID int ,--Tài khoản nhân viên lên đơn
--	FK_iOrderID int , -- Đơn hàng
--	dTimePay date, -- Thời gian thanh toán
--	fsumMoney float default 0 check (fsumMoney >= 0), -- Tổng số tiền
--	bStatus bit default 1 , -- 1 là thành công
--	CONSTRAINT FK_tblPay_tblPayments FOREIGN KEY (FK_iPaymentsID) REFERENCES tblPayments(PK_iPaymentsID),
--	CONSTRAINT FK_tblPay_tblStaff FOREIGN KEY (FK_iStaffID) REFERENCES tblStaff(PK_iStaffID),
--	CONSTRAINT FK_tblPay_tblOrderProduct FOREIGN KEY (FK_iOrderID) REFERENCES tblOrderProduct(PK_iOrderID)
--)

--CREATE TABLE tbl_ChiTietDonHang (
--	PK_iChiTietDonHang int identity (1, 1) not null primary key,
--	FK_iDonHang int not null,
--	FK_iSanPhamID int not null,
--	iSoLuong int default 1,
--	fGiaBan float,
--	fGiamGia float default 0,	
--	constraint FK_CTDonHang_DonHang foreign key (FK_iDonHang) references tblOrderProduct (PK_iOrderID)
--)
--CREATE TABLE tblOrderProduct (
--	PK_iOrderID int identity (1, 1) not null primary key,
--	FK_iStaffID int  not null,
--	FK_HinhThucThanhToanID int not null,
--	FK_iCustomerID int not null,
--	dNgayDatHang date not null,
--	dNgayGiaoHang date not null,
--	sAddressDelivery nvarchar(150) not null,
--	sDescription nvarchar(150),
--	bTinhTrangThanhToan bit default 0, --1 là thành công
--	bTinhTrangGiaoHang bit default 0, -- là dã giao
--	fTongTien float	
--)

-- Phần nhập dữ liệu
-- Bảng khách hàng

INSERT INTO tblCustomer (sNameCustomer, sPhoneNumber, sSex)
VALUES (N'Anh Hiền', '0337122712', 1),
		(N'Trần Văn Dũng','0399813551',1),
		(N'Hồ Văn Cường','0917652890',1),
		(N'Lê Văn Sơn','0976614122',1),
		(N'Nguyễn Quốc Hoàng Sơn','0345171400',2)
-- Bảng nhân viên
GO
SET DATEFORMAT DMY
INSERT INTO tblStaff (sNameStaff, sPhone, sSex, sPassword, sPosition, sSalary , dDayWork)
VALUES (N'Anh Hiền', '0337122712', 1, '123', 'Manager', 20000000, '11/02/2021'),
	   (N'Cao Trí','0918928561',1,'1234','haircuts',2000000,'10/03/2020'),
	   (N'Nguyễn Quốc Trường','0817345161',1,'12345','Cashier',1500000,'19/09/2021')
	insert into tblStaff values(N'Hùng','12/12/2000','0817345161','gateHung@gmail.com',1,'12345','hair dresser',3000000,'09/09/2021',2);
GO
--Bảng nhóm sản phẩm
INSERT INTO tblGroupProduct(PK_sGroupProductID, sGroupName)
VALUES	('CHAMSOCDA', N'Chăm sóc da'),
		('CHAMSOCTOC', N'Chăm sóc tóc')
select * from tblGroupProduct
-- Bảng danh mục sản phẩm LƯU Ý NHẬP TỔNG CỘNG 10 DÒNG HOẶC HƠN
INSERT INTO tblCategoryProduct(FK_sGroupProductID, sCategoryName)
VALUES	('CHAMSOCDA', 'Tẩy tế bào chết'), -- Nhập thêm 5 dòng
		('CHAMSOCTOC', 'Sáp vuốt tóc') -- Nhập thêm 5 dòng
-- Bảng chương trình giảm giá => Nhập khoảng 2 dòng nữa
INSERT INTO tblDiscount(sNameDiscount, fRatioDiscount)
VALUES	(N'Chương trình giảm giá COVID - 19', 5),
		(N'Chưa có giảm giá', 0),
		(N'Chương Trình Giảm giá ưu đãi ngày tết',10),
		(N'Chương Trình Ưu đãi 2 ngày lễ 30-4 và 1-5',5)

-- bẢNH ẢNH => Có bao nhiêu ảnh thì ráng nhập hết đi



select * from tblImage
-- Bảng sản phẩm => Nhập càng nhiều càng tốt
select * from tblProduct

INSERT INTO tblProduct(FK_iCategoryProductID, FK_iDiscountID, sProductName, sDescription, fPrice, sImage)
VALUES (1, 1, N'Gel Tẩy Tế Bào Chết Acsys Peeling Gel', N'Tẩy da chết là một bước rất quan trọng trong
													 quá trình chăm sóc da không chỉ của phái nữ mà còn đối với cả nam giới.
													  Tuy nhiên, nhiều người đặc biệt là các anh em lại thường xuyên bỏ qua bước 
													  này trong quy trình chăm sóc da do ngại tốn thời gian hoặc cảm thấy không cần thiết.
													   Da không được làm sạch sâu, loại bỏ hết bụi bẩn sau ngày dài là nguyên nhân chính gây ra
														tình trạng mụn, bít tắc lỗ chân lông và lão hóa sớm. Bởi vậy, đừng bỏ qua bất kỳ bước chăm sóc da
														 nào và sắm ngay cho mình một em Gel tẩy tế bào chết hiệu quả như Acsys Peeling nhé. Đây là dòng sản phẩm tẩy da
														  chết cho nam hiệu quả hàng đầu giúp da sạch sâu mà vẫn ẩm mượt sau khi sử dụng.', 350000, '30SKPKLO-Gel-tay-te-bao-che.png'),
		(1,1,N'Sữa Rửa Mặt Tràm Trà Skin&Dr Tea tree',N'Sữa rửa mặt tràm trà Skin&Dr Tea tree dành cho nam – Khắc tinh dành cho da mụn
														Khói bụi, mồ hôi, bã nhờn... là những nguyên nhân trực tiếp dẫn đến tình trạng bít tắc lỗ chân lông, gây ra các loại mụn ẩn, mụn trứng cá, mụn đầu đen... trên làn da nam giới. Vậy làm thế nào để khắc phục được tình trạng này? Sữa rửa mặt tràm trà Skin&Dr Tea tree với khả năng làm sạch sâu, kháng khuẩn và không gây kích ứng cho da chính là cứu tinh dành cho các “đấng mày râu”.
														Hiệu quả đa chiều cho làn da phái mạnh
														Làm sạch là một bước vô cùng quan trọng mà không ai có thể bỏ qua để có một làn da khỏe mạnh, rạng rỡ. Tuy nhiên, không giống với sự chăm chút của hội chị em, các anh em thường “qua loa” trong bước này. Thậm chí nhiều người nghĩ rằng chỉ cần rửa mặt bằng nước thôi là đủ. Điều này dẫn đến việc tạp chất, bụi bẩn không được loại bỏ hoàn toàn gây bít tắc lỗ chân lông, hình thành mụn, viêm và các vấn đề khác. Vì vậy, một loại sữa rửa mặt với sức mạnh làm sạch da, kháng khuẩn, trị mụn hiệu quả như Skin&Dr Tea tree xứng đáng được hội anh em “rinh” ngay cho mình.'
														,200000,'30SEEI72-Sữa rửa mặt tràm trà Skin&Dr Tea tree dành cho nam – Khắc tinh dành cho da mụn 2.png'),
		(1,1,N'Sữa Rửa Mặt Skin&Dr Active Charcoal ',N'Sữa Rửa Mặt Than Hoạt Tính - Giải pháp cho da sạch sâu, trắng bật 2 tone
Cũng như phái nữ, làn da nam giới cũng cần được chăm sóc và quan tâm. Để đạt được hiệu quả chăm sóc da tốt nhất, anh em cần đặc biệt lưu ý đến bước làm sạch da. Thế nhưng không ít người cảm thấy lúng túng khi tìm kiếm và lựa chọn sản phẩm làm sạch da phù hợp với bản thân. Nếu đã và đang gặp vấn đề trên, thì bài viết này chắc chắn sẽ giúp bạn đưa ra lựa chọn hợp lý nhất.
Sữa Rửa Mặt Than Hoạt Tính Skin&Dr – Làm sạch sâu, kiềm dầu, dưỡng trắng
Được sản xuất bởi SKIN&Dr - nhãn hàng chuyên mỹ phẩm nam thành lập vào năm 1983 tại Hàn Quốc, sữa rửa mặt than hoạt tính Skin&Dr được đánh giá là sản phẩm tốt nhất trên thị trường hiện nay. Sở hữu một bảng thành phần lành tính với: than hoạt tính, Salicylic Acid, quả lựu, bí đỏ, gạo và yến mạch…, sản phẩm có hiệu quả đa chiều, đem lại sự “lột xác” bất ngờ cho làn da phái mạnh.
Da sạch sâu, kiềm dầu - “say No” với mụn
Bụi bẩn, dầu thừa, tế bào chết là nỗi “ám ảnh” của các anh em. Đây cũng là tác nhân khiến làn da sần sùi, thâm sạm và hình thành mụn. Tình trạng này khiến anh em kém thu hút, mất tự tin, thậm chí đánh mất nhiều cơ hội trong cuộc sống. Nhưng với Skin&Dr, chỉ sau 7 ngày sử dụng, anh em hoàn toàn có thể tạm biệt làn da mụn viêm, thô ráp, già nua để lấy lại vẻ ngoài tươi trẻ và tràn đầy tự tin. 
Nhờ sự tác động tuyệt vời của than hoạt tính, mọi bụi bẩn, tạp chất… trên da được nhẹ nhàng “xử lý” nhanh gọn. Các lỗ chân lông sẽ được làm sạch sâu, se khít mịn màng. Đồng thời, cơ chế làm giảm số lượng tế bào trong lỗ chân lông cũng mang lại hiệu quả kiềm dầu tối ưu. Nhờ vậy, làn da trở nên khô thoáng, sạch sẽ, ngăn ngừa sự hình thành, phát triển của mụn cũng như làm giảm rõ rệt tình trạng viêm da, thâm da. ',129000,'Skin&dr ActiveCharcoal1.png')
select * from tblProduct
INSERT INTO tblProduct(FK_iCategoryProductID, FK_iDiscountID, sProductName, sDescription, fPrice, sImage)
values (1,1,N'Xịt Tạo Phồng Reuzel Surf Tonic',N'XỊT TẠO PHỒNG REUZEL SURF TONIC CHO MÁI TÓC VÀO NẾP TỰ NHIÊN ĐẦY SỨC SỐNG
Giữa một rừng các sản phẩm pre-styling trên thị trường, cái tên Reuzel Surf Tonic vẫn nổi bật lên như một ứng cử viên sáng giá. Từ thương hiệu uy tín tới chất lượng vượt trội với khả năng giữ nếp, cho volume và texture hoàn hảo, sản phẩm này đang ngày càng chiếm trọn lòng tin của đông đảo cánh mày râu châu Á cũng như toàn thế giới.
Thương hiệu khẳng định chất lượng sản phẩm
Reuzel là thương hiệu chuyên về các dòng sản phẩm chăm sóc tóc lừng lẫy đến từ Hà Lan, có nguồn gốc từ Schorem - cửa hiệu cắt tóc nổi tiếng nhất tại đất nước hoa tulip.
Schorem nổi danh là cửa hiệu cắt tóc của những gã “đầu gấu” bởi vẻ bề ngoài đầy những hình xăm trổ của các barber tại đây. Tuy nhiên họ chính là những người thợ cắt tóc có tâm nhất, ân cần và lịch sự nhất với mái tóc của khách hàng. Sự chuyên nghiệp này được minh chứng bởi hàng dài xếp hàng trước cửa Schorem mỗi ngày, và sự kiên nhẫn chờ đợi đến 4-5 tiếng chỉ để được cắt tóc tại đây.
Với mong muốn có sản phẩm tạo kiểu tóc tiêu chuẩn, chính xác nhất, Reuzel tạo ra sản phẩm bằng kinh nghiệm và những thành phần được tin tưởng là tốt nhất thế giới. Mang vẻ ngoài hoài cổ với phong cách không hề thay đổi theo thời gian, Reuzel xuất hiện với thông điệp “Dù xu hướng có thay đổi thì phong cách và bản lĩnh của quý ông vẫn giữ mãi như vậy”. Bởi vậy, chẳng có gì phải nghi ngờ khi Reuzel trở thành một trong những thương hiệu chăm sóc tóc được ưa chuộng nhất trên thị trường hiện nay.

',358000,'30STGO9A-XỊT TẠO PHỒNG REUZEL SURF TONIC.jpg'),
	   (1,1,N'XỊT TẠO PHỒNG GLANZEN SIDEKICK 130ml',N'XỊT TẠO PHỒNG GLANZEN SIDEKICK - THOẢI MÁI PRE-STYLING KHÔNG LO TÓC HƯ TỔN
													Glanzen Sidekick là xịt tạo phồng tóc đầu tiên của Việt Nam được sản xuất theo công nghệ cao cấp của Đức. Trên thị trường, Sidekick đang là cái tên được săn đón bậc nhất và đang làm mưa làm gió khắp các diễn đàn tóc của phái mạnh. Với khả năng giữ nếp pre-styling spray cực đỉnh đồng thời bảo vệ tóc tối ưu khỏi nhiệt độ cao khi sấy, sản phẩm này sẽ giúp anh em tự tin hơn với mái tóc khỏe mạnh, bồng bềnh vào nếp tự nhiên.
													Chất lượng được khẳng định với công nghệ Đức vượt trội 
Glanzen trong tiếng Đức có nghĩa là “Tỏa sáng”. Đúng với "nghệ danh" của nó, các sản phẩm của Glanzen quy tụ những thành phần tinh túy nhất trong thế giới chăm sóc tóc. Xịt tạo phồng Glanzen Sidekick được sản xuất với công nghệ chuẩn Đức, mang lại hiệu quả tức thì cho mái tóc, xứng đáng là một “wingman” đắc lực không thể thiếu giúp các đấng mày râu tỏa sáng trong mọi hoàn cảnh.

Glazen sidekick được thiết kế theo dạng chai xịt rất dễ sử dụng. Thiết kế nhỏ gọn với tone màu đen chủ đạo kết hợp với font chữ trắng – vàng nổi bật, không chỉ thân thiện với người sử dụng mà còn đem lại cảm giác sang trọng, rất phù hợp với phong cách phái mạnh.
Giữ nếp và làm tóc dày lên trông thấy
Glanzen Sidekick có thành phần chính là Propylene glycol - một hợp chất rất an toàn để sử dụng trong mỹ phẩm, giúp giữ ẩm và giảm độ nhớt của mỹ phẩm. Do đó, sản phẩm xịt phồng tóc này không những chẳng gây bết dính trên tóc, mà còn hút ẩm hiệu quả giúp tóc khô thoáng, chân tóc “dễ thở” bồng bềnh hơn. Chỉ với vài nhát xịt, mái tóc của anh em sẽ trông dày lên đáng kể với những lọn tóc tơi, vào nếp mượt mà cực kỳ tự nhiên.
Chưa hết, không chỉ khiến tóc “trông có vẻ” dày hơn, sản phẩm này còn khiến tóc thực sự dày lên theo thời gian. Với công thức có chứa Biotin pure là chất hỗ trợ sự tăng trưởng tế bào, thúc đẩy mái tóc khỏe mạnh, Glanzen Sidekick có tác dụng giúp tóc khỏe hơn, dày hơn và tràn đầy sức sống.

',160000,'30S3NQ4W-XỊT TẠO PHỒNG GLANZEN SIDEKICK 130ml.png'),
	   (1,1,N'XỊT TẠO PHỒNG BRITISH M Sea Salt Spray 120ml',N'XỊT TẠO PHỒNG BRITISH M SEA SALT SPRAY - BÍ QUYẾT TẠO KIỂU SỐ 1 CHO MÁI TÓC THƯA MỎNG
Xịt tạo phồng BRITISH M Sea Salt Spray là sản phẩm tạo kiểu organic có xuất xứ từ thương hiệu cao cấp BRITISH M của Hàn Quốc. Với các thành phần được chiết xuất tự nhiên, Sea Salt Spray chính là giải pháp số 1 cho mái tóc mỏng được đông đảo người dùng Hàn Quốc và các quốc gia Châu Á bình chọn. Ngoài công dụng làm phồng, sản phẩm này còn có khả năng giữ nếp trong thời gian dài, cùng hiệu quả dưỡng ẩm sâu giúp tóc bồng bềnh và mềm mượt tự nhiên.
Bảo chứng chất lượng đến từ thương hiệu chăm sóc tóc hàng đầu của Hàn Quốc
Đến từ nhà BRITISH M, Sea Salt Spray dễ dàng “ghi điểm” với người tiêu dùng, kể cả những khách hàng sành sỏi nhất. Bởi nhắc đến các sản phẩm chăm sóc tóc đến từ Hàn Quốc, không thể không nhắc tới thương hiệu BRITISH M. Thương hiệu “quốc dân” này đã xuất hiện tại hơn 70,000 Salon cao cấp tại Hàn. Đây cũng là thương hiệu “ruột” của nhiều nghệ sĩ đình đám xứ Hàn như nhóm nhạc Seventeen hay rapper Jay Park (cựu thành viên 2PM).
Không chỉ có tên tuổi tại Hàn, BRITISH M còn “phủ sóng” ra các thị trường Châu Á, châu Âu và Châu Mỹ. Thương hiệu thường xuyên xuất hiện trên những trang bìa tạp chí, tuần lễ thời trang quốc tế và các bảng xếp hạng sản phẩm tạo kiểu và chăm sóc tóc được yêu thích nhất. Thành công này có được là nhờ công thức tập trung hoàn hoàn vào các thành phần hữu cơ tự nhiên Organic, độ PH thấp và nói KHÔNG với paraben.
Mục tiêu của BRITISH M là mang đến cho phái mạnh giải pháp tối ưu cho nuôi dưỡng, bảo vệ tóc và da đầu. Hiện nay, BRITISH M đang nhận được sự tin tưởng của hàng triệu người tiêu dùng và doanh nghiệp trên toàn thế giới.',501000,'30SZZJS1-XỊT TẠO PHỒNG BRITISH M Sea Salt Spray 120ml.png'),
	   (1,1,N'XỊT TẠO KIỂU FARCOM SCULPT & FREEZE',N'FARCOM SCULPT & FREEZE - XỊT TẠO KIỂU VÀO NẾP HOÀN HẢO CHO PHÁI MẠNH
Được ví như nhân tố hoàn hảo giúp phái mạnh tự tin chinh phục mọi kiểu tóc phức tạp, keo xịt tóc là sản phẩm được anh em săn lùng nhất trong thời gian gần đây. Nếu anh em đang tìm kiếm loại keo xịt tạo kiểu giúp kiểm soát vào nếp tuyệt đối đồng thời dưỡng tóc từ sâu bên trong thì Farcom Sculpt & Freeze chắc chắn là cái tên không thể bỏ lỡ!
Uy tín chất lượng đến từ thương hiệu mỹ phẩm hàng đầu Hy Lạp - Farcom Professional 
Được thành lập vào năm 1970, Farcom là thương hiệu nổi tiếng có lịch sử lâu đời tại Hy Lạp. Với tầm nhìn và sứ mệnh cung cấp các sản phẩm chuyên nghiệp chất lượng cao cho các thợ làm tóc, FARCOM được xây dựng dựa trên những con người luôn ủng hộ lý tưởng “Một con người đẹp sống một cuộc sống tươi đẹp và tạo ra một thế giới tươi đẹp.”
Farcom đã không ngừng nghiên cứu để tạo ra các sản phẩm sáng tạo (sử dụng nguyên liệu thô thân thiện với môi trường) và đảm bảo tiêu chuẩn chất lượng cao nhất. Các sản phẩm nổi bật của thương hiệu này bao gồm chăm sóc tóc, chăm sóc da mặt, chăm sóc cơ thể và tay,... thực sự đáp ứng được mong muốn của mọi khách hàng.
Farcom hiện đã có mặt trên thị trường Việt Nam và đang từng bước định vị thương hiệu, chiếm được tình cảm từ những nhà tạo mẫu tóc chuyên nghiệp. Keo xịt tóc này có thể đem tới cho bạn nam một mái tóc bồng bềnh, với phom tóc khỏe, giúp giữ nếp tốt hơn mà vẫn cho khả năng bảo vệ tóc một cách toàn diện.',359000,'30S59V2P-XỊT TẠO KIỂU FARCOM SCULPT & FREEZE.jpg'),
	   (1,1,N'Xịt Tạo Kiểu Reuzel Spray Grooming Tonic',N'XỊT Pre Style REUZEL SPRAY GROOMING TONIC - TUYỆT TÁC DÀNH CHO TÓC KHÔ MỎNG 
Xịt tạo kiểu Reuzel Spray Grooming Tonic là phiên bản mới nhất của hãng REUZEL HÀ LAN đang dành được sự quan tâm của đông đảo anh em. Được coi là dòng sản phẩm hỗ trợ chủ lực trong tạo kiểu tóc khi sử dụng các dòng pomade reuzel, sản phẩm xịt làm phồng tóc này sẽ giúp định hình kiểu tóc tốt nhất và đem lại độ volume và texture tuyệt vời cho mái tóc!
Thương hiệu khẳng định chất lượng sản phẩm
Reuzel là thương hiệu chuyên về các dòng sản phẩm chăm sóc tóc lừng lẫy đến từ Hà Lan, có nguồn gốc từ Schorem - cửa hiệu cắt tóc nổi tiếng nhất tại đất nước hoa tulip.
Schorem nổi danh là cửa hiệu cắt tóc của những gã “đầu gấu” bởi vẻ bề ngoài đầy những hình xăm trổ của các barber tại đây. Tuy nhiên họ chính là những người thợ cắt tóc có tâm nhất, ân cần và lịch sự nhất với mái tóc của khách hàng. Sự chuyên nghiệp này được minh chứng bởi hàng dài xếp hàng trước cửa Schorem mỗi ngày, và sự kiên nhẫn chờ đợi đến 4-5 tiếng chỉ để được cắt tóc tại đây.
Với mong muốn có sản phẩm tạo kiểu tóc tiêu chuẩn, chính xác nhất, Reuzel tạo ra sản phẩm bằng kinh nghiệm và những thành phần được tin tưởng là tốt nhất thế giới. Mang vẻ ngoài hoài cổ với phong cách không hề thay đổi theo thời gian, Reuzel xuất hiện với thông điệp “Dù xu hướng có thay đổi thì phong cách và bản lĩnh của quý ông vẫn giữ mãi như vậy”. Bởi vậy, chẳng có gì phải nghi ngờ khi Reuzel trở thành một trong những thương hiệu chăm sóc tóc được ưa chuộng nhất trên thị trường hiện nay.
Xịt tạo kiểu pre-styling chuyên dụng cho tóc khô mỏng
Reuzel Spray Grooming Tonic là phiên bản pre styling mới nhất của hãng Reuzel Hà Lan. Sản phẩm đặc biệt phù hợp với anh em sở hữu mái tóc mỏng hoặc thưa, giúp giữ nếp và kiểm soát kiểu tóc hiệu quả mà không làm giảm độ phồng của tóc.
Xịt Reuzel Tonic là trợ thủ đắc lực không thể thiếu cho mỗi lần tạo kiểu. Nó giúp giữ nếp, đồng thời tăng độ bồng tự nhiên cho tóc. Chất keo tạo độ bóng thấp giúp mái tóc của bạn trông khỏe khoắn, tự nhiên hơn và không tạo cảm giác bết dính vào mùa hè. Sản phẩm xịt tạo kiểu này là bước đệm quan trọng trước khi anh em sử dụng Pomade, nếu muốn bổ sung thêm độ giữ nếp và độ phồng…',431000,'30SUAGZT-Xịt Tạo Kiểu Reuzel Spray Grooming Tonic.jpg'),
	   (1,1,N'Sáp vuốt tóc GLANZEN FOX',N'Glanzen Fox Dry paste là với công thức sóng đôi giúp dễ dàng lấy sáp, hòa tan & apply lên tóc, bổ sung độ ẩm tự nhiên giúp tăng độ phồng tự nhiên mà vẫn giữ nếp hiệu quả.  
Sáp vuốt tóc Glanzen Fox - Định nghĩa mới về siêu phẩm sáp vuốt tóc dành cho tất cả mọi người
Nếu nhắc tới dòng sáp đang dẫn đầu thị trường về độ giữ nếp chắc hẳn anh em không thể không biết Glanzen Clay - Thách thức thời gian giữ nếp tới 12 giờ đã trở thành dòng sáp vuốt tóc bán chạy nhất tại thị trường Việt Nam. Vừa qua người em của Glanzen là Glanzen Fox Dry Paste vừa được ra mặt hứa hẹn sẽ lại là một sản phẩm có chất lượng đỉnh cao và tiếp tục khuynh đảo thị trường của nhà Glanzen 
Chất lượng được khẳng định với công nghệ Đức vượt trội 
Glanzen trong tiếng Đức có nghĩa là “Tỏa sáng”. Đúng với "nghệ danh" của nó, Glanzen quy tụ những thành phần tinh túy nhất được sử dụng trong các loại sáp cao cấp như Kevin Murphy hay Morris Motley. Sáp Glanzen có “siêu năng lực” giúp tạo kiểu cho tóc nhanh và hoàn hảo chỉ trong 10s. Được xem như cường quốc vàng trong làng sáp vuốt tóc, Đức sở hữu những thương hiệu chăm sóc tóc hàng đầu thế giới. Được sản xuất với công nghệ chuẩn Đức, sáp Glanzen thực sự là một “wingman” đắc lực không thể thiếu giúp các đấng mày râu tỏa sáng trong mọi hoàn cảnh',170000,'30SW0DTJ-Sáp vuốt tóc GLANZEN FOX.jpg'),
	  (1,1,N'Sáp Volcanic Clay - Giữ nếp bất chấp nắng, mưa bão',N'Sáp Volcanic Clay - Giữ nếp bất chấp nắng gió, mưa bão
Volcanic Clay là dòng sản phẩm đình đám nhất của nhà Apestomen, cũng là loại sáp được mệnh danh là “ông hoàng” của dòng sáp tạo kiểu ở mức giá tầm trung. Đây chắc chắn là item mà anh em không thể bỏ qua nếu đang tìm kiếm một sản phẩm tạo kiểu, giữ nếp vượt trội trong mức giá hợp lý. 
Apestomen - Niềm tin đến từ thương hiệu “xịn”
Apestomen là một thương hiệu hàng đầu chuyên về sản phẩm chăm sóc và tạo kiểu tóc dành cho nam tại Singapore. Vị thế của Apestomen tại Singapore cũng là bảo chứng cho chất lượng và độ an toàn của thương hiệu này, bởi Quốc đảo sư tử nổi tiếng với những tiêu chuẩn, đánh giá khắt khe và độ “sành sỏi” của người tiêu dùng. 
Apestomen đã và đang vươn mình mạnh mẽ ra thị trường quốc tế. Minh chứng là việc các sản phẩm của nhà Apestomen, đặc biệt là Volcanic Clay, luôn nằm trong danh sách các sản phẩm bán chạy nhất tại nhiều quốc gia. Và đây cũng là dòng sáp tạo kiểu “ruột” của các salon tóc hàng đầu thế giới, được người tiêu dùng tin tưởng và “săn đón” bậc nhất trên thị trường. ',340000,'30SL7Q4D-Sáp Volcanic Clay - Giữ nếp bất chấp nắng gió, mưa bão (1).jpg'),
	   (1,1,N'Sáp Tạo Kiểu - TEA TREE SHAPING CREAM',N'Sáp Tạo Kiểu TEA TREE SHAPING CREAM - Sự lựa chọn hàng đầu cho mái tóc dài lãng tử đầy lôi cuốn
Là một trong những dòng sáp ít được nhắc tới trên thị trường, Cream lại khá ấn tượng với người sử dụng nhờ tạo cho tóc vẻ ngoài tự nhiên. Gần như rất khó để nhận ra nếu chỉ dùng cream cho tóc. Bởi thế đây chính là chân ái của những chàng trai theo đuổi phong cách lãng tử với mái tóc dài lôi cuốn. Sáp tạo kiểu Tea Tree Shaping Cream là cái tên đang đứng đầu thị trường từ Châu Âu tới Châu Á. Sự lựa chọn hàng đầu của chàng trai mang trong mình chất nghệ sĩ.
Thương hiệu số 1 tại thị trường Châu Mỹ
Paul Mitchell được thành lập bởi hai chuyên gia người Mỹ là John Paul Dejoria và Paul Mitchell vào những năm 1980. Lần đầu tiên thương hiệu được biết đến ở Việt Nam vào năm 1996. Tính đến nay, sau 40 năm hoạt động Paul Mitchell là  thương hiệu chăm sóc tóc đứng số 1 tại thị trường Châu Mỹ và có mặt tại 160 quốc gia trên thế giới.
Paul Mitchell mang trong mình sứ mệnh làm cho thế giới trở nên tốt đẹp hơn, bởi vậy thương hiệu luôn cho ra những dòng sản phẩm chất lượng hàng đầu để phục vụ nhu cầu làm đẹp và chăm sóc mái tóc của tất cả mọi người.
Vào năm 2012 Paul Mitchell ghi dấu ấn tượng trong lòng khách hàng khi là công ty đầu tiên chống lại việc thử nghiệm sản phẩm trên động vật. Quyết định dũng cảm như một lời cam kết an toàn tuyệt đối cho người sử dụng và khẳng định luôn làm đúng sứ mệnh khiến cho thế giới tốt đẹp hơn.',729000,'30SL05LK-Sáp Tạo Kiểu TEA TREE SHAPING CREAM - Sự lựa chọn hàng đầu cho mái tóc dài lãng tử đầy lôi cuốn.jpg'),
	   (1,1,N'Sáp Reuzel Red Pomade Giữ Nếp Vừa - Độ Bóng Cao - Gốc Nước',N'Sáp Reuzel Pomade Giữ Nếp Vừa - Tạo kiểu hoàn hảo đậm chất nam tính
Khác với các dòng Wax (sáp vuốt tóc), Pomade thường dùng khi tạo kiểu với lược để tạo vẻ bề ngoài trưởng thành lịch lãm cho phái mạnh. Nhắc tới Pomade không thể bỏ qua Reuzel Pomade được mệnh danh là ông hoàng trong giới với nhiều dòng sản phẩm đáp ứng nhu cầu tạo kiểu tóc cho tất cả đấng mày râu. Chỉ tính riêng sáp Reuzel Pomade giữ nếp vừa đã có tới 4 sản phẩm cho anh em lựa chọn. Anh em sẽ luôn tìm được dòng sản phẩm dành riêng cho mình khi lựa chọn Reuzel Pomade.',258000-859000,'30SK0IL2-SÁP VUỐT TÓC REUZEL POMADES GIỮ NẾP GỐC NƯỚC.jpg'),
	   (1,1,N'Sáp Reuzel Green Pomade Giữ Nếp Vừa - Độ Bóng Mờ - Gốc Dầu',N'Sáp Reuzel Pomade Giữ Nếp Vừa - Tạo kiểu hoàn hảo đậm chất nam tính
Khác với các dòng Wax (sáp vuốt tóc), Pomade thường dùng khi tạo kiểu với lược để tạo vẻ bề ngoài trưởng thành lịch lãm cho phái mạnh. Nhắc tới Pomade không thể bỏ qua Reuzel Pomade được mệnh danh là ông hoàng trong giới với nhiều dòng sản phẩm đáp ứng nhu cầu tạo kiểu tóc cho tất cả đấng mày râu. Chỉ tính riêng sáp Reuzel Pomade giữ nếp vừa đã có tới 4 sản phẩm cho anh em lựa chọn. Anh em sẽ luôn tìm được dòng sản phẩm dành riêng cho mình khi lựa chọn Reuzel Pomade.',258000-859000,'30SK0IL2-SÁP VUỐT TÓC REUZEL POMADES GIỮ NẾP GỐC NƯỚC.jpg'),
	  (1,1,N'Sáp Reuzel Fiber Pomade Mềm Dẻo - Độ Bóng Mờ - Tan Trong Nước',N'Sáp Reuzel Pomade Giữ Nếp Cứng - Tạo kiểu hoàn hảo đậm chất nam tính
Nếu đang tìm kiếm một loại sáp vuốt tóc giữ nếp siêu cứng cho mái tóc cả ngày dài thách thức mọi tác động thì nhất định không thể bỏ qua 3 dòng Pomade giữ nếp cứng của Reuzel. Với khả năng giữ nếp tới 12-14h, Reuzel Pomade đang là sản phẩm giữ nếp đỉnh cao trên thị trường. Chất lượng giữ nếp cứng hoàn hảo sản phẩm mang lại nhất định sẽ khiến anh em không thể bỏ qua',271000,'30SK0IL2-SÁP VUỐT TÓC REUZEL POMADES GIỮ NẾP GỐC NƯỚC.jpg'),
	   (1,1,N'Sáp Reuzel Clay Matte Pomade Giữ Nếp Vừa - Không Bóng - Tan Trong Nước',N'Sáp Reuzel Pomade Giữ Nếp Vừa - Tạo kiểu hoàn hảo đậm chất nam tính
Khác với các dòng Wax (sáp vuốt tóc), Pomade thường dùng khi tạo kiểu với lược để tạo vẻ bề ngoài trưởng thành lịch lãm cho phái mạnh. Nhắc tới Pomade không thể bỏ qua Reuzel Pomade được mệnh danh là ông hoàng trong giới với nhiều dòng sản phẩm đáp ứng nhu cầu tạo kiểu tóc cho tất cả đấng mày râu. Chỉ tính riêng sáp Reuzel Pomade giữ nếp vừa đã có tới 4 sản phẩm cho anh em lựa chọn. Anh em sẽ luôn tìm được dòng sản phẩm dành riêng cho mình khi lựa chọn Reuzel Pomade.',273000-931000,'30SK0IL2-SÁP VUỐT TÓC REUZEL POMADES GIỮ NẾP GỐC NƯỚC.jpg'),
	   (1,1,N'Sáp vuốt tóc Glanzen Original Clay - Vô địch giữ nếp tới 12 giờ',N'Sáp Glanzen Clay - Đỉnh cao giữ nếp tới 12 giờ còn tặng thêm loạt ưu điểm nổi bật
Nếu nhắc tới dòng sáp đang dẫn đầu thị trường về độ giữ nếp chắc hẳn anh em không thể bỏ qua sáp Glanzen Clay. Thách thức thời gian giữ nếp tới 12 giờ là lời cam kết của thương hiệu về sản phẩm tới người sử dụng. Bên cạnh đó sản phẩm còn chứa thêm loạt ưu điểm không thua kém gì những thương hiệu lớn. Sáp Glanzen Clay là sản phẩm tạo kiểu tóc đáng thử với anh em yêu thích kiểu tóc cứng cáp nam tính.',500000,'30SK0IL2-SÁP VUỐT TÓC REUZEL POMADES GIỮ NẾP GỐC NƯỚC.jpg'),
	   (1,1,N'Máy sấy tóc tạo kiểu chuyên nghiệp Sharkway Limited 1600W',N'Máy sấy tóc Sharkway Limited 1600W - Tạo kiểu chuyên nghiệp như tại Salon
Không giống với phái nữ, chăm sóc tóc và tạo kiểu với nhiều loại máy khác nhau, các chàng trai thường chỉ trung thành với một loại duy nhất: máy sấy tóc. Với các anh em, máy sấy tóc có lẽ chỉ có một tác dụng duy nhất - làm khô tóc. Tuy nhiên, máy sấy tóc Sharkway Limited 1600W có thể làm được nhiều hơn thế. Chỉ với một chiếc máy sấy nhỏ giờ đây các chàng trai có thể tự tạo kiểu tóc tại nhà chuyên nghiệp như tại Salon.',299000,'30S819JV-Máy sấy tóc tạo kiểu chuyên nghiệp Sharkway Limited 1600W.jpg'),
	   (1,1,N'Máy Cạo Râu Flyco FS330VN Lưỡi Kép',N'Máy cạo râu FLYCO FS-330VN là dòng máy cạo râu sạc điện tiên tiến, tích hợp đầy đủ các tính năng cần thiết cần thiết giúp bạn có được gương mặt hoàn hảo như mong muốn. Đây là dòng sản phẩm máy cạo râu được phân phối độc quyền bởi công ty Joyoung Việt Nam, đảm bảo hiệu quả và an toàn tuyệt đối khi sử dụng so với các loại máy cạo râu thông thường khác.',499000,'chi_tiet_may_fs330_2_f750f42328ad4ac5929659ec97b0a2bd_grande.jpg')
-- Kiểu dịch vụ
INSERT INTO tblTypeService(sNameTypeService, sDesciption)
VALUES (N'Uốn', N'Với chuyên môn cao của các tay nghề tại cửa hàng 30shine đảm bảo cho bạn 1 quả tóc uốn thiệt tuyệt vời'),
	   (N'Nhộm tóc',N'Để có 1 quả đầu thật ngầu hãy đến 30shine'),
	   (N'Cắt gội',N'Combo 10 bước cắt gội chỉ với 80k chỉ có tại cửa hàng 30shine'),
	   (N'Dịch vụ khác',N'Cắt-xả-tạo kiểu, combo 5 bước dành cho bé dưới 1.3m, lấy ráy tai an toàn, Gội đầu Massage')
-- Combo dịch vụ => Nhập 3 dòng là được rồi
INSERT INTO tblComboService(FK_iDiscountID, sNameComboService, sDescription, sImage)
VALUES (1, N'Combo cắt tóc - massage da mặt', N'abc', '30shine-massage-covaigay-3.jpg'),
		(2,N'Massage cổ vai gáy bạc hà Ngoáy tai 18 tầng mây',N'Công việc hằng ngày khiến cho vùng vai cổ gáy dễ bị đau nhức, cộng thêm căng thẳng stress mệt mỏi.
			Nhằm giúp anh giải tỏa đau nhức, mệt mỏi và thư giãn sau một ngày dài, massage cổ vai gáy bạc hà và ngoáy tai sảng khoái 9 tầng mây là sự lựa chọn hoàn hảo để tái tạo năng lượng cho anh ngày mới.','30shine-massage-covaigay-3.jpg'),
		(3,N'Xóa sổ mụn cám 6 bước an toàn Phục hồi trắng mịn',N'Mụn đầu đen khiến da trở nên sạm màu, kém sắc. Nó có thể biến chứng thành các loại mụn gây viêm nguy hiểm. Tuy nhiên, việc dùng tay nặn mụn không đảm bảo vệ sinh gây nở lỗ chân lông và có nguy cơ cao viêm nhiễm.Với mong muốn bảo vệ sức khỏe da mặt cho nam giới Việt Nam, 30Shine đã phát triển gói dịch vụ xóa sổ mụn cám 6 bước an toàn, đảm bảo không viêm nhiễm, không to lỗ chân lông và phục hồi trắng mịn.','30shine-lot-mun-cam-3.jpg')
--Bảng dịch vụ
INSERT INTO tblService(FK_iDiscountID, FK_iTypeServiceID, sNameService, sDescription, fPrice, sImage)
VALUES (1, 1, N'Uốn Hàn Quốc 8 cấp độ', N'Trở thành phiên bản mới của chính bạn', 260, '30shine-nhuom-thoi-trang-2.jpg'),
       (2,2,N'Nhộm Đen phủ bạc',N'Một người đàn ông có trong tay sức khỏe, sự thành đạt trong sự nghiệp, hạnh phúc gia đình… liệu có đã hoàn hảo? Thực ra đó là “đủ” chứ chưa thể “đầy” nếu như họ chưa hài lòng về ngoại hình, một nhu cầu thực tế trong thời hiện đại. Vì vậy, đối với đàn ông, tóc bạc sớm sẽ mang đến cảm giác giảm phong độ rõ đi trông thấy. Ái ngại, tự ti sẽ thay thế cho sự tự tin, mạnh mẽ khi đứng trước người đối diện.Hiểu được điều đó - 30Shine đã không ngừng suy nghĩ, nghiên cứu 10 triệu lượt khách hàng trên khắp cả nước để tìm được những màu phổ biến, phù hợp và tăng vẻ đẹp trai cho Nam giới Việt Nam.
Du hành các nước nổi tiếng về màu nhuộm như Ý, Pháp, Mỹ, Hàn Quốc,... để tìm nguồn cung cấp màu nhuộm chất lượng cao, chuẩn màu, giữ màu lâu nhất. Và tới cuối cùng, 30Shine đã tìm ra được thương hiệu Echosline nổi tiếng của Ý để hợp tác, cùng nhau phát triển để đem đến trải nghiệm tốt nhất cho khách hàng.
Sau thời gian dài miệt mài nghiên cứu, học hỏi từ nước ngoài, 30Shine đã tạo ra:Bảng màu mới chia làm 4 gói nhuộm theo tone màu khác nhau phù hợp với từng đối tượng đặc biệt: Elegant Black, Modern Man, Lady Killah và Fashionisto
Với gói màu Elegant Black này, 30Shine muốn hướng tới một màu đen classic, đem đến sự thanh lịch, tút lại phong độ cho người đàn ông Việt Nam.',290,'30shine-nhuom-den-2.jpg'),
		(3,3,N'Nhộm Nâu Cao Cấp',N'Đàn ông Việt khi trưởng thành thường không thích nhuộm tóc, và có quan điểm: người Á Đông thì tóc phải đen, hay trẻ con thì mới nhuộm tóc. Quan điểm này không đúng cũng chẳng sai. Quan trọng là chọn đúng màu, đúng kiểu thì không những vẻ ngoài được nâng cấp mà còn trở nên bắt mắt và mới mẻ hơn.Hiểu được điều đó - 30Shine đã không ngừng suy nghĩ, nghiên cứu 10 triệu lượt khách hàng trên khắp cả nước để tìm được những màu phổ biến, phù hợp và tăng vẻ đẹp trai cho Nam giới Việt Nam.
Du hành các nước nổi tiếng về màu nhuộm như Ý, Pháp, Mỹ, Hàn Quốc,... để tìm nguồn cung cấp màu nhuộm chất lượng cao, chuẩn màu, giữ màu lâu nhất. Và tới cuối cùng, 30Shine đã tìm ra được thương hiệu Echosline nổi tiếng của Ý để hợp tác, cùng nhau phát triển để đem đến trải nghiệm tốt nhất cho khách hàng.
Sau thời gian dài miệt mài nghiên cứu, học hỏi từ nước ngoài, 30Shine đã tạo ra:Bảng màu mới chia làm 4 gói nhuộm theo tone màu khác nhau phù hợp với từng đối tượng đặc biệt: Elegant Black, Modern Man, Lady Killah và Fashionisto
Với gói màu Modern Man này, 30Shine muốn hướng tới một màu đen classic, đem đến sự thanh lịch, tút lại phong độ cho người đàn ông Việt Nam.',225,'30shine-nhuom-nau-2.jpg')

INSERT INTO tblImage(FK_iServiceID,sImage)
VALUES (1, '30shine-banner-khong-gian-salon.jpg')
select * from tblImage

--Bang Hoa Don
insert into tblReceipt(fTotalAmount,dCompletionTime)
values (129,' 11/01/2021'),
		(150,'12/09/2020')