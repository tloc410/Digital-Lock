`timescale 1ns/1ps
module ass1_tb;
reg enable,mod3_btn, mod10_btn, confirm, enter, mode, rst_btn;
wire  N1, N2, N3, N4, N5, N6;
ass1 uut(enable,mod3_btn, mod10_btn, confirm, enter, mode, rst_btn, N1, N2, N3, N4, N5, N6);

initial 
begin
enable = 1;

mod3_btn = 0;
mod10_btn = 0;
confirm = 0;
enter = 0;
mode = 0;
rst_btn = 0;

#10 mod3_btn = 1;
mod10_btn = 0;
confirm = 0;
enter = 0;
mode = 0;
rst_btn = 0;
#10 enable = 0;
#10 enable = 1;
#10 mod3_btn = 0;
mod10_btn = 1;
confirm = 0;
enter = 0;
mode = 0;
rst_btn = 0;
#10 enable = 0;
#10 enable = 1;
#10 mod3_btn = 0;
mod10_btn = 0;
confirm = 1;
enter = 0;
mode = 0;
rst_btn = 0;
#10 enable = 0;
#10 enable = 1;
#10 mod3_btn = 0;
mod10_btn = 0;
confirm = 0;
enter = 1;
mode = 0;
rst_btn = 0;
#10 enable = 0;
#10 enable = 1;
#10 mod3_btn = 0;
mod10_btn = 0;
confirm = 0;
enter = 0;
mode = 1;
rst_btn = 0;
#10 enable = 0;
#10 enable = 1;
#10 mod3_btn = 0;
mod10_btn = 0;
confirm = 0;
enter = 0;
mode = 0;
rst_btn = 1;
#10 enable = 0;
#10 enable = 1;
#10 $finish;
end
endmodule