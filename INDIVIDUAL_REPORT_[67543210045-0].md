# INDIVIDUAL_REPORT_[67543210045-0].md

## ข้อมูลผู้จัดทำ
- ชื่อ-นามสกุล: [นายวีราวัชร์ สุประดิษฐ์พงศ์]
- รหัสนักศึกษา: [67543210045-0]
- กลุ่ม: [3]

## ขอบเขตงานที่รับผิดชอบ
รับผิดชอบหลักในส่วนของ Backend Services และโครงสร้างระบบ Microservices รวมถึงการพัฒนา Auth Service, Task Service, การออกแบบฐานข้อมูล และการตั้งค่า Docker Compose สำหรับการรันระบบทั้งหมด

## สิ่งที่ได้ดำเนินการด้วยตนเอง
อธิบายสิ่งที่ลงมือพัฒนาด้วยตนเองโดยสรุป เช่น
- พัฒนา Auth Service สำหรับระบบ Login และ JWT Authentication
- พัฒนา Task Service สำหรับจัดการ Task (Create, Read, Update, Delete)
- ออกแบบ Database Schema สำหรับ Users, Tasks และ Logsพัฒนา frontend page
- ตั้งค่า Nginx Reverse Proxy และ HTTPS
- ตั้งค่า Docker Compose เพื่อรวม services ให้ทำงานร่วมกัน

## ปัญหาที่พบและวิธีการแก้ไข
พบปัญหาในการเชื่อมต่อระหว่าง services และการตรวจสอบ JWT ระหว่าง API ซึ่งต้องปรับการตั้งค่า route และ middleware ให้สามารถตรวจสอบ token ได้ถูกต้องก่อนเข้าถึง service ต่าง ๆ

## สิ่งที่ได้เรียนรู้จากงานนี้
ได้เรียนรู้การออกแบบระบบแบบ Microservices Architecture การใช้ API Gateway (Nginx) การจัดการ JWT Authentication และการใช้ Docker Compose เพื่อรวมหลาย services ให้ทำงานร่วมกันในระบบเดียว

## แนวทางการพัฒนาต่อไปใน Set 2
สามารถพัฒนาต่อโดยเพิ่ม Register API, แยก User Service ออกจาก Auth Service และปรับปรุงโครงสร้างระบบให้ใช้ Database per Service แทน Shared Database รวมถึงเตรียมระบบสำหรับการ deploy บน clou