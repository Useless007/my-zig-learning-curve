// นำเข้าไลบรารีมาตรฐานของภาษา Zig
const std = @import("std");
// สร้างตัวแปรสำหรับการแสดงผลข้อมูล (Standard Output)
const stdout = std.io.getStdOut().writer();
// สร้างตัวแปรสำหรับการรับข้อมูลจากผู้ใช้ (Standard Input)
const stdin = std.io.getStdIn().reader();

// สร้าง struct สำหรับเก็บข้อมูลนักเรียน
// struct คือโครงสร้างข้อมูลที่สามารถเก็บข้อมูลหลายประเภทไว้ด้วยกัน
const Student = struct {
    name: [50]u8,  // ชื่อนักเรียน - เป็น array ขนาด 50 ไบต์ เก็บตัวอักษรได้สูงสุด 50 ตัว
    age: u32,      // อายุนักเรียน - เป็นจำนวนเต็มบวก 32 บิต
    score: u32,    // คะแนนนักเรียน - เป็นจำนวนเต็มบวก 32 บิต
};

// สร้าง enum สำหรับกำหนดเกรด
// enum คือชนิดข้อมูลที่มีค่าเฉพาะที่กำหนดไว้
const Grade = enum {
    A,  // เกรด A
    B,  // เกรด B
    C,  // เกรด C
    D,  // เกรด D
    F,  // เกรด F
};

// ฟังก์ชันแปลงคะแนนเป็นเกรด
// รับพารามิเตอร์ score เป็น u32 และส่งคืนค่าเป็น Grade enum
fn interpret_grade(score: u32) Grade {
    if (score >= 90) return Grade.A     // ถ้าคะแนน >= 90 ได้เกรด A
    else if (score >= 80) return Grade.B // ถ้าคะแนน >= 80 ได้เกรด B
    else if (score >= 70) return Grade.C // ถ้าคะแนน >= 70 ได้เกรด C
    else if (score >= 60) return Grade.D // ถ้าคะแนน >= 60 ได้เกรด D
    else return Grade.F;                // ถ้าคะแนน < 60 ได้เกรด F
}

// ฟังก์ชันรับจำนวนนักเรียนจากผู้ใช้
// ส่งคืนค่าเป็น u32 หรืออาจเกิด error (!u32)
fn how_many_students() !u32 {
    try stdout.print("How many students do you want to enter?: ", .{});
    
    // สร้าง buffer สำหรับเก็บข้อความที่อ่านเข้ามา
    // undefined หมายถึงยังไม่กำหนดค่าเริ่มต้น (เพื่อประสิทธิภาพ ไม่ต้องเสียเวลากำหนดค่าเริ่มต้น)
    var buffer: [100]u8 = undefined;
    
    // อ่านข้อความจนกว่าจะเจอ '\n' (Enter)
    // orelse return error.InvalidInput คือถ้าอ่านไม่สำเร็จให้คืนค่า error
    const line = try stdin.readUntilDelimiterOrEof(&buffer, '\n') orelse return error.InvalidInput;
    
    // แปลงข้อความเป็นตัวเลข
    // พารามิเตอร์ 10 คือฐาน (base) ของตัวเลข (เลขฐาน 10)
    const num_students = try std.fmt.parseInt(u32, line, 10);
    
    // ตรวจสอบว่าจำนวนนักเรียนอยู่ในช่วงที่เหมาะสม (1-100)
    if (num_students < 1 or num_students > 100) {
        return error.InvalidInput;
    }
    
    return num_students;
}

// ฟังก์ชันรับข้อมูลนักเรียนจากผู้ใช้
// ส่งคืนค่าเป็น Student struct หรืออาจเกิด error (!Student)
fn get_student_data() !Student {
    // สร้างตัวแปร student แบบยังไม่กำหนดค่าเริ่มต้น
    var student: Student = undefined;

    // รับข้อมูลชื่อนักเรียน
    try stdout.print("Enter student name: ", .{});
    // อ่านข้อมูลชื่อใส่ลงในส่วน name ของ student โดยตรง
    const name_len = try stdin.readUntilDelimiterOrEof(&student.name, '\n') orelse {
        return error.InvalidInput;
    };
    // เก็บความยาวของชื่อ
    const len = name_len.len;
    // ตรวจสอบว่าชื่อไม่เกินขนาด buffer (50 ตัวอักษร)
    if (len >= student.name.len) return error.InvalidInput;
    // เพิ่ม null terminator ที่ตำแหน่งท้ายสุดของชื่อ (เพื่อให้เป็น C-string)
    student.name[len] = 0;

    // รับข้อมูลอายุ
    try stdout.print("Enter student age: ", .{});
    // สร้าง buffer สำหรับเก็บข้อความอายุชั่วคราว
    var age_buffer: [16]u8 = undefined;
    // อ่านข้อความอายุ
    const age_input = try stdin.readUntilDelimiterOrEof(&age_buffer, '\n') orelse return error.InvalidInput;
    // แปลงข้อความอายุเป็นตัวเลข
    student.age = try std.fmt.parseInt(u32, age_input, 10);

    // รับข้อมูลคะแนน
    try stdout.print("Enter student score: ", .{});
    // สร้าง buffer สำหรับเก็บข้อความคะแนนชั่วคราว
    var score_buffer: [16]u8 = undefined;
    // อ่านข้อความคะแนน
    const score_input = try stdin.readUntilDelimiterOrEof(&score_buffer, '\n') orelse return error.InvalidInput;
    // แปลงข้อความคะแนนเป็นตัวเลข
    student.score = try std.fmt.parseInt(u32, score_input, 10);

    // ส่งคืนข้อมูลนักเรียน
    return student;
}

// ฟังก์ชันหลัก
pub fn main() !void {
    // รับจำนวนนักเรียนจากผู้ใช้
    const num_students = try how_many_students();

    // สร้าง Array สำหรับเก็บข้อมูลนักเรียนขนาดสูงสุด 100 คน
    var students: [100]Student = undefined;
    // สร้าง Slice จาก Array โดยใช้เฉพาะส่วนที่จำเป็น (ตามจำนวนนักเรียน)
    // Slice เป็นมุมมองบางส่วนของ Array ที่มีขนาดไม่เกิน Array ต้นฉบับ
    const student_slice = students[0..num_students];

    // วนลูปรับข้อมูลนักเรียนตามจำนวนที่ผู้ใช้ระบุ
    for (student_slice) |*student| {
        // ใช้ * เพื่อเข้าถึงตำแหน่งในหน่วยความจำโดยตรง (pointer)
        const data = try get_student_data();
        student.* = data; // คัดลอกข้อมูลจาก data ไปยังตำแหน่งใน array
    }

    // แสดงหัวข้อ
    try stdout.print("\nStudent Data:\n", .{});

    // วนลูปแสดงข้อมูลนักเรียนทั้งหมด
    for (student_slice) |student| {
        // คำนวณเกรดจากคะแนน
        const grade = interpret_grade(student.score);

        // หาความยาวจริงของชื่อ (จนถึง null terminator)
        var name_len: usize = 0;
        // วนลูปนับความยาวของชื่อจนกว่าจะเจอ null (0) หรือถึงขอบเขตสูงสุด
        // : (name_len += 1) คือส่วนที่ทำงานหลังจบรอบการทำงานของลูป
        while (name_len < student.name.len and student.name[name_len] != 0) : (name_len += 1) {}
        
        // สร้าง slice ของชื่อที่มีความยาวถูกต้อง ไม่รวม null terminator
        const name_slice = student.name[0..name_len];
        
        // แสดงข้อมูลนักเรียน
        // {s} คือ format specifier สำหรับ string (slice ของ u8)
        // {d} คือ format specifier สำหรับตัวเลขฐาน 10
        // @tagName(grade) แปลง enum เป็น string
        try stdout.print(
            "Name: {s}, Age: {d}, Score: {d}, Grade: {s}\n",
            .{ name_slice, student.age, student.score, @tagName(grade) },
        );
    }
}