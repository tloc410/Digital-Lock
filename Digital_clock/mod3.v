`timescale 1ns / 1ps

module mod3(
    btn,
    rst,
    set,
    count
    );
    parameter reg [1:0] start_count = 2'b00; 
    parameter reg [1:0] set_value = 2'b11; 
    input btn;
    input rst;
    input set;
    output reg [1:0] count = start_count;
    
    
   
    always @(posedge btn, posedge rst, posedge set) begin
        if (rst) begin
            count <= 2'b00 ;
        end
        else if (set) begin
            count <= set_value;
        end
        else begin 
            case (count) 
            2'b00: count <= 2'b01;
            2'b01: count <= 2'b10;
            2'b10: count <= 2'b11;
            2'b11: count <= 2'b01;
            default: count <= 2'b01;
            endcase
        end
    end
endmodule
