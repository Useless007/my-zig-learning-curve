const std = @import("std");
const print = std.debug.print;
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

// ฟังก์ชันคำนวณ BMI โดย BMI = น้ำหนัก (kg) / (ส่วนสูง (m))^2
fn calBmi(weight: f32, height: f32) f32 {
    // height ในที่นี้ควรเป็นเมตร
    return weight / (height * height);
}

// ฟังก์ชันแปลผล BMI
fn interpretBmi(bmi: f32) []const u8 {
    if (bmi < 18.5) {
        return "น้ำหนักต่ำกว่าเกณฑ์";
    } else if (bmi < 25.0) {
        return "น้ำหนักปกติ";
    } else if (bmi < 30.0) {
        return "น้ำหนักเกิน";
    } else {
        return "อ้วน";
    }
}

// ฟังก์ชันรับข้อมูลจากผู้ใช้และคำนวณ BMI
fn readUserInput() !void {
    var buf: [100]u8 = undefined; // สร้าง buffer สำหรับเก็บข้อมูลที่รับเข้ามา
    
    // รับค่าน้ำหนัก
    try stdout.print("Enter your weight (kg): ", .{});
    const weight_input = try stdin.readUntilDelimiterOrEof(&buf, '\n');
    
    if (weight_input == null or weight_input.?.len == 0) {
        return error.InvalidInput;
    }
    
    // แปลงค่าน้ำหนักเป็นตัวเลข
    const weight = try std.fmt.parseFloat(f32, weight_input.?);
    
    // เคลียร์ buffer ด้วยการกำหนดค่าใหม่
    buf = undefined;
    
    // รับค่าส่วนสูง
    try stdout.print("Enter your height (cm): ", .{});
    const height_input = try stdin.readUntilDelimiterOrEof(&buf, '\n');
    
    if (height_input == null or height_input.?.len == 0) {
        return error.InvalidInput;
    }
    
    // แปลงค่าส่วนสูงเป็นตัวเลขและแปลงจาก cm เป็น m
    const height_cm = try std.fmt.parseFloat(f32, height_input.?);
    const height_m = height_cm / 100.0; // แปลง cm เป็น m
    
    // คำนวณ BMI
    const bmi = calBmi(weight, height_m);
    const interpretation = interpretBmi(bmi);
    
    // แสดงผล
    try stdout.print("\nน้ำหนัก: {d:.1} kg\n", .{weight});
    try stdout.print("ส่วนสูง: {d:.1} cm ({d:.2} m)\n", .{height_cm, height_m});
    try stdout.print("BMI: {d:.2}\n", .{bmi});
    try stdout.print("ผลลัพธ์: {s}\n", .{interpretation});
}

pub fn main() !void {
    print("โปรแกรมคำนวณ BMI\n", .{});
    print("-----------------\n", .{});
    
    // เรียกใช้ฟังก์ชันรับข้อมูลและแสดงผล
    readUserInput() catch |err| {
        print("\nเกิดข้อผิดพลาด: {}\n", .{err});
        print("โปรดกรอกข้อมูลให้ถูกต้อง\n", .{});
    };
}