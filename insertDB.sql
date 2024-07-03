USE HousewareStore;

INSERT INTO Users ([username], [fullName], [password], [user_address], [image], [user_email], [BirthDay], [user_phone], [role])
VALUES 
	('admin', N'Nguyễn Duy Anh', '123', N'Hà Nội', 'images/users/duyanh.jpg', 'nduyanh110503@gmail.com', '2003-05-11', '123456789', 1),
    ('john_doe', 'John Doe', '456', N'123 Main St, CityA', 'images/users/user.png', 'aaaa@gmail.com', '2003-08-09', '1234567890', 2),
	('john_doeee', N'John Doe', 'password123', N'123 Main St, CityA', 'images/users/user.png', 'aaaa@gmail.com', '2003-08-09', '1234567890', 2),
	('user1', N'Khoái ăn sang', 'password123', N'456 Oak St, CityB', 'images/users/user1.png', 'user1@gmail.com', '1995-02-15', '9876543210', 2),
    ('user2', N'User Two', 'password456', N'789 Pine St, CityC', 'images/users/user2.png', 'user2@gmail.com', '1990-07-22', '1239874560', 2),
    ('user3', N'User Three', 'password789', N'Chả sợ chi', 'images/users/user3.png', 'user3@gmail.com', '1988-11-30', '6543217890', 2),
    ('user4', N'User Four', 'pass123word', N'202 Elm St, CityE', 'images/users/user4.png', 'user4@gmail.com', '1992-04-18', '7890123456', 2),
    ('user5', N'Tối em có sang', 'pass456word', N'303 Birch St, CityF', 'images/users/user5.png', 'user5@gmail.com', '1998-09-03', '3456789012', 2),
    ('user6', N'Nho từ điển', 'pass789word', N'404 Cedar St, CityG', 'images/users/user6.png', 'user6@gmail.com', '1993-02-25', '9012345678', 2),
    ('user7', N'User Seven', 'pass789word', N'Ban lãnh đạo', 'images/users/user7.png', 'user7@gmail.com', '1991-06-10', '5678901234', 2),
    ('user8', N'User Eight', 'pass123word', N'606 Elm St, CityI', 'images/users/user8.png', 'user8@gmail.com', '1994-03-27', '2345678901', 2),
    ('user9', N'User Nine', 'pass456word', N'707 Oak St, CityJ', 'images/users/user9.png', 'user9@gmail.com', '1997-08-14', '8901234567', 2),
    ('user10', N'Cai một hún', 'pass789word', N'Người đàn bà vu khống', 'images/users/user10.png', 'user10@gmail.com', '1996-01-05', '4567890123', 2);

SELECT * FROM Users order by user_id;

INSERT INTO Category([category_name])
VALUES
	(N'Máy Lọc Nước'),
	(N'Quạt'),
	(N'Nồi Cơm Điện'),
	(N'Bếp'),
	(N'Nồi - Chảo');

SELECT * FROM Category;

INSERT INTO Products([category_id], [product_name], [product_describe], [UnitPrice], [QuantityRemaining], [QuantitySold], [img])
VALUES
--Máy Lọc Nước
	(1, N'Máy lọc nước Sanaky VH-10HY', N'Máy lọc nước Sanaky VH-10HY có thiết kế dạng tủ đứng hiện đại kích thước 42 cm x 100cm (Ngang x Cao), Sanaky VH-10HY có dung tích bình chứa 6 lít, công suất lọc lên đến 15 lít/giờ.', 2990000, 10, 2, 'images/products/May Loc Nuoc/1.png'),
	(1, N'Máy Lọc Nước Slim Hydrogen Tích Hợp Nóng Lạnh Kangaroo KG100HS', N'Máy lọc nước Slim Hydrogen tích hợp nóng lạnh Kangaroo KG100HS sở hữu thiết kế tủ đứng Slim nhỏ gọn, kích thước 29cm x 91cm (Ngang x Cao), Kangaroo KG100HS có tổng dung tích 8.6 lít, công suất lọc lớn đến 18 lít/giờ.', 4990000, 5, 5, 'images/products/May Loc Nuoc/2.png'),
	(1, N'Máy Lọc Nước Nóng Lạnh Nguội 10 Lõi Karofi KAD-D61', N' Kích thước của máy 32 x 40 x 99cm, trọng lượng 25kg có thể đặt ở vị trí bất kỳ trong khu vực sử dụng, máy lọc nước với công suất 10 lít/giờ, làm lạnh với mức công suất 65W, làm nóng 430W.', 6590000, 10, 0, 'images/products/May Loc Nuoc/3.png'),
	(1, N'Máy Lọc Nước R.O Nóng Lạnh SUNHOUSE SLIMBIO SHA76214CK-S', N'Máy lọc nước R.O nóng lạnh Sunhouse SlimBio SHA76214CK-S kiểu dáng Slim thon gọn, kích thước 32cm x 100cm (Ngang x Cao), sản phẩm có công suất lọc nước lên đến 10 - 12 lít/giờ, đồng thời tiêu thụ điện 0.655 kW/h.', 5490000, 10, 0, 'images/products/May Loc Nuoc/4.png'),
	(1, N'Máy lọc nước 8 cấp Mutosi MP-285MA 8 lõi', N'Sản phẩm có kích thước nhỏ gọn khoảng 400 X 320 X 990mm (Rộng - Dài - Cao), thiết bị có công suất lọc mạnh mẽ, và bền bỉ lên đến 15 lít/ giờ', 3290000, 10, 0, 'images/products/May Loc Nuoc/5.png'),

--Quạt
	(2, N'Quạt Bàn YANFAN B202', N'Yanfan B202 là dạng quạt để bàn có chiều cao 42cm, lồng quạt 60 nan, 2 vòng giữa bằng nhựa ABS, Yanfan B2B hoạt động với công suất 28W, điện áp 220v-50Hz với 2 mức tốc độ gió.', 179000, 10, 2, 'images/products/Quat/1.png'),
	(2, N'Quạt lỡ Senko L1638 - Xám Đồng', N'Senko L1638 có 3 cánh quạt với đường kính mỗi cánh lên đến 39cm, Senko L1638 có công suất hoạt động 47W với lưu lượng gió 64.4 m3 /min và chọn 3 tốc độ gió.', 349000, 10, 0, 'images/products/Quat/2.png'),
	(2, N'Quạt Đứng ASIAvina VY639990 - Xám', N'Quạt đứng Asiavina VY639990 quạt có kích thước 540 x 465 x 1240 mm, công suất lớn lên đến 80W, điện áp 220V-50Hz, với lưu lượng 100m3/phút.', 749000, 10, 0, 'images/products/Quat/3.png'),
	(2, N'Quạt đứng Toshiba F-LSA20(H)VN', N'Quạt có kích thước 452 x 400 x 1350mm, trọng lượng 7.2kg nhẹ và dễ di chuyển, gồm có 5 cánh với kích thước cánh quạt là 40cm, sản phẩm hoạt động với công suất 60W, điện áp 220V-50Hz.', 1290000, 10, 0, 'images/products/Quat/4.png'),
	(2, N'Quạt Bàn Mitsubishi D12A-GB CY-GY - Xám Đậm - Thái Lan', N'Mitsubishi D12A-GB CY-GY có trọng lượng khoảng 3.3kg, sản phẩm hoạt động với công suất mạnh mẽ 37W, với lưu lượng gió khoảng 61m3/phút.', 990000, 10, 0, 'images/products/Quat/5.png'),

--Nồi Cơm Điện
	(3, N'Nồi Cơm Điện Tử Toshiba RC-18NTFV(W) 1.8 lít', N'Toshiba RC-18NTFV (W) cho khả năng truyền nhiệt cao và đồng đều đến khắp mọi vị trí trong lòng nồi, không những giúp thực phẩm chín nhanh, chín đều mà còn giúp thực phẩm đạt được hương vị thơm ngon nhất.', 2690000, 10, 2, 'images/products/Noi Com Dien/1.png'),
	(3, N'Nồi Cơm Điện Tử Bear DFB-P50E1', N'Nồi cơm điện tử Bear DFB-P50E1 có kích thước 30.7cm x 23.4cm (Dài x Cao), có dung tích lòng nồi 1.8 lít, đáp ứng nhu cầu nấu ăn hàng ngày của gia đình 4 - 6 thành viên.', 849000, 10, 0, 'images/products/Noi Com Dien/2.png'),
	(3, N'Nồi Cơm Điện Gaabor GR-S30', N'Nồi cơm điện Gaabor GR-S30 được thiết kế theo phong cách hiện đại, kết hợp cùng màu trắng trang nhã làm chủ đạo từ đó tạo được điểm nhấn nổi bật cho không gian bếp nhà bạn. Sản phẩm có kích thước 28.3 x 24.1 x 20.5cm (Ngang - Sâu - Cao), khá nhỏ gọn không chiếm nhiều diện tích sử dụng. Thiết bị có tổng dung tích 3 lít, và dung tích sử dụng là 1.2 lít thích hợp với các bạn sống độc thân hoặc gia đình nhỏ từ 2 - 3 người.', 519000, 10, 0, 'images/products/Noi Com Dien/3.png'),
	(3, N'Nồi Cơm Điện Tử Panasonic SR-CP188NRAM', N'Nồi cơm điện tử Panasonic SR-CP188NRAM sở hữu thiết kế hiện đại, kết hợp cùng màu chủ đạo là trắng giúp tạo điểm nhấn nổi bật cho không gian sống của mỗi gia đình. Kích thước của nồi khoảng 274 x 384 x 246mm (Rộng -  Sâu - Cao) khá nhỏ gọn, không chiếm quá nhiều diện tích sử dụng. Thiết bị có dung tích lớn 1.8 lít, đáp ứng tốt nhu cầu nấu cơm cho những gia đình có từ 4 - 6 người ăn.', 2390000, 10, 0, 'images/products/Noi Com Dien/4.png'),
	(3, N'Nồi Cơm Điện Tử Cuckoo CR-0680F 1.08 Lít', N'Cuckoo CR-0680F 1.08 lít là dòng nồi cơm điện tử của thương hiệu Cuckoo đến từ Hàn Quốc. Sản phẩm nhỏ gọn với kích thước 25.3 x 35.6 x 21.6 cm, dung tích 1.08 lít. Nồi sử dụng công nghệ nấu 3D nhiệt được tỏa đều khắp xung quanh thân nồi. Cùng với đó là công suất 600W giúp cơm được nấu nhanh, chín đều, thơm ngon.', 2199000, 10, 3, 'images/products/Noi Com Dien/5.png'),

--Bếp
	(4, N'Bếp Từ - Hồng Ngoại TEKA HIC 7320 D', N'Teka HIC 7320D có công suất lên đến 4000W, giữ cho bếp hoạt động mạnh mẽ, rút ngắn thời gian làm nóng và nấu nướng của người dùng. Sản phẩm được trang bị 2 vùng nấu với cài đặt riêng biệt cho từng vùng. Vùng từ bên trái có đường kính 195mm, nấu được các loại nồi, chảo có đế từ. Vùng hồng ngoại bên phải có đường kính 200mm, nấu được mọi loại nồi, chảo. ', 7490000, 10, 3, 'images/products/Bep/1.png'),
	(4, N'Bếp từ - hồng ngoại đôi Sunhouse SHB8609 3600W', N'Bếp từ - hồng ngoại đôi Sunhouse SHB8609 3600W có thiết kế sang trọng với mặt kính đen toàn phần và các chi tiết trên bề mặt được làm gọn gàng, tinh tế mang lại sự nổi bật cho không gian nội thất nhà bạn. Sản phẩm hoạt động với công suất lớn 3600W, khả năng làm nóng nhanh gấp 2 lần so với bếp thường giúp rút ngắn thời gian chờ đợi thức ăn chín, tiết kiệm điện năng hiệu quả.', 2290000, 10, 0, 'images/products/Bep/2.png'),
	(4, N'Bếp Điện Từ Ferroli CPN-4200IC', N'Bếp điện từ Ferroli CPN-4200IC sở hữu thiết kế hình chữ nhật với kích thước (rộng x sâu x cao) tương ứng là 740 x 450 x 64 mm. Sản phẩm có màu đen tinh tế, tạo nên sự sang trọng cho căn bếp của gia đình bạn. Ferroli CPN-4200IC có công suất hoạt động 4500W giữ cho thiết bị vận hành ổn định và bền bỉ. ', 4990000, 10, 0, 'images/products/Bep/3.png'),
	(4, N'Bếp từ - hồng ngoại đôi Sunhouse SHB8609 3600W', N'Bếp đôi JUNGER NKD20 là sản phẩm đa tính năng không kén nồi, thời gian sôi nhanh với 8 mức cài đặt khác nhau, chế độ cài đặt hẹn giờ tắt/ bật thông minh lên đến 360 phút. Hệ thống điều khiển cảm ứng hiện đại dễ dàng thao tác sử dụng. Tính năng khóa bàn phím tránh trẻ nhỏ đùa nghịch, ngoài ra bếp còn có tính năng tự động ngắt điện bếp bật khi không sử dụng và khi trào nước, đèn cảnh báo bếp vẫn còn nóng sau khi sử dụng.', 8290000, 10, 0, 'images/products/Bep/4.png'),
	(4, N'Bếp Điện Từ Đôi Iruka I-28', N'Bếp điện từ Iruka sở hữu thiết kế lắp đặt âm chắc chắn, mỏng nhẹ, kích thước ngang 73cm - sâu 43cm - cao 8.2cm, tối ưu hóa không gian bếp. Iruka I-28 có công suất lên đến 4000W, giúp cho bếp hoạt động mạnh mẽ, rút ngắn thời gian làm nóng nồi chảo và nấu nướng của người dùng. Sản phẩm được trang bị 2 vùng nấu với 4 chức năng đun sôi, chiên, xào, nấu, đáp ứng nhu cầu nấu nướng hàng ngày của người dùng.', 9190000, 10, 2, 'images/products/Bep/5.png'),

--Nồi - Chảo
	(5, N'Bộ Nồi Inox 304 Cao Cấp 7 Món Junger CWJ-070', N'Nồi xào nấu có nắp : 24 x 11.5 cm / Nồi xào nấu có nắp : 28 x 17 cm / Xoong quấy bột có nắp : 16 x 7.5 cm / Chảo : 24 x 5.5 cm',2890000, 10, 5, 'images/products/Noi - Chao/1.png'),
	(5, N'Bộ Nồi Chảo Chống Dính Đáy Từ Ultra Titanium Sunhouse ST2204B', N'Bộ Nồi Chảo Chống Dính Ultra Titanium ST2204B được thiết kế với lớp chống dính Ultra titanium cao cấp, sản phẩm có độ bền lên tới 15 năm, chấp 99.999 lần chà, an toàn khi nấu nướng ở nhiệt độ cao. Bộ nồi chảo gồm 4 sản phẩm khác nhau phục vụ cho nhu cầu nấu nướng đa dạng của mọi gia đình.', 1599000, 10, 0, 'images/products/Noi - Chao/2.png'),
	(5, N'Bộ Nồi Chảo 6 Món ENGEIBEPG EB-8013', N'Sản phẩm của thương hiệu Engeibepg (Đức), sản xuất tại Trung Quốc. Bộ nồi gồm 6 món tiện lợi cho người nội trợ trong việc chế biến các món ăn hàng ngày. Các sản phẩm gồm: Nồi 6.6 lít, kích thước 24 x 14.5cm (Ngang x Cao)/ Nồi 3.9 lít, 20 x 12.5cm/ Nồi 2.9 lít 18 x 11.5cm/ Nồi 2.1 lít 16 x 10.5cm/ Quánh 2.1 lít 16 x 10.5cm/ Chảo 3.4 lít 24 x 7.5cm.', 799000, 10, 1, 'images/products/Noi - Chao/3.png'),
	(5, N'Bộ Nồi Chảo Hợp Kim Nhôm Đúc Đáy Từ Tithafac TF01', N'Bộ nồi chảo hợp kim nhôm đúc đáy từ Tithafac TF01 gồm có 5 món với các kích cỡ: Nồi vân đá 22cm/ Nồi vân đá 20cm/ Nồi vân đá 16cm/ Chảo vân đá 20cm.',899000, 10, 0, 'images/products/Noi - Chao/4.png'),
	(5, N'Bộ Nồi Nhôm Chống Dính Đáy Từ Elmich EL-5311Mnsize 16,20, 24, Chảo 26cm', N'Bộ Nồi Nhôm Chống Dính Đáy Từ Elmich EL-5311Mn gồm: 3 nồi đường kính 16, 20 và 24 cm/ Chảo đường kính 26 cm.',1999000, 10, 3, 'images/products/Noi - Chao/5.png');

Select * from Products

select top 1 * from Products order by [product_id] desc

SELECT * FROM Products where category_id=1;
SELECT * FROM Products WHERE category_id IN (1, 2, 0, 0);

select * from Products where [product_name] like '%Sana%'

select * from Orders