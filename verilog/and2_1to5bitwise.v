module and2_1to5bitwise(S, inA, Out);
    input S;
    input [4:0] inA;
    output [4:0] Out;

    and2    zerobit(
        .inA    (S),
        .inB    (inA[0]),
        .Out    (Out[0])
    );
    and2    firstbit(
        .inA    (S),
        .inB    (inA[1]),
        .Out    (Out[1])
    );
    and2    secondbit(
        .inA    (S),
        .inB    (inA[2]),
        .Out    (Out[2])
    );
    and2    thirdbit(
        .inA    (S),
        .inB    (inA[3]),
        .Out    (Out[3])
    );
    and2    fourthbit(
        .inA    (S),
        .inB    (inA[4]),
        .Out    (Out[4])
    );
       
endmodule
