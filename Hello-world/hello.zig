const std = @import("std");

pub fn main() !void {
    
    // ต้องเป็น !void เพราะใช้ try และ stdout.print() อาจเกิด error
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"World"});
}


// ส่วนใหญ่แล้ว จะใช้ชื่อตัวแปลเป็น stderr แทน stdout เพื่อที่จะนำข้อมูลออกมา debug

// BUILD : zig build-exe hello.zig
// RUN : ./hello
// OUTPUT : Hello, world!

// BUILD (product?) : zig build-exe hello.zig -O ReleaseFast
