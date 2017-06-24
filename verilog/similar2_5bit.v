//Outputs 1 if similar
module similar2_5bit(inA, inB, Out);
    input [4:0] inA;
    input [4:0] inB;

    output Out;

    wire [4:0] xnorAB;
    wire bits01xnorAB;
    wire bits012xnorAB;
    wire bits0123xnorAB;

    //bitwise xnor the two inputs
    xnor2 bit0xnorAB(
        .in1        (inA[0]),
        .in2        (inB[0]),
        .out        (xnorAB[0])
    );
    xnor2 bit1xnorAB(
        .in1        (inA[1]),
        .in2        (inB[1]),
        .out        (xnorAB[1])
    );
    xnor2 bit2xnorAB(
        .in1        (inA[2]),
        .in2        (inB[2]),
        .out        (xnorAB[2])
    );
    xnor2 bit3xnorAB(
        .in1        (inA[3]),
        .in2        (inB[3]),
        .out        (xnorAB[3])
    );
    xnor2 bit4xnorAB(
        .in1        (inA[4]),
        .in2        (inB[4]),
        .out        (xnorAB[4])
    );

    //and the result so 1 is the same and 0 is different
    and2 outand1(
        .inA        (xnorAB[0]),
        .inB        (xnorAB[1]),
        .Out        (bits01xnorAB)
    );
    and2 outand2(
        .inA        (bits01xnorAB),
        .inB        (xnorAB[2]),
        .Out        (bits012xnorAB)
    );
    and2 outand3(
        .inA        (bits012xnorAB),
        .inB        (xnorAB[3]),
        .Out        (bits0123xnorAB)
    );
    and2 outand4(
        .inA        (bits0123xnorAB),
        .inB        (xnorAB[4]),
        .Out        (Out)
    );

endmodule
