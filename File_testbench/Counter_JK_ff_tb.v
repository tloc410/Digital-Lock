`timescale 1ns / 1ps
module Counter_JK_ff_tb();
    reg clk_in;
    wire clk_out;
    reg rst;

    initial begin 
    clk_in = 0;
    rst = 0;
    forever #4 clk_in = ~ clk_in;
    end
    initial begin
    #1 rst = 1;
    #1 rst = 0;
    
    end
    
    Counter_JK_ff UUT(clk_in,rst,clk_out);
endmodule
