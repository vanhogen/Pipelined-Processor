//output 1 when A matches any input
module similar4_5bit(tar, inA, inB, inC, inD, Out);

    input [4:0] tar;
    input [4:0] inA;
    input [4:0] inB;
    input [4:0] inC;
    input [4:0] inD;
    
    output Out;

    wire tarA;
    wire tarB;
    wire tarC;
    wire tarD;
    wire tarAB;
    wire tarCD;

    similar2_5bit tarASimilar(
        .inA        (tar), 
        .inB        (inA), 
        .Out        (tarA)
    );
    similar2_5bit tarBSimilar(
        .inA        (tar), 
        .inB        (inB), 
        .Out        (tarB)
    );
    similar2_5bit tarCSimilar(
        .inA        (tar), 
        .inB        (inC), 
        .Out        (tarC)
    );
    similar2_5bit tarDSimilar(
        .inA        (tar), 
        .inB        (inD), 
        .Out        (tarD)
    );

    //and the result so 1 if a match was found and 0 is different
    or2 outor1(
        .inA        (tarA),
        .inB        (tarB),
        .Out        (tarAB)
    );
    or2 outor2(
        .inA        (tarC), 
        .inB        (tarD), 
        .Out        (tarCD)
    );
    or2 outor3(
        .inA        (tarAB), 
        .inB        (tarCD), 
        .Out        (Out)
    );

endmodule
