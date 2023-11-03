`timescale 1ns / 1ps
module digital_lock_tb( );
    reg clk;
    reg mod3_btn;
    reg mod10_btn;
    reg confirm;
    reg enter;
    reg mode;
    reg rst_btn;
    wire [2:0] led_rgb;
    wire [11:0] led7seg;
    wire [3:0] led7_mod10;
    wire [2:0] led_mod3;
    wire led_mode;
    wire [2:0]led_4;
    wire [3:0] led_hmntims;

    //Generate clock
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    //
    
    digital_lock UUT(clk,mod3_btn,mod10_btn,confirm,enter,mode,rst_btn,led_rgb,led7seg,led7_mod10,led_mod3,led_mode,led_4,led_hmntims);
    
    initial begin
    //Dat gia tri ban dau
    mod3_btn = 0; mod10_btn = 0; confirm = 0; enter = 0; mode = 0; rst_btn =0;
    //Unlock 
    #5 enter = 1; #3 enter = 0;
    //Van dang o mode nhap mat khau
    #5 mod3_btn = 1;  #1 mod3_btn= 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Bi khoa lai (Chua tinh la 1 la dang mo)
    
    //Unlock again
    #5 rst_btn = 1; #2 rst_btn = 0;
    #5 enter = 1; #3 enter = 0;
    
    // khong the giu mod3_btn ma bam duoc, vi rst.
    #5 mode = 1; 
    //Mat khau luu - Thu 1
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    //Mat khau luu - Thu 1: So 4
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau luu - Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 2: So 5
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    //Mat khau luu - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 3: So 1   
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Vay mat khau luu la 451
    #1 mode = 0; rst_btn = 1; #1 rst_btn = 0;

    //Spam mat khau
    //Mat khau nhap - Thu 1: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 2: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 3: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Sai 1 lan
    
    
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 2: So 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 3: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Sai 2 lan : 020

    
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 2: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    //Mat khau nhap - Thu 3: So 0
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Sai 3 lan  
    
    //Sai 3 lan (2)
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
        #5 enter = 1; #3 enter = 0;
            #5 enter = 1; #3 enter = 0;
    //Sai 3 lan (3)
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
        #5 enter = 1; #3 enter = 0;
            #5 enter = 1; #3 enter = 0;
    //Nhap mat khau co dinh de mo
    //Spam 1  
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
    //Spam 2
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
    //Spam 3, bam lung tung    
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #3 mode = 1;
    #5 enter = 1; #3 enter = 0;
    #3 mode = 0;
    #5 enter = 1; #3 enter = 0;
    //Still right    
    //Nhap thu mat khau luu
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    //Mat khau luu - Thu 1: So 4
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau luu - Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 2: So 5
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    //Mat khau luu - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 3: So 1   
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Vay mat khau luu la 451
    
    //Nhap mat khau mat dinh
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    //Mat khau mac dinh - Thu 1: So 1
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau mac dinh- Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau mac dinh - Thu 2: So 2
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    
    //Mat khau mac dinh - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau mac dinh - Thu 3: So 1   
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0; 

    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #1 enter = 0;
    #5 enter = 1; #1 enter = 0;
    
    #5 mode = 1; 
    //Mat khau luu - Thu 1
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    //Mat khau luu - Thu 1: So 3
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau luu - Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 2: So 2
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    //Mat khau luu - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 3: So 1   
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    //Vay mat khau luu la 321
    
    #1 mode = 0; rst_btn = 1; #1 rst_btn = 0;
    //Spam lan 1 
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
    #5 enter = 1; #3 enter = 0;
    #5 enter = 1; #3 enter = 0;
    
    //Spam lan 2
    #10 mod3_btn = 1; #2 mod3_btn = 0;
    #5 enter = 1; #3 enter = 0;
    #5 enter = 1; #3 enter = 0;
    #5 enter = 1; #3 enter = 0;    
    //Nhap dung lan 3 
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    #5 mod3_btn = 1; #1 mod3_btn = 0;
    
    #5 enter = 1; #3 enter = 0;
    #5 enter = 1; #3 enter = 0;   
    #5 mod3_btn = 1; #1 mod3_btn = 0; 
    //Mat khau luu - Thu 1: So 3
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau luu - Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 2: So 2
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    //Mat khau luu - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 3: So 1   
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    
    //Spam sau khi da mo duoc, thi neu bam sai thi so lan sai la 1
    #5 mod3_btn = 1; #1 mod3_btn = 0; 
    //Mat khau luu - Thu 1: So 3
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #1 confirm = 0;
    //Mat khau luu - Thu 2
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 2: So 2
    #2 mod10_btn = 1; #1 mod10_btn = 0; 
    #2 mod10_btn = 1; #1 mod10_btn = 0;
    #2 confirm = 1; #2 confirm = 0;
    //Mat khau luu - Thu 3
    #5 mod3_btn = 1; #2 mod3_btn = 0;
    //Mat khau luu - Thu 3: So 0   
    #5 confirm = 1; #2 confirm = 0;
    #5 enter = 1; #3 enter = 0;
    
    
    
    
    #5 $finish;
    end
endmodule
