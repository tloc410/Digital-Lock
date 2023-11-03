`timescale 1ns / 1ps

module comparator_12bit_tb;

    reg [11:0] pass_in;
    reg [11:0] pass_set;
    reg enb;
    reg rst;

    wire lock;
    wire [2:0] led_RGB;

    comparator_12bit dut (
        .pass_in(pass_in),
        .pass_set(pass_set),
        .enb(enb),
        .rst(rst),
        .lock(lock),
        .led_RGB(led_RGB)
    );

    reg clk;
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        pass_in = 0;
        pass_set = 0;
        enb = 0;
        rst = 0;
  
        #10 rst = 1;
        #20 rst = 0;
        #30 $display("lock = %b, led_RGB = %b", lock, led_RGB);

        #10 pass_set = 1234;
             pass_in = 1234;
             enb = 1;
        #20 $display("lock = %b, led_RGB = %b", lock, led_RGB);
            enb = 0;
        #10 pass_set = 4321;
             pass_in = 1234;
             enb = 1;
        #20 $display("lock = %b, led_RGB = %b", lock, led_RGB);

        #10 $finish;
    end
    
endmodule