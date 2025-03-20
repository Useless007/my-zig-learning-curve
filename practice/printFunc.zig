const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const name = "Jintaphas"; //Zig ไม่มีชนิดข้อมูล String แบบที่มีในภาษาอื่นๆ
    const age = 23;
    const height = 175;
    const weight = 78.9;
    const is_student = true;

    printInfo(name, age, height, weight, is_student);
}

fn printInfo(name: []const u8, age: i16, height: f32, weight: f32, is_student: bool) void {
    print("Hello {s}\n", .{name});
    print("Age: {d}\n", .{age});
    print("Height: {}\n", .{height});
    print("Weight: {d:.2}\n", .{weight});
    print("Is student: {}\n", .{is_student});
}