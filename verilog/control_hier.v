module control_hier(instruction, RegWrite, Immed, pcctrl, Jump, InstFormat, MemEN, pcsrc, MemWrite, MemRead, aluops, Signed, flagSelect, ALUOut, RegWriteData, aluor, ImmdLocation, Halt);
   
    input [15:0] instruction;
    output RegWrite, Jump, MemEN, MemWrite, MemRead, Signed, ALUOut, aluor, Halt;
    output [1:0] ImmdLocation;
    output [1:0] flagSelect;
    output [1:0] Immed;
    output [1:0] pcsrc;
    output [1:0] pcctrl;
    output [1:0] InstFormat;
    output [2:0] aluops;
    output [1:0] RegWriteData;

    control control0(
        .instruction        (instruction),
        .RegWrite           (RegWrite), 
        .Jump               (Jump), 
        .MemEN              (MemEN), 
        .MemWrite           (MemWrite), 
        .MemRead            (MemRead), 
        .Signed             (Signed), 
        .ALUOut             (ALUOut), 
        .aluor              (aluor), 
        .Halt               (Halt),
        .ImmdLocation       (ImmdLocation),
        .flagSelect         (flagSelect),
        .Immed              (Immed),
        .pcsrc              (pcsrc),
        .pcctrl             (pcctrl),
        .InstFormat         (InstFormat),
        .aluops             (aluops),
        .RegWriteData       (RegWriteData)
      );

endmodule
// DUMMY LINE FOR REV CONTROL :4:
