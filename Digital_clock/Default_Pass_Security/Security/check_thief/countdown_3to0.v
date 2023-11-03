`timescale 1ns / 1ps

module countdown_3to0(
    input clk,
    input rst, // lock vao
    output reg [3:0] led = 4'b0011,
    output rst_all
    );
   
    always @(negedge clk, posedge  rst) begin
        if ( rst) begin
            led =4'b0011;
        end
        else begin 
            case (led)
                4'b0011: led = 4'b0010;
                4'b0010: led = 4'b0001;
                4'b0001: led = 4'b0000;
                4'b0000: led = 4'b0100;
            endcase
        end
    end
    assign rst_all = (led == 4'b0100) ? 1: 0;
    
endmodule
