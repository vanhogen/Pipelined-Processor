module hazard_detector(instruction, rd, rdIDEX, rdEXMEM, rdMEMWB, rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite, instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB, BranchTaken, BranchTakenEXMEM, BranchTakenMEMWB, clk, rst, Stall);
    
    input [15:0] instruction;
    input [2:0] rd, rdIDEX, rdEXMEM, rdMEMWB;
    input [4:0] instructionIFID, instructionIDEX, instructionEXMEM, instructionMEMWB;
    input BranchTaken, BranchTakenEXMEM, BranchTakenMEMWB;
    input rdWrite, rdIDEXWrite, rdEXMEMWrite, rdMEMWBWrite;
    input clk;
    input rst;

    output Stall;

    reg StallReg;
    reg BranchReg;

    wire rs;
    wire rsrt;
    wire branch;
    wire rsBranch;
    wire rsrtBranch;
    wire jalr7Check;
    wire branchOrR7;
    wire memRef;
    wire rsBranchMem;
    wire rsrtBranchMem;
    wire branchMem;

    //r7 in use check for jal and jalr
    hazard_addr_check_1source r7Source(
        .rs             (3'b111),
        .rd             (rd),
        .rdIDEX         (rdIDEX),
        .rdEXMEM        (rdEXMEM),
        .rdMEMWB        (rdMEMWB),
        .rdWrite        (rdWrite),
        .rdIDEXWrite    (rdIDEXWrite),
        .rdEXMEMWrite   (rdEXMEMWrite),
        .rdMEMWBWrite   (rdMEMWBWrite),
        .Out            (jalr7Check)
    );
    
    //check if store or load is in pipeline, improvement can be made by
    //releasing instructions after the mem[writeaddr] is calculated
    hazard_check_mem storld(
        .instructionIFID    (instructionIFID),
        .instructionIDEX    (instructionIDEX),
        .instructionEXMEM   (instructionEXMEM),
        .instructionMEMWB   (instructionMEMWB),
        .Out                (memRef)
    );

    //Stall if a branch or jump is in the pipline
    //returns 1 if instruction in pipeline contains branch or jump
    hazard_check_branch branchorjumphazard(
        .instructionIFID        (instructionIFID),
        .instructionIDEX        (instructionIDEX),
        .instructionEXMEM       (instructionEXMEM),
        .instructionMEMWB       (instructionMEMWB),
        .BranchTaken            (BranchTaken),
        .BranchTakenEXMEM       (BranchTakenEXMEM),
        .BranchTakenMEMWB       (BranchTakenMEMWB),
        .Out                    (branch)
    );

    //run check on Jformat...RFormat...etc, use case statement to choose which
    //output gets placed into stall.
    hazard_addr_check_1source singleSource(
        .rs             (instruction[10:8]),
        .rd             (rd),
        .rdIDEX         (rdIDEX),
        .rdEXMEM        (rdEXMEM),
        .rdMEMWB        (rdMEMWB),
        .rdWrite        (rdWrite),
        .rdIDEXWrite    (rdIDEXWrite),
        .rdEXMEMWrite   (rdEXMEMWrite),
        .rdMEMWBWrite   (rdMEMWBWrite),
        .Out            (rs)
    );

    hazard_addr_check_2source twoSources(
        .rs             (instruction[10:8]),
        .rt             (instruction[7:5]),
        .rd             (rd),
        .rdIDEX         (rdIDEX),
        .rdEXMEM        (rdEXMEM),
        .rdMEMWB        (rdMEMWB),
        .rdWrite        (rdWrite),
        .rdIDEXWrite    (rdIDEXWrite),
        .rdEXMEMWrite   (rdEXMEMWrite),
        .rdMEMWBWrite   (rdMEMWBWrite),
        .Out            (rsrt)
    );

    or2 rsBranchCheck(
        .inA        (rs),
        .inB        (branch),
        .Out        (rsBranch)
    );

    or2 rsrtBranchCheck(
        .inA        (rsrt),
        .inB        (branch),
        .Out        (rsrtBranch)
    );

    or2 branchOrR7Compile(
        .inA        (branch),
        .inB        (jalr7Check),
        .Out        (branchOrR7)
    );

    or2 mem1sourceCompile(
        .inA        (rsBranch),
        .inB        (memRef),
        .Out        (rsBranchMem)
    );

    or2 mem2sourceCompile(
        .inA        (rsrtBranch),
        .inB        (memRef),
        .Out        (rsrtBranchMem)
    );
    or2 branchorMemCompile(
        .inA        (branch),
        .inB        (memRef),
        .Out        (branchMem)
    );


    always @ (*) begin
        case (instruction [15:11])
            5'b00001:begin //noop
                StallReg = 1'b0;
            end
            5'b00000:begin //halt
                StallReg = branchMem;
            end
            5'b01000:begin //addi
                StallReg = rsBranch;
            end
            5'b01001:begin //subi
                StallReg = rsBranch;
            end
            5'b01010:begin //xori
                StallReg = rsBranch;
            end
            5'b01011:begin //andni
                StallReg = rsBranch;
            end
            5'b10100:begin //roli
                StallReg = rsBranch;
            end
            5'b10101:begin //slli
                StallReg = rsBranch;
            end
            5'b10110:begin //rori
                StallReg = rsBranch;
            end
            5'b10111:begin //srli
                StallReg = rsBranch;
            end
            5'b10000:begin //st
                StallReg = rsrtBranchMem;
            end
            5'b10001:begin //ld
                StallReg = rsBranchMem;
            end
            5'b10011:begin //stu
                StallReg = rsrtBranch;
            end
            5'b11001:begin //btr
                StallReg = rsBranch;
            end
            5'b11011:begin //add, sub, xor, andn
                StallReg = rsrtBranch;
            end
            5'b11010:begin //rol, sll, ror, srl
                StallReg = rsrtBranch;
            end
            5'b11100:begin //seq
                StallReg = rsrtBranch;
            end
            5'b11101:begin //slt
                StallReg = rsrtBranch;
            end                        
            5'b11110:begin //sle
                StallReg = rsrtBranch;
            end       
            5'b11111:begin //sco
                StallReg = rsrtBranch;
            end
            5'b01100:begin //beqz
                StallReg = rsBranch;
            end            
            5'b01101:begin //bnez
                StallReg = rsBranch;
            end                  
            5'b01110:begin //bltz
                StallReg = rsBranch;
            end
            5'b01111:begin //bgez
                StallReg = rsBranch;
            end
            5'b11000:begin //lbi
                StallReg = branch;
            end
            5'b10010:begin //slbi
                StallReg = rsBranch;
            end
            5'b00100:begin //j
                StallReg = branch;
            end                        
            5'b00101:begin //jr
                StallReg = rsBranch;
            end
            5'b00110:begin //jal
                StallReg = branch;
            end            
            5'b00111:begin //jalr
                StallReg = rsBranch;
            end
        endcase
    end
    
    assign Stall = StallReg;

endmodule
