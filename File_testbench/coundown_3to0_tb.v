`timescale 1ns / 1ps

module countdown_3to0_tb;

    reg clk;
    reg rst;

    wire rst_all;
    wire [3:0] led;

    countdown_3to0 dut (
        .clk(clk),
        .rst(rst),
        .led(led),
        .rst_all(rst_all)
    );

    initial begin

        clk = 0;
        rst = 1;

        #10 rst = 0;

        repeat (16) begin
            #10 clk = ~clk;
            #20 $display("led = %b, rst_all = %b", led, rst_all);
        end

        #30 $finish;
    end

endmodule