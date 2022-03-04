// Author:  Jesus Minjares
//          Master of Science in Computer Engineering
//
// Date:    03/03/22
// Objective:
//           Create a mux with a three-state behavior using structural modeling

module mux(input a,b,c,d,sel,output y);
    //wires 
    wire a0,b0;
    wire a1,b1;
    
    //connect via nands 
    nand nand1(a0, a,b);
    nand nand2(b0,c,d);
    //connect via ands
    and and1(a1,~sel,a0);
    and and2(b1, sel, b0);
    //or output
    or or1(y, a1,b1);
endmodule

module solution_problem_16(input enable, a,b,c,d,sel,output y);
    //wire to cascade output
    wire out;
    //instaniate mux 
    mux myMux(.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(out));
    //set output with tri-state buffer
    bufif0 myBuffer(y,out,enable);
endmodule