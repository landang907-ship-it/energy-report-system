-- ============================================
-- SUPABASE DATABASE SCHEMA - FIXED VERSION
-- Chạy lại nếu bị lỗi "already exists"
-- ============================================

-- Xóa policies cũ nếu có
DROP POLICY IF EXISTS "Enable read for authenticated users" ON water_readings;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON water_readings;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON water_readings;
DROP POLICY IF EXISTS "Enable read for authenticated users" ON electric_readings;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON electric_readings;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON electric_readings;
DROP POLICY IF EXISTS "Enable read for authenticated users" ON gas_readings;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON gas_readings;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON gas_readings;
DROP POLICY IF EXISTS "Enable read for authenticated users" ON steam_readings;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON steam_readings;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON steam_readings;
DROP POLICY IF EXISTS "Enable read for all users" ON locations;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON locations;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON locations;

-- Tạo lại policies cho water_readings
CREATE POLICY "water_read_all" ON water_readings FOR SELECT USING (true);
CREATE POLICY "water_read_insert" ON water_readings FOR INSERT WITH CHECK (true);
CREATE POLICY "water_read_update" ON water_readings FOR UPDATE USING (true);

-- Tạo lại policies cho electric_readings
CREATE POLICY "electric_read_all" ON electric_readings FOR SELECT USING (true);
CREATE POLICY "electric_read_insert" ON electric_readings FOR INSERT WITH CHECK (true);
CREATE POLICY "electric_read_update" ON electric_readings FOR UPDATE USING (true);

-- Tạo lại policies cho gas_readings
CREATE POLICY "gas_read_all" ON gas_readings FOR SELECT USING (true);
CREATE POLICY "gas_read_insert" ON gas_readings FOR INSERT WITH CHECK (true);
CREATE POLICY "gas_read_update" ON gas_readings FOR UPDATE USING (true);

-- Tạo lại policies cho steam_readings
CREATE POLICY "steam_read_all" ON steam_readings FOR SELECT USING (true);
CREATE POLICY "steam_read_insert" ON steam_readings FOR INSERT WITH CHECK (true);
CREATE POLICY "steam_read_update" ON steam_readings FOR UPDATE USING (true);

-- Tạo lại policies cho locations
CREATE POLICY "locations_read_all" ON locations FOR SELECT USING (true);
CREATE POLICY "locations_insert_all" ON locations FOR INSERT WITH CHECK (true);
CREATE POLICY "locations_update_all" ON locations FOR UPDATE USING (true);

-- Xóa dữ liệu cũ trong locations và insert lại
DELETE FROM locations;

-- Insert locations water
INSERT INTO locations (code, name_vi, name_cn, energy_type, area) VALUES
('B12-W', 'Phòng giặt B12', '洗衣房', 'water', 'B12'),
('B4.1-W', 'Khu dầu cọ B4.1', '棕榈油热水', 'water', 'B4.1'),
('B4.2-W', 'Phòng điện giải B4.2', '电解室', 'water', 'B4.2'),
('B11.1-W', 'Nấu tương B11.1', '煮酱', 'water', 'B11.1'),
('B17-W', 'Nhà vệ sinh CĐ3 B17', '三工程厕所', 'water', 'B17'),
('CD3-W-OUT', 'Bồn Nước nóng CĐ3 (Ngoài)', '热水缸(外)', 'water', 'CĐ3'),
('B11.2-W', 'Rửa dụng cụ CD3 B11.2', '清洗区(内)', 'water', 'B11.2');

-- Insert locations electric
INSERT INTO locations (code, name_vi, name_cn, energy_type, area) VALUES
('MP2.2-01', 'Trạm khí gas', '天然气站', 'electric', 'MP2.2'),
('MP2.2-02', 'Khu vực chiên CĐ2', '油炸区', 'electric', 'MP2.2'),
('MP2.3-01', 'Khu vực sấy nack CĐ2', '干烧区', 'electric', 'MP2.3'),
('MP2.3-02', 'Khu vực nướng CĐ2', '烘烤区', 'electric', 'MP2.3'),
('MP2.3-03', 'Khu sấy phôi nack', '胚料烘干', 'electric', 'MP2.3'),
('MP2.3-05', 'Máy sắp phôi CĐ2', '排列机', 'electric', 'MP2.3'),
('MP2.3-06', 'Máy sấy rong biển CĐ2', '海苔烘干', 'electric', 'MP2.3'),
('MP2.3-07', 'Khu đóng gói rong biển CĐ3', '包装区', 'electric', 'MP2.3'),
('MP2.3-08', 'Sấy phôi CĐ2', '胚料干燥', 'electric', 'MP2.3'),
('MP2.4-01', 'Tủ điện ổ cắm sửa chữa', '插座柜', 'electric', 'MP2.4'),
('MP2.4-02', 'Sấy bánh tuyết CĐ2', '雪饼烘干', 'electric', 'MP2.4'),
('MP2.4-03', 'Sấy bánh mỏng CĐ2', '薄饼烘干', 'electric', 'MP2.4'),
('MP2.4-04', 'Phòng nấu tương CĐ2', '煮酱区', 'electric', 'MP2.4'),
('MP2.4-05', 'Máy lạnh CĐ3', '空调', 'electric', 'MP2.4'),
('MP2.4-06', 'Đóng gói nack CĐ3', '包装', 'electric', 'MP2.4'),
('MP2.4-08', 'Sấy bánh phô mai, bánh đậu CĐ2', '芝士饼烘干', 'electric', 'MP2.4'),
('MP2.5-02', 'Đóng gói sen bei CĐ3', '仙贝包装', 'electric', 'MP2.5'),
('MP2.5-05', 'Máy hút chân không CĐ2', '真空机', 'electric', 'MP2.5'),
('MP2.5-06', 'Đóng gói bánh tuyết CĐ3', '雪饼包装', 'electric', 'MP2.5'),
('MP2.5-07', 'Đóng gói BBMM CĐ3', '米果包装', 'electric', 'MP2.5'),
('MP2.6-01', 'Khu đóng gói phía ngoài CĐ3', '外包装', 'electric', 'MP2.6'),
('MP2.6-02', 'Máy lạnh VP bánh gạo + phòng thay đồ CĐ3', '空调(办)', 'electric', 'MP2.6'),
('MP2.6-03', 'AHU máy lạnh CĐ2', '空调机组', 'electric', 'MP2.6'),
('MP2.6-04', 'Máy lạnh lưu phôi CĐ1', '胚料冷藏', 'electric', 'MP2.6'),
('MP2.6-05', 'Kho lạnh + phòng đường CĐ2', '冷库', 'electric', 'MP2.6'),
('MP2.6-07', 'Quạt hút đóng gói CĐ3', '排气扇', 'electric', 'MP2.6'),
('MP2.7-01', 'Khu tạo bột CĐ1', '制粉区', 'electric', 'MP2.7'),
('MP2.7-02', 'Khu rửa gạo CĐ1', '洗米区', 'electric', 'MP2.7'),
('MP2.7-03', 'Khu vực nghiền CĐ1', '粉碎区', 'electric', 'MP2.7'),
('MP2.7-05', 'Khu hấp CĐ1', '蒸练区', 'electric', 'MP2.7'),
('MP2.7-06', 'Sấy phôi CĐ1', '胚料干燥', 'electric', 'MP2.7'),
('MP2.11-01', 'Máy tạo bột khu 2 CĐ1', '制粉机二区', 'electric', 'MP2.11'),
('MP2.11-02', 'Khu hấp thành hình CĐ1', '蒸练成型', 'electric', 'MP2.11'),
('MP2.11-03', 'Bánh cuộn (Đóng gói)', '蛋糕卷', 'electric', 'MP2.11');

-- Insert locations gas
INSERT INTO locations (code, name_vi, name_cn, energy_type, area) VALUES
('GAS-HH', 'Công đoạn 2 - Rong biển', '厚烧', 'gas', 'CĐ2'),
('GAS-XB', 'Công đoạn 2 - Bánh tuyết', '雪饼', 'gas', 'CĐ2'),
('GAS-SB', 'Công đoạn 2 - Sen bei', '仙贝', 'gas', 'CĐ2'),
('GAS-BBMM', 'Công đoạn 2 - BBMM', '米果', 'gas', 'CĐ2');

-- Insert locations steam
INSERT INTO locations (code, name_vi, name_cn, energy_type, area) VALUES
('STM-01', 'Công đoạn 1 (5#)', '一工程', 'steam', 'CĐ1'),
('STM-02', 'Công đoạn 2 - Bánh tuyết (1#)', '雪饼', 'steam', 'CĐ2'),
('STM-03', 'Công đoạn 2 - Rong biển (2#)', '厚烧', 'steam', 'CĐ2'),
('STM-04', 'Công đoạn 2 - SNACK (3#)', '小小酥', 'steam', 'CĐ2'),
('STM-05', 'Công đoạn 3 - Máy khử ẩm (4#)', '除湿机', 'steam', 'CĐ3');

-- Kết quả
SELECT '✅ Database đã được cập nhật thành công!' as status;