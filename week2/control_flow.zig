const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // การใช้ if/else
    // if/else
    const x = 10;
    if (x > 5) {
        print("x มากกว่า 5\n",.{});
    }else{
        print("x น้อยกว่าหรือเท่ากับ 5\n", .{});
    }

    // for loops
    const items = [_]i32{1, 2, 3, 4, 5};
    for (items, 0..) |item, i| {
        print("items[{d}] = {d}\n",.{i,item});
    }

    // while loops
    var i:usize = 0;
    while (i < 3) : (i += 1) {
        print("i = {d}\n", .{i});
    }

    // switch
    const value = 2;
    switch (value) {
        1 => print("หนึ่ง\n", .{}),
        2 => print("สอง\n", .{}),
        3 => print("สาม\n", .{}),
        else => print("อื่นๆ\n", .{}),
    }

}