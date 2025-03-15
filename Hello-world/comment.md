## Regular Comments (คอมเมนต์ทั่วไป)

 **วัตถุประสงค์** :

* ใช้อธิบายโค้ดสำหรับผู้พัฒนาหรือตัวคุณเอง
* ใช้อธิบายรายละเอียดการทำงานภายใน
* ใช้เพิ่ม TODO หรือหมายเหตุชั่วคราว

 **ตัวอย่างการใช้งาน** :

```zig
// signed so we can represent pre-1970
seconds: i64,

// normal comment
```

## Doc Comments (คอมเมนต์สำหรับสร้างเอกสาร)

 **วัตถุประสงค์** :

* ใช้สร้างเอกสารประกอบ API (documentation)
* ถูกนำไปใช้โดยเครื่องมือสร้างเอกสาร
* แสดงใน IDE tooltips และข้อมูลช่วยเติมอัตโนมัติ
* รองรับการจัดรูปแบบด้วย markdown

**ตัวอย่างการใช้งาน** :

```zig
/// A structure for storing a timestamp, with nanosecond precision.
const Timestamp = struct {
    /// The number of seconds since the epoch.
    seconds: i64,
};
```
