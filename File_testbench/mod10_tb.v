`timescale 1ns / 1ps
module mod10_tb;

   reg btn;
   reg rst;
   wire [3:0] out;

   mod10 uut (.btn(btn),.rst(rst),.out(out));

   always begin
      #5 btn = ~btn;
   end

   initial begin
      btn = 0;
      rst = 0;
      #10 rst = 1;
      #10 rst = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 btn = 1;
      #10 btn = 0;
      #10 $finish;
   end

endmodule
