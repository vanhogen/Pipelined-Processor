//outputs 1 if an address matches 
module hazard_addr_check_1source(rs, rd, rdIDEX, rdEXMEM, rdMEMWB, rdStall, Out);

    input [2:0] rs;
    input [2:0] rd, rdIDEX, rdEXMEM, rdMEMWB, rdStall;

    output Out;

    wire rsrd;
    wire rsrdIDEX;
    wire rsrdEXMEM;
    wire rsrdMEMWB;
    wire rsrdStall;
    wire outor1;
    wire outor2;
    wire outor3;

    xnor2_3bit rsrdXnor(
        .inA        (rs),
        .inB        (rd),
        .Out        (rsrd)
    );

    xnor2_3bit rsrdIDEXXnor(
        .inA        (rs),
        .inB        (rdIDEX),
        .Out        (rsrdIDEX)
    );

    xnor2_3bit rsrdEXMEMXnor(
        .inA        (rs),
        .inB        (rdEXMEM),
        .Out        (rsrdEXMEM)
    );

    xnor2_3bit rsrdMEMWBXnor(
        .inA        (rs),
        .inB        (rdMEMWB),
        .Out        (rsrdMEMWB)
    );

    xnor2_3bit rsrdStallXnor(
        .inA        (rs),
        .inB        (rdStall),
        .Out        (rsrdStall)
    );

    or2 rsrdOrrsrdIDEX(
        .inA        (rsrd),
        .inB        (rsrdIDEX),
        .Out        (outor1)
    );

    or2 rsrdEXMEMOrrsrdMEMWB(
        .inA        (rsrdEXMEM), 
        .inB        (rsrdMEMWB), 
        .Out        (outor2)
    );

    or2 rsrdStallOroutor2(
        .inA        (outor2),
        .inB        (rsrdStall),
        .Out        (outor3)
    );    

    or2 orOut(
        .inA        (outor1), 
        .inB        (outor3), 
        .Out        (Out)
    );

endmodule
