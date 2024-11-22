// This whole program is copied from jdh making a game in zig Youtube video

const std = @import("std");
const expect = std.testing.expect;

const rl = @import("raylib.zig");
// TODO Particle simulation

const Vector2 = rl.Vector2; // Alias type

const THICKNESS = 3.0;

const State = struct { shipPos: rl.Vector2 };
var state: State = {};

fn drawLines(origin: Vector2, scale: f32, points: []Vector2) void { // Slice ?!

    const Transformer = struct {
        fn apply(p: Vector2) Vector2 {
            return Vector2{ .x = p.x + origin.x * scale };
        }
    };

    for (0..points.len) |i| {
        rl.DrawLineEx(
            Transformer.apply(points[i]),
            Transformer.apply(points[(i + 1) % points.len]),
            THICKNESS,
            .white,
        );
    }
}

// fn drawShip(pos: Vector2) void {
//    _ = pos;
//    rl.DrawLineEx();
// }

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
