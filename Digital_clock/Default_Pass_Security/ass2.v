`timescale 1ns / 1ps


module ass2(
    sel,
    A,B,
    led4
    );
    parameter HMNBIT = 4;
    input  sel;
    input [HMNBIT-1:0] A,B;
    output reg [HMNBIT-1:0] led4;
    always @(*) begin
        if (sel == 0) begin
            led4 = A;
        end
        else begin
            led4 = B;
        end
    end
endmodule
