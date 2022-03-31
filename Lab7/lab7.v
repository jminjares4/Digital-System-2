`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 10:52:55 AM
// Design Name: 
// Module Name: lab7
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

// Swap Decrement A and Transfer A 




/*
module transfer(input [7:0] R0, output [7:0] out);
    assign out = R0;
endmodule;

module increment(input [7:0] R0, output [7:0] out);
    assign out = R0 + 1;
endmodule;

module addition(input [7:0] R0, input [7:0] R1, output [7:0] out);
    assign out = R0 + R1;
endmodule;

module add_carry(input [7:0] R0, input [7:0] R1, output [7:0] out);
    assign out = R0 + R1 + 1;
endmodule;

module add_complement(input [7:0] R0, input [7:0] R1, output [7:0] out);
    assign out = R0 + ~(R1);
endmodule;

module subtraction(input [7:0] R0, input [7:0] R1, output [7:0] out);
    assign out = R0 + ~(R1) + 1;
endmodule;

module decrement(input [7:0] R0, output [7:0] out);
    assign out = R0 - 1;
endmodule;

module Xor(input [7:0] R0, input [7:1] R1, output out);
    assign out = R0 ^ R1;
endmodule;

module Or(input [7:0] R0, input [7:0] R1, output out);
    assign out = R0 | R1;
endmodule;

module Xor_complement(input [7:0] R0, input [7:0] R1, output [7:0] out);
    assign out = ~(R0 ^ R1);
endmodule;

module And(input [7:0] R0, input [7:0] R1, output out);
    assign out = R0 & R1;
endmodule;

*/

module ALU(
input [7:0] A,B,
input [2:0] Sel,
input Cin,
output reg [7:0] Out,
output Cout);
    
always @(Sel, Cin)
begin
    if(Sel == 3'b000)
    begin
        if(Cin == 0)
            Out = A;
        else
            Out = A + 1'b1;
    end
    else if( Sel == 3'b001)
    begin
        if(Cin == 0)
            Out = A + B;
        else 
            Out = A + B + 1'b1;
    end
    else if(Sel == 3'b010)
    begin
        if(Cin == 0)
            Out = A + ~B;
        else
            Out = A + ~B + 1'b1;
    end
    else if(Sel == 3'b011)
    begin
        if(Cin == 0)
            Out = A;
        else
            Out = A - 1;
    end
    else if(Sel == 3'b100)
    begin
        Out = A ^ B;
    end
    else if(Sel == 3'b101)
    begin
        Out = A | B;
    end
    else if(Sel == 3'b110)
    begin
        Out = ~( A ^ B );
    end
    else if(Sel == 3'b111)
    begin
        Out = A & B;
    end
//    else
//        Out <= 0;
end
/*

    if(3'b000 == Sel & Cin == 0):
    begin
        transfer trans(A ,out);
    end
    4'b0001:
    begin
        increment inc(A,B, out);
    end
    4'b0010:
    begin
        addition add(A,B, out);
    end
    4'b0011:
    begin
        add_carry add_c(A,B, out);
    end
    4'b0100:
    begin
        add_complement add_com(A,B, out);
    end
    4'b0101:
    begin
        subtraction sub(A,B, out);
    end
    4'b0110:
    begin
        transfer(A, out);
    end
    4'b0111:
    begin
        decrement dec(A,B,out);
    end
    4'b1000:
    begin
     Xor xor0(A,B,out);
    end
    4'b1001:
    begin
        Xor xor0(A,B, out);
    end
    4'b1010:
    begin
        Or or0(A,B, out);
    end
    4'b1011:
    begin
        Or Or0(A, B, out);
    end
    4'b1100:
    begin
        Xor_complement xor_c(A, B, out);
    end
    4'b1101:
    begin
        Xor_complement xor_c(A, B, out);
    end
    4'b1110:
    begin
        And and0(A,B,out);
    end
    4'b1111:
    begin
        And and0(A,B,out);
    end
    endcase
end
*/
endmodule
