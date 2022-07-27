/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : skg_shoes

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 18/07/2022 13:25:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Lifestyle', '1');
INSERT INTO `categories` VALUES (2, 'Running', '1');
INSERT INTO `categories` VALUES (3, 'Basketball', '1');
INSERT INTO `categories` VALUES (4, 'Football', '1');
INSERT INTO `categories` VALUES (5, 'Training & Gym', '1');
INSERT INTO `categories` VALUES (6, 'Jordan', '1');
INSERT INTO `categories` VALUES (7, 'Skateboarding', '1');
INSERT INTO `categories` VALUES (8, 'Golf', '1');
INSERT INTO `categories` VALUES (9, 'Tennis', '1');
INSERT INTO `categories` VALUES (10, 'Athletics', '1');
INSERT INTO `categories` VALUES (11, 'Walking', '1');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_detail_order`(`id_order`) USING BTREE,
  INDEX `fk_order_detail_product`(`id_product`) USING BTREE,
  CONSTRAINT `fk_order_detail_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_detail_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `total_money` decimal(10, 2) NULL DEFAULT NULL,
  `total_quantity` int(11) NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `status` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`id_user`) USING BTREE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `describe` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `is_male` int(11) NULL DEFAULT NULL,
  `id_category` int(11) NOT NULL,
  `slug` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`id_category`) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (24, 'Giày Converse Run Star Hike Low Top 168817V', 1, 'Màu sắc: White\nSản phẩm được thiết kế \"remix\" từ Chuck và Runner khi 2 yếu tố thời trang.\nChất liệu canvas và đế Run Star zig-zag được thiết kế với dạng răng cưa to bản, giúp tăng độ bám tạo được...', 'https://salt.tikicdn.com/cache/280x280/ts/product/17/09/0e/b6bd1ad8561958e4957693b160275cde.jpg', 2200000.00, 1, 1, 'giay-converse-run-star-hike-low-top-168817v-p60194734');
INSERT INTO `products` VALUES (25, 'Giày Converse Chuck Taylor All Star CX - 170993C', 1, 'Chuck Taylor All Star đã trở lại và thúc đẩy mạnh mẽ hơn phòng trào mang giày thể thao trong hơn 100 năm. Đôi giày là sự kết hợp của công nghệ hiện đại và chất liệu sáng tạo tạo. Chuck Taylor All...', 'https://salt.tikicdn.com/cache/280x280/ts/product/9a/c5/a2/22eaca6216fbac5fa7ad243f9171143d.jpg', 1600000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-cx-170993c-p161968581');
INSERT INTO `products` VALUES (26, 'Mắt Kính Vans Women Overcast Aviator Sunglasses - VN0A5L6EH82', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/d8/3c/c6/12cf0761970a0a5ec73583db07d54166.jpg', 600000.00, 1, 1, 'mat-kinh-vans-women-overcast-aviator-sunglasses-vn0a5l6eh82-p165256811');
INSERT INTO `products` VALUES (27, 'Giày Sneaker Unisex Old Skool Vans - VN000D3HY28', 1, 'Kiểu dáng cổ điển\nGiày Sneaker Unisex Old Skool Vans VN000D3HY28 - Black/White là dòng giày được thiết kế đa dạng kiểu dáng bên thân giày. Kiểu dáng cổ điển, dễ vệ sinh, với đường may tỉ mỉ chắc chắn...', 'https://salt.tikicdn.com/cache/280x280/ts/product/26/87/70/d6fb5565e8dba1e3bc0b0e58a0a30ad0.jpg', 1750000.00, 1, 1, 'giay-sneaker-unisex-old-skool-vans-vn000d3hy28-p9809445');
INSERT INTO `products` VALUES (28, 'Giày Converse Run Star Motion - 171545C', 1, 'Run Star Motion, một phiên bản hình thể mới mà Converse khai thác cho thông điệp thiết kế Innovation bắt nguồn từ đôi Run Star Hike, Create Next Comfort là BST được phát triển và nâng cấp về chất...', 'https://salt.tikicdn.com/cache/280x280/ts/product/86/6c/52/ac1b17316a0ea5082396c9041226ef58.jpg', 2600000.00, 1, 1, 'giay-converse-run-star-motion-171545c-p187547435');
INSERT INTO `products` VALUES (29, 'Giày Converse Chuck Taylor All Star 1970s Low Top - 162058V', 1, 'Chất liệu vải cao cấp\nGiày Sneaker Unisex Converse Chuck Taylor All Star 1970s Black/w Low 2018 được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Thiết kế kiểu dáng cùng gam màu thời...', 'https://salt.tikicdn.com/cache/280x280/ts/product/f3/b9/da/51a213b000bf7f6051b6ef09e7b75259.jpg', 1900000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-1970s-low-top-162058v-p7997237');
INSERT INTO `products` VALUES (30, 'Túi Vans X Shake Junt Ward Cross Body VN0A2ZXXZXG', 1, 'Màu sắc: Black\nVới kiểu dáng đơn giản, trẻ trung thích hợp mang đến phòng tập, du lịch, dã ngoại.\nChi tiết đường may chắc chắn, tỉ mỉ.\nĐai đeo chắc chắn, phần thân giúp giảm thiểu cảm giác đau mỏi,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/bc/96/1d/69e82008a959a16cd9e2459369eb4dc8.jpg', 800000.00, 1, 1, 'tui-vans-x-shake-junt-ward-cross-body-vn0a2zxxzxg-p74847418');
INSERT INTO `products` VALUES (31, 'Giày Converse Chuck Taylor All Star 1970s Low Top - 162065V', 1, 'Chất liệu cao cấp, sang trọng\nGiày Sneaker Unisex Converse Chuck Taylor All Star 1970s All Low - White được thiết kế từ chất liệu vải canvas nhẹ, tạo cảm giác thoải mái cho người sử dụng. Đường may...', 'https://salt.tikicdn.com/cache/280x280/ts/product/5d/63/37/4d206a2b4af947313096b382c08f3a28.jpg', 1710000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-1970s-low-top-162065v-p7995150');
INSERT INTO `products` VALUES (32, 'Giày Converse Chuck Taylor 1970s Low Top - 171570C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/86/9b/fe/25fecc5f3af4e8ab43451829ae311bdb.jpg', 1330000.00, 1, 1, 'giay-converse-chuck-taylor-1970s-low-top-171570c-p171108211');
INSERT INTO `products` VALUES (33, 'Giày Converse Chuck 1970s Hybrid Floral Hi Top - 571387C', 1, 'Giày Converse Chuck 1970s Hybrid Floral Hi Top được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót...', 'https://salt.tikicdn.com/cache/280x280/ts/product/45/f5/fc/0f391aa6378b935bc4f96c885ef99e69.jpg', 1520000.00, 1, 1, 'giay-converse-chuck-1970s-hybrid-floral-hi-top-571387c-p136500372');
INSERT INTO `products` VALUES (34, 'Giày Converse Run Star Hike Twisted Classic Foundational 166800V', 1, 'Màu sắc: Black/White/Gum\nSản phẩm được thiết kế \"remix\" từ Chuck và Runner khi 2 yếu tố thời trang.\nChất liệu canvas và đế Run Star zig-zag được thiết kế với dạng răng cưa to bản, giúp tăng độ bám...', 'https://salt.tikicdn.com/cache/280x280/ts/product/02/43/30/e754e7618b86ebdbab10297423cf1d97.jpg', 2500000.00, 1, 1, 'giay-converse-run-star-hike-twisted-classic-foundational-166800v-p58878773');
INSERT INTO `products` VALUES (35, 'Giày Converse Chuck Taylor All Star 1970s Hi Top - 162050V', 1, 'Chất liệu vải nhẹ, dày dặn, cao cấp\nGiày Sneaker Unisex Converse Chuck Taylor All Star 1970s Black/w 2018 được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và...', 'https://salt.tikicdn.com/cache/280x280/ts/product/02/f8/ce/6306eff2ad113f391d1d136bd711b8d5.jpg', 2000000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-1970s-hi-top-162050v-p7997300');
INSERT INTO `products` VALUES (36, 'Giày Vans X Kazuki Kuraishi Authentic Skate - VN0A5HZS6UT', 1, 'BTS VANS x KAZUKI KURAISHI ĐỔ BỘ VIỆT NAM ĐẦU NĂM 2022 – VINH DANH VĂN HÓA TRƯỢT VÁN NHỮNG NĂM 80\n \nVans công bố một sự hợp tác đầy thú vị với nhà thiết kế nổi tiếng Nhật Bản Kazuki Kuraishi, một...', 'https://salt.tikicdn.com/cache/280x280/ts/product/a5/fa/5d/c97c9712802b1a283d5c9f36094a526c.jpg', 1085000.00, 1, 1, 'giay-vans-x-kazuki-kuraishi-authentic-skate-vn0a5hzs6ut-p161967961');
INSERT INTO `products` VALUES (37, 'Giày Vans Style 36 - VN0A54F69LY', 1, 'Vẫn là các phân nhánh của đại gia đình Vans Classic Sport, BST luôn mang đến những phối màu ăn điểm giúp người dùng có thêm nhiều trải nghiệm mới mẻ. Ấn tượng hơn cả có thể nhắc đến các phối màu...', 'https://salt.tikicdn.com/cache/280x280/ts/product/e6/4c/11/5a2bf1fa2a58af6f664dfdf462666649.jpg', 1575000.00, 1, 1, 'giay-vans-style-36-vn0a54f69ly-p161956197');
INSERT INTO `products` VALUES (38, 'Giày Sneaker Unisex Authentic Vans - VN000EE3BLK', 1, 'Kiểu dáng cổ điển\nGiày Sneaker Unisex Authentic Vans VN000EE3BLK - Black là dòng giày được thiết kế đa dạng kiểu dáng bên thân giày. Kiểu dáng cổ điển, dễ vệ sinh, với đường may tỉ mỉ chắc chắn...', 'https://salt.tikicdn.com/cache/280x280/ts/product/9b/5a/9c/310f1bc79d43ca70c1f514e42ec9f2bf.jpg', 1305000.00, 1, 1, 'giay-sneaker-unisex-authentic-vans-vn000ee3blk-p9810452');
INSERT INTO `products` VALUES (39, 'Giày Converse Chuck 70 Seasonal Color Vintage Canvas - 172677C', 1, 'Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck 70 mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất...', 'https://salt.tikicdn.com/cache/280x280/ts/product/a3/d7/3c/dc7b85fd2c8577efb95268e1bede8e03.jpg', 1980000.00, 1, 1, 'giay-converse-chuck-70-seasonal-color-vintage-canvas-172677c-p165238625');
INSERT INTO `products` VALUES (40, 'Giày Converse Chuck 70 Mule - 172591C', 1, 'Sneaker Mule Converse - Trở lại đầy phong cách đi kèm với sự nâng cấp linh hoạt\nĐược biết đến với kiểu dáng thời thượng và thoải mái, giày mule đình đám một thời nay lại được “phục hưng” trên kiểu...', 'https://salt.tikicdn.com/cache/280x280/ts/product/0b/8a/ea/ae77b52016ff8c31593dc819d616b4a8.jpg', 1800000.00, 1, 1, 'giay-converse-chuck-70-mule-172591c-p165238439');
INSERT INTO `products` VALUES (41, 'Giày Vans Old Skool Classic Sport - VN0A5KRF93U', 1, 'Vẫn là các phân nhánh của đại gia đình Vans Classic Sport, Style 36 luôn mang đến những phối màu ăn điểm giúp người dùng có thêm nhiều trải nghiệm mới mẻ. Ấn tượng hơn cả có thể nhắc đến các phối màu...', 'https://salt.tikicdn.com/cache/280x280/ts/product/38/97/71/79c3f4bf209e5f381b2a65f96867f1fe.jpg', 1575000.00, 1, 1, 'giay-vans-old-skool-classic-sport-vn0a5krf93u-p164583262');
INSERT INTO `products` VALUES (42, 'Giày Vans Old Skool Crew Style 36 VN0A3DZ31IW', 1, 'Màu sắc: Checkerboard Red\nVans Crew Classic Old skool thiết kế bằng vải trượt có cấu hình thấp chắc chắn với hình in nổi, cổ áo có đệm, điểm nhấn bên hông đàn hồi và đế ngoài bằng cao su đặc trưng...', 'https://salt.tikicdn.com/cache/280x280/ts/product/71/01/e7/074ffdf66cf03db99f2a3bab51ab00ce.jpg', 900000.00, 1, 1, 'giay-vans-old-skool-crew-style-36-vn0a3dz31iw-p70546953');
INSERT INTO `products` VALUES (43, 'Giày Vans Era - VN0A54F19LY', 1, 'Vans UA Era Classic Sport Với thiết kế đơn giản đi kèm với chất lượng, thiết kế phần đế cao su với độ bám tốt và bền thích hợp cho các bạn yêu bộ môn ván trượt, các mẫu Vans thường được các bạn trẻ...', 'https://salt.tikicdn.com/cache/280x280/ts/product/e3/d9/f7/667f8fe0b0531c915d3d562166e4e4e1.jpg', 1305000.00, 1, 1, 'giay-vans-era-vn0a54f19ly-p161956045');
INSERT INTO `products` VALUES (44, 'Giày Sneaker Vans MN Skate Old Skool VN0A5FCBY28', 1, '\n \n \n  \n   GIÀY SNEAKER- HÀNG CHÍNH HÃNG\n   Hình mẫu Old Skool cổ điển tái xuất trong phiên bản Vans Skate Old Skool với hàng loạt cải tiến mang tính đột phá cho dòng giày trượt ván. Tái sinh bằng...', 'https://salt.tikicdn.com/cache/280x280/ts/product/45/03/ca/b9302557f137d15e0ce3538d9dae3943.jpg', 2200000.00, 1, 1, 'giay-sneaker-vans-mn-skate-old-skool-vn0a5fcby28-p140776970');
INSERT INTO `products` VALUES (45, 'Giày Vans Style 36 Marshmallow Jolly - VN0A3DZ3RFX', 1, 'Không phải lần đầu tiên xuất hiện, nhưng sản phẩm mang tên giày Vans Style 36 Marshmallow đã từng khuấy đảo được làng thời trang những năm trước. Đây cũng là sản phẩm có mức giá “đội” lên rất nhiều...', 'https://salt.tikicdn.com/cache/280x280/ts/product/a3/21/55/887f0a3869f9b8f1746cbb49d9778e21.jpg', 1850000.00, 1, 1, 'giay-vans-style-36-marshmallow-jolly-vn0a3dz3rfx-p161978534');
INSERT INTO `products` VALUES (46, 'Giày Converse Chuck 70 Utility Hybrid Fusion - 171656C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/24/64/b3/091c0d46471bc6cb6c38bf0f4863083f.jpg', 2016000.00, 1, 1, 'giay-converse-chuck-70-utility-hybrid-fusion-171656c-p161956663');
INSERT INTO `products` VALUES (47, 'Giày Vans Old Skool Skate VN0A5FCBOFW', 1, 'Vans Old Skool Skate với thiết kế với tông màu trắng ngà bắt mắt giúp sản phẩm thêm phần cá tính và nổi bật.Phần tag logo Vans bên hông giày được thay đổi thành logo checker mới lạ, tạo điểm nổi bật...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ca/d9/de/64e96a091bb81dcc6bf09a46f16f7a59.jpg', 1540000.00, 1, 1, 'giay-vans-old-skool-skate-vn0a5fcbofw-p79561382');
INSERT INTO `products` VALUES (48, 'Giày Palladium Pallabrousse Legion 77018-008-M', 1, 'Palladium Pallabrousse Legion là loại giày cho những bạn trẻ ưa khám phá, thiết kế theo phong cách bụi bặm mạnh mẽ cảm hứng từ quân đội, nhấn mạnh sự đơn giản tạo sự khác biệt đặc trưng rất cho từng...', 'https://salt.tikicdn.com/cache/280x280/ts/product/e4/6c/00/0ac65d7e158c6eadf3dbb1a69f9ceb39.jpg', 1750000.00, 1, 1, 'giay-palladium-pallabrousse-legion-77018-008-m-p77968672');
INSERT INTO `products` VALUES (49, 'Giày Sneaker Unisex Old Skool Vans - VN000D3HW00', 1, 'Giày Sneaker Unisex Old Skool Vans VN000D3HW00 - White là dòng giày được thiết kế đa dạng kiểu dáng bên thân giày.\nKiểu dáng cổ điển, dễ vệ sinh, với đường may tỉ mỉ chắc chắn.\nSản phẩm giúp hỗ trợ...', 'https://salt.tikicdn.com/cache/280x280/ts/product/4f/f8/dc/756877bdbda48f70571901007728dc8f.jpg', 1750000.00, 1, 1, 'giay-sneaker-unisex-old-skool-vans-vn000d3hw00-p9809487');
INSERT INTO `products` VALUES (50, 'Giày Vans Authentic Multi Tropic VN0A2Z5IWH9', 1, 'Màu sắc: (Multi Tropic) Dress Blues/True White\nVans Multi Tropic Authentic thiết kế với mặt giày họa tiết hoa phối màu cực kỳ đa dạng cho bạn dễ dàng lựa chọn và thỏa sức mix, match với bất kỳ phong...', 'https://salt.tikicdn.com/cache/280x280/ts/product/62/5d/f4/62a264b9f1ed73e49e31052d180b26f6.jpg', 750000.00, 1, 1, 'giay-vans-authentic-multi-tropic-vn0a2z5iwh9-p58841559');
INSERT INTO `products` VALUES (51, 'Giày Vans Slip-on Bee Check - VN0A33TB9EH', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/9e/f5/bf/deebd7aaab023fb2a0cc940f9dadac0d.jpg', 1160000.00, 1, 1, 'giay-vans-slip-on-bee-check-vn0a33tb9eh-p161955402');
INSERT INTO `products` VALUES (52, 'Giày Converse Chuck Taylor All Star 1970s Sunflower Hi Top - 162054C', 1, 'Thiết kế đơn giản, cổ điển\nGiày Sneaker Unisex Converse Chuck Taylor All Star 1970s Hi 2018 162054C luôn là dòng sản phẩm được lòng khách hàng với thiết kế đơn giản, chưa bao giờ lỗi mốt và mang nét...', 'https://salt.tikicdn.com/cache/280x280/ts/product/6d/31/f6/06c20a6650206e0997b34183ac21af5b.jpg', 1800000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-1970s-sunflower-hi-top-162054c-p20008606');
INSERT INTO `products` VALUES (53, 'Giày Slip On Unisex Vans - VN000EYEW00', 1, 'Giày Slip On Unisex Vans VN000EYEW00 - True White là một item cực phù hợp với những người mê thời trang classic hoặc hiện đại.\nĐược may tỉ mỉ, chắc chắn. Màu sắc bền theo thời gian sử dụng.\nChất liệu...', 'https://salt.tikicdn.com/cache/280x280/ts/product/2d/c5/b6/b303bf7ac4f63d93881fce75a15e93ac.jpg', 1305000.00, 1, 1, 'giay-slip-on-unisex-vans-vn000eyew00-p9810736');
INSERT INTO `products` VALUES (54, 'Giày Converse Renew Chuck 70 High Ox - 171662V', 1, 'PHƯƠNG PHÁP SỬ DỤNG :\n CHẤT LIỆU VẢI :\nKhông sử dụng thuốc tẩy hoặc ngâm giày quá lâu trong nước, nên hạn chế sử dụng bàn chải lông cứng để vệ sinh bề mặt giày, nếu không sẽ làm tổn thương đến bề mặt...', 'https://salt.tikicdn.com/cache/280x280/ts/product/cf/70/c9/e7021b3f930277f1c5644ff4c8e8d659.jpg', 1680000.00, 1, 1, 'giay-converse-renew-chuck-70-high-ox-171662v-p174825547');
INSERT INTO `products` VALUES (55, 'Giày Vans Classic Slip-On Mule Checkerboard - VN0004KTEO1', 1, 'PHƯƠNG PHÁP SỬ DỤNG :\n CHẤT LIỆU VẢI :\nKhông sử dụng thuốc tẩy hoặc ngâm giày quá lâu trong nước, nên hạn chế sử dụng bàn chải lông cứng để vệ sinh bề mặt giày, nếu không sẽ làm tổn thương đến bề mặt...', 'https://salt.tikicdn.com/cache/280x280/ts/product/48/7e/0c/c1d0e01a8802d82fbb5ba72a67f81383.jpg', 1550000.00, 1, 1, 'giay-vans-classic-slip-on-mule-checkerboard-vn0004kteo1-p176153365');
INSERT INTO `products` VALUES (56, 'Giày Converse Chuck Taylor All Star Classic Hi Top - 121186', 1, 'Chất liệu vải cao cấp\nGiày Sneaker Unisex Converse Chuck Taylor All Star Classic Hi - Black/w được thiết kế từ chất liệu vải canvas nhẹ, tạo cảm giác thoải mái cho người sử dụng. Đế có rãnh chống...', 'https://salt.tikicdn.com/cache/280x280/ts/product/11/c7/37/deddacfed53adabacc92edae5d99559b.jpg', 1550000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-classic-hi-top-121186-p7995370');
INSERT INTO `products` VALUES (57, 'Giày Converse Chuck Taylor All Star Recycled Poly Jacquard - 571357C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).\n+ Bộ sản phẩm: Hộp giày, túi vải...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ba/d7/a6/194aa98d28372a9c094771e8431bac24.jpg', 1280000.00, 1, 1, 'giay-converse-chuck-taylor-all-star-recycled-poly-jacquard-571357c-p164361494');
INSERT INTO `products` VALUES (58, 'Giày Vans Old Skool Multi Animal VN0A4U3BXF1', 1, 'Màu sắc: (Multi Animal) Rasta/Black\nVans Multi Animal Old Skool thiết kế với mặt giày màu đen cơ bản kết hợp chữ VANS phối màu cực kỳ đa dạng được đặt bên hông giày tạo sự mới lạ cho sane phẩm.\nCập...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ff/39/61/218c6a20ecf628e7590362aaf7c4351f.jpg', 900000.00, 1, 1, 'giay-vans-old-skool-multi-animal-vn0a4u3bxf1-p58717374');
INSERT INTO `products` VALUES (59, 'Vớ Vans Socks - VN0A4DSG8BM', 1, 'Chất liệu Cotton cao cấp, nguồn gốc tự nhiên, mềm, không gây kích ứng da\nĐộ đàn hồi cao, phần chun mảnh không gây hằn, đau khi sử dụng\nĐảm bảo khử mùi hiệu quả, kháng khuẩn', 'https://salt.tikicdn.com/cache/280x280/ts/product/76/f3/85/5bf7f676dd1b6e854f4c6426610ade82.jpg', 70000.00, 1, 1, 'vo-vans-socks-vn0a4dsg8bm-p55707824');
INSERT INTO `products` VALUES (60, 'Vớ Vans Vibes Crew - VN0A5KI4BLK', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/02/6a/00/fb6f9c1316aa5a5498f1bc4778842e7e.jpg', 190000.00, 1, 1, 'vo-vans-vibes-crew-vn0a5ki4blk-p170109100');
INSERT INTO `products` VALUES (61, 'Nón Converse Jack Purcell Smile Baseball Hat - 10021440-A01', 1, 'PHƯƠNG PHÁP SỬ DỤNG :\n CHẤT LIỆU VẢI :\nKhông sử dụng thuốc tẩy hoặc ngâm giày quá lâu trong nước, nên hạn chế sử dụng bàn chải lông cứng để vệ sinh bề mặt giày, nếu không sẽ làm tổn thương đến bề mặt...', 'https://salt.tikicdn.com/cache/280x280/ts/product/0f/63/b4/b30664e3a69dc37bdaa26051621e79b2.jpg', 450000.00, 1, 1, 'non-converse-jack-purcell-smile-baseball-hat-10021440-a01-p177642741');
INSERT INTO `products` VALUES (62, 'Giày SUPRA CHINO COURT', 1, 'SUPRA ra đời với mục đích bảo vệ các “skaters” trong bộ môn trượt ván. Điểm đặc trưng của dòng giày này chính là những thiết kế cổ cao cá tính và đậm chất đường phố, giúp bạn nổi bật mọi lúc, mọi nơi...', 'https://salt.tikicdn.com/cache/280x280/ts/product/f3/6f/f2/871984bff2802771133102b71e1a7360.jpg', 400000.00, 1, 1, 'giay-supra-chino-court-p133677047');
INSERT INTO `products` VALUES (63, 'Giày Vans Authentic X SpongeBob VN0A5HZSZAS', 1, 'BST Vans X SpongeBob sự hợp tác Vans và SpongeBob SquarePants, loại bọt biển đáng nhớ nhất thế giới, giúp bạn thể hiện tình yêu của mình đối với những sinh vật tuyệt vời nhất dưới biển.\nVans X...', 'https://salt.tikicdn.com/cache/280x280/ts/product/95/f3/bc/c106fe9321bba933449b16035e9304c7.jpg', 1750000.00, 1, 1, 'giay-vans-authentic-x-spongebob-vn0a5hzszas-p107033540');
INSERT INTO `products` VALUES (64, 'Vớ Vans Peek-A-Check Crew Socks - VN0A3Z92YB2', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/61/b9/02/1c0a177ce7a7ffb936d5401b3f914762.jpg', 160000.00, 1, 1, 'vo-vans-peek-a-check-crew-socks-vn0a3z92yb2-p164442769');
INSERT INTO `products` VALUES (65, 'Giày Supra Factor Tactic', 1, 'SUPRA ra đời với mục đích bảo vệ các “skaters” trong bộ môn trượt ván. Điểm đặc trưng của dòng giày này chính là những thiết kế cổ cao cá tính và đậm chất đường phố, giúp bạn nổi bật mọi lúc, mọi nơi...', 'https://salt.tikicdn.com/cache/280x280/ts/product/8e/e9/31/e423d61955828245554eda3935870be4.jpg', 500000.00, 1, 1, 'giay-supra-factor-tactic-p133646864');
INSERT INTO `products` VALUES (66, 'Vớ Vans Stripe Crew - VN0A4RUJIY6', 1, 'Nâng cao phong cách cổ điển với hoa văn vượt thời gian, Well Suited Backpack là một chiếc ba lô thời trang với vải houndstooth, có túi zip bên ngoài và thiết kế hiện đại ,đa năng . \n• Dây đeo vai đệm...', 'https://salt.tikicdn.com/cache/280x280/ts/product/e9/8f/83/4e68793b8cca7dd89b719afd5c2c8c80.jpg', 171000.00, 1, 1, 'vo-vans-stripe-crew-vn0a4rujiy6-p161978611');
INSERT INTO `products` VALUES (67, 'Giày Unisex Palladium Pampa Hi Originale 75349-238-M', 1, 'Palladium Pampa với thiết kế kiểu dáng cổ cao đơn giản nhưng lên chân siêu chất.\nUpper sử dụng chất liệu canvas dày, bền bỉ, đường may chắc chắn, tỉ mỉ. Đế giày cao su với vân đế đặc trưng tăng độ...', 'https://salt.tikicdn.com/cache/280x280/ts/product/bd/91/f6/35102cce6da121f5665de57f52f6776c.png', 1200000.00, 1, 1, 'gia-y-unisex-palladium-pampa-hi-originale-75349-238-m-p14762833');
INSERT INTO `products` VALUES (68, 'Giày K-Swiss Men\'s Court Shield', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/19/58/d7/7d6c79c3b911c72cc1023b08e25a929e.jpg', 800000.00, 1, 1, 'giay-k-swiss-men-s-court-shield-p133871373');
INSERT INTO `products` VALUES (69, 'Giày Supra Factor XT', 1, 'SUPRA ra đời với mục đích bảo vệ các “skaters” trong bộ môn trượt ván. Điểm đặc trưng của dòng giày này chính là những thiết kế cổ cao cá tính và đậm chất đường phố, giúp bạn nổi bật mọi lúc, mọi nơi...', 'https://salt.tikicdn.com/cache/280x280/ts/product/67/59/7c/6dfe2e5aeea073070251762a7ce99bd7.jpg', 600000.00, 1, 1, 'giay-supra-factor-xt-p133630093');
INSERT INTO `products` VALUES (70, 'Vớ Vans Commercial Dna Crew - VN0A5KNCWHT', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/76/f9/46/20f80888f50c3aa062baa1b98f2a3676.jpg', 200000.00, 1, 1, 'vo-vans-commercial-dna-crew-vn0a5kncwht-p167429468');
INSERT INTO `products` VALUES (71, 'Giày K-Swiss Women\'s ALTEZO', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/db/e3/c0/6a21472a65bf069b21632633cf9afc84.jpg', 600000.00, 1, 1, 'giay-k-swiss-women-s-altezo-p133864745');
INSERT INTO `products` VALUES (72, 'Giày Vans Authentic Multi Tropic VN0A2Z5IWH9', 1, 'Màu sắc: (Multi Tropic) Dress Blues/True White\nVans Multi Tropic Authentic thiết kế với mặt giày họa tiết hoa phối màu cực kỳ đa dạng cho bạn dễ dàng lựa chọn và thỏa sức mix, match với bất kỳ phong...', 'https://salt.tikicdn.com/cache/280x280/ts/product/62/5d/f4/62a264b9f1ed73e49e31052d180b26f6.jpg', 750000.00, 2, 1, 'giay-vans-authentic-multi-tropic-vn0a2z5iwh9-p58841559');
INSERT INTO `products` VALUES (73, 'Giày Vans Classic Slip-On Mule Checkerboard - VN0004KTEO1', 1, 'PHƯƠNG PHÁP SỬ DỤNG :\n CHẤT LIỆU VẢI :\nKhông sử dụng thuốc tẩy hoặc ngâm giày quá lâu trong nước, nên hạn chế sử dụng bàn chải lông cứng để vệ sinh bề mặt giày, nếu không sẽ làm tổn thương đến bề mặt...', 'https://salt.tikicdn.com/cache/280x280/ts/product/48/7e/0c/c1d0e01a8802d82fbb5ba72a67f81383.jpg', 1550000.00, 2, 1, 'giay-vans-classic-slip-on-mule-checkerboard-vn0004kteo1-p176153365');
INSERT INTO `products` VALUES (74, 'Giày Converse Chuck Taylor All Star Recycled Poly Jacquard - 571357C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).\n+ Bộ sản phẩm: Hộp giày, túi vải...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ba/d7/a6/194aa98d28372a9c094771e8431bac24.jpg', 1280000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-recycled-poly-jacquard-571357c-p164361494');
INSERT INTO `products` VALUES (75, 'Giày K-Swiss Women\'s ALTEZO', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/db/e3/c0/6a21472a65bf069b21632633cf9afc84.jpg', 600000.00, 2, 1, 'giay-k-swiss-women-s-altezo-p133864745');
INSERT INTO `products` VALUES (76, 'Giày Nữ Converse Chuck Taylor All Star II Engineered Woven 155417V', 1, 'Converse Chuck Taylor All Star II Engineered Woven được thiết kế chất liệu cao cấp, mềm mại, tạo cảm giác thoải mái cho người sử dụng.\nKiểu dáng thể thao, mạnh mẽ, đế cao su bền chắc, có độ bám cao...', 'https://salt.tikicdn.com/cache/280x280/ts/product/c7/09/41/0e4b48644226175df4312949d993acef.jpg', 400000.00, 2, 1, 'giay-nu-converse-chuck-taylor-all-star-ii-engineered-woven-155417v-p14368129');
INSERT INTO `products` VALUES (77, 'Giày Converse Chuck 70 Glam Hi-Top - 572265C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/2e/54/ec/c0feb2ffc1001ebde3af045d6da90b85.jpg', 1600000.00, 2, 1, 'giay-converse-chuck-70-glam-hi-top-572265c-p167147370');
INSERT INTO `products` VALUES (78, 'Giày K-Swiss Women\'s Court Shield', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ca/a3/2b/214901f540fd2e2bd362317c082f626e.jpg', 800000.00, 2, 1, 'giay-k-swiss-women-s-court-shield-p133864113');
INSERT INTO `products` VALUES (79, 'Giày Converse Chuck Taylor All Star Madison - 563509C', 1, 'Thiết kế form dáng thời trang phần lưỡi gà, cổ giày được đệm dày dặn êm chân tạo cảm giác thoải mái, cùng màu sắc trắng cổ điển. Logo Converse All Star ở phía trên lưỡi gà được thiết kế với màu sắc...', 'https://salt.tikicdn.com/cache/280x280/ts/product/13/e1/bc/de99ccd3f625c636bf133adbfa12a3b9.jpg', 1200000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-madison-563509c-p99855441');
INSERT INTO `products` VALUES (80, 'Giày Converse Chuck Taylor All Star Rave Millennium Glam - A00867C', 1, 'Dựa trên dòng Chuck Taylor All Star đình đám, Converse đã mang đến item Converse Chuck Taylor All Star Rave cho những tín đồ thời trang trên toàn thế giới với những đường nét diu dàng, tinh tế. Với...', 'https://salt.tikicdn.com/cache/280x280/ts/product/d5/62/a6/f5bf62637a829ab35b74bf45f66a9516.jpg', 1395000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-rave-millennium-glam-a00867c-p187551123');
INSERT INTO `products` VALUES (81, 'Giày Converse Jack Purcell LP L/S - 570482C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/6b/a5/ed/36da1c9444590f061586f5e71284fafc.jpg', 1120000.00, 2, 1, 'giay-converse-jack-purcell-lp-l-s-570482c-p169566639');
INSERT INTO `products` VALUES (82, 'Giày Converse Chuck Taylor All Star Keith Haring Low Top 171860C', 1, 'Converse Chuck Taylor All Star Keith Haring phiên bản dành riêng cho những bạn thích sự đơn giản, tinh tế nhưng không kém phần nổi bật.\nThiết kế với hình vẽ hoạt động của con người...', 'https://salt.tikicdn.com/cache/280x280/ts/product/b1/47/b0/a8e90e08e017bf6f35c39d6e8c40825c.jpg', 1120000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-keith-haring-low-top-171860c-p101722029');
INSERT INTO `products` VALUES (83, 'Giày Vans Old Skool Mismatch Style 36 VN0A3DZ3WS8', 1, 'Vans Mismatch Style 36 thiết kế có sự kết hợp màu sắc hoa văn khác nhau trên mỗi chiếc giày.\nĐa phần thiết kế của Vans ưu tiên bảo vệ đôi chân người dùng tạo nên độ chắc chắn và gắn kết hoàn hảo giữa...', 'https://salt.tikicdn.com/cache/280x280/ts/product/de/9d/d3/e0ca15f47097b6b89ad4793fd93da3a5.jpg', 900000.00, 2, 1, 'giay-vans-old-skool-mismatch-style-36-vn0a3dz3ws8-p50735122');
INSERT INTO `products` VALUES (84, 'Giày Converse CTAS Madison Ox w/Backstay Stand Out - 572368V', 1, 'PHƯƠNG PHÁP SỬ DỤNG :\n CHẤT LIỆU VẢI :\nKhông sử dụng thuốc tẩy hoặc ngâm giày quá lâu trong nước, nên hạn chế sử dụng bàn chải lông cứng để vệ sinh bề mặt giày, nếu không sẽ làm tổn thương đến bề mặt...', 'https://salt.tikicdn.com/cache/280x280/ts/product/4f/c0/76/5a8b3da530b750c3d075f0910edea480.jpg', 1350000.00, 2, 1, 'giay-converse-ctas-madison-ox-w-backstay-stand-out-572368v-p179752256');
INSERT INTO `products` VALUES (85, 'Giày Vans Slip-On Mix Checker Chili Pepper - VN0A38F7VK5', 1, 'THÔNG TIN SẢN PHẨM\n   \n\n\nThương hiệu\nVans\n\n\nXuất xứ thương hiệu\nMỹ\n\n\nSản xuất tại\nViệt Nam/ Ấn Độ/ Trung Quốc\n\n\nSKU\nVN0A38F7VK5\n\n\nModel\nVans Slip On\n\n\nChất liệu\n\nVải canvas\n\n\n\nHướng dẫn bảo...', 'https://salt.tikicdn.com/cache/280x280/ts/product/a5/8b/2e/e16f074e1ee03a68156278b1d44335d5.png', 600000.00, 2, 1, 'giay-vans-slip-on-mix-checker-chili-pepper-vn0a38f7vk5-p97736026');
INSERT INTO `products` VALUES (86, 'Giày Vans Sk8-Hi X They Are VN0A5HXV60X', 1, 'Màu sắc: CRYSTAL GRY/BAROQUE ROSE/BLACKVans ra mắt BST năm nay hợp tác với nhà thiết kế Trung Quốc Su Wukou để cho ra mắt dòng sản phẩm chung “Year of the Ox” 2021 dành cho năm Kỷ Sửu. Year of the Ox...', 'https://salt.tikicdn.com/cache/280x280/ts/product/35/99/67/3edc7172580894963d90db1a42503626.jpg', 1000000.00, 2, 1, 'giay-vans-sk8-hi-x-they-are-vn0a5hxv60x-p76262141');
INSERT INTO `products` VALUES (87, 'Giày Palladium GAO EVA HIGH BOOT - 97739-100-M', 1, 'Giày Palladium GAO EVA HIGH BOOT\n \nNHÂN ĐÔI “CHẤT” PHÁP VỚI BST GIỚI HẠN BOTH X PALLADIUM GAO EVA HIGH BOOTboth x Palladium - một bên là hãng thời trang mới nổi đang sáng giá trong làng mốt, một bên...', 'https://salt.tikicdn.com/cache/280x280/ts/product/41/36/b5/2641298111d9dab26078e21b56b85225.jpg', 7700000.00, 2, 1, 'giay-palladium-gao-eva-high-boot-97739-100-m-p166009410');
INSERT INTO `products` VALUES (88, 'Giày Converse Run Star Hike - 172361V', 1, 'Giày Converse Run Star Hike\nMột bước ngoặt lớn trong việc nâng cao tinh thần bảo vệ môi trường , Run Star Hike Crater chắc chắn sẽ là đôi giày bạn yêu thích ,được thiết kế hướng tới một tương lai...', 'https://salt.tikicdn.com/cache/280x280/ts/product/5d/10/ab/dfbe174757beabd96bd5b6b336e54d70.jpg', 2000000.00, 2, 1, 'giay-converse-run-star-hike-172361v-p161974497');
INSERT INTO `products` VALUES (89, 'Giày Converse Chuck Taylor All Star Move Hybrid Shine 571622C', 1, 'Một sự phá cách táo bạo trên năng lượng của Chuck cổ điển. Chuck Taylor All Star Move được thiết kế cho dựa trên yếu tố tự do di chuyển, tăng thêm chiều cao nhớ phần đế cao nhẹ nhàng và nổi bật.\nĐặc...', 'https://salt.tikicdn.com/cache/280x280/ts/product/59/5c/60/a1d20b55591d1a7769a5c95f6ae553e0.jpg', 1600000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-move-hybrid-shine-571622c-p172329675');
INSERT INTO `products` VALUES (90, 'Giày Chuck Taylor All Star Run Hike Leopard Low Yop 170912V', 1, 'Sản phẩm được thiết kế \"remix\" từ Chuck và Runner khi 2 yếu tố thời trang.\nThiết kế họa tiết da báo 2 bên mặt giày phối cùng lưỡi giày với họa tiết camo nổi bật, tạo sự mới lạ cho đôi giày.\nChất...', 'https://salt.tikicdn.com/cache/280x280/ts/product/33/48/35/f5b5acdd6bc766e4ba0d260cbbdd89a5.jpg', 1540000.00, 2, 1, 'giay-chuck-taylor-all-star-run-hike-leopard-low-yop-170912v-p87666125');
INSERT INTO `products` VALUES (91, 'Giày Vans Authentic 44 Dx Anaheim Factory - VN0A38ENMR2', 1, 'THÔNG TIN SẢN PHẨM\n   \n\n\nThương hiệu\nVans\n\n\nXuất xứ thương hiệu\nMỹ\n\n\nSản xuất tại\nViệt Nam/ Ấn Độ/ Trung Quốc\n\n\nSKU\nVN0A38ENMR2\n\n\nModel\nVans Authentic 44Dx\n\n\nChất liệu\n\nVải canvas\n\n\n\nHướng dẫn bảo...', 'https://salt.tikicdn.com/cache/280x280/media/catalog/producttmp/90/9c/f5/bd9a51f51e22a58fc536f48ebef20979.jpg', 1400000.00, 2, 1, 'giay-vans-authentic-44-dx-anaheim-factory-vn0a38enmr2-p97766416');
INSERT INTO `products` VALUES (92, 'Giày Vans Era X They Are VN0A5EFN60S', 1, 'Màu sắc: BAROQUE ROSE/MARSHMALLOWVans ra mắt BST năm nay hợp tác với nhà thiết kế Trung Quốc Su Wukou để cho ra mắt dòng sản phẩm chung “Year of the Ox” 2021 dành cho năm Kỷ Sửu. Year of the Ox sẽ...', 'https://salt.tikicdn.com/cache/280x280/ts/product/8e/ce/94/eb79279d0db6f661d782e8af5ad889dc.jpg', 900000.00, 2, 1, 'giay-vans-era-x-they-are-vn0a5efn60s-p76262203');
INSERT INTO `products` VALUES (93, 'Giày Vans UA Classic Slip-On Kide VN0A3MVDWOK', 1, 'Thiết kế BST mang đến sự mới lạ trong khung cảnh sinh hoạt của làng quê ven biển tại Malaysia vào những thập niên 50.\nHọa sĩ Kide Baharudin đã cho ta thấy không gian văn hóa đặc trưng của nơi ông...', 'https://salt.tikicdn.com/cache/280x280/ts/product/6a/40/e6/4fb3bdaa3b9ec223e52409fc334ef65a.jpg', 750000.00, 2, 1, 'giay-vans-ua-classic-slip-on-kide-vn0a3mvdwok-p57438525');
INSERT INTO `products` VALUES (94, 'Giày Vans Authentic Warped Floral VN0A2Z5IT7R', 1, 'Dòng sản phẩm mang đến cho bạn một sự thay đổi nguyên bản về phong cách Vans mang tính biểu tượng. \nThiết kế đế thấp đơn giản với phần đế bằng vải bền. \nĐược bao phủ trong một lớp lót mềm mại khi...', 'https://salt.tikicdn.com/cache/280x280/ts/product/96/1e/5f/67c8eeff39598ceee4005f5b9d432122.jpg', 1550000.00, 2, 1, 'giay-vans-authentic-warped-floral-vn0a2z5it7r-p46117254');
INSERT INTO `products` VALUES (95, 'Giày Converse Chuck Taylor All Star Recycled Remix - 571355C', 1, 'Converse Chuck Taylor All Star Recycled Remix không chỉ đổi mới về chất liệu, về lối thiết kế và những chi tiết độc lạ, mà nó còn được chú ý nhiều bởi tổng thể sản phẩm có tới 40% vật liệu tái chế,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/26/23/ca/8d830b00672f1cde04fe09e66c835d6a.jpg', 1050000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-recycled-remix-571355c-p188300861');
INSERT INTO `products` VALUES (96, 'Giày Vans Sk8-Hi Tiger Patchwork VN0A4BV61IO', 1, 'Màu sắc: (Tiger Patchwork) Black/True White\nVans TIGER PATCHWORK thiết kế nâng tầm Kỷ nguyên cổ điển và tạo thêm sự mới lạ cho hình bóng lâu đời với các bản in và hoa văn chắp vá khác nhau.\nTiger...', 'https://salt.tikicdn.com/cache/280x280/ts/product/43/4b/c4/3391d5f62352fe44d65e630945434b68.jpg', 1000000.00, 2, 1, 'giay-vans-sk8-hi-tiger-patchwork-vn0a4bv61io-p68200742');
INSERT INTO `products` VALUES (97, 'Giày Vans UA Slip-On We Are Beautiful  VN0A4U382Q2', 1, 'Vans UA Slip-On We Are Beautiful thiết kế giày đơn giản tạo cảm giác thân thiện với màu sắc full trắng cùng họa tiết chữ được in sắc nét.\nHọa tiết chữ nổi bật phần đế giày với những font chữ cơ bản...', 'https://salt.tikicdn.com/cache/280x280/ts/product/94/3c/03/b14fc5e02f593738131991c192f38c2e.jpg', 1050000.00, 2, 1, 'giay-vans-ua-slip-on-we-are-beautiful-vn0a4u382q2-p91980405');
INSERT INTO `products` VALUES (98, 'Giày K-Swiss ST-529 Heritage', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/24/d1/71/1e10953ad27fdf21af537cd67a5ba9a7.jpg', 600000.00, 2, 1, 'giay-k-swiss-st-529-heritage-p133866078');
INSERT INTO `products` VALUES (99, 'Giày Converse Chuck Taylor All Star Mix Recycled Platform - 571669C', 1, '+ Thời gian bảo hành: 1 tháng (Giảm 0% -10%: hỗ trợ đổi trả và bảo hành. Giảm 20%: bảo hành nhưng không đổi trả. Giảm từ 30% trở lên: không đổi trả, không bảo hành).+ Bộ sản phẩm: Hộp giày, túi vải,...', 'https://salt.tikicdn.com/cache/280x280/ts/product/89/0a/c6/35e727f7f023958c887555a1f29c86ca.jpg', 1440000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-mix-recycled-platform-571669c-p164362053');
INSERT INTO `products` VALUES (100, 'Giày Converse Chuck Taylor All Star Lift Festival 570969C', 1, 'BST Converse Chuck Taylor All Star Lift Festival được cho ra mắt gồm các thiết kế trẻ trung sử dụng những mẫu họa tiết di sản, cổ điển cho sự cá tính và năng động.\nThiết kế cảm hứng từ chi tiết động...', 'https://salt.tikicdn.com/cache/280x280/ts/product/5c/da/2b/02bbd986e76e659878078f1a3689ddc0.jpg', 1134000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-lift-festival-570969c-p90679490');
INSERT INTO `products` VALUES (101, ' Giày Converse Chuck Taylor All Star Double Stack Lift My Story Hi Top 570321C', 1, 'Converse luôn tạo sự thu hút khi cho ra những sản phẩm nhiều ý nghĩa và độc đáo của riêng mình,Chuck Taylor All Star My Story thiết kế với màu sắc và chữ in như một bằng chứng về sự sáng tạo không...', 'https://salt.tikicdn.com/cache/280x280/ts/product/6f/ef/f2/a89a46ea3bdbfd9d2d88f1dcd114a179.jpg', 1134000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-double-stack-lift-my-story-hi-top-570321c-p91549956');
INSERT INTO `products` VALUES (102, 'Giày Vans Old Skool X SpongeBob Bikini Bubble VN0A38G19XC', 1, 'BST Vans X SpongeBob sự hợp tác Vans và SpongeBob SquarePants, loại bọt biển đáng nhớ nhất thế giới, giúp bạn thể hiện tình yêu của mình đối với những sinh vật tuyệt vời nhất dưới biển.\nVans X...', 'https://salt.tikicdn.com/cache/280x280/ts/product/00/bf/95/ecae92f8d17ab46f60aa882edc897403.jpg', 1820000.00, 2, 1, 'giay-vans-old-skool-x-spongebob-bikini-bubble-vn0a38g19xc-p107022297');
INSERT INTO `products` VALUES (103, 'Giày Converse Chuck Taylor All Star Move Street Utility - 572071C', 1, 'Một sự phá cách táo bạo trên năng lượng của Chuck cổ điển. Chuck Taylor All Star Move được thiết kế cho dựa trên yếu tố tự do di chuyển, tăng thêm chiều cao nhớ phần đế cao nhẹ nhàng và nổi bật.\nĐặc...', 'https://salt.tikicdn.com/cache/280x280/ts/product/65/3f/d1/22347b3d2282daa6fdcb98473bb10113.jpg', 1520000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-move-street-utility-572071c-p161973955');
INSERT INTO `products` VALUES (104, 'Giày Converse Chuck Taylor All Star 1970s Coral Pink Low Top 570788C', 1, 'Converse Chuck Taylor All Star 1970s Coral Pink cũng được làm từ chất liệu vải Canvas nhưng kỹ thuật dệt hoàn hảo khiến mặt giày đẹp như một bức tranh vừa bắt mắt vừa tạo ra sự ôm sát cho đôi chân...', 'https://salt.tikicdn.com/cache/280x280/ts/product/ee/70/c1/45c6175b64098ee95e3df29972e96e0e.jpg', 1330000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-1970s-coral-pink-low-top-570788c-p103512013');
INSERT INTO `products` VALUES (105, 'Giày Palladium GAO EVA HIGH BOOT - 97739-008-M', 1, 'Giày Palladium GAO EVA HIGH BOOT\nNHÂN ĐÔI “CHẤT” PHÁP VỚI BST GIỚI HẠN BOTH X PALLADIUM GAO EVA HIGH BOOTboth x Palladium - một bên là hãng thời trang mới nổi đang sáng giá trong làng mốt, một bên là...', 'https://salt.tikicdn.com/cache/280x280/ts/product/63/5d/bd/981890ca690d73d72985d7b618525d47.jpg', 7700000.00, 2, 1, 'giay-palladium-gao-eva-high-boot-97739-008-m-p166009761');
INSERT INTO `products` VALUES (106, 'Giày K-Swiss Women\'s Court PRO II CMF', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/84/c3/49/d919a0d38687167d7b1e6ba13540eaac.jpg', 600000.00, 2, 1, 'giay-k-swiss-women-s-court-pro-ii-cmf-p133864384');
INSERT INTO `products` VALUES (107, 'Giày Supra Aluminum BLACK-WHITE 05662-002-M', 1, 'Các dòng sản phẩm của SUPRA được biết đến bởi những thiết kế cổ cao đậm chất đường phố, dòng SUPRA Aluminum lại mang trong mình kiểu dáng cổ cao truyền thống với những tone màu cá tính, mạnh mẽ nhưng...', 'https://salt.tikicdn.com/cache/280x280/ts/product/28/d3/3c/89b4abbe4f173843dbaa135fb4fc9818.jpg', 600000.00, 2, 1, 'giay-supra-aluminum-black-white-05662-002-m-p111720916');
INSERT INTO `products` VALUES (108, 'Giày Converse Chuck Taylor All Star Digital Daze Hi Top 570311C', 1, 'BST Converse Chuck Taylor All Star Digital Daze hiết kế họa tiết da cá sấu lạ mắt với 2 phiên bản cổ cao và thấp mang đến nguồn năng lượng mạnh mẽ, cảm hứng thời trang tuyệt vời cho những tín đồ đam...', 'https://salt.tikicdn.com/cache/280x280/ts/product/6d/23/b8/ba726540cfdf846f9082a4f422c64dce.jpg', 1120000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-digital-daze-hi-top-570311c-p76065064');
INSERT INTO `products` VALUES (109, 'Giày Converse Chuck Taylor All Star Leopard Print Lift Hi Top 570915C', 1, 'Converse Chuck Taylor All Star Leopard Print Lift được thiết kế họa tiết da báo toàn bộ trên thân giày.\nThiết kế nổi bật với phần đế được double tạo sự mới lạ độc đáo, cá tính và năng động\nThiết kế...', 'https://salt.tikicdn.com/cache/280x280/ts/product/e9/21/62/fe00de512f2b8d5f395885d15885b817.jpg', 1260000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-leopard-print-lift-hi-top-570915c-p87656569');
INSERT INTO `products` VALUES (110, 'Giày K-Swiss ST129', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/33/8c/18/16562d775ac31e329e57a64268ba9623.jpg', 600000.00, 2, 1, 'giay-k-swiss-st129-p133865072');
INSERT INTO `products` VALUES (111, 'Giày K-Swiss Women\'s Cali Trail', 1, 'Được biết đến là một trong những dòng giày cao cấp của Mỹ, K-Swiss sở hữu một thiết kế bền bỉ, dẻo dai của thể thao nhưng không kém phần thời trang và cá tính. Chính điều này đã giúp những mẫu giày...', 'https://salt.tikicdn.com/cache/280x280/ts/product/f4/b5/85/accce6868eb9202fcfc76c0e4628a1d3.jpg', 900000.00, 2, 1, 'giay-k-swiss-women-s-cali-trail-p133864537');
INSERT INTO `products` VALUES (112, 'Giày Converse Chuck Taylor All Star Rave Foundational Canvas - A01705C', 1, 'Dựa trên dòng Chuck Taylor All Star đình đám, Converse đã mang đến item Converse Chuck Taylor All Star Rave cho những tín đồ thời trang trên toàn thế giới với những đường nét diu dàng, tinh tế. Với...', 'https://salt.tikicdn.com/cache/280x280/ts/product/07/43/17/d9c5d6f459623f7669bf18cd1742a814.jpg', 1550000.00, 2, 1, 'giay-converse-chuck-taylor-all-star-rave-foundational-canvas-a01705c-p187555569');

-- ----------------------------
-- Table structure for role_detail
-- ----------------------------
DROP TABLE IF EXISTS `role_detail`;
CREATE TABLE `role_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role_group` int(11) NULL DEFAULT NULL,
  `id_role` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_detail_role`(`id_role`) USING BTREE,
  INDEX `fk_role_detail_role_group`(`id_role_group`) USING BTREE,
  CONSTRAINT `fk_role_detail_role` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_role_detail_role_group` FOREIGN KEY (`id_role_group`) REFERENCES `role_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_detail
-- ----------------------------
INSERT INTO `role_detail` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for role_group
-- ----------------------------
DROP TABLE IF EXISTS `role_group`;
CREATE TABLE `role_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_group
-- ----------------------------
INSERT INTO `role_group` VALUES (1, 'customer');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'customer');
INSERT INTO `roles` VALUES (2, 'Info');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`, `id_role`) USING BTREE,
  INDEX `fk_user_role_role`(`id_role`) USING BTREE,
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (1, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_admin` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Hùng Trần', 'hunght001', '123', 'ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg', 1);
INSERT INTO `users` VALUES (2, 'Ngọc Lan', 'ngoclan1602', '123', 'ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/277.jpg', 1);
INSERT INTO `users` VALUES (3, 'Hùng Trần 02', 'hunght002', '123', 'ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1029.jpg', 0);
INSERT INTO `users` VALUES (4, 'Grady Haley', 'Halie37', '3bgX', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/694.jpg', 0);
INSERT INTO `users` VALUES (5, 'Garry Towne', 'Iva.Hintz36', '8KrF', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1085.jpg', 0);
INSERT INTO `users` VALUES (6, 'Dennis Kessler', 'Ali.Casper', 'ovDP', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/314.jpg', 0);
INSERT INTO `users` VALUES (7, 'Meghan Pouros PhD', 'Anjali5', 'g583', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/324.jpg', 0);
INSERT INTO `users` VALUES (8, 'Miss Leroy Jakubowski', 'Pete66', 'aBND', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/50.jpg', 0);
INSERT INTO `users` VALUES (9, 'Bill Balistreri', 'Jimmy51', '9XIt', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1194.jpg', 0);
INSERT INTO `users` VALUES (10, 'Jessie Rogahn', 'Abe87', 'g7r0', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/314.jpg', 0);
INSERT INTO `users` VALUES (11, 'Emma Morissette', 'Magdalena.Turner12', 'vlKh', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/884.jpg', 0);
INSERT INTO `users` VALUES (12, 'Lester Ebert', 'Vito84', 'l5GL', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/97.jpg', 0);
INSERT INTO `users` VALUES (13, 'Deborah Johnson', 'Broderick_Bahringer23', 'SvWX', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/878.jpg', 0);
INSERT INTO `users` VALUES (14, 'Lee Fritsch', 'Katheryn.Rosenbaum72', 'wf33', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1104.jpg', 0);
INSERT INTO `users` VALUES (15, 'Yolanda Schowalter', 'Marcel.Kohler48', 'pqvp', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/701.jpg', 0);
INSERT INTO `users` VALUES (16, 'Roderick Ankunding', 'Bridie22', 'C7W1', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/369.jpg', 0);
INSERT INTO `users` VALUES (17, 'Marguerite Windler Sr.', 'Lavon.Bahringer', 'twSg', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/98.jpg', 0);
INSERT INTO `users` VALUES (18, 'Sandra Howell III', 'Diego_Veum42', 'jv9R', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1029.jpg', 0);
INSERT INTO `users` VALUES (19, 'Stephen Lockman II', 'Horacio.Lind29', 'phIY', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/819.jpg', 1);
INSERT INTO `users` VALUES (20, 'Mrs. Brandy Grant', 'Taylor22', '0FBT', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/277.jpg', 1);
INSERT INTO `users` VALUES (21, 'Harry Stanton', 'Nina37', 'ycZQ', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/785.jpg', 1);
INSERT INTO `users` VALUES (22, 'Clifton Walter', 'Tracy60', 'z0k2', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg', 1);
INSERT INTO `users` VALUES (23, 'Wilbert Bashirian', 'Clemmie_Koelpin55', 'JQ_P', 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1238.jpg', 1);

SET FOREIGN_KEY_CHECKS = 1;
