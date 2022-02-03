`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2022 1:45:39 AM
// Design Name: 
// Module Name: Project1tb
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


module Project1tb;
    
    //register -> inputs
    //wire -> outputs
    reg X;
    reg Y;
    wire Z;
    
    reg X_and;
    reg Y_and;
    wire Z_and;
    
    
    reg X_xor;
    reg Y_xor;
    wire Z_xor;
    
    reg X_nand;
    reg Y_nand;
    wire Z_nand;
    
    reg X_inv;
    reg Y_inv;
    wire Z_inv;
    
    
    Or_nand uut1(
       .A(X),
       .B(Y),
       .Out(Z)
            );
            
    And_nand uut2(
        .A(X_and),
        .B(Y_and),
        .Out(Z_and)
     );
     
     
     Xor_nand uut3(
        .A(X_xor),
        .B(Y_xor),
        .Out(Z_xor));
     
     
    
    
    Nand uut4(
        .A(X_nand),
        .B(Y_nand),
        .Out(Z_nand)
        );

    Inverter uut5(
    .A(X_inv),
    .B(Y_inv),
    .Out(Z_inv)
    );
    
    
    initial 
    begin
    X = 0; Y = 0;
// 1 clock cycle
#1 X = 0; Y = 1; 
#1 X = 1; Y = 0;
#1 X = 1; Y = 1;

    X_and = 0; Y_and = 0;
// 1 clock cycle
#1 X_and = 0; Y_and= 1; 
#1 X_and = 1; Y_and= 0;
#1 X_and = 1; Y_and= 1;

    

    X_nand = 0; Y_nand = 0;
// 1 clock cycle
#1 X_nand = 0; Y_nand= 1; 
#1 X_nand = 1; Y_nand= 0;
#1 X_nand = 1; Y_nand= 1;

    X_inv = 0; Y_inv= 0;
// 1 clock cycle
#1 X_inv = 0; Y_inv= 1; 
#1 X_inv = 1; Y_inv= 0;
#1 X_inv = 1; Y_inv = 1;



    X_xor = 0; Y_xor= 0; 
// 1 clock cycle
#1 X_xor= 0; Y_xor= 1; 
#1 X_xor = 1; Y_xor= 0;
#1 X_xor= 1; Y_xor = 1;
#5 $finish; // ends the code
    end
endmodule
