`timescale 1ns / 1ps

module select_2bit_tb;
reg [1:0] inp;
wire [2:0] select;
select_2bit uut(
.inp(inp),
.select(select)
);
initial begin
inp = 0;
#10 inp = 2'b01;
$display("select = %b", select);
#10 inp = 2'b10;
$display("select = %b", select);
#10 inp = 2'b11;
$display("select = %b", select);
#10 inp = 2'b00;

$display("select = %b", select);
#10 $finish;
end
endmodule
