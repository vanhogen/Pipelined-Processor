module or_16bits(inA, inB, Out);
    input [15:0] inA;
    input [15:0] inB;
    output [15:0] Out;
    
    or2 orbits0(.inA(inA[0]), .inB(inB[0]), .Out(Out[0]));
    or2 orbits1(.inA(inA[1]), .inB(inB[1]), .Out(Out[1]));
    or2 orbits2(.inA(inA[2]), .inB(inB[2]), .Out(Out[2]));
    or2 orbits3(.inA(inA[3]), .inB(inB[3]), .Out(Out[3]));
    or2 orbits4(.inA(inA[4]), .inB(inB[4]), .Out(Out[4]));
    or2 orbits5(.inA(inA[5]), .inB(inB[5]), .Out(Out[5]));
    or2 orbits6(.inA(inA[6]), .inB(inB[6]), .Out(Out[6]));
    or2 orbits7(.inA(inA[7]), .inB(inB[7]), .Out(Out[7]));
    or2 orbits8(.inA(inA[8]), .inB(inB[8]), .Out(Out[8]));
    or2 orbits9(.inA(inA[9]), .inB(inB[9]), .Out(Out[9]));
    or2 orbits10(.inA(inA[10]), .inB(inB[10]), .Out(Out[10]));
    or2 orbits11(.inA(inA[11]), .inB(inB[11]), .Out(Out[11]));
    or2 orbits12(.inA(inA[12]), .inB(inB[12]), .Out(Out[12]));
    or2 orbits13(.inA(inA[13]), .inB(inB[13]), .Out(Out[13]));
    or2 orbits14(.inA(inA[14]), .inB(inB[14]), .Out(Out[14]));
    or2 orbits15(.inA(inA[15]), .inB(inB[15]), .Out(Out[15]));
    
endmodule
