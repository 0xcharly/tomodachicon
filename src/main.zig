const std = @import("std");
const microzig = @import("microzig");
const rp2040 = microzig.hal;
const time = rp2040.time;

const pin_config = rp2040.pins.GlobalConfiguration{
    .GPIO25 = .{
        .name = "led",
        .direction = .out,
    },
};

pub fn main() !void {
    const pins = pin_config.apply();

    var i: u32 = 0;
    while (true) : (i += 1) {
        std.log.info("Toggling LED #{}", .{i});
        pins.led.toggle();
        time.sleep_ms(250);
    }
}
