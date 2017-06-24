//Shifts left by 8 designated by Cnt
module shift_left8(In, Cnt, Out);
    input [15:0] In;
    input Cnt;
    output [15:0] Out;

    multiplexer_2to1 firstShift8(.inA(In[0]), .inB(1'b0), .S(Cnt), .Out(Out[0])); 
    multiplexer_2to1 secondShift8(.inA(In[1]), .inB(1'b0), .S(Cnt), .Out(Out[1]));
    multiplexer_2to1 thirdShift8(.inA(In[2]), .inB(1'b0), .S(Cnt), .Out(Out[2]));
    multiplexer_2to1 fourthShift8(.inA(In[3]), .inB(1'b0), .S(Cnt), .Out(Out[3]));
    multiplexer_2to1 fifthShift8(.inA(In[4]), .inB(1'b0), .S(Cnt), .Out(Out[4]));
    multiplexer_2to1 sixthShift8(.inA(In[5]), .inB(1'b0), .S(Cnt), .Out(Out[5]));
    multiplexer_2to1 seventhShift8(.inA(In[6]), .inB(1'b0), .S(Cnt), .Out(Out[6]));
    multiplexer_2to1 eigthShift8(.inA(In[7]), .inB(1'b0), .S(Cnt), .Out(Out[7]));
    multiplexer_2to1 ninthShift8(.inA(In[8]), .inB(In[0]), .S(Cnt), .Out(Out[8]));
    multiplexer_2to1 tenthShift8(.inA(In[9]), .inB(In[1]), .S(Cnt), .Out(Out[9]));
    multiplexer_2to1 eleventhShift8(.inA(In[10]), .inB(In[2]), .S(Cnt), .Out(Out[10]));
    multiplexer_2to1 twelvthShift8(.inA(In[11]), .inB(In[3]), .S(Cnt), .Out(Out[11]));
    multiplexer_2to1 thirteenthShift8(.inA(In[12]), .inB(In[4]), .S(Cnt), .Out(Out[12]));
    multiplexer_2to1 fourteenthShift8(.inA(In[13]), .inB(In[5]), .S(Cnt), .Out(Out[13]));
    multiplexer_2to1 fifteenthShift8(.inA(In[14]), .inB(In[6]), .S(Cnt), .Out(Out[14]));
    multiplexer_2to1 sixteenthShift8(.inA(In[15]), .inB(In[7]), .S(Cnt), .Out(Out[15])); 
   
endmodule
