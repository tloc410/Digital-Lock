`timescale 1ns / 1ps

module pass_def(
    input mode_def,
    input mode,
    input lock,
    input [11:0] pass_set,
    output reg [11:0] password
    );
    parameter reg [11:0] pass_default = 12'b0001_0010_0011;
    wire enb;
    assign enb = (~lock) & mode_def;
    always @(*) begin
        if (enb == 1'b0) begin
            password <= pass_set;
        end
        
        else begin
            password <= pass_default;
        end
    end
endmodule
