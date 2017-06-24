module regIFID (PCCurr, PCInc, Inst, clk, rst, PCCurrOut, PCIncOut, InstOut);
    input [15:0] PCCurr;
    input [15:0] PCInc;
    input [15:0] Inst;
    input clk, rst;
    output [15:0] PCCurrOut;
    output [15:0] PCIncOut;
    output [15:0] InstOut;

    wire [15:0] instruction;
    wire [15:0] instructionReset;

    

    dff_16bit PCCurrStore(
        .inA        (PCCurr), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (PCCurrOut)
    );

    dff_16bit PCIncStore(
        .inA        (PCInc), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (PCIncOut)
    );

    dff_16bit InstStore(
        .inA        (instructionReset), 
        .clk        (clk), 
        .rst        (1'b0), 
        .Out        (InstOut)
    );

    multiplexer16bit_2to1 instructionResetCheck(
        .inA        (Inst), 
        .inB        (16'b0000100000000000), 
        .S          (rst), 
        .Out        (instructionReset)
    );


endmodule
