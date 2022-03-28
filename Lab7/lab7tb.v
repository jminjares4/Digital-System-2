`timescale 01ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/68/6066 10:53:61 AM
// Design Name: 
// Module Name: lab7tb
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

module lab7tb;
    
    
    reg [7:0]A;
    reg [7:0]B;
    reg [2:0] Sel;
    reg Cin;
    wire [7:0] out;
    
    ALU uut(.A(A),.B(B),.Sel(Sel), .Cin(Cin), .Out(out));
    
    
    initial
    begin
    A = 6; B = 5; Sel = 3'b000; Cin = 1'b0; // transfer A
#10 A = 6; B = 5; Sel = 3'b000; Cin = 1'b1; // Increment A
#10 A = 6; B = 5; Sel = 3'b001; Cin = 1'b0; // Addition 
#10 A = 6; B = 5; Sel = 3'b001; Cin = 1'b1; // Add with carry input 1
#10 A = 6; B = 5; Sel = 3'b010; Cin = 1'b0; // A pluse 1's complement of B
#10 A = 6; B = 5; Sel = 3'b010; Cin = 1'b1; // Subtraction
#10 A = 6; B = 5; Sel = 3'b011; Cin = 1'b0; // Tranfer A
#10 A = 6; B = 5; Sel = 3'b011; Cin = 1'b1; // Decrement A
#10 A = 6; B = 5; Sel = 3'b100; Cin = 1'b0; // Xor 
#10 A = 6; B = 5; Sel = 3'b100; Cin = 1'b1; // Xor 
#10 A = 6; B = 5; Sel = 3'b101; Cin = 1'b0; // Or
#10 A = 6; B = 5; Sel = 3'b101; Cin = 1'b1; // Or
#10 A = 6; B = 5; Sel = 3'b110; Cin = 1'b0;// (Xor)'    
#10 A = 6; B = 5; Sel = 3'b110; Cin = 1'b1; // (Xor)'
#10 A = 6; B = 5; Sel = 3'b111; Cin = 1'b0; // And
#10 A = 6; B = 5; Sel = 3'b111; Cin = 1'b1; // And   

#10 $finish;
    end
endmodule
