//outputs 1 if an address matches 
module hazard_check_branch (instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB, BranchTaken, BranchTakenEXMEM, BranchTakenMEMWB, Out);
    

    input [4:0] instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB;
    input BranchTaken, BranchTakenEXMEM, BranchTakenMEMWB;
    output Out;

    wire beqz;
    wire bnez;
    wire bltz;
    wire bgez;
    wire j;
    wire jr;
    wire jal;
    wire jalr;

    wire outor1;
    wire outor2;
    wire outor3;
    wire outor4;

    wire branches;
    wire jumps;

    wire [4:0] IDEXtaken, EXMEMtaken, MEMWBtaken;

    and2_1to5bitwise idexTakenCheck(
        .S          (BranchTaken),
        .inA        (instructionIDEX),
        .Out        (IDEXtaken)
    );
    and2_1to5bitwise exmemTakenCheck(
        .S          (BranchTakenEXMEM),
        .inA        (instructionEXMEM),
        .Out        (EXMEMtaken)
    );
    and2_1to5bitwise memwbTakenCheck(
        .S          (BranchTakenMEMWB),
        .inA        (instructionMEMWB),
        .Out        (MEMWBtaken)
    );

    similar4_5bit beqzSimilar(
        .tar        (5'b01100),
        .inA        (instructionIFID),
        .inB        (IDEXtaken),
        .inC        (EXMEMtaken),
        .inD        (MEMWBtaken),
        .Out        (beqz)
    );

    similar4_5bit bnezSimilar( 
        .tar        (5'b01101), 
        .inA        (instructionIFID), 
        .inB        (IDEXtaken), 
        .inC        (EXMEMtaken), 
        .inD        (MEMWBtaken), 
        .Out        (bnez)
    );

    similar4_5bit bltzSimilar( 
        .tar        (5'b01110), 
        .inA        (instructionIFID), 
        .inB        (IDEXtaken), 
        .inC        (EXMEMtaken), 
        .inD        (MEMWBtaken), 
        .Out        (bltz)
    );

    similar4_5bit bgezSimilar( 
        .tar        (5'b01111), 
        .inA        (instructionIFID), 
        .inB        (IDEXtaken), 
        .inC        (EXMEMtaken), 
        .inD        (MEMWBtaken), 
        .Out        (bgez)
    );

    similar4_5bit jSimilar( 
        .tar        (5'b00100), 
        .inA        (instructionIFID), 
        .inB        (instructionIDEX), 
        .inC        (instructionEXMEM), 
        .inD        (instructionMEMWB), 
        .Out        (j)
    );

    similar4_5bit jrSimilar( 
        .tar        (5'b00101), 
        .inA        (instructionIFID), 
        .inB        (instructionIDEX), 
        .inC        (instructionEXMEM), 
        .inD        (instructionMEMWB), 
        .Out        (jr)
    );

    similar4_5bit jalSimilar( 
        .tar        (5'b00110), 
        .inA        (instructionIFID), 
        .inB        (instructionIDEX), 
        .inC        (instructionEXMEM), 
        .inD        (instructionMEMWB), 
        .Out        (jal)
    );

    similar4_5bit jalrSimilar( 
        .tar        (5'b00111), 
        .inA        (instructionIFID), 
        .inB        (instructionIDEX), 
        .inC        (instructionEXMEM), 
        .inD        (instructionMEMWB), 
        .Out        (jalr)
    );


    or2 compilebranches1(
        .inA        (beqz),
        .inB        (bnez),
        .Out        (outor1)
    );

    or2 compilebranches2(
        .inA        (bltz), 
        .inB        (bgez), 
        .Out        (outor2)
    );

    or2 compilebranches3(
        .inA        (outor1),
        .inB        (outor2),
        .Out        (branches)
    );

    or2 compilejumps1(
        .inA        (j), 
        .inB        (jr), 
        .Out        (outor3)
    );

    or2 compilejumps2(
        .inA        (jal), 
        .inB        (jalr), 
        .Out        (outor4)
    );

    or2 compilejumps3(
        .inA        (outor3), 
        .inB        (outor4), 
        .Out        (jumps)
    );

    or2 compilejumpsandbranches(
        .inA        (branches),
        .inB        (jumps),
        .Out        (Out)
    );




endmodule
