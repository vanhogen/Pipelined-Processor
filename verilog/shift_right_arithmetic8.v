//Shifts right by 8 designated by Cnt
module shift_right_arithmetic8(In, Cnt, Out);
    input [15:0] In;
    input Cnt;
    output [15:0] Out;

    multiplexer_2to1 firstShift1(.inA(In[0]), .inB(In[8]), .S(Cnt), .Out(Out[0])); 
    multiplexer_2to1 secondShift1(.inA(In[1]), .inB(In[9]), .S(Cnt), .Out(Out[1]));
    multiplexer_2to1 thirdShift1(.inA(In[2]), .inB(In[10]), .S(Cnt), .Out(Out[2]));
    multiplexer_2to1 fourthShift1(.inA(In[3]), .inB(In[11]), .S(Cnt), .Out(Out[3]));
    multiplexer_2to1 fifthShift1(.inA(In[4]), .inB(In[12]), .S(Cnt), .Out(Out[4]));
    multiplexer_2to1 sixthShift1(.inA(In[5]), .inB(In[13]), .S(Cnt), .Out(Out[5]));
    multiplexer_2to1 seventhShift1(.inA(In[6]), .inB(In[14]), .S(Cnt), .Out(Out[6]));
    multiplexer_2to1 eigthShift1(.inA(In[7]), .inB(In[15]), .S(Cnt), .Out(Out[7]));
    multiplexer_2to1 ninthShift1(.inA(In[8]), .inB(In[0]), .S(Cnt), .Out(Out[8]));
    multiplexer_2to1 tenthShift1(.inA(In[9]), .inB(In[1]), .S(Cnt), .Out(Out[9]));
    multiplexer_2to1 eleventhShift1(.inA(In[10]), .inB(In[2]), .S(Cnt), .Out(Out[10]));
    multiplexer_2to1 twelvthShift1(.inA(In[11]), .inB(In[3]), .S(Cnt), .Out(Out[11]));
    multiplexer_2to1 thirteenthShift1(.inA(In[12]), .inB(In[4]), .S(Cnt), .Out(Out[12]));
    multiplexer_2to1 fourteenthShift1(.inA(In[13]), .inB(In[5]), .S(Cnt), .Out(Out[13]));
    multiplexer_2to1 fifteenthShift1(.inA(In[14]), .inB(In[6]), .S(Cnt), .Out(Out[14]));
    multiplexer_2to1 sixteenthShift1(.inA(In[15]), .inB(In[7]), .S(Cnt), .Out(Out[15]));
   
endmodule
