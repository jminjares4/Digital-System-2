/**
 * @file    Lab1.v
 * @author  Jesus Minjares
 * @date    2022-02-10
 * @brief   Create a testbench for Full-adder and Hexadecimal adder using AND and OR gates
 */

`timescale 10ns / 1ps

module Lab2tb;
    //create wires and register for the inputs
    reg [3:0]A;
    reg [3:0]B;
    reg C;
    wire [3:0]S;
    wire Co; 
    //instantiate HexAdder module  
    HexAdder uut(.A(A),.B(B), .C(C), .Sum(S),.Cout(Co));

//start test bench
initial
begin

//loop for 10 iterations
repeat (10)
begin
#10 //add same delay
// store random number from 0-16
A = $random() % 16;
B = $random() % 16;
C = $random() % 16;
end

#5 $finish; // ends the code
    end
endmodule
