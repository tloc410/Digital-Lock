`timescale 1ns / 1ps
module security(
    input clk, // H16
    input mode, // mode
    input [1:0] mod3_out, //tu mod3 vao
    input enter, //enter
    input lock_rst, //dau ra lock vao
    input enb_by_pass_def,
    output enb_frequency,
    output [2:0] led_4, // den canh bao
    output rst_all, 
    output [3:0] led_count
    );
    wire rst_btn;
    wire enb;
    //Delay module ?
    or (rst_btn,lock_rst,rst_all);
    or (rst_check_thief,enter,rst_btn);
    or (enb, enb_frequency,enb_by_pass_def);                                //Get the clk of "enb_by_pass_def" to trigger the counter.
    check3 check3times(mode,mod3_out,enter,rst_btn,led_4,enb_frequency);    //If count = 3 then, generate the enb_frequency.
    check_thief unable_btn (.clk_in(clk),.rst(rst_check_thief),.enb(enb),.rst_all(rst_all),.led7s(led_count)); //Counter down, get the trigger by 3x3 normal, then once for default
endmodule
