/**
 * @file    lab6.v
 * @author  Jesus Minjares
 * @date    2022-03-25
 * @brief   
 */
`timescale 1ns / 1ps

//Mux 
module Mux(
    input [1:0] Sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] MuxOut 
    );
    assign MuxOut = Sel[1] ? (Sel[0] ?  d : c ) : (Sel[0] ?  b : a) ;
endmodule

//D-Flip-Flop
module DFlipFlop(
    input D, Clk,
    output reg Q
    );
    initial
        Q = 0;
    always @ (posedge Clk)
    begin   
        Q <= D;
    end
endmodule

// Register
module Reg(

    input [7:0]A,
    input Clk,
    output [7:0]D
    
    );
   //instantiate dff
   DFlipFlop dff0(.D(A[0]), .Clk(Clk), .Q(D[0]));
   DFlipFlop dff1(.D(A[1]), .Clk(Clk), .Q(D[1]));
   DFlipFlop dff2(.D(A[2]), .Clk(Clk), .Q(D[2]));
   DFlipFlop dff3(.D(A[3]), .Clk(Clk), .Q(D[3]));
   DFlipFlop dff4(.D(A[4]), .Clk(Clk), .Q(D[4]));
   DFlipFlop dff5(.D(A[5]), .Clk(Clk), .Q(D[5]));
   DFlipFlop dff6(.D(A[6]), .Clk(Clk), .Q(D[6]));
   DFlipFlop dff7(.D(A[7]), .Clk(Clk), .Q(D[7]));
  
endmodule

//XOR expression
module K0(                              
    input [7:0] R0, input [7:0] R1,
    output [7:0] out
);
    assign out = R0 ^ R1; 
endmodule

//OR expression
module K1(                             
    input [7:0] R0, input [7:0] R1,
    output [7:0] out
);
    assign out = R0 | R1;
endmodule

//NOR expression
module K2(
    input [7:0] R0, input [7:0] R1,
    output [7:0] out
);
    assign out = ~(R0 ^ R1);  
endmodule

//AND expression
module K3(
    input [7:0] R0, input [7:0] R1,
    output [7:0] out
);
    assign out = R0 & R1;
endmodule

//Lab 6 module
module Lab6( 
    input [7:0] A,
    input Clk,
    input [1:0] Sel,
    output [7:0] MuxOut
        );
   wire [7:0] fK0;
   wire [7:0] fK1;
   wire [7:0] fK2;
   wire [7:0] fK3;
   wire [7:0] fReg0;
   wire [7:0] fMux;
   wire [7:0] fReg1;
   
   //store mux
   assign MuxOut = fMux;
   
   //instantiate all connections 
   Reg reg0(.A(A), .Clk(Clk), .D(fReg0));
   Reg reg1(.A(fMux), .Clk(Clk), .D(fReg1));

   //instantiate all expressions
   K0 expr0(.R0(fReg0), .R1(fReg1), .out(fK0));
   K1 expr1(.R0(fReg0), .R1(fReg1), .out(fK1));
   K2 expr2(.R0(fReg0), .R1(fReg1), .out(fK2));
   K3 expr3(.R0(fReg0), .R1(fReg1), .out(fK3));
   
   Mux mux0(.Sel(Sel), .a(fK0), .b(fK1), .c(fK2), .d(fK3), .MuxOut(fMux));
           
endmodule
