`timescale 1ns / 1ps
module check_pass_def_tb(

    );
    reg mode;
    reg mode_def;
    reg enter;
    reg [1:0] mod3_btn;
    reg lock_rst;
    reg rst_all;
    wire  Q;
    wire  [2:0] led_4;
    check_pass_def UUT(mode,mode_def,enter,mod3_btn,lock_rst,rst_all,Q,led_4);
    initial begin
        mode = 0; mode_def= 0; enter = 0; mod3_btn = 0; lock_rst= 0; rst_all=0;
        #4 mode = 1; mode_def= 0; mod3_btn = 1; lock_rst= 0; rst_all=0;
        #2 enter = 1; #1 enter = 0;
        #4 mode = 0; mode_def= 1; mod3_btn = 2; lock_rst= 0; rst_all=0;
        #1 enter = 1;
//      #0.01 rst_all = 1; #0.01 rst_all = 0;
        #0.02 enter = 0;
        #2 enter = 1; #1 enter = 0;
        #0.01 rst_all = 1; #0.01 rst_all = 0;
        #5 $finish;
    end
        
endmodule
