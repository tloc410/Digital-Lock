`timescale 1ns / 1ps


module pass_def_tb(
    
    );
    reg mode_def;
    reg mode;
    reg lock;
    reg [11:0] pass_set;
    wire [11:0] password;
    pass_def UUT (mode_def,mode,lock,pass_set,password);
    initial begin
        mode_def = 0; mode = 0; lock = 0; pass_set = 12'b0;
        #2 mode = 1; lock = 1;
        #2 mode = 0; lock = 0;
        #2 pass_set = 12'b1000_0011_1100;
        #2 mode_def = 1; mode = 0; lock = 0;
        #5 $finish;
    end
endmodule
