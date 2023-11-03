module mod10(input btn, input rst, output reg [3:0] out = 4'b0000);

   always @(posedge rst or posedge btn )
   begin
      if (rst) begin
         out <= 4'b0000;
      end else begin
        case (out)
              4'b0000: out <= 4'b0001;
              4'b0001: out <= 4'b0010;
              4'b0010: out <= 4'b0011;
              4'b0011: out <= 4'b0100;
              4'b0100: out <= 4'b0101;
              4'b0101: out <= 4'b0110;
              4'b0110: out <= 4'b0111;
              4'b0111: out <= 4'b1000;
              4'b1000: out <= 4'b1001;
              4'b1001: out <= 4'b0000;   
           endcase
      end
   end

endmodule