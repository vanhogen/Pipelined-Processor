module regIDEX (
    //Inputs
    RegWrite, Jump, MemEN, MemWrite, MemRead, ALUOut, aluor, Halt, BranchFlagger, aSelect, subOP, flagSelect, Immed, pcsrc, pcctrl, InstFormat, aluops, RegWriteData, PCCurr, PCInc, Inst, ReadReg1, ReadReg2, Extension, regWriteAddr, clk, rst,
    //Outputs
RegWriteOut, JumpOut, MemENOut, MemWriteOut, MemReadOut, ALUOutOut, aluorOut, HaltOut, BranchFlaggerOut, aSelectOut, subOPOut, flagSelectOut, ImmedOut, pcsrcOut, pcctrlOut, InstFormatOut, aluopsOut, RegWriteDataOut, PCCurrOut, PCIncOut, InstOut, ReadReg1Out, ReadReg2Out, ExtensionOut, regWriteAddrOut
    );

    //Inputs
    //control variables
    input RegWrite, Jump, MemEN, MemWrite, MemRead, ALUOut, aluor, Halt, BranchFlagger, aSelect, subOP;
    input [1:0] flagSelect;
    input [1:0] Immed;
    input [1:0] pcsrc;
    input [1:0] pcctrl;
    input [1:0] InstFormat;
    input [2:0] aluops;
    input [1:0] RegWriteData;
    //IFID
    input [15:0] PCCurr;
    input [15:0] PCInc;
    input [15:0] Inst;
    //ProcData
    input [15:0] ReadReg1;
    input [15:0] ReadReg2;
    input [15:0] Extension;
    input [2:0] regWriteAddr; 
    //Other
    input clk, rst;

    //Outputs
    //Control Variables
    output RegWriteOut, JumpOut, MemENOut, MemWriteOut, MemReadOut, ALUOutOut, aluorOut, HaltOut, BranchFlaggerOut, aSelectOut, subOPOut;
    output [1:0] flagSelectOut;
    output [1:0] ImmedOut;
    output [1:0] pcsrcOut;
    output [1:0] pcctrlOut;
    output [1:0] InstFormatOut;
    output [2:0] aluopsOut;
    output [1:0] RegWriteDataOut;
    //IFID
    output [15:0] PCCurrOut;
    output [15:0] PCIncOut;
    output [15:0] InstOut;
    //ProcData
    output [15:0] ReadReg1Out;
    output [15:0] ReadReg2Out;
    output [15:0] ExtensionOut;
    output [2:0] regWriteAddrOut;


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

    dff aluorStore(
        .q          (aluorOut), 
        .d          (aluor), 
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
    
    dff aSelectStore(
        .q          (aSelectOut), 
        .d          (aSelect), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff subOPStore(
        .q          (subOPOut), 
        .d          (subOP), 
        .clk        (clk), 
        .rst        (rst)
    );

    dff_2bit flagSelectStore(
        .inA        (flagSelect), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (flagSelectOut) 
    );

    dff_2bit ImmedStore(
        .inA        (Immed), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (ImmedOut)
    );

    dff_2bit pcsrcStore(
        .inA        (pcsrc), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (pcsrcOut) 
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

    dff_3bit aluopsStore(
        .inA        (aluops), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (aluopsOut)
    );

    dff_2bit RegWriteDataStore(
        .inA        (RegWriteData), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (RegWriteDataOut)
    );

    dff_16bit ReadReg1Store(
        .inA        (ReadReg1), 
        .clk        (clk), 
        .rst        (rst),
        .Out        (ReadReg1Out)
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
endmodule
