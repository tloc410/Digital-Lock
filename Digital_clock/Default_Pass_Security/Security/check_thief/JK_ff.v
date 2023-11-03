`timescale 1ns / 1ps
module JK_ff_asyn_rst(
    input clk,
    input j, k,
    input rst,
    output reg q=1'b0
    );
    always @ (negedge clk or posedge rst)
        begin
        if (rst)
            begin
            q =0;
            end
        else begin
            case ({j,k})
            2'b00 : q = q;
            2'b01 : q = 0;
            2'b10 : q = 1;
            2'b11 : q = ~q;
            endcase
            end
        end
endmodule
