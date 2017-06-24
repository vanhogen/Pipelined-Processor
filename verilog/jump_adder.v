module jump_adder(pc, rs, I, S, Z, N, J, aSelect, BranchTaken, Out);
    input [15:0] pc; 
    input [15:0] rs;
    input [15:0] I;
    input [1:0] S;
    input Z, N, J, aSelect;
    output BranchTaken;
    output [15:0] Out;

    wire [15:0] inA;
    wire [15:0] wireAPlusI;
    wire notZ;
    wire notN;
    wire notZandN;
    wire [15:0] beqz;
    wire [15:0] bnez;
    wire [15:0] bltz;
    wire [15:0] bgez;
    wire [15:0] branchSelect;
    wire error1;

    //Flag setup
    not1 notZFunc(
        .in1        (Z),
        .out        (notZ)
    );
    not1 notNFunc(
        .in1        (N),
        .out        (notN)
    );
    and2 notZandNFunc(
        .inA        (notZ), 
        .inB        (N), 
        .Out        (notZandN)
    );

    //Set BranchTaken Flag
    multiplexer_4to1 BranchTakenMux(
        .InA        (Z), 
        .InB        (notZ), 
        .InC        (notZandN), 
        .InD        (notN), 
        .S          (S), 
        .Out        (BranchTaken)
    );
  


    //choose jump or not
    multiplexer16bit_2to1 jumpornot(
        .inA        (pc), 
        .inB        (rs), 
        .S          (aSelect), 
        .Out        (inA)
    );


    //calculate address jump
    carry_lookahead16   PCPlusI(
        .inA        (inA),
        .inB        (I),
        .Cin        (1'b0), 
        .Cout       (error1), 
        .Sum        (wireAPlusI)
    );

    //Branch conditions
    multiplexer16bit_2to1 beqzMux(
        .inA        (pc),
        .inB        (wireAPlusI),
        .S          (Z),
        .Out        (beqz)
    );

    multiplexer16bit_2to1 bnezMux(
        .inA        (pc),
        .inB        (wireAPlusI),
        .S          (notZ),
        .Out        (bnez)
    );

    multiplexer16bit_2to1 bltzMux(
        .inA        (pc),
        .inB        (wireAPlusI),
        .S          (notZandN),
        .Out        (bltz)
    );

    multiplexer16bit_2to1 bgezMux(
        .inA        (pc),
        .inB        (wireAPlusI),
        .S          (notN),
        .Out        (bgez)
    );


    //select instruction for output
    multiplexer16bit_4to1 branchMux(
        .inA        (beqz),
        .inB        (bnez),
        .inC        (bltz),
        .inD        (bgez),
        .S          (S),
        .Out        (branchSelect)
    );

    multiplexer16bit_2to1 jumpOrBranch(
        .inA        (branchSelect),
        .inB        (wireAPlusI),
        .S          (J),
        .Out        (Out)
    );

endmodule
