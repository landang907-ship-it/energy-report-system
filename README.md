# Hệ Thống Báo Cáo Năng Lượng

## Mô tả
Website quản lý và theo dõi tiêu thụ năng lượng (nước, điện, gas, hơi nước) được tối ưu hóa theo cấu trúc quản lý của nhà máy thực phẩm.

## Tính năng & Cấu trúc dữ liệu mới
Trang web đã được cập nhật đầy đủ các trường dữ liệu theo cấu trúc file Excel quản lý của nhà máy:

1. **Ca Làm Việc:** Hỗ trợ phân loại dữ liệu theo Ca Sáng / Ca Tối.
2. **Điểm Đo / Vị Trí:** Khớp hoàn toàn với các điểm đo thực tế:
   - **Nước (Water):** 7 vị trí (Phòng giặt B12, Khu dầu cọ B4.1, Phòng điện giải B4.2, Nấu tương B11.1, Nhà vệ sinh CĐ3 B17, Bồn nước nóng CĐ3, Rửa dụng cụ CD3 B11.2).
   - **Điện (Electric):** 33 vị trí (Trạm khí gas, Khu vực chiên CĐ2, Khu vực sấy nack CĐ2, Khu tạo bột CĐ1, Khu rửa gạo CĐ1,... từ MP2.2-01 đến MP2.11-03).
   - **Gas:** 4 dòng sản phẩm chính (Rong biển, Bánh tuyết, Sen bei, BBMM).
   - **Hơi Nước (Steam):** 5 công đoạn (Công đoạn 1 đến Công đoạn 3 kèm thiết bị).
3. **Quản lý dữ liệu:** Bảng dữ liệu hiển thị trực quan thêm cột Ca và Vị Trí, hỗ trợ đầy đủ thêm mới, sửa đổi (`saveData`, `editRecord`) và xóa bản ghi.
4. **Quản Lý Admin:** Bổ sung giao diện quản trị viên chuyên dụng chia thành 3 phần:
   - **Người Dùng:** Thêm, sửa, xóa tài khoản (Email, Tên, Vai trò: User/Admin).
   - **Vị Trí Đo:** Quản lý cấu hình các điểm đo năng lượng (Mã, Tên tiếng Việt, Tên tiếng Trung, Loại năng lượng, Khu vực).
   - **Đơn Giá:** Cấu hình đơn giá năng lượng (Loại, Giá VNĐ, Đơn vị).

## Công nghệ
- Frontend: HTML5, Bootstrap 5, Chart.js
- Backend: Supabase (PostgreSQL)

## Cấu hình Supabase
- Project ID: cvctuowohxagaeprwavl
- URL: https://cvctuowohxagaeprwavl.supabase.co

## Các bảng dữ liệu
- `water_readings` - Dữ liệu nước
- `electric_readings` - Dữ liệu điện
- `gas_readings` - Dữ liệu gas
- `steam_readings` - Dữ liệu hơi nước
- `users` - Dữ liệu tài khoản người dùng
- `locations` - Danh mục các vị trí đo năng lượng
- `pricing` - Đơn giá năng lượng theo loại

## Deploy
### GitHub Pages (Tên miền hiện tại)
Trang web đang chạy trực tuyến tại địa chỉ:
🔗 **[https://landang907-ship-it.github.io/energy-report-system/](https://landang907-ship-it.github.io/energy-report-system/)**

### Hướng dẫn đẩy cập nhật mới lên Web:
Mỗi khi bạn thay đổi code ở local và muốn cập nhật bản live:
1. Mở Terminal tại thư mục này.
2. Chạy lần lượt các lệnh sau:
   ```bash
   git add .
   git commit -m "Mô tả thay đổi của bạn"
   git push
   ```
3. Đợi khoảng 1 phút để GitHub Pages tự động cập nhật phiên bản mới nhất.

## Cập nhật lần cuối
2026-06-08 (Cập nhật cấu trúc Excel nhà máy thực phẩm)