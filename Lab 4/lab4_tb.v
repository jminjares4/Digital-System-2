`timescale 10ns / 1ps

module lab4_tb;
    reg YSTART, YFULL, NCTO, NEMPTY, NHOT, Clk;
    wire HBELL, LCOLDW, HAGIT, LSPIN, HWOUT, HWIN;
    
    ASM uut(
        .YFULL(YFULL),
        .NCTO(NCTO),
        .NEMPTY(NEMPTY),
        .NHOT(NHOT),
        .YSTART(YSTART),
        .Clk(Clk),
        .HBELL(HBELL),
        .LCOLDW(LCOLDW),
        .HAGIT(HAGIT),
        .LSPIN(LSPIN),
        .HWOUT(HWOUT),
        .HWIN(HWIN)
    );
    
    initial
        Clk <= 0;
        
    always
    begin
        #1 Clk = ~Clk;
    end
    
    initial
    begin
        $dumpfile("lab4.vcd");
        $dumpvars(0,lab4_tb);
        NCTO = 1; NEMPTY = 1; 
        YSTART = 0; NHOT = 0; YFULL = 0;
        #5 YSTART = 1; NHOT = 1; YFULL = 0;
        #5 NHOT = 0; YFULL = 1;
        #5 NCTO = 1; YFULL = 0;
        #5 NCTO = 0; NEMPTY = 1;
        #5 NEMPTY = 1;
        #5 NEMPTY = 0; YFULL = 0;
        #5 YFULL = 0; NCTO = 1;
        #5 YFULL = 1;
        #5 NCTO = 1; NEMPTY = 1;
        #5 NCTO = 0;
        #5 NEMPTY = 1; NCTO = 1;
        #5 NEMPTY = 0; 
        #5 NCTO = 1;
        #5 NCTO = 0;
        #5 $finish;
    end
//    begin
//        YSTART = 0;
//        #50 YSTART = 1; NHOT = 1;
//        #50 YFULL = 0;
//        #50 NHOT = 0; YFULL = 1;
//        #10 YFULL = 0; NCTO = 1;
//        #50 NCTO = 0;
//        #10 NCTO = 1; NEMPTY = 1;
//        #50 NEMPTY = 0;
//        #10 NEMPTY = 1;
//        #50 YFULL = 1;
//        #10 YFULL = 0;
//        #50 NCTO = 0;
//        #10 NCTO = 1;
//        #50 NEMPTY = 0;
//        #10 NEMPTY = 1;
//        #50 NCTO = 0;
//    end

endmodule