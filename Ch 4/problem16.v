`timescale 1ps/1ps

module mux(input a,b,c,d,sel,output y);
    wire a0,b0;
    wire a1,b1;

    nand nand1(a0, a,b);
    nand nand2(b0,c,d);

    and and1(a1,~sel,a0);
    and and2(b1, sel, b0);

    or or1(y, a1,b1);
endmodule

module solution_problem_16(input enable, a,b,c,d,sel,output y);
    wire out;
    mux myMux(.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(out));
    bufif0 myBuffer(y,out,enable);
endmodule