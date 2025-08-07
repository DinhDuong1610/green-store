-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for greeny_shop
CREATE DATABASE IF NOT EXISTS `greeny_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `greeny_shop`;

-- Dumping structure for table greeny_shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.categories: ~3 rows (approximately)
INSERT INTO `categories` (`category_id`, `category_image`, `category_name`) VALUES
	(4, 'https://benhvienk.vn/data/media/1601/images/rau-thuoc-ho-cai-giup-cai-thien-tieu-duong-giam-nguy-co-mac-benh-tim-dot-quy-va-ung-thu-1.jpg', 'Rau'),
	(5, 'https://benhvienk.vn/data/media/1601/images/rau-thuoc-ho-cai-giup-cai-thien-tieu-duong-giam-nguy-co-mac-benh-tim-dot-quy-va-ung-thu-1.jpg', 'Trái Cây'),
	(6, 'https://benhvienk.vn/data/media/1601/images/rau-thuoc-ho-cai-giup-cai-thien-tieu-duong-giam-nguy-co-mac-benh-tim-dot-quy-va-ung-thu-1.jpg', 'Củ quả ');

-- Dumping structure for table greeny_shop.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` date DEFAULT NULL,
  `star` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`),
  CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.comments: ~4 rows (approximately)

-- Dumping structure for table greeny_shop.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` text DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.faq: ~26 rows (approximately)
INSERT INTO `faq` (`id`, `answer`, `question`) VALUES
	(1, 'Sản xuất thực phẩm hữu cơ dựa trên một hệ thống canh tác bắt chước các hệ sinh thái tự nhiên nhằm cân bằng các quần thể sinh vật có hại và sinh vật có ích, đồng thời duy trì và bổ sung độ phì nhiêu của đất. Thuật ngữ \'hữu cơ\' ở Hoa Kỳ được áp dụng cho các sản phẩm nông nghiệp được sản xuất tại các trang trại tuân thủ Quy tắc Chương trình Hữu cơ Quốc gia (NOP) của USDA.', 'Nông Nghiệp Hữu Cơ Là Gì?'),
	(2, 'Nông dân hữu cơ quản lý chất dinh dưỡng cây trồng thông qua luân canh cây trồng bao gồm cây che phủ và việc bón các chất hữu cơ từ động thực vật, thường ở dạng phân trộn. Các biện pháp làm đất và canh tác thích hợp giúp cải thiện cấu trúc đất, hàm lượng chất hữu cơ và đời sống vi sinh vật trong đất. Khoáng chất được khai thác và một số chất tổng hợp được cho phép được cho phép làm nguồn dinh dưỡng bổ sung, miễn là tránh ô nhiễm đất, cây trồng và nước.', 'Làm Thế Nào Để Các Trang Trại Hữu Cơ Quản Lý Khả Năng Sinh Sản?'),
	(3, 'Đúng. Phân thô và các vật liệu động thực vật khác phải được xử lý theo cách ngăn ngừa ô nhiễm nước, đất và cây trồng. Để có thể bón phân mà không hạn chế ngày thu hoạch, phân chuồng phải được ủ kỹ. Các loại cây trồng làm thức ăn cho người có phần ăn được tiếp xúc với đất - bao gồm cả rau xanh - phải được thu hoạch ít nhất 120 ngày sau khi bón phân chưa ủ. Các cây trồng khác dùng cho người phải được thu hoạch ít nhất 90 ngày sau khi bón phân thô.', 'Nông Dân Hữu Cơ Có Thực Hiện Bất Kỳ Biện Pháp Phòng Ngừa Nào Khi Họ Bón Phân Trong Các Trang Trại Hữu Cơ Không?'),
	(4, 'Các hệ thống trang trại hữu cơ bảo vệ cây trồng bị tổn hại do côn trùng gây hại chủ yếu thông qua việc sử dụng các biện pháp sinh học và văn hóa như luân canh cây trồng; sự đa dạng hóa; quản lý môi trường sống; giải phóng sinh vật có lợi; vệ sinh môi trường; và thời gian. Một số chất tự nhiên, chẳng hạn như thực vật và một số thuốc trừ sâu tổng hợp tương đối không độc hại như xà phòng được Tiêu chuẩn Chương trình Hữu cơ Quốc gia USDA cho phép khi sử dụng cùng với kế hoạch trang trại và được sử dụng theo các hạn chế được tìm thấy trong Danh sách Quốc gia.', 'Các Trùng Lặp Côn Trùng Gây Hại Được Quản Lý Như Thế Nào Trong Các Chủ Cơ Sở Trang?'),
	(5, 'Quản lý cỏ dại trong các trang trại hữu cơ bao gồm các kỹ thuật cơ học và văn hóa như luân canh cây trồng để ngăn chặn cỏ dại, che phủ, làm đất, canh tác, quản lý nước và làm cỏ thủ công. Cỏ dại thường giúp bảo tồn đất, cải thiện chất hữu cơ và cung cấp môi trường sống có lợi cho các loài thiên địch trong các trang trại hữu cơ. Lớp phủ nhựa được cho phép miễn là chúng được loại bỏ vào cuối vụ. Côn trùng và bệnh tật có thể giúp kiểm soát một số quần thể cỏ dại nhất định. Có một số chất tự nhiên cũng được sử dụng để quản lý cỏ dại, nhưng hiệu quả của những chất này vẫn còn phải bàn.', 'Cỏ Dại Được Quản Lý Như Thế Nào Trong Các Trang Trại Hữu Cơ?'),
	(6, 'Các bệnh truyền qua đất được quản lý bằng cách cải thiện chất hữu cơ và hoạt động sinh học. Các phương pháp văn hóa, sinh học và vật lý như luân canh, vệ sinh, cắt tỉa và chọn giống kháng bệnh đều là một phần của quản lý bệnh hữu cơ. Một số chất tự nhiên, chẳng hạn như đất sét và một số chất diệt nấm tổng hợp như đồng sunfat được cho phép theo Tiêu chuẩn Chương trình Hữu cơ Quốc gia của USDA khi sử dụng cùng với kế hoạch trang trại và được sử dụng theo các hạn chế được tìm thấy trong Danh sách Quốc gia.', 'Dịch Bệnh Cây Trồng Được Quản Lý Như Thế Nào Trong Các Trang Trại Hữu Cơ?'),
	(7, 'Có hai cách để chuyển đổi động vật lấy sữa sang sản xuất hữu cơ: \r\n1) Động vật từ các nguồn thông thường phải được duy trì dưới sự quản lý hữu cơ trong 12 tháng trước khi bán bất kỳ sản phẩm nào dưới dạng hữu cơ. Động vật thay thế có thể được thêm vào đàn sau khoảng thời gian 12 tháng chuyển đổi tương tự. \r\n2) Nếu toàn bộ một đàn riêng biệt được chuyển đổi, trợ cấp một lần được cấp để cho phép cho ăn tối đa 20% thức ăn không hữu cơ trong 9 tháng đầu tiên, sau đó là 100% thức ăn hữu cơ trong ba tháng. Nếu loại chuyển đổi này được thực hiện, tất cả các động vật thay thế phải được quản lý một cách hữu cơ từ một phần ba cuối của thai kỳ.', 'Các Yêu Cầu Để Chuyển Đổi Sang Sản Xuất Sữa Hữu Cơ Là Gì?'),
	(8, 'Tất cả các sản phẩm nông nghiệp được cung cấp trong khẩu phần thức ăn phải là hữu cơ, với một lượng bổ sung và phụ gia hạn chế. Gia súc nhai lại phải được đồng cỏ đáp ứng một phần đáng kể nhu cầu thức ăn.', 'Làm Thế Nào Để Động Vật Hữu Cơ Đáp Ứng Các Yêu Cầu Dinh Dưỡng Của Chúng?'),
	(9, 'Chăm sóc sức khỏe vật nuôi phải dựa trên các thực hành phòng bệnh, chẳng hạn như cân bằng dinh dưỡng từ thức ăn hữu cơ, giảm căng thẳng và thực hành phòng bệnh. Các loại thuốc trong Danh sách Quốc gia chỉ có thể được sử dụng khi cần thiết và không được sử dụng trong trường hợp không có bệnh. Thuốc kháng sinh không được phép sử dụng và các sản phẩm từ động vật được điều trị bằng bất kỳ loại thuốc bị cấm nào phải được chuyển hướng khỏi các kênh tiếp thị hữu cơ.', 'Làm Thế Nào Để Người Sản Xuất Duy Trì Sức Khỏe Của Động Vật Hữu Cơ?'),
	(10, 'Các nhà sản xuất chăn nuôi hữu cơ dựa vào các thực hành văn hóa để giảm thiểu sự xâm nhập của ký sinh trùng. Thuốc diệt ký sinh trùng tổng hợp chỉ có thể được sử dụng nếu chúng nằm trong Danh sách Quốc gia và bị cấm sử dụng trong kho giết mổ.', 'Có Những Phương Pháp Nào Để Quản Lý Ký Sinh Trùng Trong Vật Nuôi Hữu Cơ?'),
	(11, 'Tất cả các động vật hữu cơ được yêu cầu có quyền tiếp cận các khu vực ngoài trời và tập thể dục, đồng thời phải được cung cấp các điều kiện sống lành mạnh. Động vật nhai lại cũng được yêu cầu tiếp cận đồng cỏ.', 'Điều Kiện Sống Của Vật Nuôi Hữu Cơ Là Gì?'),
	(12, 'Chương trình Hữu cơ Quốc gia (NOP) bao gồm các quy định và cơ quan quản lý để thiết lập và bảo vệ các tiêu chuẩn cho các sản phẩm nông nghiệp được dán nhãn là "hữu cơ". Các tiêu chuẩn này được gọi là Tiêu chuẩn Hữu cơ Quốc gia. Quốc hội đã ủy quyền cho USDA thành lập NOP theo Đạo luật Sản xuất Thực phẩm Hữu cơ năm 1990. Tất cả các tuyên bố về nhãn thực phẩm hữu cơ được thực hiện tại Hoa Kỳ hiện phải được hỗ trợ bằng chứng nhận hợp lệ theo Quy tắc NOP.', 'Chương Trình Hữu Cơ Quốc Gia Là Gì?'),
	(13, 'Các quy định của USDA yêu cầu tất cả các nhà sản xuất và xử lý đưa ra công bố hữu cơ cho sản phẩm của họ phải được chứng nhận bởi một cơ quan chứng nhận được USDA công nhận. Các trường hợp ngoại lệ duy nhất là đối với nông dân nhỏ hoặc người chế biến có tổng doanh thu bán hàng hữu cơ dưới 5.000 đô la, người xử lý mua và bán mà không đóng gói lại hoặc thay đổi hình thức và các nhà bán lẻ không chế biến thực phẩm. Các hoạt động miễn trừ phải duy trì hồ sơ và tuân theo các quy trình sản xuất giống hệt như các nông dân được chứng nhận để dán nhãn sản phẩm của họ là hữu cơ.', 'Ai Phải Được Chứng Nhận?'),
	(14, 'USDA công nhận các cơ quan nhà nước, tư nhân và quốc tế chứng nhận các sản phẩm nông nghiệp và thực phẩm là hữu cơ theo NOP.', 'Ai Chứng Nhận?'),
	(15, 'Để đủ điều kiện được chứng nhận hữu cơ, đất phải không có vật liệu bị cấm áp dụng cho nó trong ba năm ngay trước khi thu hoạch.', 'Mất Bao Lâu Để Chuyển Đất Canh Tác Thông Thường Sang Trạng Thái Hữu Cơ?'),
	(16, 'Một trang trại có thể được chuyển đổi ruộng theo ruộng. Tuy nhiên, để được chứng nhận, một cánh đồng phải có ranh giới rõ ràng, xác định và vùng đệm để bảo vệ nó khỏi dòng chảy và ô nhiễm ngoài ý muốn từ vùng đất liền kề. Trang trại cũng cần có cơ sở vật chất và lưu trữ hồ sơ để đảm bảo và ghi chép rằng các loại cây trồng hữu cơ và không hữu cơ không bị lẫn lộn.', 'Phải Chuyển Đổi Toàn Bộ Trang Trại Hay Một Trang Trại Có Thể Thực Hiện Chuyển Đổi Theo Từng Cánh Đồng?'),
	(17, 'Động vật giết mổ có thể đến từ bất kỳ đàn giống nào đã được quản lý hữu cơ từ 1/3 cuối thời kỳ mang thai.', 'Những Nguồn Động Vật Được Chấp Nhận Được Sử Dụng Để Sản Xuất Thịt Hữu Cơ Là Gì?'),
	(18, 'Gia cầm phải được quản lý hữu cơ từ ngày thứ hai của cuộc sống.', 'Những Nguồn Gia Cầm Nào Được Chấp Nhận Đối Với Các Sản Phẩm Gia Cầm Hữu Cơ?'),
	(19, 'Đúng. Các hoạt động chăn nuôi có thể chuyển đổi động vật với đất mà chúng được chăn nuôi.', 'Có Thể Chuyển Đổi Động Vật Sang Sản Xuất Hữu Cơ Cùng Lúc Với Đất Không?'),
	(20, 'Được chứng nhận hữu cơ có nghĩa là thực phẩm đã được trồng và xử lý theo Tiêu chuẩn của Chương trình Hữu cơ Quốc gia và được kiểm tra bởi các tổ chức nhà nước hoặc tư nhân độc lập. Việc kiểm tra định kỳ không báo trước cũng được tiến hành. Chứng nhận bao gồm kiểm tra hàng năm tất cả các ruộng và cơ sở của trang trại, hồ sơ hoạt động của trang trại, cộng với việc kiểm tra định kỳ đất, nước và sản phẩm để đảm bảo rằng người trồng và chế biến đáp ứng các Tiêu chuẩn Hữu cơ Quốc gia.', '\'Được Chứng Nhận Hữu Cơ\' Có Nghĩa Là Gì?'),
	(21, 'Bạn có thể truy cập trang web www.tnocd.org.', 'Làm Cách Nào Để Liên Hệ Với Người Chứng Nhận Hữu Cơ?'),
	(22, 'Mỗi tổ chức chứng nhận được yêu cầu thiết lập và công bố biểu phí được áp dụng công bằng cho tất cả các ứng viên. Lệ phí khác nhau đáng kể giữa các cơ quan và tùy thuộc vào quy mô và loại hình hoạt động hữu cơ để được chứng nhận. Một số sở nông nghiệp của tiểu bang đang cung cấp một khoản hoàn trả đáng kể theo chương trình chia sẻ chi phí liên bang.', 'Chi Phí Chứng Nhận Là Bao Nhiêu?'),
	(23, 'Tất cả các tiểu bang của Hoa Kỳ và các tổ chức chứng nhận được USDA công nhận đều chấp nhận các chứng nhận do các chương trình chứng nhận được USDA công nhận hoặc được công nhận. Các chính phủ nước ngoài và các tổ chức chứng nhận quốc tế có các tiêu chuẩn hữu cơ tương tự nhưng có thể yêu cầu chứng nhận bổ sung để xác nhận các nhà kinh doanh xuất khẩu sản phẩm hữu cơ đáp ứng các tiêu chuẩn của họ. Một số nhà chứng nhận của Hoa Kỳ cung cấp dịch vụ bổ sung này.', 'Chứng Nhận Hữu Cơ Có Tự Động Được Công Nhận Ở Các Bang Khác Không?'),
	(24, 'Người điều hành thu thập và đọc các Tiêu chuẩn Hữu cơ Quốc gia, đồng thời tiến hành tự đánh giá để xem liệu hoạt động có đáp ứng các yêu cầu này về lịch sử đất đai, thực tiễn sản xuất, vật liệu được sử dụng và thủ tục lưu trữ hồ sơ hay không. Trong nhiều trường hợp, một số thông lệ và hệ thống cần được sửa đổi để tuân thủ. Sau khi một hoạt động tuân thủ, nhà điều hành sau đó sẽ chọn một người chứng nhận được công nhận, nộp đơn đăng ký, được kiểm tra, đáp ứng bất kỳ điều kiện nào được xác định bởi người chứng nhận và nhận được chứng chỉ.', 'Làm Thế Nào Để Một Trang Trại Được Chứng Nhận?'),
	(25, 'Bất kỳ hoạt động nào cố ý bán hoặc dán nhãn một sản phẩm nông nghiệp là “hữu cơ”, không tuân theo Đạo luật Sản xuất Thực phẩm Hữu cơ và Tiêu chuẩn Hữu cơ Quốc gia có thể bị phạt dân sự không quá 10.000 đô la cho mỗi vi phạm và bị trừng phạt hình sự dựa trên vi phạm Luật liên bang quản lý gian lận và khai báo sai.', 'Các Hình Phạt Đối Với Việc Sử Dụng Sai Thuật Ngữ “Hữu Cơ” Là Gì?'),
	(26, 'Quy tắc NOP yêu cầu hạt giống được sản xuất và xử lý hữu cơ phải được gieo trồng khi hạt giống đó được bán trên thị trường. Cây cấy hàng năm phải luôn được trồng theo phương pháp hữu cơ trừ khi Bộ trưởng Nông nghiệp ứng phó với thiên tai hoặc sự gián đoạn lớn khác đưa ra một phương sai tạm thời. Tất cả hạt giống được sử dụng trong sản xuất hữu cơ phải được xử lý chưa qua xử lý hoặc chỉ được xử lý bằng các chất (chẳng hạn như các sản phẩm vi sinh vật) nằm trong Danh sách Quốc gia. Nông dân được yêu cầu sử dụng hạt giống hữu cơ được chứng nhận khi nó được bán trên thị trường. Tính khả dụng trên thị trường dựa trên khả năng thu được hạt giống ở hình thức, chất lượng hoặc số lượng thích hợp, đã được đại lý chứng nhận xem xét.', 'Nông Dân Trồng Trọt Có Phải Sử Dụng Hạt Giống Hữu Cơ Không? ”');

-- Dumping structure for table greeny_shop.favorites
CREATE TABLE IF NOT EXISTS `favorites` (
  `favorite_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  UNIQUE KEY `uq_user_product` (`user_id`,`product_id`),
  KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`),
  CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.favorites: ~2 rows (approximately)
INSERT INTO `favorites` (`favorite_id`, `product_id`, `user_id`) VALUES
	(104, 10, 20),
	(108, 34, 23),
	(117, 10, 25);

-- Dumping structure for table greeny_shop.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_image` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FKeyv4f7vvbo4l5llbkgdbngxnf` (`category_id`),
  CONSTRAINT `FKeyv4f7vvbo4l5llbkgdbngxnf` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.menu: ~8 rows (approximately)
INSERT INTO `menu` (`menu_id`, `menu_image`, `menu_name`, `category_id`) VALUES
	(1, 'http://canhokhachsan.vn/wp-content/uploads/2016/03/icon-home.png', 'HomePage', NULL),
	(4, 'https://benhvienk.vn/data/media/1601/images/rau-thuoc-ho-cai-giup-cai-thien-tieu-duong-giam-nguy-co-mac-benh-tim-dot-quy-va-ung-thu-1.jpg', 'Rau', NULL),
	(5, 'https://exson.com.vn/wp-content/uploads/2019/01/n%E1%BB%81n-13.jpg', 'Trái Cây', NULL),
	(6, 'https://cdn.tgdd.vn/Files/2020/11/23/1308734/cam-nang-phan-biet-tat-tan-tat-cac-loai-cu-ngoai-cho-cho-co-nang-vung-ve-202011231615385705.jpg', 'Củ quả', NULL),
	(7, 'http://kingsdown.com.vn/wp-content/themes/FEFV/images/FEFV-contact-icon-03.jpg', 'Liên Hệ', NULL),
	(8, 'https://tkn.vn/wp-content/uploads/2021/11/chinh-sach-bao-mat-thong-tin.jpg', 'Information', NULL),
	(15, 'https://media.istockphoto.com/vectors/receipt-order-list-bill-icon-vector-id928418966', 'Lịch Sử Mua Hàng', NULL),
	(16, 'https://media.istockphoto.com/illustrations/logout-icon-elegant-soft-green-round-button-illustration-id800423714?k=20&m=800423714&s=170667a&w=0&h=S0-FFnL32TcXDexuvn8tfN9OB6hEHVKC003KBHY9mp4=', 'Log Out', NULL);

-- Dumping structure for table greeny_shop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.orders: ~34 rows (approximately)
INSERT INTO `orders` (`order_id`, `address`, `amount`, `order_date`, `phone`, `status`, `user_id`, `content`) VALUES
	(52, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 10000, '2025-05-25', '0123456789', 2, 19, 'Giao gấp nhé'),
	(53, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 258000, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(71, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 623000, '2025-05-25', '0123456789', 3, 20, 'Giao gấp nhé'),
	(72, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 129500, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(73, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 371000, '2025-05-25', '0123456789', 2, 20, 'Giao gấp nhé'),
	(74, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 880000, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(75, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 22540, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(76, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 528000, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(77, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 133000, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(79, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 30000, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(80, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 30000, '2025-05-25', '0123456789', 2, 20, 'Giao gấp nhé'),
	(81, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 19000, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(82, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 83250, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(83, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 233331, '2025-05-25', '0123456789', 0, 20, 'Giao gấp nhé'),
	(84, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 63000, '2025-05-25', '0123456789', 3, 20, 'Giao gấp nhé'),
	(85, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 77777, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(86, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 38800, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(87, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 33333, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(88, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 155554, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(89, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 22222, '2025-05-25', '0123456789', 1, 19, 'Giao gấp nhé'),
	(90, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 22222, '2025-05-25', '0123456789', 0, 19, 'Giao gấp nhé'),
	(91, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 77777, '2025-05-25', '0123456789', 1, 19, 'Giao gấp nhé'),
	(92, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 11111, '2025-05-25', '0123456789', 0, 21, 'Giao gấp nhé'),
	(93, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 21111, '2025-05-25', '0123456789', 0, 21, 'Giao gấp nhé'),
	(94, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 21111, '2025-05-25', '0123456789', 0, 21, 'Giao gấp nhé'),
	(95, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 110000, '2025-05-25', '0123456789', 2, 19, 'Giao gấp nhé'),
	(96, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 55000, '2025-05-25', '1234567890', 2, 19, 'Giao gấp nhé'),
	(97, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 46500, '2025-05-25', '1234567890', 2, 19, 'Giao gấp nhé'),
	(98, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 46500, '2025-05-25', '1234567890', 2, 19, 'Giao gấp nhé'),
	(99, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 60000, '2025-05-25', '1234567890', 2, 19, 'Giao gấp nhé'),
	(100, 'Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 417555.45, '2025-05-25', '0979727604', 2, 23, 'Giao gấp nhé'),
	(101, 'Thôn 4', 30000, '2025-05-25', '0979727604', 0, 23, 'Giao gấp nhé'),
	(102, 'Đà Nẵng', 63250, '2025-05-31', '0979727600', 2, 24, 'Giao gấp nhé'),
	(103, 'Thôn 4', 69750, '2025-05-31', '0979727604', 0, 24, 'Giao gấp nhé'),
	(104, 'Thôn 4, Quảng Công, Quảng Điền, Thừa Thiên Huế', 100750, '2025-08-07', '0979727604', 0, 22, 'Giao gấp giúp em nhé'),
	(105, 'Thôn 4', 189000, '2025-08-07', '0979727604', 0, 22, 'Giao gấp nhé'),
	(106, 'Thôn 4', 76500, '2025-08-07', '0979727604', 0, 22, 'Giao gấp nhé'),
	(107, 'Thôn 4', 23250, '2025-08-07', '0979727604', 0, 25, 'Giao gấp nhé');

-- Dumping structure for table greeny_shop.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pricedetail` double DEFAULT NULL,
  `quantitydetail` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.order_details: ~46 rows (approximately)
INSERT INTO `order_details` (`order_detail_id`, `pricedetail`, `quantitydetail`, `order_id`, `product_id`) VALUES
	(90, 10000, 1, 52, 22),
	(91, 70000, 1, 53, 33),
	(92, 200000, 1, 53, 35),
	(93, 20000, 1, 53, 36),
	(115, 200000, 3, 71, 35),
	(116, 20000, 5, 71, 36),
	(117, 130000, 1, 72, 34),
	(118, 20000, 1, 72, 36),
	(119, 200000, 2, 73, 35),
	(120, 20000, 1, 73, 36),
	(121, 200000, 5, 74, 35),
	(122, 23000, 1, 75, 28),
	(123, 200000, 3, 76, 35),
	(124, 20000, 7, 77, 36),
	(125, 30000, 1, 79, 11),
	(126, 30000, 1, 80, 11),
	(127, 20000, 1, 81, 36),
	(128, 25000, 1, 82, 10),
	(129, 30000, 2, 82, 11),
	(130, 77777, 3, 83, 47),
	(131, 70000, 1, 84, 33),
	(132, 77777, 1, 85, 47),
	(133, 10000, 4, 86, 29),
	(134, 11111, 3, 87, 51),
	(135, 77777, 2, 88, 47),
	(136, 11111, 2, 89, 51),
	(137, 11111, 2, 90, 51),
	(138, 77777, 1, 91, 47),
	(139, 11111, 1, 92, 51),
	(140, 11111, 1, 93, 51),
	(141, 10000, 1, 93, 22),
	(142, 11111, 1, 94, 51),
	(143, 10000, 1, 94, 22),
	(144, 30000, 2, 95, 11),
	(145, 25000, 2, 95, 12),
	(146, 30000, 1, 96, 11),
	(147, 25000, 1, 96, 12),
	(148, 25000, 2, 97, 10),
	(149, 25000, 2, 98, 10),
	(150, 30000, 2, 99, 11),
	(151, 130000, 3, 100, 34),
	(153, 30000, 1, 101, 11),
	(154, 10000, 1, 102, 22),
	(155, 25000, 1, 102, 10),
	(156, 30000, 1, 102, 11),
	(157, 25000, 3, 103, 10),
	(158, 25000, 2, 104, 10),
	(159, 30000, 1, 104, 11),
	(160, 25000, 1, 104, 13),
	(161, 130000, 1, 105, 34),
	(162, 30000, 2, 105, 11),
	(163, 25000, 1, 105, 12),
	(164, 25000, 2, 106, 10),
	(165, 30000, 1, 106, 11),
	(166, 25000, 1, 107, 10);

-- Dumping structure for table greeny_shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `entered_date` date DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `favorite` bit(1) NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.products: ~28 rows (approximately)
INSERT INTO `products` (`product_id`, `description`, `discount`, `entered_date`, `price`, `product_image`, `product_name`, `quantity`, `status`, `category_id`, `favorite`, `qr_code`) VALUES
	(10, 'Dưa leo (hay còn gọi là dưa chuột) được trồng rộng rãi ở nhiều nước khác nhau, có thể được sử dụng với nhiều mục đích khác nhau nhưng dù ở dạng nào dưa leo vẫn giữ nguyên được những giá trị dinh dưỡng của mình. Dưa leo baby với hình dạng giống hệt trái dưa leo thông thường với vỏ xanh lá cây sọc trắng, nhưng chiều dài lại chỉ từ 3 - 5cm và vị thì ngọt và mát hơn dưa leo thông thường.', 7, '2025-05-10', 25000, '03.jpg', 'Dưa leo ', 93, 0, 6, b'1', '10.png'),
	(11, 'Hay còn được gọi là cà dái dê, đây là một loại rau củ chế biến được thành rất nhiều món ăn thơm ngon như: hấp, xào, nướng, ăn sống,... mỗi dạng đều mang lại hương vị rất ngon. Trong cà tím Nhật chứa hàm lượng chất xơ vô cùng cao và giàu sắt rất tốt cho cơ thể.\r\nCà tím Nhật là giống cà tím (có tên gọi khác là cà dái dê) có nguồn gốc từ Nhật Bản, có họ hàng với cà chua, khoai tây, cà pháo. Loại củ, quả này sử dụng trong chế biến dưới dạng thức ăn hầm, xào, nướng. Cà tím Nhật có phần vỏ ngoài màu tím đen, bắt mắt, không những vậy chứa hàm lượng chất xơ vô cùng cao và giàu sắt, giúp giảm nguy cơ mắc các bệnh ung thư như ung thư ruột kết, trực tràng, tim mạch, chữa chứng hay quên,... Đây được xem là "thần dược" của người Nhật.', 0, '2025-05-10', 30000, '04.jpg', 'Cà tím', 34, 0, 6, b'0', '11.png'),
	(12, 'Đậu bắp là một loại rau quả rất tốt cho sức khỏe đặc biệt cho hệ xương khớp nhưng có giá rất rẻ. Một kg đậu bắp tươi hiện nay có giá chỉ từ 25.000 – 30.000 đồng và đậu bắp sấy khô giá cũng chỉ có 120.000 đồng/1kg mà thôi.', 0, '2025-05-10', 25000, '05.jpg', 'Đậu bắp', 27, 0, 6, b'0', '12.png'),
	(13, 'Là loại rau củ rất tốt cho sức khoẻ của người sử dụng, loại rau củ này không những giúp bổ sung chất dinh dưỡng cần thiết cho cơ thể mà chúng có giúp làm đẹp da cho phái nữ. Cà chua có thể ăn sống hoặc chế biến các món ăn cũng rất ngon.\r\nCà chua được xem là một loại thực phẩm thiết yếu bởi chúng rất quen thuộc để tạo ra nhiều món ăn ngon hàng ngày cho gia đình. Đây cũng được xem là một loại củ rất bổ dưỡng và lành mạnh, có tác dụng tăng cường sức đề kháng của cơ thể, ngăn ngừa và điều trị bệnh suy nhược, chống chống nhiễm trùng. Không những thế, cà chua còn chứa hàm lượng vitamin A cao, mang đến nhiều lợi ích cho sức khoẻ. \r\nCà chua còn giúp làm trắng sáng da ở phụ nữ bằng nhiều cách như nước ép cà chua, mặt nạ cà chua,...', 3, '2025-05-10', 25000, '06.jpg', 'Cà chua', 58, 0, 6, b'0', '13.png'),
	(14, 'Do có tính mát, thơm, ngọt dịu, nhiều chất xơ khi được nấu nên thường dùng để chế biến thành canh với tôm thịt hoặc xào để tăng độ ngon.\r\nCải ngọt là một trong những loại rau cải được sử dụng phổ biến trong các bữa ăn của người Việt Nam. Cải ngọt có thân tròn, phần lá có dạng tròn hoặc tù, màu xanh mướt. Cải ngọt có vị ngọt thanh, khi già thì có vị cay và nồng, rất phù hợp trong việc chế biến nhiều món ăn khác nhau. Ngoài ra cải ngọt còn mang đến nhiều lợi ích cho sức khỏe như phòng ngừa ung thư, hỗ trợ trị bệnh gout, trĩ, xơ gan, tăng sức đề kháng và thanh lọc cơ thể. ', 0, '2025-05-10', 40000, '09.jpg', 'Cải ngọt', 50, 0, 4, b'0', '14.png'),
	(15, 'Còn gọi là bí đỏ hạt đậu, đây là giống bí có ruột rất đặc, ít hả ăn dẻo và ngọt. Bí hồ lô chứa nhiều chất dinh dưỡng và mang lại nhiều lợi ích cho sức khoẻ. Bí hồ lô có thể chế biến thành nhiều món ăn ngon như: sữa bí, canh bí, súp bí,... món nào cũng đều thơm ngon.\r\nBí đỏ là loại củ chứa lượng calo tương đối thấp, do 94% bí đỏ là nước. Bí đỏ cũng chứa nhiều beta-caroten, một loại carotenoid mà cơ thể tổng hợp thành vitamin A. Hơn thế nữa, hạt bí đỏ cũng có thể được sử dụng bởi chúng chứa nhiều chất dinh dưỡng và mang lại nhiều lợi ích cho sức khoẻ.\r\nBí đỏ hồ lô cùng họ nhà bí đỏ nhưng có hình dạng giống như hồ lô. Về mặt dinh dưỡng, bí đỏ hay bí đỏ hồ lô đều giống nhau. Bí đỏ hồ lô sẽ tăng thêm một sự lựa chọn cho những người nội trợ với nhu cầu trang trí món ăn thêm phần bắt mắt. ', 0, '2025-05-10', 10000, '12.jpg', 'Bí đỏ', 40, 0, 6, b'0', '15.png'),
	(16, 'Chín đỏ đẹp mắt vô cùng hấp dẫn, bao bì sang trọng, kin đáo và an toàn. Dâu tây hộp 500g chứa nhiều loại đường, protein, axít hữu cơ, pectic và giàu vitamin, chất khoáng cũng như nguyên tố vi lượng giúp tăng cường hệ miễn dịch, bảo vệ mắt, chống ung thư, ngăn ngừa vết nhăn,...và nhiều lợi ích khác\r\nDâu tây hay còn gọi là dâu đất, được trồng lấy trái cây ở vùng ôn đới. Với mùi thơm hấp dẫn cùng vị dâu ngọt lẫn chua nên dâu tây được ưa chuộng. Loại trái cây nội địa này có giá trị dinh dưỡng cao, được coi là “nữ hoàng của các loài trái cây”. Dâu tây chứa nhiều loại đường, protein, axít hữu cơ, pectic và giàu vitamin, chất khoáng cũng như nguyên tố vi lượng giúp tăng cường hệ miễn dịch, bảo vệ mắt, chống ung thư, ngăn ngừa vết nhăn,...', 5, '2025-05-10', 120000, '13.jpg', 'Dâu tây', 90, 0, 5, b'0', '10.png'),
	(17, 'Loại trái cây phổ biến được ưa chuộng giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, tim mạch, giúp mắt sáng, làm đẹp da. Xoài keo có quả chắc giòn giòn chua ngọt thơm ngon được nhiều người ưa thích\r\nNhư bạn đã biết thì xoài là một loại trái cây nhiệt đới phổ biến ở nước ta, được nhiều người dùng ưa chuộng. Loại trái cây này cực kỳ giàu chất xơ, vitamin, khoáng chất thiết yếu không chỉ giúp cung cấp chất dinh dưỡng cho cơ thể con người mà còn mang lại nhiều lợi ích tuyệt vời cho sức khỏe. Ăn xoài thường xuyên sẽ giúp hệ tiêu hóa, tim mạch của bạn hoạt động tốt hơn, giúp sáng mắt, làm đẹp da hiệu quả. Xoài còn được biết là loại trái cây tốt cho những người mắc bệnh tiểu đường. Nhờ vị chua và giòn mà xoài keo được xem như là lựa chọn đầu tiên khi làm gỏi, xoài lắc hay ăn sống cùng mắm ruốc, muối tôm cực kỳ ngon.', 0, '2025-05-10', 22000, '14.jpg', 'Xoài keo', 60, 0, 5, b'0', '10.png'),
	(18, 'Cam sành có nguồn gốc từ Việt Nam, được trồng nhiều ở các tỉnh miền Nam và một số tỉnh phía Bắc: Hà Giang, Tuyên Quang, Yên Bái. Cam sành có vỏ dày, sần sùi màu xanh, khi chín có sắc cam, các múi thịt có màu cam. Cam sành rất mọng nước, có vị chua thanh nên thường vắt lấy nước pha chế thành nước giải khát chứ không ăn tươi như những loại cam khác.', 3, '2025-05-10', 35000, '16.jpg', 'Cam', 98, 0, 5, b'0', '10.png'),
	(19, 'Từ vùng trồng nho nổi tiếng cả nước. Nho xanh quả to, tươi ngon, màu sắc đẹp, chứa nhiều vitamin và chất dinh dưỡng có thể ăn trực tiếp hoặc pha chế các loại đồ uống đều ngon. Sản phẩm cam kết bán đúng khối lượng, chất lượng và an toàn tuyệt đối. Bao bì kín đáo, sạch sẽ và hợp vệ ...\r\nNho xanh là loại trái cây nội địa của Việt Nam. Sản phẩm có thịt quả dày và trong, vị ngọt dịu không gắt, chua nhẹ rất hấp dẫn nên được đông đảo người tiêu dùng yêu thích và lựa chọn sử dụng. Nho rất giàu chất dinh dưỡng, lại có rất nhiều lợi ích đối với sức khỏe con người. Chúng ta có thể ăn nho trực tiếp nhưng cũng có thể làm nước ép nho để uống hay chế biến nhiều cách khác nhau.', 5, '2025-05-10', 170000, '17.jpg', 'Nho xanh', 60, 0, 5, b'0', '10.png'),
	(20, 'Chuối chuyển màu từ xanh đậm sang vàng khi chín, phần thịt trắng ngà hoặc vàng, mềm, nhiều tinh bột khi chin. Chuối vàng là khi chuối chín. Khi chín chuối sẽ có hương vị rất ngon, ăn mềm , dẻo và ngọt, giàu chất xơ, vitamin C, vitamin B6. Chất béo bão hòa, cholesterol và natri trong chuối thấp. Bên cạnh đó, vỏ chuối còn có nhiều công dụng làm đẹp được nhiều chị em phụ nữ áp dụng. Ngoài ra, chuối còn có rất nhiều lợi ích khác.', 4, '2025-05-10', 25000, '18.jpg', 'Chuối', 79, 0, 5, b'0', '10.png'),
	(22, 'Bông cải trắng có phần bông màu trắng gắn khít vào nhau, xốp và hơi dai mềm, bên ngoài có lớp lá bao bọc xung quanh, phiến lá cứng và dày. \r\n Một cup bông cải có 3g chất xơ, chiếm 10% nhu cầu hằng ngày . Chất xơ giúp nuôi các vi khuẩn khỏe mạnh trong ruột, giúp giảm viêm và tăng cường sức khỏe tiêu hóa.\r\n Chất chống oxy hóa trong bông cải bảo vệ các tế bào của bạn khỏi các gốc tự do có hại gây viêm.\r\n Chất Choline trong súp lơ trắng giúp duy trì màng tế bào, tổng hợp ADN và hỗ trợ trao đổi chất, ngăn ngừa cholesterol tích tụ trong gan.\r\n Có thể được sử dụng để thay thế các loại ngũ cốc và đậu trong chế độ ăn giảm cân.', 0, '2025-05-10', 10000, 'suplotrang.jpg', 'Súp lơ trắng', 27, 1, 4, b'0', '10.png'),
	(23, 'Xà lách xoắn (hay Xà lách lolo xanh) có vị ngọt đắng, tính mát và thơm nhẹ, kết cấu lá giòn. Là loại rau chứa nhiều vitamin, khoáng chất, rất tốt cho sức khỏe, được nhiều chị em lựa chọn trong thực đơn bữa ăn gia đình. Có tác dụng giải nhiệt, lọc máu, kích thích tiêu hóa, giảm đau, trị bệnh mất ngủ, chống ho. Loại rau xà lách lolo này thích hợp ăn sống và làm các món salad trộn: xà lách trộn dầu giấm, trộn thịt bò, trứng,.', 2, '2025-05-10', 10000, 'rauxalach.jpg', 'Rau xà lách', 100, 0, 4, b'0', '10.png'),
	(24, 'Hành lá hay gọi là hành hoa, hành hương, hành ta. Hành lá có mùi thơm, vị ngọt và cay the nhè nhẹ khi ăn sống, do đó chúng hay được sử dụng với vai trò là gia vị cho các món ăn. Ngoài ra, hành lá cũng xuất hiện trong một số bài thuốc đông y nhằm phòng hoặc chữa một vài căn bệnh nào như: giải quyết dứt điểm triệu chứng cảm sốt, nhức đầu, ăn uống không tiêu, ngăn ngừa tiểu đường, tốt cho mắt, nâng cao hoạt động hệ tim mạch,...', 0, '2025-05-10', 10000, 'hanhla.jpg', 'Hành lá', 500, 0, 4, b'0', '10.png'),
	(25, 'Rau dền là một trong những loại rau chứa nhiều khoáng chất và vitamin nhất, trong 100g rau dền có chứa 0.32mg vitamin B2, 80mg vitamin C, 267mg canxi, 1.3g chất xơ, 3.9mg chất sắt, 3.5g protein, 411 mg kali và 2.6g khoáng chất.\r\n Rau dền là một loại rau xanh có 3 loại phổ biến: Rau đền đỏ, rau dền gai, rau dền cơm. Được các bà nội trợ bổ sung trong thực đơn mỗi ngày. Ngoài vị ngọt mát và thành phần dinh dưỡng cao, rau dền xanh còn được xem là một vị thuốc dân gian chữa được nhiều bệnh với lợi ích như: Chống táo bón, điều trị tăng huyết áp, tốt cho bệnh nhân tiểu đường, ngừa ung thư...', 0, '2025-05-10', 15000, 'rauden.jpg', 'Rau dền', 200, 0, 4, b'0', '10.png'),
	(26, 'Ngò rí không chỉ là một loại rau giúp tạo ra hương vị thơm ngon hấp dẫn cho món ăn mà còn có nhiều công dụng tuyệt vời cho sức khỏe. Thường xuyên ăn thực phẩm này giúp bảo vệ tim mạch, hạ huyết áp, làm giảm đường huyết, giúp xương khớp chắc khỏe.Dưới đây là những công dụng của ngò rí mà ắt hẳn khi nghe tới nhiều người sẽ vô cùng ngạc nhiên.\r\n Giảm cholesterol, bảo vệ tim mạch, hạ huyết áp, ngăn ngừa ung thư, ngăn ngừa thiếu máu và giảm nguy cơ dị tật ống thần kinh cho thai nhi, giúp hạ đường huyết, chống viêm, ngăn ngừa bệnh viêm khớp dạng thấp, bảo vệ thần kinh và não bộ, tăng cường trí nhớ, giảm lo âu, căng thẳng, tăng khả năng miễn dịch, tốt cho người bị sỏi thận, nhiễm trùng đường tiết niệu,...', 0, '2025-05-10', 3500, 'raungori.jpg', 'Rau ngò rí', 500, 0, 4, b'0', '10.png'),
	(27, 'Rau má là loại rau mang đến nhiều công dụng cho sức khỏe của gia đình bạn như: giải độc gan, điều trị táo bón, bệnh tim mạch, làm đẹp da và tăng cường sức đề kháng cho sức khỏe,… rau má có thể dùng làm sinh tố uống giải nhiệt mùa hè, đồng thời cũng dùng để chế biến thành nhiều món ăn ngon hấp dẫn. Ngoài ra, rau má còn có các công dụng sau:\r\n Cải thiện hệ thống miễn dịch, chất lượng giấc ngủ\r\n Phục hồi tóc dễ gãy rụng, làm đẹp da (rau má để làm mặt nạ trị mụn)\r\n Giúp tăng cường chức năng nhận thức.\r\n Giảm đáng kể nguy cơ mắc các bệnh như Alzheimer và chứng mất trí,...', 1, '2025-05-10', 3000, 'rauma.jpg', 'Rau má', 2000, 0, 4, b'0', '10.png'),
	(28, 'Bên cạnh những tác dụng giảm viêm và chống oxy hóa, một số hợp chất trong bông cải xanh có thể giúp giảm tổn thương mãn tính của một số mô trong cơ thể. Ngoài giàu dưỡng chất và vitamin, bông cải xanh là loại rau xanh được nghiên cứu cho thấy tác dụng giảm nguy cơ ung thư ở một số cơ quan như ung thư vú, tuyến tiền liệt, dạ dày, thận, bàng quang.', 2, '2025-05-10', 23000, 'suploxanh.jpg', 'Súp lơ xanh', 500, 1, 4, b'0', '10.png'),
	(29, 'Đã quá quen thuộc với mỗi chúng ta. Loại củ này được xuất hiện thường xuyên trên mâm cơm này có rất nhiều công dụng hữu ích. Nó không chỉ tốt cho sức khỏe, làm đẹp hiệu quả mà còn có rất nhiều tác dụng bổ ích khác. Khoai tây có thể chế biến thành canh, súp, hoặc chiên đều rất ngon.\r\n Khoai tây thuộc họ cà, là một loại củ đa năng có hàm lượng chất dinh dưỡng cao, vì vậy nhiều hộ gia đình tại Việt Nam đã lựa chọn khoai tây như một món ăn chính trong các bữa ăn hàng ngày. Sở hữu nguồn vitamin và khoáng chất phong phú, khoai tây mang lại nhiều lợi ích cho sức khỏe như kháng viêm, giảm đau, tăng cường hệ miễn dịch, kích thích tiêu hóa,...', 3, '2025-05-10', 10000, 'khoaitay.png', 'Khoai tây', 500, 0, 6, b'0', '10.png'),
	(30, 'Giống như hầu hết các loại trái cây và rau quả có màu cam / đỏ, gấc chứa hàm lượng cao beta-carotene và lycopene. Và hầu hết các lợi ích sức khỏe đã được khẳng định của quả gấc đều bắt nguồn từ hàm lượng beta-carotene và lycopene cao này. Trên thực tế, mỗi gam gấc có nhiều beta - carotene hơn cà rốt hoặc khoai lang (vốn đã có hàm lượng khá cao).\r\n Phần cùi gấc thường được trộn với gạo nếp để tạo thành món ăn Việt Nam gọi là xôi gấc, nghe qua có vẻ giống như một loại gạo vàng tự nhiên có thể giúp ngăn ngừa sự thiếu hụt vitamin A (beta-caroten được chuyển hóa thành vitamin A trong cơ thể). Gấc cũng chứa nhiều lycopene, một loại carotenoid thường được tìm thấy trong cà chua có liên quan đến nhiều lợi ích sức khỏe bao gồm giảm nguy cơ đột quỵ.\r\n Và để làm cho quả gấc tốt cho sức khỏe hơn nữa, một nghiên cứu năm 2005 đã phát hiện ra rằng quả gấc có chứa một loại protein có tác dụng ức chế được sự phát triển của khối u ở chuột.', 5, '2025-05-10', 40000, 'quagat.jpg', 'Quả gất', 1000, 0, 6, b'0', '10.png'),
	(31, 'Vị ngọt thanh, hạt nhỏ, vỏ mỏng, là một trong những loại trái cây nhiệt đới đặc trưng của ngày hè, chôm chôm được nuôi trồng theo những tiêu chuẩn an  toàn và chất lượng. Có thể sử dụng là món tráng miệng sau mỗi bữa ăn hoặc làm trái cây dầm.\r\n Chôm chôm là một loại trái cây vùng nhiệt đới, được trồng nhiều ở vùng đồng bằng sông Cửu Long, đặc biệt là Bến Tre. Đây là loại quả quen thuộc trong đời sống, quả khi chín có vỏ màu đỏ tươi. Khi thưởng thức sẽ cảm nhận phần thịt mọng nước, vị ngọt thanh và độ giòn dai. \r\n Không những hấp dẫn về mùi vị, chôm chôm còn chứa nhiều chất dinh dưỡng như: vitamin C, đồng, mangan, kali, canxi, sắt, phospho, chất xơ,… Vì thế, đây là loại quả rất tốt cho sức khỏe, có khả năng làm đẹp đối với phụ nữ.', 6, '2025-05-10', 50000, 'quachomchom.jpg', 'Chôm chôm', 1000, 0, 5, b'0', '10.png'),
	(32, 'Là một trong những loại trái cây đặc sản của Việt Nam. Vú sữa bơ hồng căng mọng có vị ngọt hương thơm bơ sữa hấp dẫn, quyến rũ. Đặc biệt trong cú sữa có chứa các dưỡng chất như canxi, phốt pho, sắt và magiê rất tốt cho sức khỏe phụ nữa mang thai và thai nhi. Cam kết đúng khối lượng, chất lượng và an toàn.\r\n Vú sữa bơ hồng là một trong những loại trái cây cung cấp dinh dưỡng và sức khoẻ cho người tiêu dùng.Phần thịt có màu sữa trắng, vị ngọt thanh, thơm mùi bơ sữa, có các hạt dẹt màu nâu nhạt. Lợi ích từ vú sửa như sau:\r\n Trong 100gram thịt vú sữa cung cấp chứa 67 kcal, chứa nhiều loại vitamin A, B1, B2, B3, C… nhất là glucid, canxi, sắt, chất xơ, protein và lipid.\r\n Hấp thụ 100 – 200g vú sữa mỗi ngày sẽ giúp phòng ngừa hiện tượng thiếu máu, còi xương ở trẻ.\r\n Vú sữa còn chứa nhiều nước, hàm lượng chất xơ cao giúp cho người dùng có cảm giác no bụng, kiểm soát cân nặng hiệu quả\r\n Lượng calcium không những giúp xương chắc khỏe mà còn ngừa được lượng mỡ thừa trong cơ thể', 5, '2025-05-10', 70000, 'quavusua.jpg', 'Quả vú sữa', 1000, 0, 5, b'0', '10.png'),
	(33, 'Vải thiều là loại trái cây được nhiều người yêu thích, trái vải chín đỏ, mọng nước và thơm ngọt. Ngoài ăn trực tiếp thì vải còn chế biến thành nhiều món ngon như trà vải, vải sấy khô, siro vải, rau câu vải,.... Tuy nhiên mỗi ngày chỉ nên ăn 6-7 trái, nếu ăn nhiều quá có thể dẫn đến nóng trong người.\r\n Cứ đến khoảng tháng 6, tháng 7 là mùa rộ thu hoạch vải thiều ở các tỉnh phía Bắc. Những quả vải thiều chín đỏ, căng mọng và thơm ngọt là món trái cây ưa thích của nhiều gia đình trong mùa hè bởi giá thành không quá cao. Trái vải được lấy từ nhiều nơi khác nhau như vải thiều Thanh Hà, vải thiều Lục Ngạn. Dù vậy, chất lượng vẫn luôn được cam kết, đảm bảo an toàn và tươi ngon.', 10, '2025-05-10', 70000, 'vaithieu.jpg', 'Vải thiều', 1000, 1, 5, b'0', '10.png'),
	(34, 'Lựu được xem là một trong những loại trái cây nhiệt đới tốt nhất cho sức khỏe. Trong quả lựu chứa một loạt các hợp chất từ thực vật có lợi mà nhiều loại thực phẩm khác không thể so sánh được. Các nghiên cứu đã cho thấy rằng chúng có nhiều lợi ích và làm giảm nguy cơ mắc nhiều bệnh khác nhau. Với hương vị thơm ngon đặc trưng và giá trị dinh dưỡng đối với sức khỏe, lựu đang được rất nhiều chị em ưa chuộng. Trong quả lựu có chứa nhiều chất oxy hóa, vitamin C và nhiều dưỡng chất khác có tác dụng làm đẹp, tăng cường hệ miễn dịch và bảo vệ sức khỏe.', 20, '2025-05-10', 130000, 'qualuu.jpg', 'Quả lựu', 997, 1, 5, b'0', '34.png'),
	(35, 'Táo nữ hoàng Queen nhập khẩu 100% từ New Zealand (có giấy chứng nhận xuất xứ). Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. Quả tròn, vỏ mỏng có màu sắc đỏ thẫm đẹp mắt. Thịt táo vàng, lõi nhỏ, vị ngọt nhẹ và mùi thơm đậm\r\n Loại táo này được lai giữa giữa táo Gala và táo Splendour, táo nữ hoàng có dáng tròn, vỏ mỏng màu đỏ thẫm đẹp mắt, vị ngọt thanh và mùi thơm đậm đặc trưng, thịt táo chắc nhưng không quá cứng, được xem là loại trái cây rất thích hợp cho mọi người.\r\n Táo là nguồn cung cấp vitamin C tuyệt vời, có tác dụng tăng cường hệ thống miễn dịch. Mỗi quả táo chứa khoảng 8mg vitamin này, vì thế chúng sẽ cung cấp khoảng 14% nhu cầu vitamin C hàng ngày của cơ thể.\r\n Cũng giống như lê và việt quất, táo có mối liên hệ với việc giảm thiểu nguy cơ mắc bệnh tiểu đường type 2 nhờ chất chống oxy hóa Anthocyanins. Hơn nữa trong táo có chất Triterpenoids có khả năng chống lại các bệnh ung thư gan, ruột kết và ung thư vú.', 12, '2025-05-10', 200000, 'quatao.jpg', 'Quả táo', 988, 1, 5, b'0', '10.png'),
	(36, 'Chanh vàng Mỹ hay còn gọi là chanh tây, là loại hoa quả nhập khẩu từ Mỹ, có màu vàng, hình bầu dục, có vị chua nhẹ và mùi thơm rất đặc trưng. Chanh vàng vị chua dịu nhưng lại thơm hơn rất nhiều so với chanh ta. Do vậy, khi sử dụng chanh vàng làm nước uống, làm bánh sẽ ngon hơn rất nhiều, giảm được vị gắt, chát của chanh ta.\r\n Chanh vàng có chứa nhiều vitamin, đặc biệt là vitamin C - là chất chống oxy hóa mạnh, giúp ngăn ngừa ung thư và nhiều căn bệnh nguy hiểm khác. Ngoài ra, còn chứa nhiều chất khoáng như kali, magiê, natri, canxi, mangan và các hợp chất đặc biệt tốt cho gan, thận khác.', 5, '2025-05-10', 20000, 'quachanhvang.jpg', 'Chanh vàng', 994, 1, 6, b'0', '10.png'),
	(47, 'Chanh vàng Mỹ hay còn gọi là chanh tây, là loại hoa quả nhập khẩu từ Mỹ, có màu vàng, hình bầu dục, có vị chua nhẹ và mùi thơm rất đặc trưng. Chanh vàng vị chua dịu nhưng lại thơm hơn rất nhiều so với chanh ta. Do vậy, khi sử dụng chanh vàng làm nước uống, làm bánh sẽ ngon hơn rất nhiều, giảm được vị gắt, chát của chanh ta.\r\n Chanh vàng có chứa nhiều vitamin, đặc biệt là vitamin C - là chất chống oxy hóa mạnh, giúp ngăn ngừa ung thư và nhiều căn bệnh nguy hiểm khác. Ngoài ra, còn chứa nhiều chất khoáng như kali, magiê, natri, canxi, mangan và các hợp chất đặc biệt tốt cho gan, thận khác.', 0, '2025-05-10', 77777, '06.jpg', 'Cà  Tím', 77, 1, 4, b'0', '47.png'),
	(51, 'Chanh vàng Mỹ hay còn gọi là chanh tây, là loại hoa quả nhập khẩu từ Mỹ, có màu vàng, hình bầu dục, có vị chua nhẹ và mùi thơm rất đặc trưng. Chanh vàng vị chua dịu nhưng lại thơm hơn rất nhiều so với chanh ta. Do vậy, khi sử dụng chanh vàng làm nước uống, làm bánh sẽ ngon hơn rất nhiều, giảm được vị gắt, chát của chanh ta.\r\n Chanh vàng có chứa nhiều vitamin, đặc biệt là vitamin C - là chất chống oxy hóa mạnh, giúp ngăn ngừa ung thư và nhiều căn bệnh nguy hiểm khác. Ngoài ra, còn chứa nhiều chất khoáng như kali, magiê, natri, canxi, mangan và các hợp chất đặc biệt tốt cho gan, thận khác.', 0, '2025-05-10', 11111, 'h30.jpg', 'Chanh Vàng ', 10, 0, 4, b'0', '51.png');

-- Dumping structure for table greeny_shop.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.role: ~2 rows (approximately)
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'ROLE_ADMIN'),
	(2, 'ROLE_USER');

-- Dumping structure for table greeny_shop.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.user: ~7 rows (approximately)
INSERT INTO `user` (`user_id`, `avatar`, `email`, `name`, `password`, `register_date`, `status`) VALUES
	(17, 'user.png', 'admin@gmail.com', 'Admin', '$2a$10$hl94pxbqsH7h.fi8h1ECDuY8s3yUHBp/xLuzwtR01PwWF3LqH2Tda', '2025-03-28', b'1'),
	(19, 'user.png', 'vietlt.23it@vku.udn.vn', 'Lê Trung Việt', '$2a$10$hl94pxbqsH7h.fi8h1ECDuY8s3yUHBp/xLuzwtR01PwWF3LqH2Tda', '2025-04-30', b'1'),
	(20, 'user.png', 'nhanplusa7@gmail.com', 'Nhân', '$2a$10$hl94pxbqsH7h.fi8h1ECDuY8s3yUHBp/xLuzwtR01PwWF3LqH2Tda', '2025-04-30', b'1'),
	(21, 'user.png', 'hhlong286@gmail.com', 'Long', '$2a$10$hl94pxbqsH7h.fi8h1ECDuY8s3yUHBp/xLuzwtR01PwWF3LqH2Tda', '2025-04-30', b'1'),
	(22, 'user.png', 'dinhd1.23it@vku.udn.vn', 'Đính Dương', '$2a$10$NiBgS.Gu63ywlgyianETxuX5uzqBkp0SoQsSwyJWAGqKDsYdYljz.', '2025-04-30', b'1'),
	(23, 'user.png', 'dinhd2.23it@vku.udn.vn', 'Đính Dương', '$2a$10$d/itygRZh1O2p3zNVmNY2uzcR8fgXcZS/ba2w4kOTKpNytQyssdz.', '2025-04-30', b'1'),
	(24, 'user.png', 'longthanhnct1@gmail.com', 'Lý Thành Long', '$2a$10$jOGAQlEuMEQjf9fVKSRrbunWPzYQ1MOZbGAxu3251jBglKTeSJFN.', '2025-05-31', b'1'),
	(25, 'user.png', 'dinhd.23it@vku.udn.vn', 'Dương Đính', '$2a$10$QFY7n/0T79zum3HyEdZAauAyLtnfCRszWRk7l8LRfQax.tbp4elaO', '2025-08-07', b'1');

-- Dumping structure for table greeny_shop.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table greeny_shop.users_roles: ~7 rows (approximately)
INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
	(17, 1),
	(19, 2),
	(20, 2),
	(21, 2),
	(22, 2),
	(23, 2),
	(24, 2),
	(25, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
