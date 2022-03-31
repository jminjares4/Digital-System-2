/*
    Author: Jesus Minjares
    Date:   03-31-2022
    Digital System II Quiz
*/


module up_down_counter(input [1:0] up_dwn, input clk, input reset, output reg [3:0]count);

    initial begin
        count = 3'b0;
    end
    always @ (negedge reset,clk)
    begin
        if(reset == 1'b0)
            count = 3'b0;
        if(up_dwn == 2'b01) //increment
            count = count + 1;
        if(up_dwn == 2'b10)
            count = count - 1;
        if(up_dwn == 2'b11 || up_dwn == 2'b00)
            count = count;
    end

endmodule
