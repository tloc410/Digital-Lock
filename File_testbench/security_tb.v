`timescale 1ns / 1ps


module security_tb(
    
    );
    reg clk; // H16
    reg mode; // mode
    reg [1:0] mod3_out; // tu mod3 vao
    reg enter; // enter
    reg lock_rst; // dau ra lock vao
    reg enb_by_pass_def;
    wire enb_frequency;
    wire [2:0] led_4; // den canh bao
    wire rst_all; 
    wire [3:0] led_count;
    security UUT(clk, mode,mod3_out,enter,lock_rst, enb_by_pass_def,enb_frequency,led_4, rst_all, led_count);
    initial begin
        clk = 0;
        forever #0.1 clk= ~clk;
    end
    initial begin
        mode = 0; mod3_out = 0; enter = 0; lock_rst = 0;  enb_by_pass_def= 0;
        #1 lock_rst= 1 ; #10   lock_rst = 0;
        #10 mode = 0; mod3_out = 2'b10; enter = 0; lock_rst = 0;
        #10  enter = 1; #20 enter = 0;
        #10  enter = 1; #20 enter = 0;
        #20  lock_rst = 1; #10 lock_rst = 0;
        #10  enter = 1; #20 enter = 0;
        #10  enter = 1; #20 enter = 0;
        #10  enter = 1; #20 enter = 0;        
    
        #80 enb_by_pass_def = 1; #55 enb_by_pass_def = 0;
        #4  enter = 1; #20 enter = 0;
        #4  enter = 1; #20 enter = 0;
        #30 $finish;
    end
endmodule
