//Shifts left by 4 designated by Cnt
module shift_left4(In, Cnt, Out);
    input [15:0] In;
    input Cnt;
    output [15:0] Out;

    multiplexer_2to1 firstShift4(.inA(In[0]), .inB(1'b0), .S(Cnt), .Out(Out[0])); 
    multiplexer_2to1 secondShift4(.inA(In[1]), .inB(1'b0), .S(Cnt), .Out(Out[1]));
    multiplexer_2to1 thirdShift4(.inA(In[2]), .inB(1'b0), .S(Cnt), .Out(Out[2]));
    multiplexer_2to1 fourthShift4(.inA(In[3]), .inB(1'b0), .S(Cnt), .Out(Out[3]));
    multiplexer_2to1 fifthShift4(.inA(In[4]), .inB(In[0]), .S(Cnt), .Out(Out[4]));
    multiplexer_2to1 sixthShift4(.inA(In[5]), .inB(In[1]), .S(Cnt), .Out(Out[5]));
    multiplexer_2to1 seventhShift4(.inA(In[6]), .inB(In[2]), .S(Cnt), .Out(Out[6]));
    multiplexer_2to1 eigthShift4(.inA(In[7]), .inB(In[3]), .S(Cnt), .Out(Out[7]));
    multiplexer_2to1 ninthShift4(.inA(In[8]), .inB(In[4]), .S(Cnt), .Out(Out[8]));
    multiplexer_2to1 tenthShift4(.inA(In[9]), .inB(In[5]), .S(Cnt), .Out(Out[9]));
    multiplexer_2to1 eleventhShift4(.inA(In[10]), .inB(In[6]), .S(Cnt), .Out(Out[10]));
    multiplexer_2to1 twelvthShift4(.inA(In[11]), .inB(In[7]), .S(Cnt), .Out(Out[11]));
    multiplexer_2to1 thirteenthShift4(.inA(In[12]), .inB(In[8]), .S(Cnt), .Out(Out[12]));
    multiplexer_2to1 fourteenthShift4(.inA(In[13]), .inB(In[9]), .S(Cnt), .Out(Out[13]));
    multiplexer_2to1 fifteenthShift4(.inA(In[14]), .inB(In[10]), .S(Cnt), .Out(Out[14]));
    multiplexer_2to1 sixteenthShift4(.inA(In[15]), .inB(In[11]), .S(Cnt), .Out(Out[15]));
   
endmodule
