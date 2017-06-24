module xor_16bits(inA, inB, Out);
    input [15:0] inA;
    input [15:0] inB;
    output [15:0] Out;
    
    xor2 xorbits0(.in1(inA[0]), .in2(inB[0]), .out(Out[0]));
    xor2 xorbits1(.in1(inA[1]), .in2(inB[1]), .out(Out[1]));
    xor2 xorbits2(.in1(inA[2]), .in2(inB[2]), .out(Out[2]));
    xor2 xorbits3(.in1(inA[3]), .in2(inB[3]), .out(Out[3]));
    xor2 xorbits4(.in1(inA[4]), .in2(inB[4]), .out(Out[4]));
    xor2 xorbits5(.in1(inA[5]), .in2(inB[5]), .out(Out[5]));
    xor2 xorbits6(.in1(inA[6]), .in2(inB[6]), .out(Out[6]));
    xor2 xorbits7(.in1(inA[7]), .in2(inB[7]), .out(Out[7]));
    xor2 xorbits8(.in1(inA[8]), .in2(inB[8]), .out(Out[8]));
    xor2 xorbits9(.in1(inA[9]), .in2(inB[9]), .out(Out[9]));
    xor2 xorbits10(.in1(inA[10]), .in2(inB[10]), .out(Out[10]));
    xor2 xorbits11(.in1(inA[11]), .in2(inB[11]), .out(Out[11]));
    xor2 xorbits12(.in1(inA[12]), .in2(inB[12]), .out(Out[12]));
    xor2 xorbits13(.in1(inA[13]), .in2(inB[13]), .out(Out[13]));
    xor2 xorbits14(.in1(inA[14]), .in2(inB[14]), .out(Out[14]));
    xor2 xorbits15(.in1(inA[15]), .in2(inB[15]), .out(Out[15]));
    
endmodule
