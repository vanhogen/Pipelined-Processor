//outputs 1 if an address matches 
module hazard_check_mem (instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB, Out);
    

    input [4:0] instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB;
    output Out;

    wire st;
    wire ld;

    similar4_5bit beqzSimilar(
        .tar        (5'b10000),
        .inA        (instructionIFID),
        .inB        (instructionIDEX),
        .inC        (instructionEXMEM),
        .inD        (instructionMEMWB),
        .Out        (st)
    );

    similar4_5bit bnezSimilar( 
        .tar        (5'b10001), 
        .inA        (instructionIFID), 
        .inB        (instructionIDEX), 
        .inC        (instructionEXMEM), 
        .inD        (instructionMEMWB), 
        .Out        (ld)
    );


    or2 compilebranches1(
        .inA        (st),
        .inB        (ld),
        .Out        (Out)
    );




endmodule
