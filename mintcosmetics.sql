-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 29, 2024 lúc 04:07 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mintcosmetics`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` int(11) NOT NULL DEFAULT 0,
  `birth` date NOT NULL DEFAULT '2021-01-22',
  `ngay_tao_tai_khoan` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""',
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image.jpg',
  `is_lock` tinyint(1) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `is_super`, `birth`, `ngay_tao_tai_khoan`, `phone`, `address`, `photo`, `is_lock`, `is_delete`) VALUES
(12, 'Admin', 'admin@gmail.com', '$2y$10$RoVn0CavV56fGY5J2lzsCea3BNCqILt85dNnUCKXaQsUM/5LRfssG', 0, '2003-07-09', '2024-06-24 23:49:45', '0985460336', 'Tuyên Quang', 'd1c38a09acc34845c6be3a127a5aacaf.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluanadmins`
--

CREATE TABLE `binhluanadmins` (
  `id` int(11) NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `noi_dung_binh_luan` text NOT NULL,
  `thoi_gian_binh_luan` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluans`
--

CREATE TABLE `binhluans` (
  `id` int(11) UNSIGNED NOT NULL,
  `noi_dung_binh_luan` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `thoi_gian_binh_luan` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluans`
--

INSERT INTO `binhluans` (`id`, `noi_dung_binh_luan`, `user_id`, `san_pham_id`, `thoi_gian_binh_luan`, `created_at`, `updated_at`) VALUES
(5, 'cái này dở quá', 2, 23, '2021-03-03 11:10:04', NULL, NULL),
(28, 'dùng tốt vão ò', 14, 1, '2024-06-27 21:33:40', NULL, NULL),
(29, '1231212', 14, 1, '2024-06-27 21:38:40', NULL, NULL),
(30, 'đâsdasd', 12, 58, '2024-06-27 21:57:56', NULL, NULL),
(31, 'test', 14, 58, '2024-06-27 22:27:34', NULL, NULL),
(32, 'tốt', 14, 57, '2024-06-28 21:55:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadons`
--

CREATE TABLE `chitiethoadons` (
  `hoa_don_id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadons`
--

INSERT INTO `chitiethoadons` (`hoa_don_id`, `san_pham_id`, `so_luong`, `don_gia`, `created_at`, `updated_at`) VALUES
(42, 58, 8, 325000, NULL, NULL),
(42, 59, 7, 120000, NULL, NULL),
(42, 60, 1, 135000, NULL, NULL),
(42, 61, 1, 50000, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgias`
--

CREATE TABLE `danhgias` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `muc_do_danh_gia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadons`
--

CREATE TABLE `hoadons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `dia_chi_nhan_hang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tinh_trang_thanh_toan` tinyint(4) NOT NULL DEFAULT 0,
  `ngay_tao` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadons`
--

INSERT INTO `hoadons` (`id`, `user_id`, `dia_chi_nhan_hang`, `tinh_trang_thanh_toan`, `ngay_tao`, `created_at`, `updated_at`) VALUES
(42, 14, '24B7/ Yên Phúc', 1, '2024-06-28 21:52:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanphams`
--

CREATE TABLE `loaisanphams` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_loai_san_pham` varchar(50) NOT NULL,
  `da_xoa` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanphams`
--

INSERT INTO `loaisanphams` (`id`, `ten_loai_san_pham`, `da_xoa`, `created_at`, `updated_at`) VALUES
(1, 'Make Up', 0, '2021-02-28 03:57:24', NULL),
(2, 'Skin Care', 0, '2024-06-26 03:52:50', NULL),
(3, 'Personal Care', 0, '2024-06-26 13:04:44', NULL),
(4, 'Beauty Tools', 0, '2024-06-26 13:05:00', NULL),
(32, 'test', 1, '2024-06-28 15:04:11', NULL),
(33, 'dasdasdasd', 1, '2024-06-28 15:05:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphams`
--

CREATE TABLE `sanphams` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_san_pham` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `loai_san_pham_id` int(10) UNSIGNED NOT NULL,
  `mo_ta_san_pham` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `hinh_anh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `ngay_dang` datetime NOT NULL DEFAULT current_timestamp(),
  `da_xoa` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphams`
--

INSERT INTO `sanphams` (`id`, `ten_san_pham`, `admin_id`, `loai_san_pham_id`, `mo_ta_san_pham`, `so_luong`, `don_gia`, `hinh_anh`, `ngay_dang`, `da_xoa`, `created_at`, `updated_at`) VALUES
(57, 'BODYMISS DARK NIGHT', 12, 3, 'BODYMISS DARK NIGHT BODYMISS DARK NIGHT BODYMISS DARK NIGHT BODYMISS DARK NIGHT BODYMISS DARK NIGHT&nbsp;', 100, 325000, '2ab56412b1163ee131e1246da0955bd1.jpeg', '2024-06-27 21:45:45', 0, NULL, NULL),
(58, 'BODYMISS STOP & STARE', 14, 3, 'BODYMISS STOP &amp; STARE BODYMISS STOP &amp; STARE BODYMISS STOP &amp; STARE BODYMISS STOP &amp; STARE BODYMISS STOP &amp; STARE&nbsp;', 92, 325000, 'f2fc990265c712c49d51a18a32b39f0c.jpg', '2024-06-27 21:47:56', 0, NULL, NULL),
(59, 'MAYBELLINE bút tạo khối', 12, 1, '<p>MAYBELLINE bút tạo khối&nbsp;MAYBELLINE bút tạo khối&nbsp;<span style=\"font-size: 1rem;\">MAYBELLINE bút tạo khối&nbsp;MAYBELLINE bút tạo khối&nbsp;</span><span style=\"font-size: 1rem;\">MAYBELLINE bút tạo khối&nbsp;MAYBELLINE bút tạo khối</span><br></p>', 113, 120000, '7f5d04d189dfb634e6a85bb9d9adf21e.jpg', '2024-06-27 21:49:24', 0, NULL, NULL),
(60, 'MAYBELLINE bút che khuyết điểm', 12, 1, 'MAYBELLINE bút che khuyết điểm&nbsp;MAYBELLINE bút che khuyết điểm MAYBELLINE bút che khuyết điểm&nbsp;MAYBELLINE bút che khuyết điểm MAYBELLINE bút che khuyết điểm&nbsp;MAYBELLINE bút che khuyết điểm', 149, 135000, 'f90f2aca5c640289d0a29417bcb63a37.jpg', '2024-06-27 21:51:23', 0, NULL, NULL),
(61, 'Chì kẻ mày', 12, 1, 'Chì kẻ mày&nbsp;Chì kẻ mày Chì kẻ mày&nbsp;Chì kẻ mày Chì kẻ mày&nbsp;Chì kẻ mày', 129, 50000, '4b0a59ddf11c58e7446c9df0da541a84.jpg', '2024-06-27 21:52:51', 0, NULL, NULL),
(62, 'dầu gội TRESemmé', 12, 3, '&nbsp;dầu gội TRESemmé&nbsp;&nbsp;dầu gội TRESemmé&nbsp;&nbsp;dầu gội TRESemmé&nbsp;&nbsp;dầu gội TRESemmé&nbsp;&nbsp;dầu gội TRESemmé&nbsp;&nbsp;dầu gội TRESemmé', 1000, 432000, 'a8849b052492b5106526b2331e526138.jpg', '2024-06-27 21:54:36', 0, NULL, NULL),
(63, 'Dầu gội bưởi The Cocoon', 12, 3, 'Dầu gội bưởi The Cocoon&nbsp;Dầu gội bưởi The Cocoon&nbsp;Dầu gội bưởi The Cocoon&nbsp;Dầu gội bưởi The Cocoon', 120, 375000, '8d7d8ee069cb0cbbf816bbb65d56947e.jpg', '2024-06-27 21:55:50', 0, NULL, NULL),
(64, 'Dầu gội khô', 12, 3, 'Dầu gội khô&nbsp;Dầu gội khô&nbsp;Dầu gội khô&nbsp;Dầu gội khô&nbsp;Dầu gội khô', 234, 274000, '59b90e1005a220e2ebc542eb9d950b1e.jpg', '2024-06-27 21:56:57', 0, NULL, NULL),
(65, 'HATOMUGI CREAM', 12, 2, '&nbsp;HATOMUGI CREAM&nbsp;HATOMUGI CREAM&nbsp;HATOMUGI CREAM&nbsp;HATOMUGI CREAM&nbsp;HATOMUGI CREAM', 234, 254000, '4c56ff4ce4aaf9573aa5dff913df997a.jpg', '2024-06-27 21:59:24', 0, NULL, NULL),
(66, 'Kem tẩy lông', 12, 2, 'Kem tẩy lông&nbsp;Kem tẩy lông&nbsp;Kem tẩy lông&nbsp;Kem tẩy lôngKem tẩy lông', 43, 124000, 'c15da1f2b5e5ed6e6837a3802f0d1593.jpeg', '2024-06-27 22:00:14', 0, NULL, NULL),
(67, 'Máy rửa mặt SEPHORA', 12, 4, 'máy rửa mặt SEPHORA&nbsp;máy rửa mặt SEPHORA máy rửa mặt SEPHORA&nbsp;máy rửa mặt SEPHORA máy rửa mặt SEPHORA&nbsp;máy rửa mặt SEPHORA&nbsp;', 23, 1352000, '4b0250793549726d5c1ea3906726ebfe.jpeg', '2024-06-27 22:02:00', 0, NULL, NULL),
(68, 'Máy rửa mặt FOREO', 12, 4, 'Máy rửa mặt FOREO&nbsp;Máy rửa mặt FOREO&nbsp;Máy rửa mặt FOREO&nbsp;Máy rửa mặt FOREO&nbsp;Máy rửa mặt FOREO&nbsp;Máy rửa mặt FOREO', 23, 2357000, '084b6fbb10729ed4da8c3d3f5a3ae7c9.jpg', '2024-06-27 22:03:41', 0, NULL, NULL),
(69, 'phấn phủ innisfree', 12, 1, 'sản phẩm bla blo blee blung', 456584, 500000, '15de21c670ae7c3f6f3f1f37029303c9.jpg', '2024-06-28 22:02:59', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL DEFAULT '2021-01-22',
  `ngay_tao_tai_khoan` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image.jpg',
  `is_lock` tinyint(1) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `birth`, `ngay_tao_tai_khoan`, `phone`, `address`, `photo`, `is_lock`, `is_delete`) VALUES
(1, 'khanh', 'khanh@gmail.com', '09072003', '2003-09-07', '2024-06-24 18:02:56', '0985460336', '', '', 0, 0),
(14, 'tester', 'test@gmail.com', '$2y$10$sdBWwmFfHYM9dPHKHN7BZu5wtQ5eR0MGqCo9JfmJsd2CXzPjp.gt2', '2021-01-22', '2024-06-25 17:18:06', '0989732942', '24B7/ Yên Phúc', 'f9a40a4780f5e1306c46f1c8daecee3b.jpg', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `binhluanadmins`
--
ALTER TABLE `binhluanadmins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `san_pham_id` (`san_pham_id`) USING BTREE;

--
-- Chỉ mục cho bảng `binhluans`
--
ALTER TABLE `binhluans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binhluans_user_id_foreign` (`user_id`),
  ADD KEY `san_pham_id` (`san_pham_id`);

--
-- Chỉ mục cho bảng `chitiethoadons`
--
ALTER TABLE `chitiethoadons`
  ADD PRIMARY KEY (`hoa_don_id`,`san_pham_id`),
  ADD KEY `chitiethoadons_san_pham_id_foreign` (`san_pham_id`),
  ADD KEY `chitiethoadons_hoa_don_id_foreign` (`hoa_don_id`);

--
-- Chỉ mục cho bảng `danhgias`
--
ALTER TABLE `danhgias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `san_pham_id` (`san_pham_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `hoadons`
--
ALTER TABLE `hoadons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `loaisanphams`
--
ALTER TABLE `loaisanphams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanphams`
--
ALTER TABLE `sanphams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanphams_admin_id_foreign` (`admin_id`),
  ADD KEY `loai_san_pham_id` (`loai_san_pham_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `binhluanadmins`
--
ALTER TABLE `binhluanadmins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binhluans`
--
ALTER TABLE `binhluans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `danhgias`
--
ALTER TABLE `danhgias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hoadons`
--
ALTER TABLE `hoadons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `loaisanphams`
--
ALTER TABLE `loaisanphams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `sanphams`
--
ALTER TABLE `sanphams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadons`
--
ALTER TABLE `chitiethoadons`
  ADD CONSTRAINT `chitiethoadons_ibfk_1` FOREIGN KEY (`hoa_don_id`) REFERENCES `hoadons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
