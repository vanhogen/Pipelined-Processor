//output 1 when A and B are the same
module xnor2_3bit(inA, inB, Out);

    input [2:0] inA;
    input [2:0] inB;
    
    output Out;

    wire [2:0] xnorOut;
    wire bit1and2;
    wire bit1and2and3;

    //bitwise xnor the two inputs
    xnor2 bit0(
        .in1        (inA[0]),
        .in2        (inB[0]),
        .out        (xnorOut[0])
    );
    xnor2 bit1(
        .in1        (inA[1]),
        .in2        (inB[1]),
        .out        (xnorOut[1])
    );
    xnor2 bit2(
        .in1        (inA[2]),
        .in2        (inB[2]),
        .out        (xnorOut[2])
    );

    //and the result so 1 is the same and 0 is different
    and2 outand1(
        .inA        (xnorOut[0]),
        .inB        (xnorOut[1]),
        .Out        (bit1and2)
    );
    and2 outand2(
        .inA        (bit1and2), 
        .inB        (xnorOut[2]), 
        .Out        (Out)
    );

endmodule
