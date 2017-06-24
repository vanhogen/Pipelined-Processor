module and_16bits(inA, inB, Out);
    input [15:0] inA;
    input [15:0] inB;
    output [15:0] Out;
    
    and2 andbits0(.inA(inA[0]), .inB(inB[0]), .Out(Out[0]));
    and2 andbits1(.inA(inA[1]), .inB(inB[1]), .Out(Out[1]));
    and2 andbits2(.inA(inA[2]), .inB(inB[2]), .Out(Out[2]));
    and2 andbits3(.inA(inA[3]), .inB(inB[3]), .Out(Out[3]));
    and2 andbits4(.inA(inA[4]), .inB(inB[4]), .Out(Out[4]));
    and2 andbits5(.inA(inA[5]), .inB(inB[5]), .Out(Out[5]));
    and2 andbits6(.inA(inA[6]), .inB(inB[6]), .Out(Out[6]));
    and2 andbits7(.inA(inA[7]), .inB(inB[7]), .Out(Out[7]));
    and2 andbits8(.inA(inA[8]), .inB(inB[8]), .Out(Out[8]));
    and2 andbits9(.inA(inA[9]), .inB(inB[9]), .Out(Out[9]));
    and2 andbits10(.inA(inA[10]), .inB(inB[10]), .Out(Out[10]));
    and2 andbits11(.inA(inA[11]), .inB(inB[11]), .Out(Out[11]));
    and2 andbits12(.inA(inA[12]), .inB(inB[12]), .Out(Out[12]));
    and2 andbits13(.inA(inA[13]), .inB(inB[13]), .Out(Out[13]));
    and2 andbits14(.inA(inA[14]), .inB(inB[14]), .Out(Out[14]));
    and2 andbits15(.inA(inA[15]), .inB(inB[15]), .Out(Out[15]));
    
endmodule
