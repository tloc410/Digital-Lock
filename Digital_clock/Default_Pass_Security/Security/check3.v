`timescale 1ns / 1ps

module check3(
    input mode,
    input [1:0] mod3,
    input enter,
    input rst,
    output reg [2:0] led_4,
    output clk_enb
    );
    wire clk_check;
    wire mod3_check;
    wire [1:0] mod4_check_out;
    wire compare3;
    assign mod3_check = (mod3 == 2'b00) ? 0 : 1;
    assign clk_check = ~mode & enter & mod3_check;
    Check_3_times check_3_times (clk_check,rst,mod4_check_out);
    assign compare3 = (mod4_check_out == 2'b11) ? 1 : 0;
    always @(mod4_check_out) begin
        case (mod4_check_out) 
            2'b00: led_4 <= 3'b000;     //Tat den
            2'b01: led_4 <= 3'b001;     //Mau blue
            2'b10: led_4 <= 3'b101;     //Mau purple
            2'b11: led_4 <= 3'b111;     //Mau White
        endcase
    end
    assign clk_enb = compare3;
    
endmodule
