`timescale 1ns / 1ps

module lab5tb;
        /*ROM TESTING*/
        reg YET, YWT,YE, Clk;

        wire HEWR, HEWY, HEWG, HNSR, HNSY, HNSG;
       
        TrafficLightController uut(
            .YET(YET),
            .YWT(YWT),
            .YE(YE),
            .Clk(Clk),
            .HEWR(HEWR),
            .HEWY(HEWY),
            .HEWG(HEWG),
            .HNSR(HNSR),
            .HNSY(HNSY),
            .HNSG(HNSG)
         );

        initial Clk <= 1;
        always #1 Clk = ~Clk;
       
        initial
        begin
        $dumpfile("lab5.vcd");
        $dumpvars(0, lab5tb);

        YET = 0; YWT = 0; YE=0;
        #60 YET = 1;
        #50 YET = 0;
        #200 YWT = 1;
        #50 YWT = 0; 
        #50 YE = 1;
        #12 $finish;
        end

endmodule