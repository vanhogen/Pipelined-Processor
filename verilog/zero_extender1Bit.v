module zero_extender1Bit(inA, Out);
    input inA;
    output [15:0] Out;

    
    //Zero Extend
    assign Out[0] = inA;
    assign Out[1] = 1'b0; 
    assign Out[2] = 1'b0; 
    assign Out[3] = 1'b0; 
    assign Out[4] = 1'b0; 
    assign Out[5] = 1'b0; 
    assign Out[6] = 1'b0; 
    assign Out[7] = 1'b0; 
    assign Out[8] = 1'b0; 
    assign Out[9] = 1'b0; 
    assign Out[10] = 1'b0; 
    assign Out[11] = 1'b0; 
    assign Out[12] = 1'b0; 
    assign Out[13] = 1'b0; 
    assign Out[14] = 1'b0; 
    assign Out[15] = 1'b0; 

endmodule
