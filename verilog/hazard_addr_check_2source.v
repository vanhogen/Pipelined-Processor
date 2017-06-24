module hazard_addr_check_2source (rs, rt, rd, rdIDEX, rdEXMEM, rdMEMWB, rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite, Out);

    input [2:0] rs;
    input [2:0] rt;
    input [2:0] rd, rdIDEX, rdEXMEM, rdMEMWB;
    input rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite;

    output Out;

    wire match1;
    wire match2;

    hazard_addr_check_1source rsCheck(
        .rs             (rs),
        .rd             (rd),
        .rdIDEX         (rdIDEX),
        .rdEXMEM        (rdEXMEM),
        .rdMEMWB        (rdMEMWB),
        .rdWrite        (rdWrite),
        .rdIDEXWrite    (rdIDEXWrite),
        .rdEXMEMWrite   (rdEXMEMWrite),
        .rdMEMWBWrite   (rdMEMWBWrite),
        .Out            (match1)
    );

    hazard_addr_check_1source rtCheck(
        .rs             (rt),
        .rd             (rd),
        .rdIDEX         (rdIDEX),
        .rdEXMEM        (rdEXMEM),
        .rdMEMWB        (rdMEMWB),
        .rdWrite        (rdWrite),
        .rdIDEXWrite    (rdIDEXWrite),
        .rdEXMEMWrite   (rdEXMEMWrite),
        .rdMEMWBWrite   (rdMEMWBWrite),
        .Out            (match2)
    );

    or2 findmatch(
        .inA        (match1), 
        .inB        (match2), 
        .Out        (Out)
    );

endmodule
