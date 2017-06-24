/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here */

    //control wires
    wire RegWrite, RegWriteIDEX, RegWriteEXMEM, RegWriteMEMWB;
    wire Jump, JumpIDEX, JumpEXMEM, JumpMEMWB;
    wire MemEN, MemENIDEX, MemENEXMEM, MemENMEMWB;
    wire MemWrite, MemWriteIDEX, MemWriteEXMEM, MemWriteMEMWB;
    wire MemRead, MemReadIDEX, MemReadEXMEM, MemReadMEMWB;
    wire Signed, SignedIDEX, SignedEXMEM, SignedMEMWB;
    wire aluout, aluoutIDEX, aluoutEXMEM, aluoutMEMWB;
    wire aluor, aluorIDEX;
    wire Halt, HaltIDEX, HaltEXMEM, HaltMEMWB;
    wire aSelect, aSelectIDEX;
    wire subOP, subOPIDEX;
    wire [1:0] Immed, ImmedIDEX;
    wire [1:0] ImmdLocation;
    wire [1:0] pcctrl, pcctrlIDEX, pcctrlEXMEM, pcctrlMEMWB;
    wire [1:0] pcsrc, pcsrcIDEX;
    wire [1:0] InstFormat, InstFormatIDEX, InstFormatEXMEM, InstFormatMEMWB;
    wire [1:0] FlagSelect, FlagSelectIDEX;
    wire [1:0] RegWriteData, RegWriteDataIDEX, RegWriteDataEXMEM, RegWriteDataMEMWB;
    wire [2:0] aluops, aluopsIDEX;
    
    //module wires
    wire [15:0] pcAdderOut, pcAdderOutIFID, pcAdderOutIDEX, pcAdderOutEXMEM, pcAdderOutMEMWB; 
    wire [15:0] instruction, instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB;
    wire [15:0] immediate, immediateIDEX, immediateEXMEM, immediateMEMWB;
    wire [15:0] jumpCalculation, jumpCalculationEXMEM, jumpCalculationMEMWB;
    wire [15:0] aluOut, aluOutEXMEM;
    wire [15:0] aluOutOr, aluOutOrEXMEM, aluOutOrMEMWB;
    wire [15:0] readReg1, readReg1IDEX;
    wire [15:0] readReg2, readReg2IDEX, readReg2EXMEM;
    wire [15:0] writeRegData;
    wire [15:0] aluB;
    wire [15:0] flagSelect16Bit; //not in use? Probably supposed to be FlagSelect16Bit
    wire [15:0] aluFlagOut;
    wire [15:0] aluFlagOrOut, aluFlagOrOutEXMEM, aluFlagOrOutMEMWB;
    wire [15:0] dataMemOut, dataMemOutMEMWB;
    wire [15:0] aluMemOut;
    wire [15:0] regWriteDataSelected; //unused?
    wire [15:0] wasteWire; //unused?
    wire [15:0] pcValue, pcValueIFID, pcValueIDEX, pcValueEXMEM, pcValueMEMWB;
    wire [15:0] pcValueSelect;
    wire [15:0] jumpAdderOut; //unused?
    wire [15:0] FlagSelect16Bit;
    wire [15:0] fromReverser, fromReverserEXMEM, fromReverserMEMWB;
    wire [15:0] beforeMemory; //unused?
    wire [15:0] pcBranchJump;
    wire [15:0] instructionStallChecked;
    wire [15:0] pcStallChecked;
    wire [2:0] regWriteAddr, regWriteAddrIDEX, regWriteAddrEXMEM, regWriteAddrMEMWB;
    wire nFlagBF;
    wire zFlagBF;
    wire nFlagALU;
    wire zFlagALU;
    wire oflFlag;
    wire nFlag;
    wire zFlag;
    wire zornFlag;
    wire registerError;
    wire flagSelect1Bit;
    wire BranchFlagger, BranchFlaggerIDEX, BranchFlaggerEXMEM, BranchFlaggerMEMWB;
    wire BranchTakenOrJump;
    wire BranchFlaggerOrJump;
    wire resetViaInstructionJump;
    wire reset;
    wire Stall;


    //Or and Mux handle jump pc setup without interuppting the normal pc
    //increments
    or2 JumpBranchOrPCSelectOr2(
        .inA        (BranchTakenMEMWB), 
        .inB        (JumpMEMWB), 
        .Out        (BranchTakenOrJump)
    );
    multiplexer16bit_2to1 JumpBranchOrPCMux(
        .inA        (pcStallChecked), 
        .inB        (jumpCalculationMEMWB), 
        .S          (BranchTakenOrJump), 
        .Out        (pcBranchJump)
    );  

    //Handle reset flag which will only set positive if a branch results in
    //true or a jump instruction occurs in order to clear the instructions
    //that followed which currently reside in the pipeline
//    multiplexer_2to1 BranchTakenOrJumpMux(
//        .inA        (BranchTakenMEMWB), 
//        .inB        (JumpMEMWB), 
//        .S          (JumpMEMWB), 
//        .Out        (resetViaInstructionJump)
//    );
//    or2 BranchFlaggerOrJumpOr2(
//        .inA        (BranchFlaggerMEMWB),
//        .inB        (JumpMEMWB),
//        .Out        (BranchFlaggerOrJump)
//    );
//    multiplexer_2to1 resetMux(
//        .inA        (rst),
//        .inB        (resetViaInstructionJump), 
//        .S          (BranchFlaggerOrJump), 
//        .Out        (reset)
//    );
//    wire rstOrBranch;
//    or2 rstOrBranchTaken(
//        .inA        (rst),
//        .inB        (BranchTakenMEMWB),
//        .Out        (rstOrBranch)
//    );
//    or2 rstOrBranchOrJump(
//        .inA        (rstOrBranch),
//       .inB        (JumpMEMWB),
//        .Out        (reset)
//    );
  
    //Stall PC check
    multiplexer16bit_2to1 StallPC(
        .inA        (pcAdderOut),
        .inB        (pcValue),
        .S          (Stall),
        .Out        (pcStallChecked)
    );

    //pc Mux
    multiplexer16bit_4to1 pcMux(
        .inA        (pcStallChecked), 
        .inB        (pcBranchJump), 
        .inC        (16'h0000), 
        .inD        (16'h0000), 
        .S          (pcctrlMEMWB), 
        .Out        (pcValueSelect)
    );


    pc pcModule(
        .inA        (pcValueSelect),
        .clk        (clk), 
        .rst        (rst),
        .Out        (pcValue)
    );
    always @ (posedge clk) begin
        $display("pcValue: %b\npcStallChecked: %b\nStall: %b\npcAdderOut: %b\npcValueSelect: %b\npcctrlMEMWB: %b\ninstructionMEMWB: %b\ninstructionStallChecked: %b\ninstructionPreStallCheck: %b\nHaltMEMWB: %b\ninstructionIFID: %b\nwriteRegData: %b\nimmediateIDEX: %b\ninstructionIDEX: %b\naluB: %b\nImmedIDEX: %b\nImmed: %b\nreset: %b\n", pcValue, pcStallChecked, Stall, pcAdderOut, pcValueSelect, pcctrlMEMWB, instructionMEMWB, instructionStallChecked, instruction, HaltMEMWB, instructionIFID, writeRegData, immediateIDEX, instructionIDEX, aluB, ImmedIDEX, Immed, reset);
    end

    pcAdder pcPlus2(
        .inA        (pcValue),
        .E          (err),
        .Out        (pcAdderOut)
    );

    //TODO reset for instruction and data memory on jumps/branches?
    memory2c instructionMemory(
        .data_out       (instruction), 
        .data_in        (16'h0000), 
        .addr           (pcValue), 
        .enable         (1'b1), 
        .wr             (1'b0), 
        .createdump     (HaltMEMWB), 
        .clk            (clk), 
        .rst            (rst)
    );


    //detect if a source register for the instruction is currently in the
    //pipline as a destination register
    hazard_detector hd(
        .instruction        (instruction), 
        .rd                 (regWriteAddr), 
        .rdIDEX             (regWriteAddrIDEX), 
        .rdEXMEM            (regWriteAddrEXMEM), 
        .rdMEMWB            (regWriteAddrMEMWB),
        .instructionIFID    (instructionIFID[15:11]),
        .instructionIDEX    (instructionIDEX[15:11]), 
        .instructionEXMEM   (instructionEXMEM[15:11]), 
        .instructionMEMWB   (instructionMEMWB[15:11]), 
        .Stall              (Stall)
    );

    //mux between nop and instruction with select Stall. Could be brought into
    //the hazard_detector which ouput could be wired directly to regIFID
    multiplexer16bit_2to1 stallInstruction(
        .inA            (instruction), 
        .inB            (16'b0000100000000000), 
        .S              (Stall), 
        .Out            (instructionStallChecked)
    ); 

    regIFID ifid(
        .PCCurr         (pcValue), 
        .PCInc          (pcAdderOut), 
        .Inst           (instructionStallChecked), 
        .clk            (clk), 
//        .rst            (reset), 
        .rst            (rst),
        .PCCurrOut      (pcValueIFID), 
        .PCIncOut       (pcAdderOutIFID), 
        .InstOut        (instructionIFID)
    );


    control ctrl(
        .instruction        (instructionIFID), 
        .RegWrite           (RegWrite), 
        .Immed              (Immed), 
        .pcctrl             (pcctrl), 
        .Jump               (Jump), 
        .InstFormat         (InstFormat), 
        .MemEN              (MemEN), 
        .pcsrc              (pcsrc), 
        .MemWrite           (MemWrite), 
        .MemRead            (MemRead), 
        .aluops             (aluops), 
        .Signed             (Signed), 
        .flagSelect         (FlagSelect), 
        .ALUOut             (aluout), 
        .RegWriteData       (RegWriteData), 
        .aluor              (aluor), 
        .ImmdLocation       (ImmdLocation),
        .Halt               (Halt),
        .BranchFlagger      (BranchFlagger),
        .aSelect            (aSelect),
        .subOP              (subOP)
    );


    //mux to select write register
    multiplexer3bit_4to1 writeRegSelect(
        .inA        (3'b111), 
        .inB        (instructionIFID[7:5]),
        .inC        (instructionIFID[10:8]),
        .inD        (instructionIFID[4:2]),
        .S          (InstFormat), 
        .Out        (regWriteAddr)
    );

//    always @ (posedge clk) begin
//        $display("writeRegData: %b\n", writeRegData);
//    end

    rf registers(
        .read1data      (readReg1), 
        .read2data      (readReg2), 
        .err            (registerError), 
        .clk            (clk), 
        .rst            (rst), 
        .read1regsel    (instructionIFID[10:8]), 
        .read2regsel    (instructionIFID[7:5]), 
        .writeregsel    (regWriteAddrMEMWB), 
        .writedata      (writeRegData), 
        .write          (RegWriteMEMWB)
    );

    extender ext(
        .inA            (instructionIFID), 
        .ImmdLocation   (ImmdLocation), 
        .Signed         (Signed), 
        .Out            (immediate)
    );

    regIDEX idex(
        //Inputs
        .RegWrite           (RegWrite), 
        .Jump               (Jump), 
        .MemEN              (MemEN), 
        .MemWrite           (MemWrite), 
        .MemRead            (MemRead), 
        .ALUOut             (aluout), 
        .aluor              (aluor), 
        .Halt               (Halt), 
        .BranchFlagger      (BranchFlagger), 
        .aSelect            (aSelect), 
        .subOP              (subOP), 
        .flagSelect         (FlagSelect), 
        .Immed              (Immed), 
        .pcsrc              (pcsrc), 
        .pcctrl             (pcctrl), 
        .InstFormat         (InstFormat), 
        .aluops             (aluops), 
        .RegWriteData       (RegWriteData), 
        .PCCurr             (pcValueIFID), 
        .PCInc              (pcAdderOutIFID), 
        .Inst               (instructionIFID), 
        .ReadReg1           (readReg1),
        .ReadReg2           (readReg2),
        .Extension          (immediate),
        .regWriteAddr       (regWriteAddr),
        .clk                (clk), 
//        .rst                (reset),
        .rst                (rst),
        //Outputs
        .RegWriteOut        (RegWriteIDEX), 
        .JumpOut            (JumpIDEX), 
        .MemENOut           (MemENIDEX), 
        .MemWriteOut        (MemWriteIDEX), 
        .MemReadOut         (MemReadIDEX), 
        .ALUOutOut          (aluoutIDEX), 
        .aluorOut           (aluorIDEX), 
        .HaltOut            (HaltIDEX), 
        .BranchFlaggerOut   (BranchFlaggerIDEX), 
        .aSelectOut         (aSelectIDEX), 
        .subOPOut           (subOPIDEX), 
        .flagSelectOut      (FlagSelectIDEX), 
        .ImmedOut           (ImmedIDEX), 
        .pcsrcOut           (pcsrcIDEX), 
        .pcctrlOut          (pcctrlIDEX), 
        .InstFormatOut      (InstFormatIDEX), 
        .aluopsOut          (aluopsIDEX), 
        .RegWriteDataOut    (RegWriteDataIDEX), 
        .PCCurrOut          (pcValueIDEX), 
        .PCIncOut           (pcAdderOutIDEX), 
        .InstOut            (instructionIDEX), 
        .ReadReg1Out        (readReg1IDEX), 
        .ReadReg2Out        (readReg2IDEX), 
        .ExtensionOut       (immediateIDEX),
        .regWriteAddrOut    (regWriteAddrIDEX)
    );

    jump_adder jumpCalculationFunc(
        .pc             (pcAdderOutIDEX), 
        .rs             (readReg1IDEX), 
        .I              (immediateIDEX), 
        .S              (pcsrcIDEX), 
        .Z              (zFlag), 
        .N              (nFlag),
        .aSelect        (aSelectIDEX), 
        .J              (JumpIDEX),
        .BranchTaken    (BranchTaken),
        .Out            (jumpCalculation)
    );

    //mux to choose immediate or register data for alu
    multiplexer16bit_4to1 aluInBSelect(
        .inA        (readReg2IDEX),
        .inB        (immediateIDEX),
        .inC        (16'h000F),
        .inD        (16'h0008),
        .S          (ImmedIDEX),
        .Out        (aluB)
    );

    branch_flagger bf(
        .inA            (readReg1IDEX), 
        .N              (nFlagBF), 
        .Z              (zFlagBF)
    );

    
    alu alu1 (
        //Inputs
        .A      (readReg1IDEX),
        .B      (aluB), 
        .Cin    (1'b0), 
        .Op     (aluopsIDEX), 
        .invA   (1'b0), 
        .invB   (1'b0), 
        .sign   (1'b0), 
        //output
        .Out    (aluOut), 
        .Ofl    (oflFlag), 
        .Z      (zFlagALU), 
        .N      (nFlagALU),
        //input
        .subOP  (subOP)
    );

    multiplexer_2to1 zFlagSelect(
        .inA        (zFlagALU), 
        .inB        (zFlagBF), 
        .S          (BranchFlaggerIDEX), 
        .Out        (zFlag)
    ); 
    multiplexer_2to1 nFlagSelect(
        .inA        (nFlagALU), 
        .inB        (nFlagBF), 
        .S          (BranchFlaggerIDEX), 
        .Out        (nFlag)
    ); 
    
    //or nFlag and zFlag for flag select mux
    or2 nORf(
        .inA        (nFlag), 
        .inB        (zFlag), 
        .Out        (zornFlag)
    );


    //flag select mux
    multiplexer_4to1 flagSelect(
        .InA        (oflFlag),
        .InB        (zFlag),
        .InC        (nFlag),
        .InD        (zornFlag),
        .S          (FlagSelectIDEX),
        .Out        (flagSelect1Bit)
    );

    //zero extend flag select output
    zero_extender1Bit flagExtender(
        .inA                (flagSelect1Bit), 
        .Out                (FlagSelect16Bit)
    ); 

    //mux for alu or flag output
    multiplexer16bit_2to1 aluOrFlagSelect(
        .inA        (aluOut), 
        .inB        (FlagSelect16Bit), 
        .S          (aluoutIDEX), 
        .Out        (aluFlagOut)
    );

    or_16bits bitwiseOr(
        .inA        (aluOut), 
        .inB        (immediateIDEX), 
        .Out        (aluOutOr)
    );

    //mux between aluOutOr and aluOut for slbi
    multiplexer16bit_2to1 aluFlagOraluorSelect(
        .inA        (aluFlagOut),
        .inB        (aluOutOr),
        .S          (aluorIDEX),
        .Out        (aluFlagOrOut)
    );

    reverse reverser(
        .inA        (readReg1IDEX), 
        .Out        (fromReverser)
    );

    regEXMEM  exmem(
        //Inputs
        .RegWrite           (RegWriteIDEX), 
        .Jump               (JumpIDEX), 
        .MemEN              (MemENIDEX), 
        .MemWrite           (MemWriteIDEX), 
        .MemRead            (MemReadIDEX), 
        .ALUOut             (aluoutIDEX), 
        .Halt               (HaltIDEX), 
        .BranchFlagger      (BranchFlaggerIDEX), 
        .pcctrl             (pcctrlIDEX), 
        .InstFormat         (InstFormatIDEX), 
        .RegWriteData       (RegWriteDataIDEX), 
        .PCCurr             (pcValueIDEX),
        .PCInc              (pcAdderOutIDEX), 
        .Inst               (instructionIDEX), 
        .ReadReg2           (readReg2IDEX), 
        .Extension          (immediateIDEX),
        .regWriteAddr       (regWriteAddrIDEX),
        .fromReverser       (fromReverser),
        .aluFlagOrOut       (aluFlagOrOut), 
        .aluOut             (aluOut),
        .jumpCalculation    (jumpCalculation), 
        .BranchTaken        (BranchTaken), 
        .clk                (clk), 
//        .rst                (reset),
        .rst                (rst),
        //Outputs
        .RegWriteOut        (RegWriteEXMEM), 
        .JumpOut            (JumpEXMEM), 
        .MemENOut           (MemENEXMEM),
        .MemWriteOut        (MemWriteEXMEM), 
        .MemReadOut         (MemReadEXMEM), 
        .ALUOutOut          (aluoutEXMEM), 
        .HaltOut            (HaltEXMEM), 
        .BranchFlaggerOut   (BranchFlaggerEXMEM), 
        .pcctrlOut          (pcctrlEXMEM), 
        .InstFormatOut      (InstFormatEXMEM), 
        .RegWriteDataOut    (RegWriteDataEXMEM), 
        .PCCurrOut          (pcValueEXMEM), 
        .PCIncOut           (pcAdderOutEXMEM), 
        .InstOut            (instructionEXMEM), 
        .ReadReg2Out        (readReg2EXMEM), 
        .ExtensionOut       (immediateEXMEM),
        .regWriteAddrOut    (regWriteAddrEXMEM),
        .fromReverserOut    (fromReverserEXMEM), 
        .aluFlagOrOutOut    (aluFlagOrOutEXMEM), 
        .aluOutOut          (aluOutEXMEM),
        .jumpCalculationOut (jumpCalculationEXMEM), 
        .BranchTakenOut     (BranchTakenEXMEM)
    );



    memory2c dataMemory(
        .data_out       (dataMemOut), 
        .data_in        (readReg2EXMEM), 
        .addr           (aluOutEXMEM), 
        .enable         (MemReadEXMEM), 
        .wr             (MemWriteEXMEM), 
        .createdump     (HaltMEMWB), 
        .clk            (clk), 
        .rst            (rst)
    );



    regMEMWB memwb (
        //Inputs
        .RegWrite           (RegWriteEXMEM), 
        .Jump               (JumpEXMEM), 
        .MemEN              (MemENEXMEM), 
        .Halt               (HaltEXMEM), 
        .BranchFlagger      (BranchFlaggerEXMEM), 
        .pcctrl             (pcctrlEXMEM), 
        .InstFormat         (InstFormatEXMEM), 
        .RegWriteData       (RegWriteDataEXMEM), 
        .PCCurr             (pcValueEXMEM), 
        .PCInc              (pcAdderOutEXMEM), 
        .Inst               (instructionEXMEM), 
        .Extension          (immediateEXMEM), 
        .regWriteAddr       (regWriteAddrEXMEM),
        .fromReverser       (fromReverserEXMEM),
        .aluFlagOrOut       (aluFlagOrOutEXMEM),
        .jumpCalculation    (jumpCalculationEXMEM),
        .BranchTaken        (BranchTakenEXMEM), 
        .dataMemOut         (dataMemOut), 
        .clk                (clk), 
//        .rst                (reset),
        .rst                (rst),
        //Outputs
        .RegWriteOut        (RegWriteMEMWB), 
        .JumpOut            (JumpMEMWB), 
        .MemENOut           (MemENMEMWB), 
        .HaltOut            (HaltMEMWB), 
        .BranchFlaggerOut   (BranchFlaggerMEMWB), 
        .pcctrlOut          (pcctrlMEMWB), 
        .InstFormatOut      (InstFormatMEMWB), 
        .RegWriteDataOut    (RegWriteDataMEMWB), 
        .PCCurrOut          (pcValueMEMWB), 
        .PCIncOut           (pcAdderOutMEMWB), 
        .InstOut            (instructionMEMWB), 
        .ExtensionOut       (immediateMEMWB), 
        .regWriteAddrOut    (regWriteAddrMEMWB),
        .fromReverserOut    (fromReverserMEMWB), 
        .aluFlagOrOutOut    (aluFlagOrOutMEMWB), 
        .jumpCalculationOut (jumpCalculationMEMWB),
        .BranchTakenOut     (BranchTakenMEMWB), 
        .dataMemOutOut      (dataMemOutMEMWB)
    );


    //mux to select from memory output and aluout/aluoutor
    multiplexer16bit_2to1 aluOrMemorySelect(
        .inA        (aluFlagOrOutMEMWB),
        .inB        (dataMemOutMEMWB),
        .S          (MemENMEMWB),
        .Out        (aluMemOut)
    );


    
    //mux to choose write data for register (alu/memory output, immediate,
    //pc+2)
    multiplexer16bit_4to1 regWriteDataSelect(
        .inA        (aluMemOut),
        .inB        (pcAdderOutMEMWB),
        .inC        (immediateMEMWB),
        .inD        (fromReverserMEMWB),
        .S          (RegWriteDataMEMWB),
        .Out        (writeRegData)
    );

   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
