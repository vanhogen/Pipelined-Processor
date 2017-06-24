module invert(inA, out);
    input [15:0]inA;
    output [15:0]out;
    
    
    not1 invertBit1(.in1(inA[15]), .out(out[15]));
    not1 invertBit2(.in1(inA[14]), .out(out[14]));
    not1 invertBit3(.in1(inA[13]), .out(out[13]));
    not1 invertBit4(.in1(inA[12]), .out(out[12]));
    not1 invertBit5(.in1(inA[11]), .out(out[11]));
    not1 invertBit6(.in1(inA[10]), .out(out[10]));
    not1 invertBit7(.in1(inA[9]), .out(out[9]));
    not1 invertBit8(.in1(inA[8]), .out(out[8]));
    not1 invertBit9(.in1(inA[7]), .out(out[7]));
    not1 invertBit10(.in1(inA[6]), .out(out[6]));
    not1 invertBit11(.in1(inA[5]), .out(out[5]));
    not1 invertBit12(.in1(inA[4]), .out(out[4]));
    not1 invertBit13(.in1(inA[3]), .out(out[3]));
    not1 invertBit14(.in1(inA[2]), .out(out[2]));
    not1 invertBit15(.in1(inA[1]), .out(out[1]));
    not1 invertBit16(.in1(inA[0]), .out(out[0]));
    
    /*
    wire bitPlacement;
    wire waste;
    wire [15:0]invertBitWire;
    
    
    not1 invertBit1(.in1(inA[15]), .out(invertBitWire[15]));
    not1 invertBit2(.in1(inA[14]), .out(invertBitWire[14]));
    not1 invertBit3(.in1(inA[13]), .out(invertBitWire[13]));
    not1 invertBit4(.in1(inA[12]), .out(invertBitWire[12]));
    not1 invertBit5(.in1(inA[11]), .out(invertBitWire[11]));
    not1 invertBit6(.in1(inA[10]), .out(invertBitWire[10]));
    not1 invertBit7(.in1(inA[9]), .out(invertBitWire[9]));
    not1 invertBit8(.in1(inA[8]), .out(invertBitWire[8]));
    not1 invertBit9(.in1(inA[7]), .out(invertBitWire[7]));
    not1 invertBit10(.in1(inA[6]), .out(invertBitWire[6]));
    not1 invertBit11(.in1(inA[5]), .out(invertBitWire[5]));
    not1 invertBit12(.in1(inA[4]), .out(invertBitWire[4]));
    not1 invertBit13(.in1(inA[3]), .out(invertBitWire[3]));
    not1 invertBit14(.in1(inA[2]), .out(invertBitWire[2]));
    not1 invertBit15(.in1(inA[1]), .out(invertBitWire[1]));
    not1 invertBit16(.in1(inA[0]), .out(invertBitWire[0]));
    
 //   assign invertReg[15] = invertBit1Wire;
    carry_lookahead16 addit(.inA(invertBitWire), .inB(16'h0001), .Cin(1'b0), .Cout(waste), .Sum(out));
    */
    
endmodule
