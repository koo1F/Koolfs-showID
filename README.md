# Koolfs Show ID

A lightweight and configurable script for displaying player IDs above their heads in a FiveM ESX server.  
Supports toggle key and command, speaking color, and display distance customization.

> 🇹🇭 สคริปต์โชว์ ID เหนือหัวผู้เล่นในเซิร์ฟเวอร์ FiveM (ESX) พร้อมตั้งค่าระยะ ปุ่ม และสีได้อย่างอิสระ

---

## 🔧 Features

- Toggle show/hide player IDs with a key (`F5`) or chat command (`/ids`)
- Configurable display distance
- Color indication for when players are speaking
- Easy to configure via `config.lua`

---

## ⚙️ Configuration (`config.lua`)

```lua
Config.showIds = false
Config.displayDistance = 20.0
Config.toggleKey = "F5"
Config.commands = "ids"
Config.talkingColor = {0, 255, 136}
Config.normalColor = {255, 255, 255}
