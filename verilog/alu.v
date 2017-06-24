module alu (A, B, Cin, Op, invA, invB, sign, Out, Ofl, Z, N, subOP);
   
    input [15:0] A;
    input [15:0] B;
    input Cin;
    input [2:0] Op;
    input invA;
    input invB;
    input sign;
    input subOP;
    output [15:0] Out;
    output Ofl;
    output Z;
    output N;
    
    reg regZ;

    reg [15:0] regOut;

    wire[15:0] wireOutShifter;
    
    wire[15:0] wireOutRotate;
    wire[15:0] wireOutShift;
    wire[15:0] wireOutArithmetic;
    wire[15:0] wireOutLogical;
    
    wire[15:0] wireXor;
    wire[15:0] wireAnd;
    reg[15:0] wireSub;
    wire[15:0] wireAdd;
    wire oflAdd;

    reg regAdd;
    
    wire [15:0] inuseBCompliment;
    wire [15:0] invertInuseB;
    wire [15:0] subNotNeg;
    wire [15:0] invertSub;
    wire [15:0] wireSubSum;
    wire [15:0] inuseASelect;
    wire [15:0] inuseBSelect;
    wire negativeFlag;
    wire [15:0] sub;
    wire waste1, waste2;
    wire carry, subMSB, negCheck, zeroCheck;
    wire[15:0] inverseA;
    wire[15:0] inverseB;
    reg[15:0] inuseA;
    reg[15:0] inuseB;
    
    wire xorMSB;
    wire signCheck;
    wire negOut;
    wire sameSign;
    wire negSubNeg;
    wire tempRemove;
    wire edgeCarry;
    wire negCarry;
    wire preEdgeCheck;
    wire initNotDiffWithCarry;
    wire initNotDiff;
    wire initDiff;
    wire noCarry;
    
    
    
    invert invertA(.inA(A), .out(inverseA));
    invert invertB(.inA(B), .out(inverseB));

    always @ (*) begin
        case(invA)
            1'b1: begin
                inuseA = inverseA;
            end
            1'b0: begin
                inuseA = A;
            end
        endcase
    end
    
    always @ (*) begin
        case(invB)
            1'b1: begin
                inuseB = inverseB;
            end
            1'b0: begin
                inuseB = B;
            end
        endcase
    end
    
    //Detect signed overflow by seeing if the numbers are different signs
    //where 1 means different
    xor2 xorMSBFunc(.in1(inuseA[15]), .in2(inuseB[15]), .out(xorMSB));

    shifter shiftOps(
        .In(inuseA), 
        .Cnt(inuseB[3:0]), 
        .Op(Op[1:0]), 
        .Out(wireOutShifter)
    );

    //ALU Operations
    //Xor
    xor_16bits xorbitwise(.inA(inuseA), .inB(inuseB), .Out(wireXor));

    
    
    //Subtract
    //Select proper subtraction or (ie A-B or B-A)
    multiplexer16bit_2to1 flipA(
        .inA    (inuseA), 
        .inB    (inuseB), 
        .S      (subOP), 
        .Out    (inuseASelect)
    );
    multiplexer16bit_2to1 flipB(
        .inA    (inuseB), 
        .inB    (inuseA), 
        .S      (subOP), 
        .Out    (inuseBSelect)
    );

    invert invertInuseBFunc(
        .inA        (inuseBSelect),
        .out        (invertInuseB)
    );
    carry_lookahead16 inuseBComplimentFunc(
        .inA        (invertInuseB),
        .inB        (16'h0001),
        .Cin        (1'b0),
        .Cout       (waste1),
        .Sum        (inuseBCompliment)
    );
    carry_lookahead16 subAB(
        .inA        (inuseASelect),
        .inB        (inuseBCompliment),
        .Cin        (1'b0),
        .Cout       (carry),
        .Sum        (sub)
    );
    //calculate sum if calculation resulted in negative
    invert invertSubFunc(
        .inA        (sub), 
        .out        (invertSub)
    );
    carry_lookahead16 subSum(
        .inA        (invertSub),
        .inB        (16'h0001),
        .Cin        (1'b0),
        .Cout       (waste2),
        .Sum        (wireSubSum)
    );

    //if carry = 0 and the second bitstring was non-neg
    //Then answer is negative
    //
    //if carry = 0 and the second bitstring was neg
    //then use sub

    //if one was negative then check result for negative bit
        //or'd with ofl detection for negative flag.

    or2 zeroCheckFunc(
        .inA        (carry),
        .inB        (waste1),
        .Out        (zeroCheck)
    );
    or2 addNegCheck(
        .inA        (zeroCheck),
        .inB        (inuseBSelect[15]), 
        .Out        (negCheck)
    ); 

    //0 on carry is negative
    //can represent the number as unsigned with the negative flag if you
       //switch 1'b0 sub with wireSubSum
    always @ (*) begin
        case(negCheck)
            1'b0:begin
//                wireSub = wireSubSum;
                wireSub = sub;
            end
            1'b1:begin
                wireSub = sub;
            end
        endcase
    end

    //Flip carry to calculate negative flag
    not1 negativeFlagCarryFunc(
        .in1        (negCheck),
        .out        (negativeFlag)
    );
    

    //AndN
    and_16bits andbitwise(.inA(inuseA), .inB(inverseB), .Out(wireAnd));
    //Add
    carry_lookahead16 addAB(.inA(inuseA), .inB(inuseB), .Cin(Cin), .Cout(oflAdd), .Sum(wireAdd));

    always @ (*) begin
        case(Op)
            //Rotate Left
            3'b000: begin
                regOut = wireOutShifter;
            end
            //Shift Left
            3'b001: begin
                regOut = wireOutShifter;
            end
            //Shift Right Arithmetic
            3'b010: begin
                regOut = wireOutShifter;
            end
            //Shift Right Logical
            3'b011: begin
                regOut = wireOutShifter;
            end
            //Add
            3'b100: begin
                regOut = wireAdd;
            end
            //Subtract
            3'b101: begin
                regOut = wireSub;
            end
            //Xor
            3'b110: begin
                regOut = wireXor;
            end
            //AndN
            3'b111: begin
                regOut = wireAnd;
            end
        endcase
    end
    
    //TODO may need to handle zeroing regAdd if a logical operation was
    //used to avoid unneccesary ofl flagging
    always @ (*) begin
        case(sign)
            //Signed integers which require some logic checks
            1'b1: begin
                case(xorMSB)
                    //Different signs so overflow will not occur
                    1'b1: begin
                        //
                        regAdd = 1'b0;
                    end
                    //Same sign so the overflow can occur
                    1'b0: begin
                        case(wireAdd[15])
                            inuseA[15]: begin
                                //
                                regAdd = 1'b0;
                            end
                            default: begin
                                //
                                regAdd = 1'b1;
                            end
                        endcase
                    end
                endcase
            end
            //Unsigned which can use straight overflow logic
            1'b0: begin
                //
                regAdd = oflAdd;
            end
        endcase
    end
    
    always @ (*) begin
        case(regOut)
            16'h0000: begin
                //
                regZ = 1'b1;
            end
            default: begin
                //
                regZ = 1'b0;
            end
        endcase
    end

       assign Ofl = regAdd;
       assign Z = regZ;
       assign Out = regOut;     
   

    //if signs are diff & msb = 1 then negative
    xor2 signCheckFunc(
        .in1        (inuseASelect[15]),
        .in2        (inuseBCompliment[15]),
        .out        (signCheck)
    );
    and2 resultedInNeg(
        .inA        (signCheck),
        .inB        (regOut[15]),
        .Out        (negOut)
    );
    not1 bothSameSignCheck(
        .in1        (signCheck),
        .out        (sameSign)
    );
    and2 inputNegCheck(
        .inA        (sameSign),
        .inB        (inuseASelect[15]),
        .Out        (negSubNeg)
    );

    //edge case from t_6_ctrl
    not1 notCarryFunc(
        .in1        (carry),
        .out        (noCarry)
    );

    and2 edgeCarryCheck(
        .inA        (carry),
        .inB        (sameSign),
        .Out        (edgeCarry)
    );

    xor2 initDiffCheck(
        .in1        (inuseASelect[15]),
        .in2        (inuseBSelect[15]),
        .out        (initDiff)
    );

    not1 initNotDiffCheck(
        .in1        (initDiff),
        .out        (initNotDiff)
    );

    and2 initDiffAggregation(
        .inA        (edgeCarry),
        .inB        (initNotDiff),
        .Out        (initNotDiffWithCarry)
    );
    
    not1 negCarryFunc(
        .in1        (initNotDiffWithCarry),
        .out        (negCarry)
    );
    
    or2 negFlagSet(
        .inA        (negSubNeg),
        .inB        (negOut),
        .Out        (preEdgeCheck)
    );

    and2 negOfl(
        .inA        (negCarry),
        .inB        (preEdgeCheck),
        .Out        (N)
    );
    
    
endmodule
