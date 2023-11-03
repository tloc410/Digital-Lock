`timescale 1ns / 1ps

module check_thief(
    input clk_in,
    input rst,
    input enb,                  //Give the permission to count
    output rst_all,
    output [3:0] led7s
    );
    wire fre1Hz;
    wire clk_input;
    and a1(clk_input,clk_in,enb);
    Counter_JK_ff a4 (clk_input,rst,fre1Hz);    
    countdown_3to0 a2 (fre1Hz,rst,led7s,rst_all);
endmodule
