`timescale 1ns / 1ps

module ass1(
input enable,mod3_btn, mod10_btn, confirm, enter, mode, rst_btn,
output  N1, N2, N3, N4, N5, N6
    );
    
   and (N1, mod3_btn, enable);
   and (N2, mod10_btn, enable);
   and (N3, confirm, enable);
   and (N4, enter, enable);
   and (N5, mode, enable);
   and (N6, rst_btn, enable);
   
endmodule
