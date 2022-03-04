`timescale 1ps/1ps

module ch4_tb;
    reg a;
    reg b;
    reg c;
    reg d;
    wire [2:0] Y;
    two_bit uut(.a(a),.b(b),.c(c),.d(d),.Y(Y));

initial begin
    $dumpfile("ch4.vcd");
    $dumpvars(0,ch4_tb);
    //equal
    a = 0; b = 0; c = 0; d = 0;
#1 
    //greater
    a = 0; b = 1; c = 0; d = 0;
#1 
    //less
    a = 0; b = 1; c = 1; d = 0;
#1
    $finish;
end
endmodule