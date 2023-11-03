module select_2bit (input [1:0] inp, output reg [2:0] select);
    always @(inp) begin
        case (inp)
        2'b00: select = 3'b000;
        2'b01: select = 3'b001;
        2'b10: select = 3'b010;
        2'b11: select = 3'b100;
        endcase
    end

endmodule