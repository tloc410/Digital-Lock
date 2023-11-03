`timescale 1ns / 1ps
module digital_lock(
    input clk_125Mhz,
    input mod3_btn_1,
    input mod10_btn_1,
    input confirm_1,
    input enter_1,
    input mode_1,
    input rst_btn_1,
    output [2:0] led_rgb,
    output [11:0] led7seg,
    output [3:0] led7_mod10,
    output [2:0] led_mod3,
    output led_mode,
    output [2:0]led_4,
    output [3:0] led_hmntims
    );
    wire [1:0] mod3_out;
    wire [3:0] mod10_out;
    wire rst_mod10;
    wire enb_frequency;
    //Declare for btn and sws
    wire mod3_btn;
    wire mod10_btn;
    wire confirm;
    wire enter;
    wire mode;
    wire rst_btn;
    wire lock;
    wire [11:0] pass_in_out;
    wire [11:0] pass_set_out;
    wire [11:0] pass_set_out_1;
    wire enb_pass_def;
    wire enb_frequency_1;
    wire mode_set;
    wire mod3_rst;
    or (mod3_rst, rst_btn, enb_frequency);
    wire pass_in_rst;
    or (pass_in_rst,rst_btn,enb_frequency);
    assign rst_mod10 = mod3_btn | rst_btn | enb_frequency;
    mod3 a0(.btn(mod3_btn),.rst(mod3_rst),.set(1'b0),.count(mod3_out)); //Cho vao module led_btn
    mod10 a1 (.btn(mod10_btn), .rst(rst_mod10), .out(mod10_out)); //Cho vao led 7 seg mod10
    assign mode_set = lock & mode;
    password_12it pass_in (.mode(~mode),.mod3(mod3_out),.mod10(mod10_out),.rst(pass_in_rst),.confirm(confirm),.password(pass_in_out)); //Cho dau ra vao led7x3
    password_12it pass_set (.mode(mode_set),.mod3(mod3_out),.mod10(mod10_out),.rst(mode_def),.confirm(confirm),.password(pass_set_out_1)); //Cho dau ra vao led7x3
    //-----------------------------------Default Password 
    pass_def default_password (mode_def,mode,lock,pass_set_out_1,pass_set_out);
        defparam default_password.pass_default = 12'b0001_0010_0010;            //Set default password;
    //-----------------------------------Check if the password is right or not
    comparator_12bit a3(.pass_in(pass_in_out), .pass_set(pass_set_out),.enb(enter),.rst(rst_btn),.lock(lock),.led_RGB(led_rgb)); 
    //-----------------------------------Show the password on led 7 segs
    seg7x3 led_out7 (pass_in_out,pass_set_out,mode,lock,1'b0,led7seg[3:0],led7seg[7:4], led7seg[11:8]);
    //-----------------------------------Show which key is chosen
    led_btn led_out_mod3 (mod3_out,led_mod3);
    assign led_mode = mode /*_set*/ ; // OK thi cho cai nay ok 
    
    //Security
    wire rst_all;
    wire [3:0] led_count;
    wire [2:0] led_4_tmp, led_4_pass_def_check;

    ass1 enb_all_btn (~enb_frequency,mod3_btn_1,mod10_btn_1,confirm_1,enter_1,mode_1,rst_btn_1,
                        mod3_btn,mod10_btn,confirm,enter,mode,rst_btn); 
    Default_Pass_Security Security(
    .clk(clk_125Mhz),                           //H16
    .mode(mode),                                
    .mod3_out(mod3_out),
    .mod10_out(mod10_out),
    .enter(enter),
    .lock_rst(lock),
    .enb_frequency(enb_frequency),
    .led_4(led_4),.led_count(led7_mod10),       
    .led_hmntimes(led_hmntims),                 //Show how many times left do I have, use led on extension board.
    .mode_def(mode_def));                       //Use default password to unlock
   //------------------------------------------------------------------------------
endmodule
