//outputs 1 if an address matches 
module hazard_addr_check_1source(rs, rd, rdIDEX, rdEXMEM, rdMEMWB, rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite, Out);

    input [2:0] rs;
    input [2:0] rd, rdIDEX, rdEXMEM, rdMEMWB;
    input rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite;

    output Out;

    wire rsrd;
    wire rsrdIDEX;
    wire rsrdEXMEM;
    wire rsrdMEMWB;
    wire rsrdEN;
    wire rsrdIDEXEN;
    wire rsrdEXMEMEN;
    wire rsrdMEMWBEN;
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

    //Check enable status
    and2 Enablerd(
        .inA        (rsrd), 
        .inB        (rdWrite), 
        .Out        (rsrdEN)
    );
    and2 EnablerdIDEX(
        .inA        (rsrdIDEX), 
        .inB        (rdIDEXWrite), 
        .Out        (rsrdIDEXEN)
    );
    and2 EnableEXMEM(
        .inA        (rsrdEXMEM), 
        .inB        (rdEXMEMWrite), 
        .Out        (rsrdEXMEMEN)
    );
    and2 EnableMEMWB(
        .inA        (rsrdMEMWB), 
        .inB        (rdMEMWBWrite), 
        .Out        (rsrdMEMWBEN)
    );

    or2 rsrdOrrsrdIDEX(
        .inA        (rsrdEN),
        .inB        (rsrdIDEXEN),
        .Out        (outor1)
    );

    or2 rsrdEXMEMOrrsrdMEMWB(
        .inA        (rsrdEXMEMEN), 
        .inB        (rsrdMEMWBEN), 
        .Out        (outor2)
    );

    or2 orOut(
        .inA        (outor1), 
        .inB        (outor2), 
        .Out        (Out)
    );

endmodule
