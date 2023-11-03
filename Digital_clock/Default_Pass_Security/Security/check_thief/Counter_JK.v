`timescale 1ns / 1ps
module Counter_JK_ff(
    input clk_in,
    input button,
    output clk_out_
    );
        wire [25:0] clk_out;
        wire [11:0]temp;
        wire rst;
        and a0 (temp[0], clk_out[25], clk_out[24]);
        and a1 (temp[1], clk_out[23],clk_out[21]);
        and a2 (temp[2], clk_out[20],clk_out[19]);
        and a3 (temp[3], clk_out[16],clk_out[15]);
        and a4 (temp[4], clk_out[13],clk_out[11]);
        and a5 (temp[5], clk_out[10],clk_out[7]);
        and a6 (temp[6], clk_out[5],temp[0]);
        and a7 (temp[7], temp[1],temp[2]);
        and a8 (temp[8], temp[3],temp[4]);
        and a9 (temp[9], temp[5],temp[6]);
        and a10 (temp[10], temp[7],temp[8]);
        and a11 (temp[11], temp[9], temp[10]);
//        assign temp[11] = (clk_out == 26'b0000_0000_0000_0000_0000_1000_00_) ? 1: 0;
        or (rst, temp[11],button);   
    genvar i;
    JK_ff_asyn_rst D1(clk_in,1'b1,1'b1,rst,clk_out[0]);
    for (i = 1; i<=25;i=i+1) begin
        JK_ff_asyn_rst D2_26(clk_out[i-1],1'b1,1'b1,rst,clk_out[i]);
    end
    wire temp_clk;
    not (temp_clk,temp[11]);
    JK_ff_asyn_rst D27(temp_clk,1'b1,1'b1,button,clk_out_);
endmodule
