
module control_bench(instruction, RegWrite, Immed, pcctrl, Jump, InstFormat, MemEN, pcsrc, MemWrite, MemRead, aluops, Signed, flagSelect, ALUOut, RegWriteData, aluor, ImmdLocation, Halt);
   // Instantiate the module we want to verify


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

   //01000 101 001 11100
   assign instruction = 16'b0100010100111100;

   control_hier DUT(
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



   always @ (*)begin

      // Print log of what transpired
      $display("Instruction = %b\n================\nRegWrite = %b\nJump = %b\nMemEN = %b\nMemWrite = %b\nMemRead = %b\nSigned = %b\nALUOut = %b\naluor = %b\nHalt = %b\nImmdLocation = %b\nflagSelect = %b\nImmed = %b\npcsrc = %b\npcctrl = %b\nInstFormat = %b\naluops = %b\nRegWriteData = %b",
               instruction, RegWrite, Jump, MemEN, MemWrite, MemRead, Signed, ALUOut, aluor, Halt, ImmdLocation, flagSelect, Immed, pcsrc, pcctrl, InstFormat, aluops, RegWriteData);

   end

endmodule // rf_bench
// DUMMY LINE FOR REV CONTROL :0:
