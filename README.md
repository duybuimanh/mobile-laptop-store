# Mobile Laptop Store - Hệ thống bán điện thoại và laptop

Đây là một hệ thống e-commerce hoàn chỉnh được xây dựng bằng Laravel để bán điện thoại di động và laptop.

## Tính năng chính

### Dành cho khách hàng (User)
- 🏠 Trang chủ với sản phẩm nổi bật
- 📱 Danh sách sản phẩm với bộ lọc và tìm kiếm
- 🔍 Chi tiết sản phẩm với thông số kỹ thuật
- 🛒 Giỏ hàng và quản lý đơn hàng
- 💳 Thanh toán (COD, chuyển khoản)
- 👤 Quản lý thông tin cá nhân
- 📋 Lịch sử đơn hàng

### Dành cho quản trị viên (Admin)
- 📊 Dashboard với thống kê tổng quan
- 📂 Quản lý danh mục sản phẩm
- 📦 Quản lý sản phẩm (CRUD)
- 🛍️ Quản lý đơn hàng và trạng thái
- 👥 Quản lý khách hàng
- 📈 Báo cáo doanh thu

## Công nghệ sử dụng

- **Backend**: Laravel 11
- **Database**: MySQL/SQLite
- **Frontend**: Bootstrap 5, Font Awesome
- **Authentication**: Laravel UI
- **File Storage**: Laravel Storage

## Cài đặt

### Yêu cầu hệ thống
- PHP >= 8.2
- Composer
- MySQL (hoặc SQLite)
- Node.js & NPM (tùy chọn)

### Các bước cài đặt

1. **Clone repository**
```bash
git clone <repository-url>
cd mobile-laptop-store
```

2. **Cài đặt dependencies**
```bash
composer install
```

3. **Cấu hình môi trường**
```bash
cp .env.example .env
php artisan key:generate
```

4. **Cấu hình database trong file .env**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mobile_laptop_store
DB_USERNAME=root
DB_PASSWORD=your_password
```

5. **Chạy migration và seeder**
```bash
php artisan migrate:fresh --seed
```

6. **Tạo symbolic link cho storage**
```bash
php artisan storage:link
```

7. **Khởi động server**
```bash
php artisan serve
```

## Tài khoản mặc định

Sau khi chạy seeder, bạn có thể đăng nhập với:

### Admin
- Email: `admin@example.com`
- Password: `password`

### User
- Email: `user@example.com`
- Password: `password`

## Cấu trúc dự án

```
mobile-laptop-store/
├── app/
│   ├── Http/Controllers/
│   │   ├── Admin/           # Controllers cho admin
│   │   ├── HomeController.php
│   │   ├── CartController.php
│   │   └── CheckoutController.php
│   ├── Models/              # Eloquent models
│   └── Http/Middleware/     # Custom middleware
├── database/
│   ├── migrations/          # Database migrations
│   └── seeders/            # Database seeders
├── resources/
│   └── views/
│       ├── admin/          # Admin views
│       ├── auth/           # Authentication views
│       ├── layouts/        # Layout templates
│       └── ...
└── routes/
    └── web.php             # Web routes
```

## Chức năng chi tiết

### Quản lý sản phẩm
- Thêm/sửa/xóa sản phẩm
- Upload nhiều hình ảnh
- Quản lý thông số kỹ thuật (JSON)
- Phân loại theo danh mục
- Quản lý tồn kho
- Giá gốc và giá khuyến mãi

### Quản lý đơn hàng
- Trạng thái đơn hàng: Chờ xử lý → Đang xử lý → Đã gửi → Đã giao → Đã hủy
- Thông tin giao hàng chi tiết
- Phương thức thanh toán
- Lịch sử đơn hàng

### Hệ thống giỏ hàng
- Thêm/xóa/cập nhật sản phẩm
- Tính toán tự động
- Kiểm tra tồn kho
- Session-based cho guest, database cho user đã đăng nhập

## API Routes

### Public Routes
- `GET /` - Trang chủ
- `GET /products` - Danh sách sản phẩm
- `GET /products/{slug}` - Chi tiết sản phẩm
- `GET /category/{slug}` - Sản phẩm theo danh mục

### User Routes (yêu cầu đăng nhập)
- `GET /cart` - Giỏ hàng
- `POST /cart/add` - Thêm vào giỏ hàng
- `GET /checkout` - Thanh toán
- `GET /orders` - Lịch sử đơn hàng

### Admin Routes (yêu cầu quyền admin)
- `GET /admin` - Dashboard
- `Resource /admin/categories` - Quản lý danh mục
- `Resource /admin/products` - Quản lý sản phẩm
- `Resource /admin/orders` - Quản lý đơn hàng

## Tùy chỉnh

### Thêm phương thức thanh toán
1. Cập nhật enum trong migration `orders` table
2. Thêm logic xử lý trong `CheckoutController`
3. Cập nhật form checkout

### Thêm trường sản phẩm
1. Tạo migration mới
2. Cập nhật model `Product`
3. Cập nhật form và view tương ứng

### Thêm tính năng email
1. Cấu hình mail trong `.env`
2. Tạo Mailable classes
3. Gửi email trong các event (đặt hàng, cập nhật trạng thái)

## Bảo mật

- CSRF protection
- SQL injection prevention (Eloquent ORM)
- XSS protection (Blade templating)
- Authentication & Authorization
- Input validation
- File upload security

## Performance

- Database indexing
- Eager loading relationships
- Image optimization
- Caching (có thể thêm Redis)
- Pagination

## Hỗ trợ

Nếu bạn gặp vấn đề hoặc có câu hỏi, vui lòng tạo issue trên GitHub repository.

## License

Dự án này được phát hành dưới [MIT License](LICENSE).