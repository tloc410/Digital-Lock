module check_pass_def (
    input mode,
    input mode_def,
    input enter,
    input [1:0] mod3_btn,
    input lock_rst,
    input rst_all,
    output reg Q = 1'b0,
    output [2:0] led_4
    );      
    wire rst;
    wire enb;
    wire mod3_check;
    assign mod3_check = (mod3_btn == 2'b00) ? 1'b0 : 1'b1;
    assign rst = lock_rst | rst_all;
    assign enb = mod3_check & (~mode) & mode_def & enter ;
    always @(posedge enb, posedge rst) begin
        if  (rst) begin
            Q <= 1'b0;
        end
        else begin
            Q<= 1'b1;
        end
    end
    assign led_4 = (Q == 1'b0) ? 3'b000 : 3'b110;
endmodule