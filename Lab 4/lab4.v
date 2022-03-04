`timescale 1ns / 1ps

module DFF(
    input D, Clk,
    output reg Q
    );
    
    always @(posedge Clk)
        Q <= D;
    
endmodule

module INV(
    input A,
    output B
    );
    
    assign B = ~A;
endmodule

module threeBitReg(
        input [2:0]D,
        input Clk,
        output [2:0]Q
    );
    
    DFF dff1(.D(D[0]), .Clk(Clk), .Q(Q[0]));
    DFF dff2(.D(D[1]), .Clk(Clk), .Q(Q[1]));
    DFF dff3(.D(D[2]), .Clk(Clk), .Q(Q[2]));
endmodule

module twoBitReg(
        input [1:0]D,
        input Clk,
        output [1:0]Q
    );
    
    DFF dff1(.D(D[0]), .Clk(Clk), .Q(Q[0]));
    DFF dff2(.D(D[1]), .Clk(Clk), .Q(Q[1]));
endmodule

module genMUX(
    input [1:0]S,
    input A, B, C, D,
    output Out
    );
    
    assign Out = S[1] ? (S[0] ? D : C) : (S[0] ? B : A);
    
endmodule

module MUX(
    input [1:0]S,
    input YFULL, NCTO, NEMPTY,
    output Out
    );
    
    genMUX m1(.S(S), .A(YFULL), .B(NCTO), .C(NEMPTY), .Out(Out));
    
endmodule

module genDECODER(
    input [1:0]Code,
    output reg [3:0]Data
    );
    
    always @(Code)
    begin
        if(Code == 0) Data = 4'b0001; else
        if(Code == 1) Data = 4'b0010; else
        if(Code == 2) Data = 4'b0100; else
        if(Code == 3) Data = 4'b1000; else
                      Data = 4'bx;
    end
    
endmodule

module DEC1(
    input [1:0]S,
    output HBELL, LCOLDW, HAGIT
    );
    wire hanging;
    genDECODER dec1(.Code(S), .Data({hanging ,HAGIT, LCOLDW, HBELL}));
    
endmodule

module DEC2(
    input [1:0]S,
    output LSPIN, HWOUT, HWIN
    );
    wire hanging;
    genDECODER dec1(.Code(S), .Data({HWIN, HWOUT, LSPIN, hanging}));
    
endmodule

module ROM(
    input [5:0]A,
    output reg [8:0]D
    );
    
//    initial
//    D <= 9'b000_00_00_11;
    
    always @(A)
    case(A)
        //State0
        6'b000_0_0_0 : D <= 9'b000_00_00_11;
        6'b000_1_1_0 : D <= 9'b000_00_11_01;
        6'b000_1_0_0 : D <= 9'b000_00_11_11;
        6'b000_1_0_1 : D <= 9'b001_01_00_11;
        //State1
        6'b001_0_0_0 : D <= 9'b001_01_00_11;
        6'b001_1_0_0 : D <= 9'b010_10_00_11;
        6'b001_1_0_1 : D <= 9'b001_01_00_10;
        //State2
        6'b010_0_0_0 : D <= 9'b010_10_00_11;
        6'b010_1_0_0 : D <= 9'b011_00_00_11;
        6'b010_1_0_1 : D <= 9'b010_10_10_11;
        //State3
        6'b011_0_0_0 : D <= 9'b011_00_00_11;
        6'b011_1_0_0 : D <= 9'b011_00_11_11;
        6'b011_1_0_1 : D <= 9'b100_01_00_11;
        //State4
        6'b100_0_0_0 : D <= 9'b100_01_00_11;
        6'b100_1_0_0 : D <= 9'b101_10_00_11;
        6'b100_1_0_1 : D <= 9'b100_01_00_10;
        //State5
        6'b101_0_0_0 : D <= 9'b101_10_00_11;
        6'b101_1_0_0 : D <= 9'b110_01_00_11;
        6'b101_1_0_1 : D <= 9'b101_10_10_11;
        //State6
        6'b110_0_0_0 : D <= 9'b110_01_00_11;
        6'b110_1_0_0 : D <= 9'b000_00_00_00;
        6'b110_1_0_1 : D <= 9'b110_01_01_11;
        default : D <= 9'b000_00_00_11;
    endcase
endmodule

module ASM(
    input YFULL, NCTO, NEMPTY, NHOT, YSTART, Clk,
    output HBELL, LCOLDW, HAGIT, LSPIN, HWOUT, HWIN
    );
    
    wire [1:0]toDec1;
    wire [1:0]toDec2;
    wire [1:0]toTwoBitReg;
    wire [2:0]toThreeBitReg;
    wire [1:0]fromTwoBitReg;
    wire [2:0]fromThreeBitReg;
    wire fromMux;
    wire toInv1;
    wire toInv2;
    
    ROM romTable(.A({fromThreeBitReg, YSTART, NHOT, fromMux}), .D({toThreeBitReg, toTwoBitReg, toDec2, toDec1}));
    
    DEC1 dec1(.S(toDec1), .HBELL(HBELL), .LCOLDW(toInv1), .HAGIT(HAGIT));
    DEC2 dec2(.S(toDec2), .LSPIN(toInv2), .HWOUT(HWOUT), .HWIN(HWIN));
    
    INV inv1(.A(toInv1), .B(LCOLDW));
    INV inv2(.A(toInv2), .B(LSPIN));
    
    twoBitReg dff1(.D(toTwoBitReg), .Clk(Clk), .Q(fromTwoBitReg));
    threeBitReg dff2(.D(toThreeBitReg), .Clk(Clk), .Q(fromThreeBitReg));
    
    MUX mux1(.S(fromTwoBitReg), .YFULL(YFULL), .NCTO(NCTO), .NEMPTY(NEMPTY), .Out(fromMux));
   
endmodule

//module ROM(
//    input [5:0]A,
//    input Clk,
//    output reg [8:0]D
//    );
    
//    reg [5:0]PS;
//    always @(posedge Clk)
//    PS <= A;
    
//    initial
//    PS <= 0;
    
//    always@(posedge Clk)
//    begin
//        case(PS)
//            6'h0:
//                D <= 9'h003;
//            6'h1:
//                D <= 9'h003;
//            6'h2:
//                D <= 9'h003;
//            6'h3:
//                D <= 9'h003;
//            6'h4:
//                D <= 9'h00F;
//            6'h5:
//                D <= 9'h053;
//            6'h6:
//                D <= 9'h00D;
//            6'h7:
//                D <= 9'h051;
//            6'h8:
//                D <= 9'h053;
//            6'h9:
//                D <= 9'h053;
//            6'hA:
//                D <= 9'h053;
//            6'hB:
//                D <= 9'h053;
//            6'hC:
//                D <= 9'h0A3;
//            6'hD:
//                D <= 9'h052;
//            6'hE:
//                D <= 9'h0A3;
//            6'hF:
//                D <= 9'h052;
//            6'h10:
//                D <= 9'h0A3;
//            6'h11:
//                D <= 9'h0A3;
//            6'h12:
//                D <= 9'h0A3;
//            6'h13:
//                D <= 9'h0A3;
//            6'h14:
//                D <= 9'h0C3;
//            6'h15:
//                D <= 9'h0AB;
//            6'h16:
//                D <= 9'h0C3;
//            6'h17:
//                D <= 9'h0AB;
//            6'h18:
//                D <= 9'h0C3;
//            6'h19:
//                D <= 9'h0C3;
//            6'h1A:
//                D <= 9'h0C3;
//            6'h1B:
//                D <= 9'h0C3;
//            6'h1C:
//                D <= 9'h0CF;
//            6'h1D:
//                D <= 9'h113;
//            6'h1E:
//                D <= 9'h0CF;
//            6'h1F:
//                D <= 9'h113;
//            6'h20:
//                D <= 9'h113;
//            6'h21:
//                D <= 9'h113;
//            6'h22:
//                D <= 9'h113;
//            6'h23:
//                D <= 9'h113;
//            6'h24:
//                D <= 9'h163;
//            6'h25:
//                D <= 9'h112;
//            6'h26:
//                D <= 9'h163;
//            6'h27:
//                D <= 9'h112;
//            6'h28:
//                D <= 9'h163;
//            6'h29:
//                D <= 9'h163;
//            6'h2A:
//                D <= 9'h163;
//            6'h2B:
//                D <= 9'h163;
//            6'h2C:
//                D <= 9'h193;
//            6'h2D:
//                D <= 9'h16B;
//            6'h2E:
//                D <= 9'h193;
//            6'h2F:
//                D <= 9'h16B;
//            6'h30:
//                D <= 9'h193;
//            6'h31:
//                D <= 9'h193;
//            6'h32:
//                D <= 9'h193;
//            6'h33:
//                D <= 9'h193;
//            6'h34:
//                D <= 9'h000;
//            6'h35:
//                D <= 9'h197;
//            6'h36:
//                D <= 9'h000;
//            6'h37:
//                D <= 9'h197;
//        endcase
//    end
    
//endmodule

//module genDECODER(
//    input [1:0]S,
//    output reg A, B, C, D
//    );
    
//    always @ (S[1] or S[0])
//        if(S[1] & 1)
//            begin
//            if(S[0] & 1)
//                begin
//                A = 0; B = 0; C = 0; D = 1;
//                end
//            else
//                A = 0; B = 0; C = 1; D = 0;
//            end
//        else
//            begin
//            if(S[0] & 1)
//                begin
//                A = 0; B = 1; C = 0; D = 0;
//                end
//            else
//                A = 1; B = 0; C = 0; D = 0;
//            end
    
//endmodule