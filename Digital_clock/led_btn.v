`timescale 1ns / 1ps

module led_btn(input [1:0] in, output reg  [2:0] out_led

    );
    always@ (in) begin 
        case(in)
            2'b01 : out_led = 3'b001;
            2'b10 : out_led = 3'b010;
            2'b11 : out_led = 3'b100;
            2'b00 : out_led = 3'b000;
        endcase
    end
endmodule
