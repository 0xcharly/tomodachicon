const std = @import("std");
const MicroZig = @import("microzig/build");
const RP2040 = @import("microzig/bsp/raspberrypi/rp2040");

pub fn build(b: *std.Build) void {
    const mz = MicroZig.init(b, .{});
    const optimize = b.standardOptimizeOption(.{});

    const firmware = mz.add_firmware(b, .{
        .name = "tomodachicon",
        .target = RP2040.boards.raspberrypi.pico,
        .optimize = optimize,
        .root_source_file = .{ .path = "src/main.zig" },
    });

    mz.install_firmware(b, firmware, .{});
    mz.install_firmware(b, firmware, .{ .format = .elf });
}
