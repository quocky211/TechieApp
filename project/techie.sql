USE [master]
GO
/****** Object:  Database [Techie]    Script Date: 12/18/2022 12:17:00 AM ******/
CREATE DATABASE [Techie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLySanPham_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Techie.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'QuanLySanPham_Logs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Techie.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Techie] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Techie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Techie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Techie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Techie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Techie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Techie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Techie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Techie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Techie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Techie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Techie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Techie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Techie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Techie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Techie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Techie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Techie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Techie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Techie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Techie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Techie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Techie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Techie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Techie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Techie] SET  MULTI_USER 
GO
ALTER DATABASE [Techie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Techie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Techie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Techie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Techie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Techie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Techie', N'ON'
GO
ALTER DATABASE [Techie] SET QUERY_STORE = OFF
GO
USE [Techie]
GO
/****** Object:  User [techie]    Script Date: 12/18/2022 12:17:01 AM ******/
CREATE USER [techie] FOR LOGIN [techie] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [QLSP_ReactAPI]    Script Date: 12/18/2022 12:17:01 AM ******/
CREATE USER [QLSP_ReactAPI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [techie]
GO
ALTER ROLE [db_owner] ADD MEMBER [QLSP_ReactAPI]
GO
/****** Object:  Schema [QLSP_ReactAPI]    Script Date: 12/18/2022 12:17:01 AM ******/
CREATE SCHEMA [QLSP_ReactAPI]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/18/2022 12:17:01 AM ******/
/*Table type*/
CREATE TABLE TYPEOFPRODUCT
(
	MA int PRIMARY KEY,
	NAMETYPE NVARCHAR(100) NOT NULL,
	HINH NVARCHAR(250) NOT NULL,

)
/*Table product*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSp] int NOT NULL,
	[loai] int NOT NULL,
	[name] [nvarchar](250) NULL,
	[price] [int] NULL,
	[hinh] [nvarchar](250) NULL,
	[mota] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE SanPham ADD CONSTRAINT FK_TYPE FOREIGN KEY (loai) REFERENCES TYPEOFPRODUCT(MA);
/*table user*/
CREATE TABLE USERLOGIN
(	
	MA INT IDENTITY(1,1) PRIMARY KEY,
	HOTEN NVARCHAR (200) NOT NULL,
	TENDN NVARCHAR (100) NOT NULL,
	MATKHAU NVARCHAR (100) NOT NULL,
	EMAIL NVARCHAR (200) NOT NULL,
)

/*data for type of product*/
INSERT TYPEOFPRODUCT VALUES (1,N'Tai nghe',N'headphone1.jpg')
INSERT TYPEOFPRODUCT VALUES (2,N'Bàn phím',N'keyboard1.jpg')
INSERT TYPEOFPRODUCT VALUES (3,N'Chuột',N'mouse1.jpg')
INSERT TYPEOFPRODUCT VALUES (4,N'Sạc',N'sac1.jpg')
INSERT TYPEOFPRODUCT VALUES (5,N'Sạc dự phòng',N'sacDp2.jpeg')
INSERT TYPEOFPRODUCT VALUES (6,N'loa',N'loa3.jpg')
/*data for product*/

INSERT [dbo].[SanPham]  VALUES (1, 1, N'Headphone 1', 1000000, N'headphone1.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (2, 1, N'Headphone 2', 900000, N'headphone2.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (3, 1, N'Headphone 3', 800000, N'headphone3.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (4, 1, N'Headphone 4', 700000, N'headphone4.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (5, 1, N'Headphone 5', 600000, N'headphone5.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (6, 1, N'Headphone 6', 500000, N'headphone6.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (7, 1, N'Headphone 7', 550000, N'headphone7.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (8, 1, N'Headphone 8', 650000, N'headphone8.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (9, 1, N'Headphone 9', 750000, N'headphone9.jpeg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (10, 1, N'Headphone 10', 850000, N'headphone10.jpeg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (11, 1, N'Headphone 11', 1000000, N'headphone11.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (12, 1, N'Headphone 12', 1000000, N'headphone12.jpg',N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] VALUES (13, 2, N'Corsair K68 RGB', 2635000, N'keyboard1.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (14, 2, N'Gaming MSI Vigor GK20 US', 700000, N'keyboard2.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (15, 2, N'Rapoo V500Pro', 1300000, N'keyboard3.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (16, 2, N'Microsoft QSZ-00017', 1190000, N'keyboard4.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (17, 3, N'DareU A960', 640000, N'mouse1.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (18, 3, N'Rapoo VT30', 620000, N'mouse2.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (19, 3, N'Logitech G102 Gen2', 600000, N'mouse3.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (20, 3, N'Asus Keris', 1125000, N'mouse4.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (21, 4, N'PD 20W Xmobile TC20B', 210000, N'sac1.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (22, 4, N'Lightning MFI 0.9m Anker Select+ A8012', 215000, N'sac2.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (23, 4, N'VOOC 30W OPPO VC56JAUH', 345000, N'sac3.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (24, 4, N'PD 40W Anker Nano Pro A2038', 500000, N'sac4.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (25, 5, N'Xmobile PowerBox P69D', 730000, N'sacDp1.jpg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (26, 5, N'AVA+ JP208', 200000, N'sacDp2.jpeg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (27, 5, N'Hydrus PJ JP196', 500000, N'sacDp3.jpg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (28, 5, N'Xmobile PowerLite P106WD', 800000, N'sacDp4.jpg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (29, 6, N'Mozard BT100', 1300000, N'loa1.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] VALUES (30, 6, N'Sony Extra Bass SRS-XB33', 3690000, N'loa2.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] VALUES (31, 6, N'Microlab B26', 300000, N'loa3.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] VALUES (32, 6, N'Sony SRS-XE200', 1700000, N'loa4.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] VALUES (33, 2, N'Corsair K63 Compact Mechanical', 1485000, N'keyboard5.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (34, 3, N'Logitech G403 Hero', 1080000, N'mouse5.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (35, 4, N'Lightning MFI 2m Mbest DS948-WB', 280000, N'sac5.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (36, 5, N' Hydrus PA CK01', 300000, N'sacDp5.jpg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (37, 6, N'JBL Flip 6', 1700000, N'loa5.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] VALUES (38, 2, N'Gaming Razer BlackWidow', 2200000, N'keyboard6.jpg',N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] VALUES (39, 3, N'Gaming Zadez G-610M', 170000, N'mouse6.jpg',N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] VALUES (40, 4, N'Type C - Lightning 1m Apple MM0A3', 590000, N'sac6.jpg',N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] VALUES (41, 5, N'Hydrus PB299S', 675000, N'sacDp6.jpg',N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] VALUES (42, 6, N'Sony SRS-XE300', 4690000, N'loa6.jpg',N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
GO
/****** Object:  StoredProcedure [dbo].[ListProduct]    Script Date: 12/18/2022 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListProduct]
as
select [maSp]
      ,[loai]
      ,[name]
      ,[price]
      ,'http://192.168.1.26/TechieAPI/images/'+[hinh] as hinh
      ,[mota] from SanPham
GO
/****** Object:  StoredProcedure [dbo].[Proc_getproductbytype]    Script Date: 12/18/2022 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListProductByType](@type int)
as
select [maSp]
      ,[loai]
      ,[name]
      ,[price]
      ,'http://192.168.1.26/TechieAPI/images/'+[hinh] as hinh
      ,[mota] from SanPham
where [loai]=@type
GO
/****** Object:  StoredProcedure [dbo].[Proc_adduser]    Script Date: 12/18/2022 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[AddUser](@HOTEN NVARCHAR(200),@TENDN NVARCHAR(100),@MATKHAU NVARCHAR(100),
@EMAIL NVARCHAR(200),@CurrentID int output)
AS 
IF(EXISTS (SELECT * FROM USERLOGIN WHERE TENDN=@TENDN OR EMAIL=@EMAIL))
	BEGIN
	SET @CurrentID=-1
	RETURN
	END
INSERT INTO USERLOGIN (HOTEN,TENDN,MATKHAU,EMAIL) VALUES (@HOTEN,@TENDN,@MATKHAU,@EMAIL)
SET @CurrentID=@@IDENTITY
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 11/24/2022 9:58:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DangNhap](@TENDN nvarchar(100),@MATKHAU nvarchar(100))
 as
 select * from USERLOGIN where TENDN=@TENDN and MATKHAU=@MATKHAU
GO
