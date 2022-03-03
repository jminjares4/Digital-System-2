`timescale 1ps/1ps
module problem_16_test;

    reg a,b,c,d,sel,enable;
    wire y;

    solution_problem_16 uut(.enable(enable),
    .a(a),.b(b),.c(c),.d(d),.sel(sel),.y(y));

initial 
begin
    $dumpfile("problem16.vcd");
    $dumpvars(0,problem_16_test);
    a = 0; b=0; c = 0; d = 0; sel = 0; enable = 0;
#10
    a = 1; b=1; c = 0; d = 0; sel = 0; enable = 0;
#10
    a = 0; b=0; c= 0; d = 0; sel = 1; enable = 0;
#10
    a = 0; b=0; c = 0; d = 0; sel = 0; enable = 1;
#10
    a = 0; b=0; c = 0; d = 0; sel = 1; enable = 1;
#5    $finish; 
    end
endmodule