module two_bit(input a,input b,input c,input d, output [2:0] Y);
    //equal
    wire e0,e1,e2,e3;
    and n0(e0, ~a,~b,~c,~d);
    and a1(e1,~a,b, ~c, d);
    and a2(e2, a,b,c,d);
    and a3(e3, a,~b, c,d);
    or or1(Y[0], e0,e1,e2,e3);

    //less than
    wire L0, L1, L2;
    and a4(L0, ~a, ~b, d);
    and a5(L1, ~a, c);
    and a6(L2, a, ~b,c,d);
    or or2(Y[1], L0,L1,L2);

    //greater than
    wire g0,g1,g2;

    and a7(g0,b,~c, ~d);
    and a8(g1,a,~c);
    and a9(g2,a,b,c,~d);
    or or3(Y[2], g0,g1,g2);
    
endmodule