`timescale 1ns / 1ps

module reg_4bit_tb;
reg [3:0] mod10;
reg clk_enb=0;
reg rst;
wire [3:0] key;
reg_4bit uut(
.mod10(mod10),
.clk_enb(clk_enb),
.rst(rst),
.key(key)
);
  always #5 clk_enb = ~clk_enb;
initial begin
   
    rst = 0;
    mod10 = 4'b0101;
    #10 rst = 1;
    #10 rst = 0;
    #10 $monitor("key = %b", key);
    $finish;
end
endmodule
