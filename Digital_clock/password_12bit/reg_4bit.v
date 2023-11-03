`timescale 1ns / 1ps


module reg_4bit(
    input [3:0] mod10,
    input clk_enb,
    input rst,
    output reg[3:0]  key =4'b0000
    );
    always @(posedge clk_enb, posedge rst) begin
        if (rst) begin
            key =4'b0000;
        end
        else begin 
            key <= mod10;
        end
    end
endmodule
