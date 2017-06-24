module multiplexer3bit_4to1 (inA, inB, inC, inD, S, Out);
	input [2:0] inA;
    input [2:0] inB; 
    input [2:0] inC;
    input [2:0] inD;
	input [1:0] S;
	output [2:0] Out;

    
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


	
endmodule
