`timescale 1ns / 1ps

module password_12bit_tb;
 reg mode;
   reg [1:0] mod3;
   reg [3:0] mod10;
   reg rst;
   reg confirm;
   wire [11:0] out;
   
    password_12it UUT (
    .mode(mode),
    .mode3(mod3),
    .mod10(mod10),
    .rst(rst),
    .comfirm(confirm),
    .password(out)
    );
   
    initial begin
        mode = 0; confirm = 0; rst = 0; mod10 = 4'b0000; mod3 = 2'b00;
        #5 mode = 1;
        
        #5 mod3 = 2'b01;
        #5 mod10 = 4'b0001;
        #5 confirm =1;
        #1 confirm = 0;
         #5 $display("out = %b", out);
        #2 mod3 = 2'b10;
        #5 mod10 = 4'b0011;
        #5 confirm =1;
        #1 confirm = 0;
         #5 $display("out = %b", out);
        #2 mod3 = 2'b11;
        #5 mod10 = 4'b0111;
        #5 confirm =1;
      //  #5 mod3 = 2'b01;
        #1 confirm = 0;
         #5 $display("out = %b", out);
        #5 mode = 0;
        #5 rst = 1;
        #1 rst = 0;
        #5 $display("out = %b", out);
        #5 $finish;
        
         
        
    end
endmodule
