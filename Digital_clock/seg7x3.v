module seg7x3(
  input [11:0] pass_in, pass_set,
  input mode, L, show,
  output reg [3:0] led1, led2, led3
);

  always @ (*) begin
      if(show==0) begin
        if(L==1 && mode ==1) begin
            led1 = pass_set[3:0];
            led2 = pass_set[7:4];
            led3 = pass_set[11:8];
        end else begin
            led1 = pass_in[3:0];
            led2 = pass_in[7:4];
            led3 = pass_in[11:8];
        end
      end else begin
        led1 = pass_set[3:0];
        led2 = pass_set[7:4];
        led3 = pass_set[11:8];
      end
  end
endmodule