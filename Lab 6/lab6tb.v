/**
 * @file    lab6.v
 * @author  Jesus Minjares
 * @date    2022-03-25
 * @brief   
 */

`timescale 1ns / 1ps

//Lab 6 testbench
module lab6tb;

    reg [7:0] A;
    reg Clk;
    reg [1:0] Sel;
    wire [7:0] MuxOut;

    //instantiate lab 6 module
    Lab6 uut(
       .Sel(Sel),
       .A(A),
       .Clk(Clk),
       .MuxOut(MuxOut)
    
    );

  initial
        Clk <= 0; //start clock @ 0
       
    always

    begin
        #5 Clk = ~Clk; // toggle clock every 5 clock cycles
    end
   
    initial
    begin
    //store output to vcd to open in GTKWAVE
    $dumpfile("lab6.vcd");
    $dumpvars(0, lab6tb);

   // Test conditions
      A = 7; Sel = 0;
   #10
      A = 7; Sel = 1;
   #10
      A = 7; Sel = 2;
   #10
      A = 7; Sel = 3;
   #10
      A = 3; Sel = 0;
   #10
      A = 3; Sel = 1;
   #10
      A = 3; Sel = 2;
   #10
      A = 3; Sel = 3;
   #10
      $finish; // end 
   end
endmodule
