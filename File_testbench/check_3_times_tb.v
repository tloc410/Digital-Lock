`timescale 1ns / 1ps

module Check_3_times_tb;

    reg btn;
    reg rst;

    wire [1:0] count_3;

    Check_3_times dut (
        .btn(btn),
        .rst(rst),
        .count_3(count_3)
    );

    initial begin

        btn = 0;
        rst = 1;

        #10 rst = 0;
        
        //  Count up to 3
        repeat (3) begin
            #20 btn = 1;
            #30 btn = 0;
            #40 $display("count_3 = %b", count_3);
        end
        
        //  Count up to 3 again
        repeat (3) begin
            #20 btn = 1;
            #30 btn = 0;
            #40 $display("count_3 = %b", count_3);
        end
        
        //  Reset the counter to 0
        #50 rst = 1;
        #60 rst = 0;
        repeat (3) begin
            #20 btn = 1;
            #30 btn = 0;
            #40 $display("count_3 = %b", count_3);
        end

        #70 $finish;
    end

endmodule