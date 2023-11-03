`timescale 1ns / 1ps

module ass2_tb;

   // parameter HMNBIT = 4;
    reg sel;
    reg [3:0] A;
    reg [3:0] B;

    wire [3:0] led4;

    ass2 uut (
        .sel(sel),
        .A(A),
        .B(B),
        .led4(led4)
    );


    always #5 sel = ~sel;

    initial begin
   
        sel = 0;
        A = 0;
        B = 0;

        #10 A = 4'b0001;
             B = 4'b1010;
            
        #10 $display("led4 = %b", led4);

        #10 $finish;
    end
    
endmodule