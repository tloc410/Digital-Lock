`timescale 1ns / 1ps

module mod3_tb_1;
    reg btn;
reg rst;
reg set;

wire [1:0] count;

mod3 dut (
    .btn(btn),
    .rst(rst),
    .set(set),
    .count(count)
);

initial begin

             rst = 1;
             set = 0;
             btn = 0;
             
            #10 rst = 0;
            #10 set = 1;
            #10 set = 0;

            #5 btn = 1;
            #5 btn = 0;
            #5 btn = 1;
            #5 btn = 0;
            #5 btn = 1;
            #5 btn = 0;
            #10 $finish;
end
endmodule
