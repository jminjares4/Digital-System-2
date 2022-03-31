/*
    Author: Jesus Minjares
    Date:   03-31-2022
    Digital System II Quiz
*/

module jesus_quiztb;

    reg [1:0] up_dwn;
    reg clk;
    reg reset;
    wire [3:0] count;


    up_down_counter uut(.up_dwn(up_dwn),.clk(clk), .reset(reset), .count(count));


initial
    clk <= 0; //start clock @ 0
    
always
begin
    #5 clk = ~clk; // toggle clock every 5 clock cycles
end


initial
begin
    //store output to vcd to open in GTKWAVE
    $dumpfile("jesus_minjares_tb.vcd");
    $dumpvars(0, jesus_quiztb);

    up_dwn = 1;
#10 up_dwn = 1;
#10 up_dwn = 1;
#10 up_dwn = 3;
#10 up_dwn = 2;
#10 up_dwn = 2;
#10 up_dwn = 2;
#10 up_dwn = 1;
#10 up_dwn = 2;
#10 up_dwn = 0;

$finish;
end
endmodule