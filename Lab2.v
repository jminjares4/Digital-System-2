`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 10:37:26 AM
// Design Name: 
// Module Name: Lab2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Or(
    input A,
    input B,
    output Out);
    assign Out= A|B;
endmodule

module And(
    input A,
    input B,
    output Out);
    assign Out= A&B;
endmodule


//module Inverter(
//    input A,
//    output reg B);
//    always @ (A)
//    begin
//        if(A == 1'b0)
//        begin
//             B = 1'b1;
//        end
//        else
//             B = 1'b0;
//    end       
//endmodule

//module Lab2(
//    input A, 
//    input B, 
//    input Cin, 
//    output Sum, 
//    output Cout
//    );    
//endmodule

module FullAdder(input A, input B, input C, output Sum, output Cout);
//    wire a, b, cin,
    wire a0,a1,a2,a3,a4;    
    wire o0, o1; 
    And And1(.A(~A), .B(~C), .Out(a0)); //~A~C
    And And2(.A(~B), .B(~C), .Out(a1));//~B~C
    And And3(.A(A), .B(B), .Out(a2)); // AB
    And And4(.A(A), .B(C), .Out(a3)); // AC
    And And5(.A(a2),.B(C), .Out(a4)); // AB & C -> ABC
    
    Or Or1(.A(a0), .B(a1), .Out(o0)); //~A~C + ~B~C
    
    Or Or2(.A(a2), .B(a3), .Out(o1));  //AB + AC 
    
    Or Or3(.A(o0), .B(a4), .Out(Sum)); // ~A~C + ~B~C + ABC
    
    Or Or4(.A(o1), .B(~a1), .Out(Cout)); // AC + AB +BC
endmodule


module HexAdder(input [3:0]A, input[3:0]B, input C, output [3:0]Sum, output Cout);
    wire co, c1, c2;
    
    FullAdder f1(.A(A[0]),.B(B[0]),.C(C),.Sum(Sum[0]),.Cout(co));
    FullAdder f2(.A(A[1]),.B(B[1]),.C(co),.Sum(Sum[1]),.Cout(c1));
    FullAdder f3(.A(A[2]),.B(B[2]),.C(c1),.Sum(Sum[2]),.Cout(c2));
    FullAdder f4(.A(A[3]),.B(B[3]),.C(c2),.Sum(Sum[3]),.Cout(Cout));
    
endmodule  

//input [3:0]Name
//module HexAdder(input A[4], input B[4], input Cin[4], output Sum[4], output Cout[4]);
//endmodule
