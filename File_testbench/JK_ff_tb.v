`timescale 1ns / 1ps


module JK_ff_tb;
reg clk, j, k, rst;
wire q;
    JK_ff_asyn_rst uut(.clk(clk),
    .j( j),
    .k( k),
    .rst( rst),
    .q( q)
    ); 
    initial clk=0;
    always #2 clk=~clk;
    initial 
    begin
        j = 0;
        k = 0;
        rst = 1;
        j = 1; k = 0;
           #10 rst = 0; 
           
           #10 j = 0; k = 0;
           #10 j = 0; k = 1;
           #10 j = 1; k = 0;
           #10 j = 1; k = 1;
           #10 $finish;
    end
endmodule
