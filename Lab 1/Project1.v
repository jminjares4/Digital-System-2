`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2022 10:41:13 AM
// Design Name: 
// Module Name: Project1
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
    output Out
    );
    
    assign Out = A | B;
    
endmodule

module And(
    input A,
    input B,
    output Out
    );
    
    assign Out = A & B;
    
endmodule


module Nand(
    input A, 
    input B, 
    output Out
    );
   
    assign Out = ~(A & B);

endmodule

module Inverter(
    input A,
    input B,
    output reg Out
    );
    
    always @ (A or B)
    begin
        if(A == 1'b1 | B == 1'b1)
        begin
            Out = 1'b0;
        end
        else 
            Out = 1'b1;
    end
endmodule

module And_nand(
    input A,
    input B,
    output Out
    );
    
    wire my_and;
    
    Nand my_nand(.A(A), .B(B), .Out(my_and));
 
    Inverter my_inv(.A(my_and), .B(my_and), .Out(Out));

endmodule

module Or_nand(
    input A,
    input B,
    output Out);
    
    wire a_i;
    wire b_i;
    
    Inverter a_inv(.A(A), .B(A), .Out(a_i));
    Inverter b_inv(.A(B), .B(B), .Out(b_i));
    
    Nand my_nand(.A(a_i),.B(b_i), .Out(Out));
    
 endmodule
 
 module Xor_nand(
    input A,
    input B,
    output Out);
    
    wire a_inv_out;
    Inverter first_inv(.A(A), .B(A), .Out(a_inv_out));
    
    wire b_inv_out;
    Inverter second_inv(.A(B),.B(B), .Out(b_inv_out));
    
    wire a_nand_out;
    Nand a_nand(.A(A),.B(b_inv_out), .Out(a_nand_out));
    
    wire b_nand_out;
    Nand b_nand(.A(B), .B(a_inv_out), .Out(b_nand_out));
    
    Nand c_nand(.A(a_nand_out), .B(b_nand_out), .Out(Out));
    
 endmodule
