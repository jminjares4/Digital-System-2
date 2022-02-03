/**
 * @file    Lab1.v
 * @author  Jesus Minjares
 * @date    2022-01-31
 * @brief   Lab 1 consist of development OR, AND, NOT, and XOR gates using NAND 
 */

`timescale 10ns / 1ps //set timescale 

//Nand module with 2 inputs and 1 output
module Nand(
    input A, 
    input B, 
    output Out
    );
    // NOT(A AND B)
    assign Out = ~(A & B);

endmodule

//Inverter module with 2 inputs and 1 output
//output reg to store output value
module Inverter(
    input A,
    input B,
    output reg Out
    );
    
    //loop
    always @ (A or B) 
    begin
        // if(A == 1'b1 | B == 1'b1)
        // begin
        //     Out = 1'b0;
        // end
        // else 
        //     Out = 1'b1;
        Out = (A == 1'b1 | B == 1'b1) ? 1'b0 :  1'b1;    
    end
endmodule

//And_nand module with 2 inputs and 1 output
//And_nand uses nand and inverter to create an AND gate
module And_nand(
    input A,
    input B,
    output Out
    );
    
    //create a wire to store output
    wire my_and;
    
    //create an instant of Nand gate and pass A, B and store in my_nand
    Nand my_nand(.A(A), .B(B), .Out(my_and));
    
    //create an instant of Inverter and pass Nand output as input and store in Out
    Inverter my_inv(.A(my_and), .B(my_and), .Out(Out));

endmodule

//Or_nand module with 2 inputs and 1 output
//Or_nand uses nand and inverter to create an OR gate
module Or_nand(
    input A,
    input B,
    output Out);
    
    //create wires to store outputs
    wire a_i;
    wire b_i;
    
    //create instances of inverters and pass A and B
    Inverter a_inv(.A(A), .B(A), .Out(a_i));
    Inverter b_inv(.A(B), .B(B), .Out(b_i));
    
    //create an instance of Nand and store output to Out
    Nand my_nand(.A(a_i),.B(b_i), .Out(Out));
    
 endmodule
 
//Xor_nand module with 2 inputs and 1 output
//Xor_nand uses nand and inverter to create an XOR gate
 module Xor_nand(
    input A,
    input B,
    output Out);
    
    //create a wire to store inverter A
    wire a_inv_out;
    Inverter first_inv(.A(A), .B(A), .Out(a_inv_out));
    //create a wire to store inverter B
    wire b_inv_out;
    Inverter second_inv(.A(B),.B(B), .Out(b_inv_out));
    //create wire to store Nand A
    wire a_nand_out;
    Nand a_nand(.A(A),.B(b_inv_out), .Out(a_nand_out));
    //create wire to store Nand B
    wire b_nand_out;
    Nand b_nand(.A(B), .B(a_inv_out), .Out(b_nand_out));
    //create an instance of Nand and pass the outputs of Nand A, Nand B and store in Out
    Nand c_nand(.A(a_nand_out), .B(b_nand_out), .Out(Out));
    
 endmodule
