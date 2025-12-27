# Hướng dẫn cài đặt Mobile Laptop Store

## Cài đặt nhanh

### 1. Yêu cầu hệ thống
- PHP >= 8.2
- Composer
- MySQL hoặc SQLite
- Web server (Apache/Nginx) hoặc PHP built-in server

### 2. Cài đặt

```bash
# Clone project (nếu có)
git clone <repository-url>
cd mobile-laptop-store

# Cài đặt dependencies
composer install

# Copy file cấu hình
cp .env.example .env

# Tạo application key
php artisan key:generate

# Cấu hình database trong .env
# Với SQLite (mặc định):
DB_CONNECTION=sqlite

# Hoặc với MySQL:
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mobile_laptop_store
DB_USERNAME=root
DB_PASSWORD=your_password

# Chạy migration và seeder
php artisan migrate:fresh --seed

# Tạo symbolic link cho storage
php artisan storage:link

# Khởi động server
php artisan serve
```

### 3. Truy cập website

- Website: http://127.0.0.1:8000
- Admin Panel: http://127.0.0.1:8000/admin

### 4. Tài khoản mặc định

**Admin:**
- Email: admin@example.com
- Password: password

**User:**
- Email: user@example.com  
- Password: password

## Cấu hình MySQL (nếu sử dụng)

### Tạo database:
```sql
CREATE DATABASE mobile_laptop_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Cập nhật .env:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mobile_laptop_store
DB_USERNAME=root
DB_PASSWORD=your_password
```

## Cấu hình production

### 1. Cấu hình môi trường
```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com
```

### 2. Optimize Laravel
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```

### 3. Cấu hình web server

**Apache (.htaccess đã có sẵn)**

**Nginx:**
```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /path/to/mobile-laptop-store/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

## Tính năng bổ sung

### 1. Cấu hình email
```env
MAIL_MAILER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=your-email@gmail.com
MAIL_FROM_NAME="${APP_NAME}"
```

### 2. Cấu hình file storage
```bash
# Tạo thư mục storage
mkdir -p storage/app/public/products
mkdir -p storage/app/public/categories

# Link storage
php artisan storage:link
```

### 3. Cấu hình queue (tùy chọn)
```env
QUEUE_CONNECTION=database
```

```bash
# Chạy queue worker
php artisan queue:work
```

## Troubleshooting

### Lỗi thường gặp:

1. **Permission denied**
```bash
chmod -R 755 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
```

2. **Key not found**
```bash
php artisan key:generate
```

3. **Database connection failed**
- Kiểm tra cấu hình database trong .env
- Đảm bảo MySQL service đang chạy
- Kiểm tra username/password

4. **Storage link not working**
```bash
php artisan storage:link
```

5. **View not found**
```bash
php artisan view:clear
php artisan config:clear
```

## Backup & Restore

### Backup database:
```bash
# MySQL
mysqldump -u root -p mobile_laptop_store > backup.sql

# SQLite
cp database/database.sqlite backup_database.sqlite
```

### Restore database:
```bash
# MySQL
mysql -u root -p mobile_laptop_store < backup.sql

# SQLite
cp backup_database.sqlite database/database.sqlite
```

## Cập nhật

```bash
# Pull code mới
git pull origin main

# Cập nhật dependencies
composer install --no-dev --optimize-autoloader

# Chạy migration
php artisan migrate

# Clear cache
php artisan config:clear
php artisan view:clear
php artisan route:clear

# Optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache
```