module register_16(writeData, We, clk, rst, readData);
    
    input [15:0] writeData;
    input We;
    input clk;
    input rst;
    output [15:0] readData;
    wire [15:0] readWire;
    reg [15:0] writeReg;
    reg writeReg0, writeReg1, writeReg2, writeReg3, writeReg4, writeReg5;
    reg writeReg6, writeReg7, writeReg8, writeReg9, writeReg10, writeReg11;
    reg writeReg12, writeReg13, writeReg14, writeReg15;


    always @ (*) begin
        case(We)
            1'b0: begin
                writeReg0 = readWire[0];
                writeReg1 = readWire[1];
                writeReg2 = readWire[2];
                writeReg3 = readWire[3];
                writeReg4 = readWire[4];
                writeReg5 = readWire[5];
                writeReg6 = readWire[6];
                writeReg7 = readWire[7];
                writeReg8 = readWire[8];
                writeReg9 = readWire[9];
                writeReg10 = readWire[10];
                writeReg11 = readWire[11];
                writeReg12 = readWire[12];
                writeReg13 = readWire[13];
                writeReg14 = readWire[14];
                writeReg15 = readWire[15];
            end
            1'b1: begin
                writeReg0 = writeData[0];
                writeReg1 = writeData[1];
                writeReg2 = writeData[2];
                writeReg3 = writeData[3];
                writeReg4 = writeData[4];
                writeReg5 = writeData[5];
                writeReg6 = writeData[6];
                writeReg7 = writeData[7];
                writeReg8 = writeData[8];
                writeReg9 = writeData[9];
                writeReg10 = writeData[10];
                writeReg11 = writeData[11];
                writeReg12 = writeData[12];
                writeReg13 = writeData[13];
                writeReg14 = writeData[14];
                writeReg15 = writeData[15];
            end
        endcase
    end

    dff dff0(
        .q      (readWire[0]),
        .d      (writeReg0),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff1(
        .q      (readWire[1]),
        .d      (writeReg1),
        .clk    (clk),
        .rst    (rst)
    );
    
    dff dff2(
        .q      (readWire[2]),
        .d      (writeReg2),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff3(
        .q      (readWire[3]),
        .d      (writeReg3),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff4(
        .q      (readWire[4]),
        .d      (writeReg4),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff5(
        .q      (readWire[5]),
        .d      (writeReg5),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff6(
        .q      (readWire[6]),
        .d      (writeReg6),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff7(
        .q      (readWire[7]),
        .d      (writeReg7),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff8(
        .q      (readWire[8]),
        .d      (writeReg8),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff9(
        .q      (readWire[9]),
        .d      (writeReg9),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff10(
        .q      (readWire[10]),
        .d      (writeReg10),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff11(
        .q      (readWire[11]),
        .d      (writeReg11),
        .clk    (clk),
        .rst    (rst)
    );


    dff dff12(
        .q      (readWire[12]),
        .d      (writeReg12),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff13(
        .q      (readWire[13]),
        .d      (writeReg13),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff14(
        .q      (readWire[14]),
        .d      (writeReg14),
        .clk    (clk),
        .rst    (rst)
    );

    dff dff15(
        .q      (readWire[15]),
        .d      (writeReg15),
        .clk    (clk),
        .rst    (rst)
    );

    assign readData[0] = readWire[0];
    assign readData[1] = readWire[1];
    assign readData[2] = readWire[2];
    assign readData[3] = readWire[3];
    assign readData[4] = readWire[4];
    assign readData[5] = readWire[5];
    assign readData[6] = readWire[6];
    assign readData[7] = readWire[7];
    assign readData[8] = readWire[8];
    assign readData[9] = readWire[9];
    assign readData[10] = readWire[10];
    assign readData[11] = readWire[11];
    assign readData[12] = readWire[12];
    assign readData[13] = readWire[13];
    assign readData[14] = readWire[14];
    assign readData[15] = readWire[15];

endmodule
