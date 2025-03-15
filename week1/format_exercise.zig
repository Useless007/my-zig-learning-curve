//! Format Specifiers หลายรูปแบบเพื่อแสดงข้อมูลต่างๆ
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const number =42;
    const letter = 'a';
    const hex_value = 255;
    const binary_value = 10;
    const float_value = 3.14159;

    // ใช้ Format Specifiers ต่างๆ เพื่อแสดงข้อมูลอย่างถูกต้อง
    print("Decimal: {d}\n", .{number});
    print("Character: {c}\n",.{letter});
    print("Hex: 0x{x}\n",.{hex_value});
    print("UPPERCASE Hex: 0x{X}\n",.{hex_value});
    print("Binary: {b}\n",.{binary_value});
    print("Float (default): {}\n", .{float_value});
    print("Float (2 decimal): {d:.2}\n",.{float_value});

    // ลองใช้ Padding และการจัดตำแหน่ง
    print("Right-alligned: '{d:5}'\n",.{number});
    print("Left-alligned: '{d:<5}'\n",.{number});
    print("Zero-padded: '{d:0>4}'\n",.{number});

}