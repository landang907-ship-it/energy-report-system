# 📌 HƯỚNG DẪN DEPLOY WEBSITE LÊN INTERNET

## PHƯƠNG ÁN 1: NETLIFY (Nhanh nhất - 2 phút)

### Bước 1: Truy cập Netlify
1. Mở trình duyệt → Truy cập: **https://app.netlify.com/drop**
2. Đăng nhập (có thể dùng GitHub, Google)

### Bước 2: Upload file
1. Kéo thả file `index.html` từ Desktop vào ô upload
2. Đợi 10-30 giây
3. **Netlify sẽ tự động tạo URL public!**

### Kết quả:
- Website online ngay lập tức
- URL dạng: `https://random-name.netlify.app`
- Có thể custom domain miễn phí

---

## PHƯƠNG ÁN 2: VERCEL

### Bước 1: Truy cập Vercel
1. Truy cập: **https://vercel.com**
2. Đăng nhập với GitHub

### Bước 2: Import Project
1. Click **"Add New"** → **"Project"**
2. Chọn **"Import Third-Party Git Repository"** 
3. Hoặc kéo thả folder chứa index.html

### Bước 3: Deploy
1. Vercel tự nhận diện HTML
2. Click **Deploy**
3. URL: `https://project-name.vercel.app`

---

## PHƯƠNG ÁN 3: SURGE.SH (Dùng Terminal)

### Bước 1: Cài Surge
```bash
npm install -g surge
```

### Bước 2: Deploy
```bash
cd C:\Users\landa\Desktop
surge .
```
- Tạo tài khoản (email/password)
- URL: `https://project-name.surge.sh`

---

## 📝 CÁC BƯỚC ĐÃ HOÀN THÀNH

### 1. ✅ Website đã sẵn sàng
- File: `C:\Users\landa\Desktop\index.html`
- Kết nối Supabase: **cvctuowohxagaeprwavl**
- Responsive iPhone X - 17
- Song ngữ Việt-Trung

### 2. ✅ Database Schema
- File: `C:\Users\landa\Desktop\supabase-schema.sql`
- Cần chạy trên Supabase Dashboard

---

## 🔧 BƯỚC TIẾP THEO SAU KHI DEPLOY

### 1. Chạy Database Schema
1. Truy cập: https://supabase.com/dashboard/project/cvctuowohxagaeprwavl
2. Vào **SQL Editor**
3. Copy file `supabase-schema.sql` vào
4. Click **Run**

### 2. Cập nhật CORS (nếu cần)
Vào Supabase Dashboard → Settings → API → Cấu hình allowed origins

---

## 📞 NẾU GẶP LỖI

### Lỗi CORS
```
Access to fetch at 'https://cvctuowohxagaeprwavl.supabase.co' 
from origin 'https://...' has been blocked by CORS policy
```

**Cách sửa:**
1. Supabase Dashboard → Authentication → URL Configuration
2. Site URL: Điền URL website của bạn
3. Redirect URLs: Thêm `*`

### Lỗi 404
Kiểm tra file index.html đã được upload đúng cách

---

## ✅ CHECKLIST TRƯỚC KHI SỬ DỤNG

- [ ] Đã deploy website lên hosting
- [ ] Đã chạy SQL schema trên Supabase
- [ ] Đã cấu hình CORS đúng
- [ ] Test thử nhập và lưu dữ liệu
- [ ] Website hiển thị "Online" (màu xanh)

---

## 🌐 WEBSITE SẼ CÓ URL DẠNG:

| Provider | URL mẫu |
|----------|----------|
| Netlify | `https://energie-report.netlify.app` |
| Vercel | `https://energie-report.vercel.app` |
| Surge | `https://energie-report.surge.sh` |
| GitHub Pages | `https://username.github.io/energie-report/` |

---

**Sẵn sàng để online!** 🚀