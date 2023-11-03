module password_12it (
    mode,
    mod3,
    mod10,
    rst,
    confirm,
    password
);
    input mode;
    input [1:0] mod3;
    input [3:0] mod10;
    input rst;
    input confirm;
    output [11:0] password;
    wire clk_enb;
    wire [2:0] select;
    reg [3:0] key1_out;
    select_2bit key_enb(mod3,select);
    assign clk_reg1 = mode & select[0] & confirm;
    assign clk_reg2 = mode & select[1] & confirm;
    assign clk_reg3 = mode & select[2] & confirm;
    reg_4bit key1 (mod10,clk_reg1,rst,password[11:8]);
    reg_4bit key2 (mod10,clk_reg2,rst,password[7:4]);
    reg_4bit key3 (mod10,clk_reg3,rst,password[3:0]);
endmodule 