/**
 * @file    Lab1.v
 * @author  Jesus Minjares
 * @date    2022-02-10
 * @brief   Create a Full-adder and Hexadecimal adder using AND and OR gates
 */
`timescale 10ns / 1ps

//Or module with 2 inputs
module Or(
    input A,
    input B,
    output Out);
    assign Out= A|B;
endmodule

//And module with 2 inputs
module And(
    input A,
    input B,
    output Out);
    assign Out= A&B;
endmodule

//FullAdder module of two bits 
module FullAdder(input A, input B, input C, output Sum, output Cout);

    //create wires to store and and or outputs
    wire a01,a02,a03,a04;
    wire a11,a12,a13,a14;
    wire o01, o02;
    //instantiate AND and OR gates for the SUM
    And And1(.A(~A),.B(~B),.Out(a01)); 
    And And2(.A(~A),.B(B),.Out(a02));
    And And3(.A(A),.B(B), .Out(a03));
    And And4(.A(A),.B(~B), .Out(a04));
    And And5(.A(a01),.B(C),.Out(a11));
    And And6(.A(a02),.B(~C),.Out(a12));
    And And7(.A(a03),.B(C),.Out(a13));
    And And8(.A(a04),.B(~C),.Out(a14));
    Or Or1(.A(a11),.B(a12),.Out(o01));
    Or Or2(.A(a13),.B(a14),.Out(o02));
    Or Or3(.A(o01),.B(o02),.Out(Sum));
    
    // instantiate AND and OR gates for the Cout
    wire c1,c2,c3,c4;
    And And9(.A(A),.B(C),.Out(c1));
    And And10(.A(A),.B(B),.Out(c2));
    And And11(.A(B),.B(C),.Out(c3));
    Or Or4(.A(c1),.B(c2),.Out(c4));
    Or Or5(.A(c4),.B(c3),.Out(Cout));
endmodule

//Hexadecimal adder with two 4 bits inputs and 4 bits sum output 
module HexAdder(input [3:0]A, input[3:0]B, input C, output [3:0]Sum, output Cout);
    //create wire to store Cin output
    wire co, c1, c2;
    //instantiate Fulll-adder modules
    FullAdder f1(.A(A[0]),.B(B[0]),.C(C),.Sum(Sum[0]),.Cout(co));
    FullAdder f2(.A(A[1]),.B(B[1]),.C(co),.Sum(Sum[1]),.Cout(c1));
    FullAdder f3(.A(A[2]),.B(B[2]),.C(c1),.Sum(Sum[2]),.Cout(c2));
    FullAdder f4(.A(A[3]),.B(B[3]),.C(c2),.Sum(Sum[3]),.Cout(Cout));
    
endmodule  
