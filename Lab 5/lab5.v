`timescale 1ns / 1ps

module Or(
    input Or0, Or1,
    output OrOut
    );

    assign OrOut = Or0 | Or1;

endmodule

module DFlipFlop( //USED FOR 4 BIT REGISTER
    input D,
    input Clk, En,
    output reg Q
    );
   
   initial Q <= 0;
   
    always @ (posedge Clk)
        begin
        if(En)
                Q <= D;
        end
endmodule

module OneBitRegister(
    input D, Clk,
    output reg Q
    );
   
    always @ (posedge Clk)
        Q <= D;

endmodule

module RegisterModule(
    input [3:0]D,
    input En, //HLO
    input Clk,
    output [3:0]Q
    );
   
    DFlipFlop df0(.D(D[0]), .Clk(Clk), .Q(Q[0]), .En(En));
    DFlipFlop df1(.D(D[1]), .Clk(Clk), .Q(Q[1]), .En(En));
    DFlipFlop df2(.D(D[2]), .Clk(Clk), .Q(Q[2]), .En(En));
    DFlipFlop df3(.D(D[3]), .Clk(Clk), .Q(Q[3]), .En(En));
   
endmodule

module Counter(
    input [3:0]D,  //COUNTER TO 15, COUNTS BACK TO 0
    input Clk, En, //LLNS
    output reg [3:0]C_out
);
               
   initial C_out <= 0;
               
   always @ (posedge Clk)
    begin
        if(~En) // if enabled (active low)
            C_out <= D;
        else if(C_out == 4'b1111)
            C_out <= 0;
        else
            C_out = C_out + 1;  // counting up        
    end
             
endmodule

module Timer(
    input [3:0]D,
    input Clk, En,
    output T_Out
    //output [4:0]Timer_Out
    );
    reg T;
    reg [4:0]Time;
   
    //assign Timer_Out = Time;
    assign T_Out = T;
   
    always @ (posedge Clk)
    begin
        if(~En) //IF BROUGHT TO 0, BEGIN COUNTING AT D INPUT
        begin
            Time = D;
            if(Time == 15)
                Time = 21;
        end
        if(Time == 0)
            T = 1;
        else //IF BROUGHT TO 1, BEGIN COUNTING DOWN
        begin
            T = 0;
            Time = Time - 1;
        end
    end
endmodule


module Mux2_1(
    input Mux0, Mux1, Sel,
    output MuxOut /*, MuxCheck, SelCheck*/
    );

    /*assign SelCheck = Sel;*/
    assign MuxOut = Sel ? Mux1 : Mux0;
    /*assign MuxCheck = Sel ? Mux1 : Mux0;*/

endmodule

module Decoder(
    input [1:0]DecIn,
    output reg [3:0]DecOut
    );

    always @ (DecIn)
    case(DecIn)
        2'b00 : DecOut <= 4'b0001;
        2'b01 : DecOut <= 4'b0010;
        2'b10 : DecOut <= 4'b0100;
        2'b11 : DecOut <= 4'b1000;
    endcase
endmodule

module ROM(
    input [5:0]A,
    output reg [7:0]D
    );
    always @(A)
    case(A)
        //State0
        6'b0000_0_0 : D <= 9'b0_1_1_1_11_01;
        6'b0000_0_1 : D <= 9'b0_1_1_1_11_01;
        6'b0000_1_0 : D <= 9'b0_1_1_1_11_01;
        6'b0000_1_1 : D <= 9'b0_1_1_1_11_01;
        //State1
        6'b0001_0_0 : D <= 9'b1_1_0_0_11_11;
        6'b0001_0_1 : D <= 9'b1_1_0_0_11_11;
        6'b0001_1_0 : D <= 9'b1_1_0_0_11_11;
        6'b0001_1_1 : D <= 9'b1_1_0_0_11_11;
        //State2
        6'b0010_0_0 : D <= 9'b1_0_1_0_00_10;
        6'b0010_0_1 : D <= 9'b0_1_1_0_00_11;
        6'b0010_1_0 : D <= 9'b0_0_1_0_11_01;
        6'b0010_1_1 : D <= 9'b0_0_1_0_11_01;
        //State3
        6'b0011_0_0 : D <= 9'b0_0_1_0_00_00;
        6'b0011_0_1 : D <= 9'b0_1_1_0_01_00;
        6'b0011_1_0 : D <= 9'b0_0_1_0_11_01;
        6'b0011_1_1 : D <= 9'b0_0_1_0_11_01;
        //State4
        6'b0100_0_0 : D <= 9'b0_1_1_1_10_01;
        6'b0100_0_1 : D <= 9'b0_1_1_1_10_01;
        6'b0100_1_0 : D <= 9'b0_1_1_1_10_01;
        6'b0100_1_1 : D <= 9'b0_1_1_1_10_01;
        //State5
        6'b0101_0_0 : D <= 9'b1_1_0_0_10_01;
        6'b0101_0_1 : D <= 9'b1_1_0_0_10_01;
        6'b0101_1_0 : D <= 9'b1_1_0_0_10_01;
        6'b0101_1_1 : D <= 9'b1_1_0_0_10_01;
        //State6
        6'b0110_0_0 : D <= 9'b1_0_1_0_01_10;
        6'b0110_0_1 : D <= 9'b1_1_1_0_01_11;
        6'b0110_1_0 : D <= 9'b1_0_1_0_11_01;
        6'b0110_1_1 : D <= 9'b1_0_1_0_11_01;
        //State7
        6'b0111_0_0 : D <= 9'b0_1_1_1_01_11;
        6'b0111_0_1 : D <= 9'b0_1_1_1_01_11;
        6'b0111_1_0 : D <= 9'b0_1_1_1_01_11;
        6'b0111_1_1 : D <= 9'b0_1_1_1_01_11;
        //State8
        6'b1000_0_0 : D <= 9'b1_1_0_0_11_11;
        6'b1000_0_1 : D <= 9'b1_1_0_0_11_11;
        6'b1000_1_0 : D <= 9'b1_1_0_0_11_11;
        6'b1000_1_1 : D <= 9'b1_1_0_0_11_11;    
        //State9
        6'b1001_0_0 : D <= 9'b1_0_1_0_10_01;
        6'b1001_0_1 : D <= 9'b1_1_1_0_10_10;
        6'b1001_1_0 : D <= 9'b1_0_1_0_11_01;
        6'b1001_1_1 : D <= 9'b1_0_1_0_11_01;
        //State10
        6'b1010_0_0 : D <= 9'b1_1_1_1_01_10;
        6'b1010_0_1 : D <= 9'b1_1_1_1_01_10;
        6'b1010_1_0 : D <= 9'b1_1_1_1_01_10;
        6'b1010_1_1 : D <= 9'b1_1_1_1_01_10;
        //State11
        6'b1011_0_0 : D <= 9'b1_1_0_0_10_01;
        6'b1011_0_1 : D <= 9'b1_1_0_0_10_01;
        6'b1011_1_0 : D <= 9'b1_1_0_0_10_01;
        6'b1011_1_1 : D <= 9'b1_1_0_0_10_01;
        //State12
        6'b1100_0_0 : D <= 9'b1_0_1_0_11_00;
        6'b1100_0_1 : D <= 9'b1_0_1_0_00_00;
        6'b1100_1_0 : D <= 9'b1_0_1_0_11_01;
        6'b1100_1_1 : D <= 9'b1_1_1_0_11_01;
        //State13
        6'b1101_0_0 : D <= 9'b1_1_1_1_01_01;
        6'b1101_0_1 : D <= 9'b1_1_1_1_01_01;
        6'b1101_1_0 : D <= 9'b1_1_1_1_01_01;
        6'b1101_1_1 : D <= 9'b1_1_1_1_01_01;
        //State14
        6'b1110_0_0 : D <= 9'b1_1_0_0_11_00;
        6'b1110_0_1 : D <= 9'b1_1_0_0_11_00;
        6'b1110_1_0 : D <= 9'b1_1_0_0_11_00;
        6'b1110_1_1 : D <= 9'b1_1_0_0_11_00;
        //State 15
        6'b1111_0_0 : D <= 9'b1_0_1_0_11_11;
        6'b1111_0_1 : D <= 9'b1_1_1_0_00_00;
        6'b1111_1_0 : D <= 9'b1_0_1_0_11_01;
        6'b1111_1_1 : D <= 9'b1_0_1_0_11_01;
        default : D <= 8'b1_1_1_1_01_01;
       endcase
endmodule

module TrafficLightController(
    input YET, YWT,YE, Clk,
    output HEWR, HEWY, HEWG, HNSR, HNSY, HNSG
    );  
   wire HLO, LLT, LLNS, HSTO, YTO;        
   wire HSTOD, MuxToCont,YEWS, G0, G1, A0;
   wire [3:0]dec;
   wire [3:0]Rin25;
   wire [3:0]Rout03;
       
   Or or1(.Or0(YET), .Or1(YWT), .OrOut(YEWS));
   Timer topCounter(.D(Rout03), .Clk(Clk), .En(LLT), .T_Out(YTO)); //top counter
   OneBitRegister reg0(.D(HSTO), .Clk(Clk), .Q(HSTOD));
   Mux2_1 muxx(.Sel(HSTOD),.Mux0(YEWS), .Mux1(YTO),.MuxOut(A0));
           
   Counter bottomCounter(.D(Rout03), .Clk(Clk), .En(LLNS), .C_out(Rin25)); //bottom counter
   
   RegisterModule reg1(.D(Rout03), .Clk(Clk),.En(HLO),.Q(dec));                      

   Decoder decNS(.DecIn({dec[3], dec[2]}),.DecOut({HNSG, HNSY, HNSR, G1}));
   Decoder decEW(.DecIn({dec[1], dec[0]}),.DecOut({HEWG, HEWY, HEWR, G0}));
     
   ROM romcontroller(.A({Rin25, YE, A0}), .D({HSTO, LLNS, LLT, HLO,Rout03}) );  
endmodule


