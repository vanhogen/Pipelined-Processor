module multiplexer3bit_2to1 (inA, inB, S, Out);
	input [2:0] inA;
    input [2:0] inB;
    input S;
    output [2:0] Out;


    multiplexer_2to1 firstBit(
        .inA        (inA[0]),
        .inB        (inB[0]),
        .S          (S),
        .Out        (Out[0])
    );

    multiplexer_2to1 secondBit(
        .inA        (inA[1]),
        .inB        (inB[1]),
        .S          (S),
        .Out        (Out[1])
    );

    multiplexer_2to1 thirdBit(
        .inA        (inA[2]),
        .inB        (inB[2]),
        .S          (S),
        .Out        (Out[2])
    );



endmodule
