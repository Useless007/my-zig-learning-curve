const std = @import("std");
const print = std.debug.print;

const BmiCategory = enum {
    Underweight,
    Normal,
    Overweight,
    Obesity,
};

///เขียนฟังก์ชันที่รับค่า BMI และคืนค่า enum BmiCategory และเขียนแบบลดรูป
///ให้ใช้ switch expression
fn interpretBmi(bmi: f32) BmiCategory {
    if (bmi < 18.5) return .Underweight;
    if (bmi < 25.0) return .Normal;
    if (bmi < 30.0) return .Overweight;
    return .Obesity;
}

pub fn main() void {
    const bmi = 25.14; // ตัวอย่างค่า BMI
    const category = interpretBmi(bmi);

    switch (category) {
        .Underweight => print("BMI Category: Underweight\n", .{}),
        .Normal => print("BMI Category: Normal\n", .{}),
        .Overweight => print("BMI Category: Overweight\n", .{}),
        .Obesity => print("BMI Category: Obesity\n", .{}),
    }
}


