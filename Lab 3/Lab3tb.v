`timescale 1ns / 1ps
// `include "Lab3.v"

module Lab3tb;

    reg YP;
    reg NS;
    reg Clk;

    wire HYL, HRL, HW, HDNW;


ASM uut(
    .YP(YP),
    .NS(NS),
    .Clk(Clk),
    .HYL(HYL),
    .HRL(HRL),
    .HW(HW),
    .HDNW(HDNW)
    );


initial
    Clk <= 0;

always
    #5 Clk = ~Clk;

initial
begin
    $dumpfile("Lab3.vcd");
    $dumpvars(0,Lab3tb);

    YP = 1'b0;
    NS = 1'b1;
    #10;

    YP = 1'b1;
    #10;
end

endmodule
