module multiplexer16bit_2to1 (inA, inB, S, Out);
	input [15:0] inA;
    input [15:0] inB;
    input S;
    output [15:0] Out;
	wire notS;
	wire nandBS;
	wire nandAnotS;


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

    multiplexer_2to1 fourthBit(
        .inA        (inA[3]),
        .inB        (inB[3]),
        .S          (S),
        .Out        (Out[3])
    );

    multiplexer_2to1 fifthBit(
        .inA        (inA[4]),
        .inB        (inB[4]),
        .S          (S),
        .Out        (Out[4])
    );

    multiplexer_2to1 sixthBit(
        .inA        (inA[5]),
        .inB        (inB[5]),
        .S          (S),
        .Out        (Out[5])
    );

    multiplexer_2to1 seventhBit(
        .inA        (inA[6]),
        .inB        (inB[6]),
        .S          (S),
        .Out        (Out[6])
    );

    multiplexer_2to1 eigthBit(
        .inA        (inA[7]),
        .inB        (inB[7]),
        .S          (S),
        .Out        (Out[7])
    );

    multiplexer_2to1 ninthBit(
        .inA        (inA[8]),
        .inB        (inB[8]),
        .S          (S),
        .Out        (Out[8])
    );

    multiplexer_2to1 tenthBit(
        .inA        (inA[9]),
        .inB        (inB[9]),
        .S          (S),
        .Out        (Out[9])
    );

    multiplexer_2to1 eleventhBit(
        .inA        (inA[10]),
        .inB        (inB[10]),
        .S          (S),
        .Out        (Out[10])
    );

    multiplexer_2to1 twelfthBit(
        .inA        (inA[11]),
        .inB        (inB[11]),
        .S          (S),
        .Out        (Out[11])
    );

    multiplexer_2to1 thirteenthBit(
        .inA        (inA[12]),
        .inB        (inB[12]),
        .S          (S),
        .Out        (Out[12])
    );

    multiplexer_2to1 fourteenthBit(
        .inA        (inA[13]),
        .inB        (inB[13]),
        .S          (S),
        .Out        (Out[13])
    );

    multiplexer_2to1 fifteenthBit(
        .inA        (inA[14]),
        .inB        (inB[14]),
        .S          (S),
        .Out        (Out[14])
    );

    multiplexer_2to1 sixteenthBit(
        .inA        (inA[15]),
        .inB        (inB[15]),
        .S          (S),
        .Out        (Out[15])
    );


endmodule
