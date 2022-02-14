`timescale 1ns / 1ps

module DFF(input D, input clk, output reg Q);
    always @ (posedge clk)
        Q <= D;
endmodule;

module DFF4Bit(input [3:0] D, input clk, output [3:0]Q);
    DFF dff1(.D(D[0]), .clk(clk), .Q(Q[0]));
    DFF dff2(.D(D[1]), .clk(clk), .Q(Q[1]));
    DFF dff3(.D(D[2]), .clk(clk), .Q(Q[2]));
    DFF dff4(.D(D[3]), .clk(clk), .Q(Q[3]));
endmodule;

module ROM(
            input [3:0]P,
            input Clk, YP, NS,
            output reg [3:0]N,
            output reg HYL, HRL, HW, HDNW
            );
    reg [3:0]PS;
    always @ (posedge Clk)
    PS <= P;
    
    initial
    PS <= 0;
    
    always @ (posedge Clk)
    begin
        case (PS)
            0: case(YP)
                0:
                begin
                    N <= 0;
                    HDNW <= 0;
                    HW <= 0;
                    HRL <= 0;
                    HYL <= 0;
                end
                1:
                begin
                    N <= 1;
                    HDNW <= 1;
                    HW <= 0;
                    HRL <= 0;
                    HYL <= 1;
                end
                endcase
             4'h1:
            begin
                N <= 2;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 0;
            end
             4'h2:
            begin
                N <= 3;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 1;
            end
            4'h3:
            begin
                N <= 4;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 0;
            end
           4'h4:
            begin
                N <= 5;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 1;
            end
            4'h5:
            begin
                N <= 6;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 1;
            end
            4'h6:
            begin
                N <= 7;
                HDNW <= 1;
                HW <= 0;
                HRL <= 1;
                HYL <= 0;
            end  
            4'h7:
            begin
                N <= 8;
                HDNW <= 0;
                HW <= 1;
                HRL <= 1;
                HYL <= 0;
            end
            4'h8: case(NS)
                 0: 
                 begin
                    N <= 8;
                    HDNW <= 0;
                    HW <= 1;
                    HRL <= 1;
                    HYL <= 0;
                 end
                 1:
                 begin
                    N <= 9;
                    HDNW <= 0;
                    HW <= 0;
                    HRL <= 1;
                    HYL <= 0;
                 end
                 endcase
            4'h9:
            begin
                N <= 4'hA;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 0;
            end
            4'hA:
            begin
                N <= 4'hB; 
                HDNW <= 0;
                HW <= 0;
                HRL <= 1;
                HYL <= 0;
            end
            4'hB:
            begin
                N <= 4'hC;
                HDNW <= 1;
                HW <= 0;
                HRL <= 0;
                HYL <= 0;
            end
            4'hC:
            begin
                N <= 0;
                HDNW <= 0;
                HW <= 0;
                HRL <= 0;
                HYL <= 0;
            end
      endcase
end
endmodule;

//(input [3:0] D, input clk, output [3:0]Q);
//            input [3:0]P,
//            input Clk, YP, NS,
//            output reg [3:0]N,
//            output reg HYL, HRL, HW, HDNW
//            );
module ASM(
    input Clk,
    input YP,
    input NS,
    output HYL, 
    output HRL,
    output HW,
    output HDNW);

    wire [3:0]stateOut;
    

        DFF4Bit StateFlipFlop(.D(stateOut), .clk(Clk), .Q(stateOut));
    
    ROM RomTable(   .P(stateOut), 
                    .Clk(Clk),
                    .YP(YP), 
                    .NS(NS), 
                    .N(N),
                    .HYL(HYL),
                    .HRL(HRL),
                    .HW(HW),
                    .HDNW(HDNW)
                    );
       
endmodule;
