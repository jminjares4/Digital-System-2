`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 10:38:12 AM
// Design Name: 
// Module Name: Lab2tb
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

module Lab2tb;
    reg A,B,Ci;
    wire Co, S;
    
    FullAdder uut(
        .A(A),
        .B(B), 
        .C(Ci),
        .Sum(S),
        .Cout(Co)
     );
initial
begin
     
//     A = 0; B = 0; Ci = 0;
//#1   A = 0; B = 0; Ci = 1;
//#1   A = 0; B = 1; Ci = 0;
//#1   A = 0; B = 1; Ci = 1;
#1   A = 1; B = 0; Ci = 0;
//#1   A = 1; B = 0; Ci = 1;
//#1   A = 1; B = 1; Ci = 0;
//#1   A = 1; B = 1; Ci = 1;


#5 $finish; // ends the code
    end
endmodule
