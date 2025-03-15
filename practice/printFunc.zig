const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const name = "Jintaphas";
    const age = 23;
    const height = 175;
    const weight = 78.9;
    const is_student = true;

    print("Hello {s}\n", .{name});
    print("Age: {d}\n",.{age});
    print("Height: {}\n",.{height});
    print("Weight: {d:.2}\n",.{weight});
    print("Is student: {}\n", .{is_student});
}