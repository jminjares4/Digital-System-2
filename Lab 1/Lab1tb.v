/**
 * @file    Lab1tb.v
 * @author  Jesus Minjares
 * @date    2022-01-31
 * @brief   Lab 1 testbench, verifying module functionality
 */

`timescale 10ns / 1ps

module Lab1tb;
    //register -> inputs
    //wire -> outputs

    //variables for Or
    reg X;
    reg Y;
    wire Z;
    //variables for And
    reg X_and;
    reg Y_and;
    wire Z_and;  
    //variables for Xor
    reg X_xor;
    reg Y_xor;
    wire Z_xor;
    //variables for Nand
    reg X_nand;
    reg Y_nand;
    wire Z_nand;
    //variables for Inverter
    reg X_inv;
    reg Y_inv;
    wire Z_inv;
      
    //Create an instance of Or
    Or_nand uut1(
       .A(X),
       .B(Y),
       .Out(Z)
            );
    //Create an instance of And
            
    And_nand uut2(
        .A(X_and),
        .B(Y_and),
        .Out(Z_and)
     );
     
    //Create an instance of Xor
    Xor_nand uut3(
        .A(X_xor),
        .B(Y_xor),
        .Out(Z_xor));
    //Create an instance of Nand
    Nand uut4(
        .A(X_nand),
        .B(Y_nand),
        .Out(Z_nand)
        );
    //Create an instance of Inverter
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
