const std = @import("std");
const print = std.debug.print;

const Person = struct {
    name: []const u8,
    age: u8,
    height: f32,
    weight: f32,

    // ฟังก์ชันคำนวณ BMI โดย BMI = น้ำหนัก (kg) / (ส่วนสูง (m))^2
    pub fn bmi(self: Person) f32 {
        return self.weight / ((self.height) / 100.00 * (self.height / 100.00));
    }
};

pub fn main() void {
    const useless007 = Person{
        .name = "Jintaphas",
        .age = 23,
        .height = 175,
        .weight = 77,
    };

    print("Name : {s}\n", .{useless007.name});
    print("Age: {d}\n", .{useless007.age});
    print("BMI: {d:.2}\n",.{useless007.bmi()});
}
