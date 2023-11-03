`timescale 1ns / 1ps

module Default_Pass_Security(
    input clk,
    input mode,
    input [1:0] mod3_out, 
    input [3:0] mod10_out,
    input enter,
    input lock_rst,
    output enb_frequency,
    output [2:0] led_4 ,
    output [3:0] led_count,
    output [3:0] led_hmntimes,
    output mode_def
    );
    //----------------------------------Declare nets
    wire enb_frequency_1;                   // Generate signal 1 if the counter is counting down
    wire [2:0] led_4_pass_def_check;        // Show how many times did you enter wrong
    wire rst_all;                           // After counter down to zero, there will be a posedge signal
    wire [3:0] led_count_temp;              // Counter down show on led 7 segs
    wire enb_pass_def;                      //A signal to the counter when you give the wrong default password only 1 time
    wire [2:0] led_4_tmp;                   //Led show a different color when you give the wrong default password
    wire enter_unable;
    
    and a1(enter_unable,enter,~mode_def);
   
    //----------------------------------
    or (enb_frequency,enb_pass_def,enb_frequency_1);   
    //---------------------------------- Use to check normal password for 3 times, and also with a counter        
    security anti_spam(.clk (clk),.mode(mode),.mod3_out(mod3_out),.enter(enter_unable),.lock_rst(lock_rst),
    .enb_by_pass_def(enb_pass_def)          //Get the signal to count if the default password which is given is wrong, and then the counter works
    ,.enb_frequency(enb_frequency_1),       //Generate signal 1 if the counter is counting down
    .led_4(led_4_pass_def_check),           //Led4_RGB show how many times did you try for normal mode input (not default password).
    .rst_all(rst_all),                      //Generate if the counter counts to zero (posedge).
    .led_count(led_count_temp));            //7-segs 3 on extension board, but have to go through a select leds
    //----------------------------------Choose show mod10 or counter down mode
    ass2 select_led (
    enb_frequency,                          //If 1 then on counter mode
    mod10_out,                                //From mod 10 output
    led_count_temp,                         //From security module
    led_count);                             //To led 7 segs [3]
    //---------------------------------- Use to check if you give the wrong default password or not, only once
    
    
    //----------------------------------
    check_pass_def Check_default_pass (mode,mode_def,enter,mod3_out,
    lock_rst,rst_all,                       //Get these signal to force the output to zero
    enb_pass_def,                           //If 1 then the counter with count down
    led_4_tmp);                             //The led_signal to show that you are on counting mod or not
    // -------------------------------- 
    wire [1:0] mode_def_count;
    //--------------------------------- If after 3 times of 3 times try, then you have to give default password.
    Check_3_times check3times (
    rst_all,                // Get the rst_all of the 3 times try (small) to trigger
    lock_rst,               // If you get the right password, then rst all
    mode_def_count);        //Show which state I am in, how many times I have left
    assign mode_def = (mode_def_count == 2'b11) ? 1: 0;
    assign led_hmntimes = (mode_def_count == 2'b00) ? 4'b0001 : (mode_def_count ==2'b01) ? 4'b0010 : (mode_def_count == 2'b10) ? 4'b0100 : 4'b1000;
    //---------------------------------
    or o1(mode_def_enb,mode_def,enb_pass_def);      //Because when it blocks, the mode_def will be 0, then no signal to drive the led_4RGB
    ass2 #(.HMNBIT(3))                              //Set the led_4RGB to 3 bit with parameter
    led4_rbg(.sel(mode_def_enb),                    //If mode_def = 0 then the normal is chosen
    .A(led_4_pass_def_check),                       //Normal password led
    .B(led_4_tmp),                                  //Default password led
    .led4(led_4));                                  //Show to the final output
    
    
endmodule
