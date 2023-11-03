`timescale 1ns / 1ps
module Check_3_times(
    input btn,
    input rst,
    output reg [1:0] count_3 = 2'b00
    );
    // Just change the posedge to negedge then it don't generate a pulse anymore.
    always @ (negedge btn, posedge rst) begin
        if (rst) begin
            count_3 <= 2'b00;
        end
        else begin
            case (count_3) 
                2'b00: count_3 <= 2'b01;
                2'b01: count_3 <= 2'b10;
                2'b10: count_3 <= 2'b11;
                2'b11: count_3 <= 2'b11;
            endcase
        end
    end
endmodule
