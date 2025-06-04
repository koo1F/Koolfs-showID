Config = {}

-- แสดงไอดีของผู้เล่นหรือไม่ (true = แสดง, false = ไม่แสดง)
-- Display player IDs (true = show, false = hide)
Config.showIds = false

-- ระยะที่สามารถมองเห็นไอดีของผู้เล่น (หน่วย: เมตร)
-- Maximum distance to display player IDs (unit: meters)
Config.displayDistance = 20.0

-- ปุ่มที่ใช้เปิด/ปิดการแสดงไอดี (ค่าเริ่มต้น: F5)
-- Keyboard key used to toggle ID display (default: F5)
Config.toggleKey = "F5"

-- คำสั่งในแชทที่ใช้เปิด/ปิดการแสดงไอดี
-- Chat command to toggle ID display
Config.commands = "ids"

-- สีของชื่อผู้เล่นขณะพูด (ค่าเป็น RGB)
-- RGB color of player name when speaking
Config.talkingColor = {0, 255, 136}

-- สีของชื่อผู้เล่นขณะไม่ได้พูด
-- RGB color of player name when not speaking
Config.normalColor = {255, 255, 255}