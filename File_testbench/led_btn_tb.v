`timescale 1ns / 1ps

module led_btn_tb;
reg [1:0] in;
    wire [2:0] out_led;
    led_btn dut (
        .in(in),
        .out_led(out_led)
    );
    initial begin
        in = 0;
        #10 in = 2'b01;
        #20 $display("out_led = %b", out_led);
        #10 in = 2'b10;
        #20 $display("out_led = %b", out_led);
        #10 in = 2'b11;
        #20 $display("out_led = %b", out_led);
        #10 in = 2'b00;
        #20 $display("out_led = %b", out_led);
        #10 $finish;
    end
    
endmodule
