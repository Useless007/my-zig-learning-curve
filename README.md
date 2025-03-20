
# Zig Learning Repository

คู่มือเรียนภาษา Zig สำหรับผู้เริ่มต้น! Repository นี้รวบรวมตัวอย่างโค้ด แบบฝึกหัด และบันทึกที่เกี่ยวกับการเรียนรู้ภาษา Zig

## การติดตั้งและเริ่มต้นใช้งาน

1. ติดตั้ง Zig จาก [ziglang.org](https://ziglang.org/download/)
2. คำสั่งพื้นฐาน:
   ```
   # คอมไพล์และรันไฟล์ .zig
   zig run hello.zig

   # คอมไพล์เป็นไฟล์ executable
   zig build-exe hello.zig

   # คอมไพล์แบบเพิ่มประสิทธิภาพ
   zig build-exe hello.zig -O ReleaseFast
   ```

## โครงสร้างของ Repository

```
README.md                # คุณกำลังอ่านไฟล์นี้อยู่
Hello-world/             # ตัวอย่างพื้นฐานเกี่ยวกับ Zig
  ├─ hello.zig           # ตัวอย่างแรกของโปรแกรม Zig
  ├─ hello-again.zig     # ตัวอย่างการแสดงผลแบบง่ายๆ
  ├─ string_literals.zig # การจัดการกับสตริงใน Zig
  ├─ values.zig          # ชนิดข้อมูลพื้นฐานใน Zig
  ├─ doc_comments.zig    # การใช้งาน Doc Comments
  ├─ comment.md          # อธิบายเกี่ยวกับการใช้ comments
  ├─ note.md             # บันทึกเกี่ยวกับคุณสมบัติของ Zig
  └─ FormatSpecifiers.md # อธิบายเกี่ยวกับ Format Specifiers
practice/                # โค้ดที่ใช้ฝึกหัด
  └─ printFunc.zig       # ตัวอย่างการใช้ฟังก์ชัน print
week1/                   # แบบฝึกหัดแยกตามสัปดาห์
  └─ format_exercise.zig # แบบฝึกหัดเกี่ยวกับ Format Specifiers
```

## เนื้อหาที่ควรศึกษาตามลำดับ

### 1. พื้นฐานของ Zig

- [hello.zig](Hello-world/hello.zig) - เริ่มต้นกับการเขียนโปรแกรมแรกใน Zig และการใช้ `try` กับ `!void`
- [hello-again.zig](Hello-world/hello-again.zig) - รูปแบบที่ง่ายกว่าในการแสดงผลข้อความ
- [note.md](Hello-world/note.md) - อธิบายเกี่ยวกับ comments และการใช้ `!` กับ types

### 2. ชนิดข้อมูลและการแสดงผล

- [values.zig](Hello-world/values.zig) - ทำความรู้จักกับชนิดข้อมูลพื้นฐาน, optional, และ error union
- [string_literals.zig](Hello-world/string_literals.zig) - วิธีการทำงานกับสตริงใน Zig
- [FormatSpecifiers.md](Hello-world/FormatSpecifiers.md) - การใช้ format specifiers เพื่อแสดงผลข้อมูล

### 3. การเขียน Comments

- [comment.md](Hello-world/comment.md) - เรียนรู้เกี่ยวกับ regular comments และ doc comments
- [doc_comments.zig](Hello-world/doc_comments.zig) - ตัวอย่างการใช้ doc comments

### 4. ฝึกปฏิบัติ

- [printFunc.zig](practice/printFunc.zig) - ฝึกการใช้ฟังก์ชัน print กับข้อมูลประเภทต่างๆ
- [format_exercise.zig](week1/format_exercise.zig) - แบบฝึกหัดการใช้ format specifiers

## วิธีการรันตัวอย่างโค้ด

```bash
# เข้าไปที่โฟลเดอร์ของโปรเจค
cd path/to/zig-learning

# รันไฟล์ .zig โดยตรง
zig run Hello-world/hello.zig

# หรือคอมไพล์และรัน
zig build-exe Hello-world/hello.zig
./hello
```

## คำแนะนำสำหรับการเรียนรู้

1. **เริ่มจากพื้นฐาน**: ศึกษา [hello.zig](Hello-world/hello.zig) และ [hello-again.zig](Hello-world/hello-again.zig) ก่อน
2. **ทำความเข้าใจชนิดข้อมูล**: ศึกษา [values.zig](Hello-world/values.zig) เพื่อเรียนรู้เรื่อง data types
3. **ฝึกการใช้ Format Specifiers**: ทดลองทำแบบฝึกหัดใน [format_exercise.zig](week1/format_exercise.zig)
4. **ทำความเข้าใจ Error Handling**: ศึกษาเรื่อง `!void` และ error union จาก [values.zig](Hello-world/values.zig) และ [note.md](Hello-world/note.md)
5. **ลองเขียนโปรแกรมด้วยตัวเอง**: หลังจากศึกษาตัวอย่างแล้ว ลองนำความรู้มาประยุกต์ใช้โดยแก้ไข [printFunc.zig](practice/printFunc.zig) หรือสร้างไฟล์ใหม่

## หัวข้อที่น่าสนใจเพิ่มเติม

- **Arrays และ Slices** - การทำงานกับข้อมูลหลายรายการ
- **Structs และ Enums** - การสร้างโครงสร้างข้อมูลที่ซับซ้อน
- **Memory Management** - การจัดการหน่วยความจำใน Zig
- **Async/Await** - การเขียนโปรแกรมแบบอะซิงโครนัส
- **Error Handling** - การจัดการข้อผิดพลาดอย่างมีประสิทธิภาพ

## แหล่งข้อมูลเพิ่มเติม

- [เว็บไซต์อย่างเป็นทางการของ Zig](https://ziglang.org/)
- [เอกสารอ้างอิง Zig](https://ziglang.org/documentation/master/)
- [Zig Standard Library Documentation](https://ziglang.org/documentation/master/std/)
- [Ziglings - แบบฝึกหัดสำหรับเรียน Zig](https://github.com/ratfactor/ziglings)
- [Zig Learn](https://ziglearn.org/) - คู่มือออนไลน์สำหรับการเรียนรู้ Zig
- [Awesome Zig](https://github.com/nrdmn/awesome-zig) - รวมรายการทรัพยากรที่น่าสนใจเกี่ยวกับ Zig

## หมายเหตุ

Repository นี้อยู่ระหว่างการพัฒนาและจะมีการเพิ่มเติมเนื้อหาใหม่ๆ อย่างต่อเนื่อง โปรดติดตามการอัปเดตเพื่อเรียนรู้เนื้อหาใหม่เกี่ยวกับ Zig!
