`timescale 1ns / 1ps


module check3_tb(
    );
    reg mode;
    reg [1:0] mod3;
    reg enter;
    reg rst;
    wire [2:0] led_4;
    wire clk_enb;
    check3 UUT (mode,mod3,enter,rst,led_4,clk_enb);
    initial begin
        mode = 0; mod3 = 2'b01;
        enter = 0; rst = 0;
//        #1 rst = 0;
        # 5 enter = 1; #2 enter = 0;
        # 5 enter = 1; #2 enter = 0;
        # 5 mod3 = 2'b11;
        # 5 enter = 1;#2 enter = 0; rst = 0;
        #5 $finish;
    end
endmodule
