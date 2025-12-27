-- Tạo database cho Mobile Laptop Store
CREATE DATABASE IF NOT EXISTS mobile_laptop_store 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Sử dụng database
USE mobile_laptop_store;

-- Tạo user cho database (tùy chọn)
-- CREATE USER 'mobile_store_user'@'localhost' IDENTIFIED BY 'your_secure_password';
-- GRANT ALL PRIVILEGES ON mobile_laptop_store.* TO 'mobile_store_user'@'localhost';
-- FLUSH PRIVILEGES;

-- Hiển thị thông tin database
SELECT 'Database mobile_laptop_store đã được tạo thành công!' as message;