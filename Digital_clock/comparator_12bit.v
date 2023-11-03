module comparator_12bit (
    input [11:0] pass_in, pass_set,
    input enb,
    input rst,
    output reg lock =1'b0,
    output reg [2:0] led_RGB = 3'b100
     );
     always @ (posedge enb or posedge rst)
        if (rst) begin
            lock <=0;
            led_RGB <= 3'b100;
        end
        else begin
            if (pass_in == pass_set) begin
            lock <=1;
            led_RGB <= 3'b010;
            end
            else begin 
                lock <=0;
                led_RGB <= 3'b100;
            end
        end
endmodule