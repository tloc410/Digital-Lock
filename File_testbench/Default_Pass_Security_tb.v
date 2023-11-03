`timescale 1ns / 1ps
module Default_Pass_Security_tb();
    reg clk;
    reg mode_1;
    reg [1:0] mod3_out_1;
    reg enter_1;
    reg lock_rst_1;
    wire enb_frequency;
    wire [2:0] led_4;
    wire [3:0] led_count;
    reg [3:0] mod10_out;
    wire [3:0] hmntimes;
    Default_Pass_Security UUT (clk,mode_1,mod3_out_1,mod10_out,enter_1,lock_rst_1,enb_frequency,led_4,led_count,hmntimes,enb);
    initial begin 
        clk = 0;
        forever #0.9375 clk= ~clk;
    end
    initial begin 
        mode_1 = 0; mod3_out_1 = 0; enter_1 = 0; lock_rst_1 = 0; mod10_out = 0111;
        #1 lock_rst_1 = 1; #1 lock_rst_1 = 0;
        #2 mode_1 = 0; mod3_out_1 = 2; 
        #2 enter_1 = 1; #20 enter_1 = 0;
        
        #2 enter_1 = 1; #20 enter_1 = 0; mod3_out_1 = 3; 
        #2 enter_1 = 1; #20 enter_1 = 0;
        #145 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;

        #145 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #150 enter_1 = 1; 
        #20 enter_1 = 0; 
        #145 lock_rst_1 = 1; # 10 lock_rst_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #160 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #2 enter_1 = 1; #20 enter_1 = 0;
        #1 lock_rst_1 = 1;  #1 lock_rst_1 = 0;
        #30 $finish;
    end
endmodule
