# 🚀 HƯỚNG DẪN DEPLOY LÊN GITHUB PAGES

## BƯỚC 1: Tạo Repository trên GitHub

1. Truy cập: **https://github.com/new**
2. **Repository name**: `energy-report-system`
3. Chọn **Public**
4. Click **Create repository**

---

## BƯỚC 2: Upload Files lên GitHub

### Cách 1: Qua trình duyệt (Dễ nhất)
1. Trên trang GitHub repository mới tạo
2. Click **uploading an existing file**
3. Kéo thả các file sau vào:
   - `index.html`
   - `supabase-config.js` (nếu có)
4. Click **Commit changes**

### Cách 2: Qua GitHub Desktop
1. Download **GitHub Desktop**: https://desktop.github.com/
2. Clone repository vừa tạo
3. Copy file `index.html` vào thư mục repository
4. Commit và Push

---

## BƯỚC 3: Bật GitHub Pages

1. Trên trang GitHub repository
2. Vào **Settings** (Tab cuối)
3. Scroll xuống mục **GitHub Pages**
4. **Source**: Chọn **Deploy from a branch**
5. **Branch**: Chọn **main**, thư mục **/ (root)**
6. Click **Save**

---

## BƯỚC 4: Lấy URL Public

⏳ Đợi 1-2 phút để GitHub Pages build

🌐 URL của bạn sẽ là:
```
https://[your-username].github.io/energy-report-system/
```

**Ví dụ**: `https://landadev.github.io/energy-report-system/`

---

## 📝 CHECKLIST

- [ ] Đã tạo repository trên GitHub
- [ ] Đã upload file `index.html`
- [ ] Đã bật GitHub Pages trong Settings
- [ ] Đã chạy SQL schema trên Supabase Dashboard
- [ ] Đã test website với URL mới

---

## ⚠️ LƯU Ý QUAN TRỌNG

Sau khi có URL mới, bạn cần cập nhật **Supabase CORS**:
1. Truy cập: https://supabase.com/dashboard/project/cvctuowohxagaeprwavl
2. Vào **Settings** → **API**
3. Trong mục **CORS**, thêm URL mới của bạn:
   - `https://[your-username].github.io`

---

## ✅ WEBSITE SẼ HOẠT ĐỘNG SAU KHI:

1. ✅ Upload files lên GitHub
2. ✅ Bật GitHub Pages
3. ✅ Chạy SQL schema (`supabase-schema-public.sql`) trên Supabase
4. ✅ Cập nhật CORS trong Supabase (thêm URL GitHub Pages)

---

**Chúc bạn thành công!** 🎉