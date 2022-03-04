// primitive d_ff(output reg q_out input clock, data);
// table
//     //      clk    data    state   q_out/next_state
//             (01)    0   :   ?   :   0;
//             (01)    1   :   ?   :   1;
//             (0X)    1   :   1   :   1;
//             (0X)    0   :   0   :   0;
//             (?0)    ?   :   ?   :   -;

//             ?      (??) :   ?   :   -;
// endtable
// endprimitive

`timescale 1ps/1ps

module d_ff_gate(input D, input clk, output q);
    wire q_not;
    wire d_not;
    wire n0, n1;

    not not1(d_not, D);

    nand nand1(n0, D,clk);
    nand nand2(n1, d_not,clk);

    nand nand3(q, n0, q_not);
    nand nand4(q_not, n1,q);

endmodule

module ring_bidirectional_counter(input D, input clk, output [3:0] Q);

    d_ff_gate dff1(.D(D), .clk(clk), .Q(Q[0]));
    d_ff_gate dff2(.D(D), .clk(~(Q[0]), .Q(Q[1]));
    d_ff_gate dff3(.D(D), .clk(~(Q[1]), .Q(Q[2])));
    
endmodule