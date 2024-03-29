USE [master]
GO
/****** Object:  Database [Techie]    Script Date: 1/12/2023 10:14:23 PM ******/
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
/****** Object:  User [techie]    Script Date: 1/12/2023 10:14:23 PM ******/
CREATE USER [techie] FOR LOGIN [techie] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [QLSP_ReactAPI]    Script Date: 1/12/2023 10:14:23 PM ******/
CREATE USER [QLSP_ReactAPI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [techie]
GO
ALTER ROLE [db_owner] ADD MEMBER [QLSP_ReactAPI]
GO
/****** Object:  Schema [QLSP_ReactAPI]    Script Date: 1/12/2023 10:14:23 PM ******/
CREATE SCHEMA [QLSP_ReactAPI]
GO
/****** Object:  UserDefinedTableType [dbo].[Giohang]    Script Date: 1/12/2023 10:14:23 PM ******/
CREATE TYPE [dbo].[Giohang] AS TABLE(
	[maSp] [int] NULL,
	[SLuong] [int] NULL,
	[price] [real] NULL,
	[Sum] [real] NULL
)
GO
/****** Object:  Table [dbo].[BLOG]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOG](
	[Ma] [int] NOT NULL,
	[Hinh] [nvarchar](250) NOT NULL,
	[TieuDe] [nvarchar](300) NOT NULL,
	[TomTat] [nvarchar](500) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[Ma_CTDH] [int] IDENTITY(1,1) NOT NULL,
	[Ma_DH] [int] NULL,
	[MaSp] [int] NULL,
	[SLuong] [int] NULL,
	[price] [real] NULL,
	[Sum] [real] NULL,
 CONSTRAINT [PK_CTDonHang] PRIMARY KEY CLUSTERED 
(
	[Ma_CTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Don_Hang]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Don_Hang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaUser] [int] NULL,
	[Ngay_Mua] [datetime] NULL,
	[HoTen] [nvarchar](200) NOT NULL,
	[SDT] [varchar](11) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Message] [nvarchar](max) NULL,
	[Tinh_Trang] [int] NULL,
 CONSTRAINT [PK_Don_Hang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSp] [int] NOT NULL,
	[loai] [int] NOT NULL,
	[name] [nvarchar](250) NULL,
	[price] [int] NULL,
	[hinh] [nvarchar](250) NULL,
	[hot] [int] NULL,
	[mota] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPEOFPRODUCT]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPEOFPRODUCT](
	[MA] [int] NOT NULL,
	[NAMETYPE] [nvarchar](100) NOT NULL,
	[HINH] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERLOGIN]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERLOGIN](
	[MA] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](200) NOT NULL,
	[TENDN] [nvarchar](100) NOT NULL,
	[MATKHAU] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](250) NOT NULL,
	[EMAIL] [nvarchar](200) NOT NULL,
	[SDT] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BLOG] ([Ma], [Hinh], [TieuDe], [TomTat], [NoiDung]) VALUES (1, N'blog_1.jpg', N'Tai nghe có công nghệ chống ồn chủ động ANC là gì? Có nên mua không?', N'Tai nghe là thiết bị không thể thiếu đối với người dùng điện thoại hoặc laptop. Hiện nay, một số hãng đã trang bị công nghệ chống ồn chủ động ANC trên tai nghe của họ. Vậy tai nghe có công nghệ chống ồn chủ động ANC là gì? Hãy cùng TechieShop tìm hiểu nhé! ...', N'Tại sao tai nghe cần chống ồn?
Trong nhiều trường hợp sử dụng tai nghe để giải trí hay học tập, tiếng ồn và tạp âm từ môi trường xung quanh như tiếng còi xe, tiếng nói chuyện, tiếng công trường thi công,... sẽ lọt vào tai bạn làm lấn át cũng như giảm chất lượng âm thanh phát ra từ tai nghe.
Để tạm thời khắc phục vấn đề này, các nhà sản xuất đã cho ra đời rất nhiều kiểu tai nghe chống ồn giúp người dùng cảm nhận âm thanh tốt hơn mà không bị ảnh hưởng bởi tiếng ồn.
Công nghệ chống ồn trên tai nghe được chia ra làm hai loại, bao gồm chống ồn chủ động Active Noise Cancelling (ANC) và chống ồn thụ động Passive Noise Cancelling (PNC). Trong đó ANC là công nghệ chống ồn hiện đại và hiệu quả hơn so với PNC.
Chống ồn chủ động (Active Noise Cancelling - ANC) là công nghệ tạo ra tín hiệu đối lập để hủy tiếng ồn, từ đó ngăn chặn tiếng ồn bên ngoài và giúp người dùng cảm nhận và thưởng thức âm thanh từ tai nghe tốt hơn.
Chống ồn chủ động (Active Noise Cancelling - ANC) là một công nghệ hiện đại được phát triển bởi hãng âm thanh Bose trong những năm cuối thế kỉ 20. 
Tuy nhiên, vào năm 1934 nhà phát minh người Đức Paul Lueg đã đăng ký bằng sáng chế lý thuyết về loại bỏ tiếng ồn bằng cách sử dụng nhiễu và tạo ra các vùng tĩnh. Đến những năm 1950, Harry Olsen đã sử dụng công nghệ ANC trong thực tế.
Các thiết bị điện tử bên trong chiếc tai nghe có công nghệ chống ồn chủ động sẽ tạo ra một làn sóng khử nhiễu có dao động hoàn toàn trái ngược với tiếng ồn xung quanh được ghi lại bởi mic và loại bỏ các âm thanh không mong muốn xung quanh bạn mà không làm giảm âm thanh chính phát ra từ driver của tai nghe.
Trong cài đặt tiếp liệu, micrô được đặt bên ngoài tai nghe, như vậy mic sẽ nghe thấy tiếng ồn và sau đó ANC xử lý và khử tiếng ồn trước khi gửi tín hiệu kết quả đến loa tai nghe.
Công nghệ khử tiếng ồn này có thể giảm nhiễu tần số cao, lên tới 1222 kHz, tuy nhiên chúng cũng gây ra tiếng ồn nhỏ mà chúng không tự triệt tiêu được.
Với loại này, mic được đặt bên trong cốc tai và phía trước loa, do đó, nó sẽ nghe được tiếng ồn giống chính xác như cách người dùng nghe được, do đó, mic sẽ truyền tín hiệu đến ANC để phản hồi và xử lí tiếng ồn thích hợp nhất. Tuy nhiên, nó lại không thể xử lý tốt với tạp âm ở tần số cao.
')
INSERT [dbo].[BLOG] ([Ma], [Hinh], [TieuDe], [TomTat], [NoiDung]) VALUES (2, N'blog_2.jpg', N'Những công nghệ, tiện ích có trên sạc dự phòng, cáp sạc, adapter', N'Trên thị trường hiện nay có rất nhiều thương hiệu sản xuất sạc dự phòng, cáp, sạc,... mỗi hãng lại trang bị cho sản phẩm của mình những công nghệ, tiện ích riêng. Và dưới đây là một số công nghệ phổ biến trong số đó, mời các bạn cùng theo dõi....', N'AiPower là công nghệ sạc thích ứng cho phép sạc dự phòng tự động điều chỉnh điện áp đầu ra (output) phù hợp với từng thiết bị được sạc.
Đây là công nghệ độc quyền được trang bị trên các sản phẩm của sạc dự phòng Aukey, cho khả năng sạc nhanh, an toàn và tương thích với nhiều thiết bị.
Đây là công nghệ do Anker nghiên cứu và ứng dụng lên các sản phẩm của hãng với khả năng kiểm soát đồng thời dòng điện đầu vào (bảo vệ sạc dự phòng) và dòng điện đầu ra (bảo vệ thiết bị được sạc), giảm nguy cơ hư hỏng, cháy nổ.
PowerIQ là công nghệ được tích hợp trong con chip của sạc dự phòng Anker, nó cho phép sạc dự phòng điều chỉnh điện áp đầu ra (output) phù hợp với thiết bị được sạc.
Tính đến tháng 2/2017, PowerIQ 2.0 là phiên bản chip mới nhất, cho công suất sạc 18W mỗi chip, nhờ vậy giúp rút ngắn thời gian sạc, đồng thời đảm bảo điện áp, dòng sạc phù hợp, tránh quá dòng, quá nhiệt.
VoltageBoost là công nghệ bù điện trở của Anker, dễ hiểu hơn là giúp dòng sạc luôn duy trì ổn định, giảm tác động từ cáp, sạc, dòng điện thiếu ổn định,...
Quick Charge là công nghệ sạc nhanh của Qualcomm, được hỗ trợ phổ biến trên nhiều thiết bị smartphone trang bị chip Qualcomm Snapdragon.
Nhưng nhìn chung đây là chuẩn sạc nhanh, hiệu quả, an toàn được nhiều người tin dùng, từ đó các phụ kiện hỗ trợ công nghệ công nghệ Qualcomm Quick Charge cũng ra đời phục vụ cho người dùng.
')
INSERT [dbo].[BLOG] ([Ma], [Hinh], [TieuDe], [TomTat], [NoiDung]) VALUES (3, N'blog_3.jpg', N'Điểm qua những công nghệ âm thanh cực chất có trong dàn âm thanh Sony', N'Dàn âm thanh Sony không chỉ mang đến ngôi nhà bạn chất lượng âm thanh tuyệt hảo mà còn có thiết kế tinh tế, hiện đại, sánh ngang hàng với các dòng dàn âm thanh LG hay dàn âm thanh Samsung. Để có được chất lượng âm thanh cực đỉnh trên các dòng dàn âm thanh của hãng...', N'Nếu am hiểu về âm thanh, Hi-Res Audio (âm thanh độ phân giải cao) không xa lạ với bạn chút nào đúng không? Công nghệ High-Resolution Audio được Sony sử dụng nhiều trên các thiết bị âm thanh của hãng.
High-Resolution Audio (Hi-Res Audio) hay còn gọi là âm thanh độ phân giải cao là một cuộc cách mạng trên các dàn âm thanh gia đình và tất nhiên là Sony cũng không thể bỏ qua công nghệ âm thanh này. High-Resolution Audio trên dàn máy Sony sẽ mang đến cho bạn trải nghiệm âm thanh ở một cấp độ mới, tốt hơn chất lượng CD (44.1kHz/16-bit). Chất lượng âm thanh vượt bậc thể hiện tinh tế từng chi tiết và sắc thái âm nhạc, mà thường bạn chỉ có thể lắng nghe được ở tại phòng thu hoặc buổi biểu diễn trực tiếp.
Công nghệ ClearAudio+ là sự kết hợp của các công nghệ tuyệt đỉnh như S-Force Front Surround cho âm thanh vòm 360 độ mạnh mẽ; ClearPhase tái tạo cân bằng các tần số thấp, trung và cao; Clear Vocal giúp lời thoại rõ ràng; mang đến những chất âm không chỉ rõ nét mà còn đặc sắc đến không ngờ.
Digital Music Area trên dàn máy Sony sẽ mang đến cho người dùng trải nghiệm khi nghe nhạc không khác gì nghe trực tiếp với chất lượng âm thanh tốt nhất.
Công nghệ Digital Music Area được phát triển với sự nghiên cứu kỹ lượng và được tạo ra bằng việc sử dụng các chỉ số đo lường âm thanh được ghi nhận trực tiếp từ nhà hát 02 London Arena, kết hợp với công nghệ xử lý âm thanh kỹ thuật số tiên tiến DSP. Những dàn máy sử dụng công nghệ Digital Music tạo ra âm thanh có độ vang ấn tượng, đồng thời chân thực và sống động hệt như bạn đang thực sự ngồi nghe một buổi hòa nhạc tại nhà hát.
')
INSERT [dbo].[BLOG] ([Ma], [Hinh], [TieuDe], [TomTat], [NoiDung]) VALUES (4, N'blog_4.jpg', N'Review realme Buds T100: Thiết kế tối giản, pin 28 tiếng, giá chỉ 1.19 triệu', N'Tai nghe realme Buds T100 là sản phẩm phụ kiện điện thoại không dây vừa mới được ra mắt của nhà realme, với thiết kế đẹp và thời lượng sử dụng lâu dài. Cùng review realme Buds T100 để khám phá các đặc điểm nổi bật của dòng tai nghe này nhé!...', N'Tổng thể realme Buds T100 được thiết kế khá nhỏ gọn với gam màu trắng thanh nhã. Dòng tai nghe có khối lượng chỉ 4.1g, rất nhẹ nên người dùng có thể cầm nắm, bỏ vào túi quần hay balo một cách rất dễ dàng.
Hộp sạc của realme Buds T100 được làm từ nhựa nhưng không ọp ẹp và có độ hoàn thiện rất tốt. Tuy nhiên, bề ngoài được trang bị phần nhựa bóng nên rất dễ bám bẩn mồ hôi hay vết ố sau một thời gian sử dụng.
Phần tai nghe bên trong hộp sạc realme Buds T100 được thiết kế dạng in-ear, phần housing được làm dạng hình bầu dục có thể tháo rời phần đệm giống với những mẫu in-ear có trên thị trường hiện nay.
Thiết kế này tuy không quá mới mẻ trong phân khúc tai nghe True Wireless nhưng vẫn được rất nhiều người đón nhận. Bởi khi đeo trên tai, thiết bị mang đến cảm giác cực kỳ nhẹ, không gây đau mỏi tai sau thời gian dài sử dụng, đồng thời cũng giúp loại bỏ tạp âm xung quanh.
Bạn có thể dễ dàng kết nối realme Buds T100 với điện thoại hay laptop mà không cần thông qua một ứng dụng nào, chỉ cần kết nối qua Bluetooth bằng cách mở nắp hộp sạc tai nghe.
realme Buds T100 được trang bị thêm công nghệ ENC chống ồn hiện đại, nhằm giúp người dùng có được trải nghiệm nghe tốt nhất khi thiết bị có thể tách rõ âm thanh với môi trường bên ngoài. Công nghệ này cực kỳ phù hợp người đang thực hiện cuộc khi đang đi ngoài đường, do tai nghe sẽ ngăn tiếng gió to, giúp giọng của bạn được rõ hơn.
realme Buds T100 cho thời gian nghe nhạc lên đến 6 giờ, nếu kết hợp với hộp sạc thì tai nghe có thể cho thời lượng sử dụng lên đến 28 giờ. Đây là một thời lượng pin rất tốt và dư sức đáp ứng cho nhu cầu nghe nhạc hay đàm thoại của bạn.
')
INSERT [dbo].[BLOG] ([Ma], [Hinh], [TieuDe], [TomTat], [NoiDung]) VALUES (5, N'blog_5.jpg', N'Sự phát triển của công nghệ không dây và cách lựa chọn tai nghe phù hợp', N'Từ năm 2017, dòng tai nghe true wireless tăng trưởng với tốc độ nhanh chóng. Năm 2019, Apple ra mắt tai nghe true wireless airpods giảm tiếng ồn. Năm 2020 SOLREPUBLIC, MARLEY cũng ra mắt tai nghe true wireless giảm tiếng ồn. Trên toàn cầu các nhà tai nghe lớn cũng đ...', N'Trong lịch sử phát triển của bluetooth, các chuyên gia kỹ thuật bluetooth đã liên tục cải cách và đổi mới. Đặc biệt là những thay đổi gần đây, từ tai nghe đơn tới tai nghe bluetooth chụp tai, tai nghe bluetooth có dây. Mới nhất là tai nghe Bluetooth không dây nhận được nhiều quan tâm. Dựa theo những diễn biến trên, cho thấy được sự phát triển nhanh chóng của tai nghe bluetooth. Nhưng mà, sự phát triển nhanh chóng này là sự tiến bộ về công nghệ hay là sự phóng đại của thị trường quảng cáo? Còn đối với người tiêu dùng đều nhận được là thông tin được công bố từ nhà sản xuất. Chúng tôi hy vọng rằng, sau khi hiểu được công nghệ và kiến thức về Bluetooth không dây. Bạn có thể chọn sản phẩm phù hợp nhất với nhu cầu của mình.
Tai nghe không dây truyền thống và tai nghe true wireless khác nhau chỗ nào? Thật ra đáp án rất đơn giản, chủ yếu là xem bên tai trái và tai phải của tai nghe có dây liên kết hay không. Thông thường tai nghe không dây để duy trì chất lượng kết nối và kiểm soát đồng bộ âm thanh ở hai tai. Thì sẽ có sởi dây cáp liên kết và tai nghe được truyền dẫn thông qua không dây (thông thường là bluetooth) với thiết bị di động ( ví dụ: điện thoại, PC, laptop. switch, apple wath, iphone, pS). Tuy nhiên, đối với tai nghe true wireless thì hoàn toàn không có dây cáp kết nối giữa 2 tai. Mà được thông qua công nghệ truyền dẫn không dây để hai tai nghe có thể hoạt động. Có thể phát nhạc trực tiếp từ điện thoại, chuyển động tự do mà không bị ràng buộc bởi dây.
Tai nghe true wireless không có dây và bộ điều khiển giữa hai tai và nó sử dụng ít không gian hơn. Tất cả các thao tác điều khiển, thiết bị gọi được thực hiện trên thân tai nghe bởi bộ điều khiển. Do đó, độ chính xác và mật độ của nó cao hơn. Cũng vì vậy dung lượng pin sẽ bị giảm đi. Do đó, thời gian sử dụng của nó ngắn hơn so với tai nghe Bluetooth truyền thống và nhất định phải phối hợp với hộp sạc để kéo dài thời gian sử dụng.
 Tai nghe true wireless khác với tai nghe bluetooth truyền thống ở chỗ là, chúng không kết nối với nhau bằng cáp. Nguyên lí hoạt động của nó là thông qua bluetooth để liên kết với điện thoại. Điện thoại sẽ truyền tín hiệu tới máy chủ, sau đó tai nghe chính truyền dữ liệu nhạc đến tai nghe phụ thông qua tín hiệu không dây.
 Với sự tiến bộ không ngừng của công nghệ chip điện tử. Hiện tại, có rất nhiều công nghệ kết nối mới. Cả hai tai nghe bên trái và bên phải đều có thể được sử dụng làm tai nghe chính. Phương thức kết nối này có thể giảm gánh nặng cho tai nghe chính. Đồng thời, phần nguồn năng lượng cũng được cải thiện rất nhiều. Vào cuối năm 2019, các dòng sản phẩm mới đều được áp dụng công nghệ này. Giúp lượng pin tai nghe có thể đạt ít nhất 6h trở lên. Tin tưởng trong năm 2020, phần năng lượng tai nghe sẽ tiếp tục tăng. Ngoài ra, cũng có kỹ thuật mới là hai tai nghe đều được liên kết trực tiếp với máy chủ. Điều này làm giảm gánh nặng cho tai chủ.
')
GO
SET IDENTITY_INSERT [dbo].[CTDonHang] ON 

INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (1, 1, 1, 1, 1000000, 1000000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (2, 1, 2, 1, 900000, 900000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (3, 1, 3, 1, 800000, 800000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (4, 1, 6, 2, 500000, 1000000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (5, 2, 2, 1, 900000, 900000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (6, 3, 1, 1, 1000000, 1000000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (7, 4, 1, 5, 1000000, 5000000)
INSERT [dbo].[CTDonHang] ([Ma_CTDH], [Ma_DH], [MaSp], [SLuong], [price], [Sum]) VALUES (8, 4, 37, 1, 1700000, 1700000)
SET IDENTITY_INSERT [dbo].[CTDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[Don_Hang] ON 

INSERT [dbo].[Don_Hang] ([SoDH], [MaUser], [Ngay_Mua], [HoTen], [SDT], [Address], [Message], [Tinh_Trang]) VALUES (1, 1, CAST(N'2023-01-06T11:50:31.293' AS DateTime), N'Nguyễn Quốc Kỳ', N'0972389257', N'Bình Định', N'kkk', 1)
INSERT [dbo].[Don_Hang] ([SoDH], [MaUser], [Ngay_Mua], [HoTen], [SDT], [Address], [Message], [Tinh_Trang]) VALUES (2, 1, CAST(N'2023-01-06T12:10:16.663' AS DateTime), N'Nguyễn Quốc Kỳ', N'0972389257', N'Bình Định', N'sgfsd', 1)
INSERT [dbo].[Don_Hang] ([SoDH], [MaUser], [Ngay_Mua], [HoTen], [SDT], [Address], [Message], [Tinh_Trang]) VALUES (3, 1, CAST(N'2023-01-06T16:11:09.443' AS DateTime), N'Nguyễn Quốc Kỳ', N'0972389257', N'Bình Định', NULL, 1)
INSERT [dbo].[Don_Hang] ([SoDH], [MaUser], [Ngay_Mua], [HoTen], [SDT], [Address], [Message], [Tinh_Trang]) VALUES (4, 1, CAST(N'2023-01-07T13:37:18.180' AS DateTime), N'Nguyễn Quốc Kỳ', N'0972389257', N'Bình Định', NULL, 1)
SET IDENTITY_INSERT [dbo].[Don_Hang] OFF
GO
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (1, 1, N'Headphone 1', 1000000, N'headphone1.jpg', 1, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (2, 1, N'Headphone 2', 900000, N'headphone2.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (3, 1, N'Headphone 3', 800000, N'headphone3.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (4, 1, N'Headphone 4', 700000, N'headphone4.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (5, 1, N'Headphone 5', 600000, N'headphone5.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (6, 1, N'Headphone 6', 500000, N'headphone6.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (7, 1, N'Headphone 7', 550000, N'headphone7.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (8, 1, N'Headphone 8', 650000, N'headphone8.jpg', 1, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (9, 1, N'Headphone 9', 750000, N'headphone9.jpeg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (10, 1, N'Headphone 10', 850000, N'headphone10.jpeg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (11, 1, N'Headphone 11', 1000000, N'headphone11.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (12, 1, N'Headphone 12', 1000000, N'headphone12.jpg', NULL, N'Thiết kế housing tinh xảo, đồng màu với hộp sạc trong 2 phiên bản là màu hồng ngọt ngào và màu trắng trang nhã, phù hợp với cả phái mạnh và phái đẹp. Housing được chế tác với tay cầm dài cho bạn dễ cầm và đeo vào tai, hạn chế trượt tay, rơi rớt khi thao tác. 
Vẻ ngoài hộp sạc tinh tế, cạnh hông được làm lõm vào trong phá cách và đẹp mắt, bản lề đóng mở dễ dàng, đảm bảo việc nhấc và đặt tai nghe ra/vào rất đơn giản. 
Các dải âm khá tách bạch, nghe được nhiều thể loại nhạc khác nhau từ Bolero đến EDM, Pop. Đảm bảo chất lượng cho các cuộc đàm thoại, tai nghe Bluetooth được tích hợp cả mic thoại cho giọng nói chi tiết, rõ ràng hơn.
Với khả năng phối ghép với đa nền tảng từ Android, iOS (iPhone, iPad), Windows đến macOS (Macbook, iMac), tai nghe sử dụng tiện lợi, kết nối Bluetooth ổn định trong khoảng cách xa lên đến 10 m. Nghe nhạc hoặc gọi điện được với 2 housing hoặc 1 housing dễ dàng. 
Khi chỉ dùng housing, thời gian cung cấp cho bạn sử dụng tới 4 giờ, kết hợp hộp sạc có thêm 16 giờ, nâng tổng thời gian là 20 tiếng. Nếu tai nghe True Wireless sắp hết pin, bạn chỉ cần cắm sạc trong 1.5 giờ là lại có tai nghe đầy năng lượng để trải nghiệm tiếp.
Tiện lợi khi tùy chọn các tính năng như chuyển bài hát, phát/ngừng nhạc, nghe/nhận cuộc gọi, tăng/giảm âm lượng và bật trợ lý ảo. 
Tai nghe Bluetooth True Wireless đạt chuẩn IPX5 có khả năng chịu được tia nước bắn áp suất thấp trong ít nhất 3 phút nên bạn có thể sử dụng tai nghe khi tập luyện với cường độ cao xuất nhiều mồ hôi hay đi ra đường lỡ gặp cơn mưa nhẹ bất chợt.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (13, 2, N'Corsair K68 RGB', 2635000, N'keyboard1.jpg', NULL, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (14, 2, N'Gaming MSI Vigor GK20 US', 700000, N'keyboard2.jpg', NULL, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (15, 2, N'Rapoo V500Pro', 1300000, N'keyboard3.jpg', NULL, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (16, 2, N'Microsoft QSZ-00017', 1190000, N'keyboard4.jpg', 1, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (17, 3, N'DareU A960', 640000, N'mouse1.jpg', NULL, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (18, 3, N'Rapoo VT30', 620000, N'mouse2.jpg', NULL, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (19, 3, N'Logitech G102 Gen2', 600000, N'mouse3.jpg', 1, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (20, 3, N'Asus Keris', 1125000, N'mouse4.jpg', NULL, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (21, 4, N'PD 20W Xmobile TC20B', 210000, N'sac1.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (22, 4, N'Lightning MFI 0.9m Anker Select+ A8012', 215000, N'sac2.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (23, 4, N'VOOC 30W OPPO VC56JAUH', 345000, N'sac3.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (24, 4, N'PD 40W Anker Nano Pro A2038', 500000, N'sac4.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (25, 5, N'Xmobile PowerBox P69D', 730000, N'sacDp1.jpg', NULL, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (26, 5, N'AVA+ JP208', 200000, N'sacDp2.jpeg', 1, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (27, 5, N'Hydrus PJ JP196', 500000, N'sacDp3.jpg', NULL, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (28, 5, N'Xmobile PowerLite P106WD', 800000, N'sacDp4.jpg', NULL, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (29, 6, N'Mozard BT100', 1300000, N'loa1.jpg', NULL, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (30, 6, N'Sony Extra Bass SRS-XB33', 3690000, N'loa2.jpg', NULL, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (31, 6, N'Microlab B26', 300000, N'loa3.jpg', NULL, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (32, 6, N'Sony SRS-XE200', 1700000, N'loa4.jpg', 1, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (33, 2, N'Corsair K63 Compact Mechanical', 1485000, N'keyboard5.jpg', NULL, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (34, 3, N'Logitech G403 Hero', 1080000, N'mouse5.jpg', NULL, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (35, 4, N'Lightning MFI 2m Mbest DS948-WB', 280000, N'sac5.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (36, 5, N' Hydrus PA CK01', 300000, N'sacDp5.jpg', NULL, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (37, 6, N'JBL Flip 6', 1700000, N'loa5.jpg', NULL, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (38, 2, N'Gaming Razer BlackWidow', 2200000, N'keyboard6.jpg', NULL, N'Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (39, 3, N'Gaming Zadez G-610M', 170000, N'mouse6.jpg', NULL, N'Chuột Không dây Bluetooth sở hữu thiết kế nhỏ gọn, màu sắc nổi bật, phản hồi chính xác từng cử chỉ di chuyển chuột,...
2 bên hông thân chuột có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.
Có 2 gam màu đen và xanh đen sang trọng, lựa chọn lý tưởng cho cả phái mạnh và phái đẹp.
Với 1000 DPI, điều khiển chuột dễ dàng trên hầu hết các bề mặt, hạn chế tối đa các lần nhấp/di chuyển sai mục tiêu, phục vụ tốt cho những nhu cầu dùng thường nhật của bạn như lướt web, chơi game, làm việc văn phòng,...
Trang bị cổng USB thông dụng, chuột máy tính làm việc được với nhiều thiết bị khác nhau như laptop, máy tính để bàn, tivi,..., sóng mạnh mẽ, hầu như không bị trễ, rớt mạng tạo sự linh hoạt cho hoàn cảnh sử dụng.
Cuộn con lăn ổn định đến từng dòng, phím trái - phải ấn nhẹ êm, cho bạn sử dụng chuột tiện lợi, năng suất.
Pin AA phổ biến, dễ mua và thay thế khi sắp hết pin. Chế độ tiết kiệm pin tự động kích hoạt khi không dùng chuột không dây.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (40, 4, N'Type C - Lightning 1m Apple MM0A3', 590000, N'sac6.jpg', NULL, N'Ấn tượng đầu tiên khi cầm củ sạc này trên tay, kiểu dáng nhỏ gọn, chiều ngang chỉ khoảng 2/3 thẻ căn cước công dân và chiều dài cũng chỉ gần bằng thẻ này. Đặc biệt, mình có thể cầm trọn trong lòng bàn tay, điều này cũng tương đương với việc củ sạc không chiếm nhiều diện tích trên ổ cắm và trong các ngăn balo, túi xách,...
Chất liệu nhựa màu trắng cứng cáp, các khớp được liên kết với nhau liền mạch cùng các viền được bo tròn, khi mình cầm củ sạc trên tay mang lại cảm giác đầm tay, chắc chắn và cũng khá thoải mái.
Bên cạnh đó, mình khá ưng ý với thiết kế đầu cắm của adapter sạc này là loại có 2 chấu tròn quen thuộc, mình đã có thể thuận lợi dùng được với đa dạng các ổ điện ở mọi nơi từ nhà cho tới công sở, trường học, quán cà phê, khách sạn,... 
Mình đã có thể rút ngắn được thời gian chờ đợi nạp đầy năng lượng,... khi củ sạc này đã được tích hợp công nghệ Power Delivery hỗ trợ sạc nhanh ở nhiều dòng điện áp khác nhau. Mình sạc cho iPhone 13 Pro chỉ mất khoảng 1 tiếng hơn khi dùng củ sạc Apple 20 W và cáp sạc Apple chính hãng. Đây là thời gian sạc khá nhanh, lý tưởng dành cho mình và tất cả mọi người.
Nếu hành trang thường nhật của bạn đang thiếu 1 chiếc adapter sạc nhanh chính hãng tin cậy thì mẫu adapter này chắc chắn sẽ là lựa chọn tuyệt vời cho bạn.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (41, 5, N'Hydrus PB299S', 675000, N'sacDp6.jpg', NULL, N'Pin sạc dự phòng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Pin dự phòng có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có thể thấy, pin sạc dự phòng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.')
INSERT [dbo].[SanPham] ([maSp], [loai], [name], [price], [hinh], [hot], [mota]) VALUES (42, 6, N'Sony SRS-XE300', 4690000, N'loa6.jpg', NULL, N'Loa nổi bật với thiết kế sang chảnh, đèn LED đẹp mắt, chất lượng âm thanh vượt trội,... hứa hẹn sẽ là người bạn đồng hành tuyệt vời cùng bạn trong mọi bữa tiệc âm nhạc.
Kiểu dáng đơn giản, thiết kế tiện dụng với phần tay cầm ở mặt trên loa. Chân đế bọc cao su giúp loa đứng vững và bám chắc vào mặt phẳng.
Bữa tiệc thêm hoành tráng, ấn tượng với sự kết hợp của đèn LED trên thân loa giúp trải nghiệm của bạn tuyệt vời hơn.
Với 1 củ loa subwoofer và 2 củ loa tweeter giúp thể hiện rõ từng chi tiết và giữ nguyên vẹn âm sắc vốn có của bản nhạc. Công suất chiếc loa JBL này đạt 100 W và có thể lên tới 200 W, cho bữa tiệc âm thanh thêm bùng nổ.
Kết nối Bluetooth chuẩn 5.1 hiện đại giúp bạn có thể thoải mái phát nhạc ở khoảng cách 10 m so với vị trí đặt thiết bị mà vẫn đảm bảo âm thanh phát ra liền mạch, kết nối ổn định.
Chống nước IPX4 cho phép loa chống được tia nước phun trực tiếp từ mọi hướng, khả năng phát nhạc vẫn không bị ảnh hưởng.')
GO
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (1, N'Tai nghe', N'tainghe_logo.png')
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (2, N'Bàn phím', N'banphim_logo.jpg')
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (3, N'Chuột', N'chuot_logo.jpg')
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (4, N'Sạc', N'sac_logo.jpg')
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (5, N'Sạc dự phòng', N'sacdp_logo.jpg')
INSERT [dbo].[TYPEOFPRODUCT] ([MA], [NAMETYPE], [HINH]) VALUES (6, N'Loa', N'loa_logo.jpg')
GO
SET IDENTITY_INSERT [dbo].[USERLOGIN] ON 

INSERT [dbo].[USERLOGIN] ([MA], [HOTEN], [TENDN], [MATKHAU], [DIACHI], [EMAIL], [SDT]) VALUES (1, N'Nguyễn Quốc Kỳ', N'quocky', N'1234', N'Bình Định', N'quockynguyen@gmail.com', N'0972389257')
INSERT [dbo].[USERLOGIN] ([MA], [HOTEN], [TENDN], [MATKHAU], [DIACHI], [EMAIL], [SDT]) VALUES (2, N'Lê Quang Lâm', N'quanglam', N'1234', N'Phù Mỹ', N'quanglamvlog@gmail.com', N'0972389256')
SET IDENTITY_INSERT [dbo].[USERLOGIN] OFF
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD FOREIGN KEY([Ma_DH])
REFERENCES [dbo].[Don_Hang] ([SoDH])
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([maSp])
GO
ALTER TABLE [dbo].[Don_Hang]  WITH CHECK ADD FOREIGN KEY([MaUser])
REFERENCES [dbo].[USERLOGIN] ([MA])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([loai])
REFERENCES [dbo].[TYPEOFPRODUCT] ([MA])
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddOrder](@MaUser int,@Address nvarchar(500),@Hoten nvarchar(200),@sdt varchar(11),@Message nvarchar(Max),
@t Giohang readonly ,@Currentid int output)
as
begin try
declare @madh int
insert into Don_hang([MaUser] ,[Ngay_Mua],[HoTen],[SDT],[Address],[Message] ,[Tinh_Trang])
values(@MaUser,getdate(),@Hoten,@sdt,@Address,@Message,1)
set @madh=@@IDENTITY
insert into [CTDonHang]([Ma_DH],[MaSp],[SLuong],[price]  ,[Sum])
select @madh,maSp , SLuong ,  price , Sum from @t
set @Currentid=@madh
end try
begin catch
set @Currentid=-1
end catch
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddUser](@HOTEN NVARCHAR(200),@TENDN NVARCHAR(100),@MATKHAU NVARCHAR(100), @DIACHI nvarchar(250),@EMAIL NVARCHAR(200),@SDT varchar(12),@CurrentID int output)
AS 
IF(EXISTS (SELECT * FROM USERLOGIN WHERE TENDN=@TENDN OR EMAIL=@EMAIL))
	BEGIN
	SET @CurrentID=-1
	RETURN
	END
INSERT INTO USERLOGIN (HOTEN,TENDN,MATKHAU,DIACHI,EMAIL,SDT) VALUES (@HOTEN,@TENDN,@MATKHAU,@DIACHI,@EMAIL,@SDT)
SET @CurrentID=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DangNhap](@TENDN nvarchar(100),@MATKHAU nvarchar(100))
 as
 select * from USERLOGIN where TENDN=@TENDN and MATKHAU=@MATKHAU
GO
/****** Object:  StoredProcedure [dbo].[ListBlog]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListBlog]
as
select [Ma]
      ,[Hinh]
      ,[TieuDe]
      ,[TomTat]
      ,[NoiDung] from BLOG
GO
/****** Object:  StoredProcedure [dbo].[ListProduct]    Script Date: 1/12/2023 10:14:23 PM ******/
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
      ,[hinh] 
      ,[mota] from SanPham
GO
/****** Object:  StoredProcedure [dbo].[ListProductBought]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListProductBought](@mauser int)
as
select distinct [loai]
      ,[name]
      ,SanPham.price
      ,[hinh] 
      ,[mota] from SanPham,CTDonHang,Don_Hang
where SanPham.maSp=CTDonHang.MaSp and CTDonHang.Ma_DH=Don_Hang.SoDH and Don_Hang.MaUser=@mauser
GO
/****** Object:  StoredProcedure [dbo].[ListProductByType]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListProductByType](@loai int)
as
select [maSp]
      ,[loai]
      ,[name]
      ,[price]
      ,[hinh] 
      ,[mota] from SanPham
where [loai]=@loai
GO
/****** Object:  StoredProcedure [dbo].[ListProductHot]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListProductHot]
as
select [maSp]
      ,[loai]
      ,[name]
      ,[price]
      ,[hinh] 
      ,[mota] from SanPham
where [hot]=1
GO
/****** Object:  StoredProcedure [dbo].[ListType]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListType]
as
select [MA]
      ,[NAMETYPE]
      ,[HINH] from TYPEOFPRODUCT
GO
/****** Object:  StoredProcedure [dbo].[SumMoney]    Script Date: 1/12/2023 10:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SumMoney](@mauser int)
as
select [loai]
      ,[name]
      ,[SLuong]
	  ,SanPham.price
      ,[hinh] 
      ,[mota] from SanPham,CTDonHang,Don_Hang
where SanPham.maSp=CTDonHang.MaSp and CTDonHang.Ma_DH=Don_Hang.SoDH and Don_Hang.MaUser=@mauser
GO
USE [master]
GO
ALTER DATABASE [Techie] SET  READ_WRITE 
GO
