module multiplexer16bit_4to1 (inA, inB, inC, inD, S, Out);
	input [15:0] inA;
    input [15:0] inB; 
    input [15:0] inC;
    input [15:0] inD;
	input [1:0] S;
	output [15:0] Out;

    
    multiplexer_4to1 zeroBit(
        .InA        (inA[0]),
        .InB        (inB[0]),
        .InC        (inC[0]),
        .InD        (inD[0]),
        .S          (S),
        .Out        (Out[0])
    );
    
    multiplexer_4to1 firstBit(
        .InA        (inA[1]),
        .InB        (inB[1]),
        .InC        (inC[1]),
        .InD        (inD[1]),
        .S          (S),
        .Out        (Out[1])
    );

    multiplexer_4to1 secondBit(
        .InA        (inA[2]),
        .InB        (inB[2]),
        .InC        (inC[2]),
        .InD        (inD[2]),
        .S          (S),
        .Out        (Out[2])
    );

    multiplexer_4to1 thirdBit(
        .InA        (inA[3]),
        .InB        (inB[3]),
        .InC        (inC[3]),
        .InD        (inD[3]),
        .S          (S),
        .Out        (Out[3])
    );

    multiplexer_4to1 fourthBit(
        .InA        (inA[4]),
        .InB        (inB[4]),
        .InC        (inC[4]),
        .InD        (inD[4]),
        .S          (S),
        .Out        (Out[4])
    );

    multiplexer_4to1 fifthBit(
        .InA        (inA[5]),
        .InB        (inB[5]),
        .InC        (inC[5]),
        .InD        (inD[5]),
        .S          (S),
        .Out        (Out[5])
    );

    multiplexer_4to1 sixthBit(
        .InA        (inA[6]),
        .InB        (inB[6]),
        .InC        (inC[6]),
        .InD        (inD[6]),
        .S          (S),
        .Out        (Out[6])
    );

    multiplexer_4to1 seventhBit(
        .InA        (inA[7]),
        .InB        (inB[7]),
        .InC        (inC[7]),
        .InD        (inD[7]),
        .S          (S),
        .Out        (Out[7])
    );

    multiplexer_4to1 eigthBit(
        .InA        (inA[8]),
        .InB        (inB[8]),
        .InC        (inC[8]),
        .InD        (inD[8]),
        .S          (S),
        .Out        (Out[8])
    );

    multiplexer_4to1 ninthBit(
        .InA        (inA[9]),
        .InB        (inB[9]),
        .InC        (inC[9]),
        .InD        (inD[9]),
        .S          (S),
        .Out        (Out[9])
    );

    multiplexer_4to1 tenthBit(
        .InA        (inA[10]),
        .InB        (inB[10]),
        .InC        (inC[10]),
        .InD        (inD[10]),
        .S          (S),
        .Out        (Out[10])
    );

    multiplexer_4to1 eleventhBit(
        .InA        (inA[11]),
        .InB        (inB[11]),
        .InC        (inC[11]),
        .InD        (inD[11]),
        .S          (S),
        .Out        (Out[11])
    );

    multiplexer_4to1 twelfthBit(
        .InA        (inA[12]),
        .InB        (inB[12]),
        .InC        (inC[12]),
        .InD        (inD[12]),
        .S          (S),
        .Out        (Out[12])
    );

    multiplexer_4to1 thirteenthBit(
        .InA        (inA[13]),
        .InB        (inB[13]),
        .InC        (inC[13]),
        .InD        (inD[13]),
        .S          (S),
        .Out        (Out[13])
    );

    multiplexer_4to1 fourteenthBit(
        .InA        (inA[14]),
        .InB        (inB[14]),
        .InC        (inC[14]),
        .InD        (inD[14]),
        .S          (S),
        .Out        (Out[14])
    );

    multiplexer_4to1 fifteenthBit(
        .InA        (inA[15]),
        .InB        (inB[15]),
        .InC        (inC[15]),
        .InD        (inD[15]),
        .S          (S),
        .Out        (Out[15])
    );


	
endmodule
