`timescale 10ns / 1ps
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
//    reg A,B,Ci;
//    wire Co, S;
    
//    FullAdder uut(
//        .A(A),
//        .B(B), 
//        .C(Ci),
//        .Sum(S),
//        .Cout(Co)
//     );
    
    reg [3:0]A;
    reg [3:0]B;
    reg C;
    wire [3:0]S;
    wire Co; 
    
    
    HexAdder uut(.A(A),.B(B), .C(C), .Sum(S),.Cout(Co));
initial
begin
     
//     A = 0; B = 0; Ci = 0;
//#1   A = 0; B = 0; Ci = 1;
//#1   A = 0; B = 1; Ci = 0;
//#1   A = 0; B = 1; Ci = 1;
//#1   A = 1; B = 0; Ci = 0;
//#1   A = 1; B = 0; Ci = 1;
//#1   A = 1; B = 1; Ci = 0;
//#1   A = 1; B = 1; Ci = 1;


repeat (10)
begin
#10
A = $random() % 16;
B = $random() % 16;
C = $random() % 16;
end


#5 $finish; // ends the code
    end
endmodule
