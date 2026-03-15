# TEAM_SPLIT.md

## ข้อมูลกลุ่ม
- กลุ่มที่: [SEC1 GROUP03]
- รายวิชา: ENGSE207 Software Architecture

## รายชื่อสมาชิก
- [67543210045-0] [นายวีราวัชร์ สุประดิษฐ์พงศ์]
- [67543210016-1] [นายชยานันท์   เพชรรักษ์]

## การแบ่งงานหลัก

### สมาชิกคนที่ 1: [นายวีราวัชร์ สุประดิษฐ์พงศ์]
รับผิดชอบงานหลักดังต่อไปนี้
- [รับผิดชอบส่วนของ Backend Services และ System Configuration]
- [หน้าที่หลัก
พัฒนา Auth Service
ระบบ Login
JWT Authentication
Verify Token API
User Info API
พัฒนา Task Service
API สำหรับจัดการ Task
Create / Read / Update / Delete Tasks
ตรวจสอบ JWT ก่อนเข้าถึง API
ออกแบบ Database Schema
ตาราง Users
ตาราง Tasks
ตาราง Logs
ตั้งค่า Docker Compose
กำหนด container services
เชื่อมต่อ services กับ database]

### สมาชิกคนที่ 2: [นายชยานันท์   เพชรรักษ์]
รับผิดชอบงานหลักดังต่อไปนี้
- [รับผิดชอบส่วนของ Frontend, Logging และ Integration ของระบบ]
- [หน้าที่หลัก
พัฒนา Frontend Interface
หน้า Login
หน้า Task Board
หน้า Log Dashboard
เชื่อมต่อ Frontend กับ Backend API
เรียกใช้งาน Auth API
เรียกใช้งาน Task API
จัดการ JWT Token ในฝั่ง client
พัฒนา Log Service Integration
ส่ง log จาก service ไปยัง Log Service
แสดงผล log ผ่าน Log Dashboard
จัดเตรียม Screenshots และ Documentation
เก็บภาพการทดสอบระบบ
จัดโครงสร้าง README]

## งานที่ดำเนินการร่วมกัน
- [ทดสอบ API ผ่าน Browser และ Postman]
- [ตรวจสอบการทำงานของ HTTPS และ JWT]
- [จัดทำ README.md และ จัดเตรียม screenshots สำหรับการส่งงาน]

## เหตุผลในการแบ่งงาน
เพราะนายวีราวัชร์ รับผิดชอบงานส่วนมากและจัดการทั้ง backend ออกมาใช้งานได้ และทำระบบเกือบทั้งหมด นายชยานันท์ที่มาช่วยภายหลังเลยได้แค่ซัพพอร์ตเพื่อนในงานส่วนอื่น

## สรุปการเชื่อมโยงงานของสมาชิก
ในโปรเจกต์นี้ นายวีราวัชร์ สุประดิษฐ์พงศ์ เป็นผู้รับผิดชอบหลักในการพัฒนาโครงสร้างระบบ Microservices และ Backend Services ซึ่งเป็นส่วนสำคัญของระบบ เช่น Auth Service, Task Service และการตั้งค่า Docker Compose

ส่วน นายชยานันท์ เพชรรักษ์ ได้เข้ามาช่วยสนับสนุนในส่วนของการทดสอบระบบ การตรวจสอบการทำงานของ API การจัดทำเอกสาร README และการเตรียม screenshots สำหรับการนำเสนอและการส่งงาน รวมถึงช่วยตรวจสอบการเชื่อมต่อระหว่าง Frontend และ Backend ให้ทำงานได้ถูกต้อง
