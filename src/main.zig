const std = @import("std");
const expect = std.testing.expect;

const rl = @import("raylib.zig");
// TODO Particle simulation

pub fn main() !void {
    std.debug.print("\n\nHello World!\n\n", .{});
    rl.InitWindow(800, 600, "Small Space Combat");
    rl.SetWindowPosition(100, 100);
    rl.SetTargetFPS(144);

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        const a = rl.Vector2{ .x = 10, .y = 10 };
        const b = rl.Vector2{ .x = 100, .y = 100 };
        rl.DrawLineEx(a, b, 3.0, rl.WHITE);

        rl.ClearBackground(rl.BLACK);
    }

    rl.CloseWindow();
}
