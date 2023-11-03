`timescale 1ns / 1ps

module seg7x3_tb;
    reg [11:0] pass_in;
    reg [11:0] pass_set;
    reg mode;
    reg L;
    reg show;

    wire [3:0] led1;
    wire [3:0] led2;
    wire [3:0] led3;

    seg7x3 dut (
        .pass_in(pass_in),
        .pass_set(pass_set),
        .mode(mode),
        .L(L),
        .show(show),
        .led1(led1),
        .led2(led2),
        .led3(led3)
    );
    initial begin

        pass_in = 0;
        pass_set = 0;
        mode = 0;
        L = 0;
        show = 0;

        #10 pass_in = 12'b010101010101;
             mode = 0;
             L = 0;
             show = 0;
        #20 $display("led1 = %b, led2 = %b, led3 = %b", led1, led2, led3);

        #10 pass_set = 12'b000011110000;
             mode = 0;
             L = 1;
             show = 0;
        #20 $display("led1 = %b, led2 = %b, led3 = %b", led1, led2, led3);

        #10 pass_set = 12'b000000111111;
             mode = 1;
             L = 1;
             show = 0;
        #20 $display("led1 = %b, led2 = %b, led3 = %b", led1, led2, led3);

        #10 pass_set = 12'b001100110011;
             mode = 1;
             L = 1;
             show = 1;
        #20 $display("led1 = %b, led2 = %b, led3 = %b", led1, led2, led3);

        #10 $finish;
    end
    
endmodule