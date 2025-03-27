const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const numbers = [_]i32{ 1, 2, 3, 4, 5 };
    print("Array: \n", .{});
    for (numbers) |num| {
        print("Number: {d} ", .{num});
    }
    print("\n", .{});

    const slice: []const i32 = numbers[1..4];
    if (numbers.len >= 4) {
        print("Slice: \n", .{});
        for (slice) |num| {
            print("{d} ", .{num});
        }
        print("\n", .{});
    } else {
        print("Error: Array does not have enough elements for slicing.\n", .{});
        print("\n", .{});
        print("Slice: \n", .{});
        for (slice) |num| {
            print("Slice Element: {d} ", .{num});
        }
        print("\n", .{});
    }
}
