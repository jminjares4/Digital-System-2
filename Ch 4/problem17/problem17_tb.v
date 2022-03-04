`timescale 1ps/1ps

module problem17_tb;

    reg  clk;
    reg D;
    wire Q;

    d_ff_gate uut(.D(D),.clk(clk),.q(Q));

initial clk = 0;
always #1 clk = ~clk;

initial 
begin
    $dumpfile("problem17.vcd"); 
    $dumpvars(0,problem17_tb); 
    D = 0;
#5
    D = 1;
    $finish;
end
    
endmodule