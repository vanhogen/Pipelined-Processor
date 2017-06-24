module regEXMEM (
    //Inputs
    RegWrite, Jump, MemEN, MemWrite, MemRead, ALUOut, Halt, BranchFlagger, pcctrl, InstFormat, RegWriteData, PCCurr, PCInc, Inst, ReadReg2, Extension, regWriteAddr, fromReverser, aluFlagOrOut, aluOut, jumpCalculation, BranchTaken, clk, rst,
    //Outputs
RegWriteOut, JumpOut, MemENOut, MemWriteOut, MemReadOut, ALUOutOut, HaltOut, BranchFlaggerOut, pcctrlOut, InstFormatOut, RegWriteDataOut, PCCurrOut, PCIncOut, InstOut, ReadReg2Out, ExtensionOut, regWriteAddrOut, fromReverserOut, aluFlagOrOutOut, aluOutOut, jumpCalculationOut, BranchTakenOut
    );

    //Inputs
    //control variables
    input RegWrite, Jump, MemEN, MemWrite, MemRead, ALUOut, Halt, BranchFlagger;
    input [1:0] pcctrl;
    input [1:0] InstFormat;
    input [1:0] RegWriteData;
    //IFID
    input [15:0] PCCurr;
    input [15:0] PCInc;
    input [15:0] Inst;
    //ProcData
    input BranchTaken;
    input [2:0] regWriteAddr;
    input [15:0] ReadReg2;
    input [15:0] Extension;
    input [15:0] fromReverser;
    input [15:0] aluFlagOrOut;
    input [15:0] aluOut;
    input [15:0] jumpCalculation;
    //Other
    input clk, rst;

    //Outputs
    //Control Variables
    output RegWriteOut, JumpOut, MemENOut, MemWriteOut, MemReadOut, ALUOutOut, HaltOut, BranchFlaggerOut;
    output [1:0] pcctrlOut;
    output [1:0] InstFormatOut;
    output [1:0] RegWriteDataOut;
    //IFID
    output [15:0] PCCurrOut;
    output [15:0] PCIncOut;
    output [15:0] InstOut;
    //ProcData
    output BranchTakenOut;
    output [2:0] regWriteAddrOut;
    output [15:0] ReadReg2Out;
    output [15:0] ExtensionOut;
    output [15:0] fromReverserOut;
    output [15:0] aluFlagOrOutOut;
    output [15:0] aluOutOut;
    output [15:0] jumpCalculationOut;


    dff RegWriteStore(
        .q          (RegWriteOut),
        .d          (RegWrite),
        .clk        (clk),
        .rst        (rst)
    );
    
    dff JumpStore(
        .q          (JumpOut), 
        .d          (Jump), 
        .clk        (clk), 
        .rst        (rst)
    );
    
    dff MemENStore(
        .q          (MemENOut), 
        .d          (MemEN), 
        .clk        (clk), 
        .rst        (rst)
    );
    
    dff MemWriteStore(
        .q          (MemWriteOut), 
        .d          (MemWrite), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff MemReadStore(
        .q          (MemReadOut), 
        .d          (MemRead), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff ALUOutStore(
        .q          (ALUOutOut), 
        .d          (ALUOut), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff HaltStore(
        .q          (HaltOut), 
        .d          (Halt), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff BranchFlaggerStore(
        .q          (BranchFlaggerOut), 
        .d          (BranchFlagger), 
        .clk        (clk), 
        .rst        (rst)
    );
    
    dff_2bit pcctrlStore(
        .inA        (pcctrl), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (pcctrlOut)
    );

    dff_2bit InstFormatStore(
        .inA        (InstFormat), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (InstFormatOut)
    );

    dff_2bit RegWriteDataStore(
        .inA        (RegWriteData), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (RegWriteDataOut)
    );

    dff_16bit ReadReg2Store(
        .inA        (ReadReg2), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (ReadReg2Out)
    );

    dff_16bit ExtensionStore(
        .inA        (Extension), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (ExtensionOut)
    );

    dff_3bit regWriteAddrStore(
        .inA        (regWriteAddr),
        .clk        (clk),
        .rst        (rst),
        .Out        (regWriteAddrOut)
    );

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
        .inA        (Inst), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (InstOut)
    );

    dff_16bit fromReverserStore(
        .inA        (fromReverser), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (fromReverserOut)
    );
    
    dff_16bit aluFlagOrOutStore(
        .inA        (aluFlagOrOut), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (aluFlagOrOutOut)
    );
    
    dff_16bit aluOutStore(
        .inA        (aluOut), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (aluOutOut)
    );

    dff_16bit jumpCalculationStore(
        .inA        (jumpCalculation), 
        .clk        (clk), 
        .rst        (rst), 
        .Out        (jumpCalculationOut)
    );

    dff BranchTakenStore(
        .q          (BranchTakenOut), 
        .d          (BranchTaken), 
        .clk        (clk), 
        .rst        (rst)
    );
endmodule
