`timescale 1ns / 1ps
//or module
module Or(
    input Or0, Or1,
    output OrOut
    );

    assign OrOut = Or0 | Or1;

endmodule

//mux module
module Mux2_1(
    input Mux0, Mux1, Sel,
    output MuxOut /*, MuxCheck, SelCheck*/
    );

    /*assign SelCheck = Sel;*/
    assign MuxOut = Sel ? Mux1 : Mux0;
    /*assign MuxCheck = Sel ? Mux1 : Mux0;*/

endmodule

//One bit register module
module OneBitRegister(
    input D, Clk,
    output reg Q
    );
    
    always @ (posedge Clk)
        Q <= D;

endmodule

//DFF module
module DFlipFlop(
    input D, Clk, En,
    output reg Q/*, Qb*/
    );
    
    always @ (posedge Clk)
    begin   
        if(En)
        begin 
            Q <= D;
            /*Qb <= ~D;*/
        end
    end
endmodule
//Timer module
module Timer(
    input [3:0]D,
    input Clk, En,
    output T_Out/*,
    output [4:0]Timer_Out*/
    );
    reg T;
    reg [4:0]Time;
    
    /*assign Timer_Out = Time;*/
    assign T_Out = T;
    
    always @ (posedge Clk)
    begin
        if(~En)
        begin
            Time = D;
            if(Time == 15)
                Time = 21;
        end
        if(Time == 0)
            T = 1;
        else
        begin
            T = 0;
            Time = Time - 1;
        end
    end
endmodule

//decoder module
module Decoder(
	input [1:0] DecIn,
	output reg [3:0] DecOut
	);

	always @ (DecIn)
	case(DecIn)
	2'b00 : DecOut <= 4'b0001; 
	2'b01 :	DecOut <= 4'b0010;
	2'b10 :	DecOut <= 4'b0100;
	2'b11 :	DecOut <= 4'b1000;
	endcase

endmodule