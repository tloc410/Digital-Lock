`timescale 1ns / 1ps


module check_thief_tb(

    );
    reg clk_in;
    reg rst;
    reg enb;                  //Give the permission to count
    wire rst_all;
    wire [3:0] led7s;
    or (rst_temp, rst, rst_all);
    check_thief UUT(clk_in,rst_temp,enb,rst_all,led7s);
    
    initial begin 
        clk_in = 0;
        forever #0.1 clk_in = ~clk_in;
    end
    initial begin
        enb = 0; rst= 0;
        #1 rst = 1; #5 rst = 0;
        #1 enb = 1;
        # 62 enb= 0;
        # 20 $finish;
    end
endmodule
