// Author:  Jesus Minjares
//          Master of Science in Computer Engineering
//
// Date:    03/03/22
// Objective:
//           Create a mux with a three-state behavior using structural modeling

`timescale 10ns/1ps
module problem_16_test;
    //create inputs 
    reg a,b,c,d,sel,enable;
    //create output
    wire y;

    //instantiate solution
    solution_problem_16 uut(
                .enable(enable),
                .a(a),
                .b(b),
                .c(c),
                .d(d),
                .sel(sel),
                .y(y)
                        );

initial 
begin
    //store output in vcd file
    $dumpfile("problem16.vcd");
    //dump variables of the testbench
    $dumpvars(0,problem_16_test);

    //verify functionality
    a = 0; b=0; c = 0; d = 0; sel = 0; enable = 0; //intial state
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