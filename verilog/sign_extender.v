module sign_extender(inA, ImmdLocation, Out);
    input [15:0] inA;
    input [1:0] ImmdLocation;
    output [15:0] Out;

    wire [15:0] fiveBit;
    wire [15:0] eightBit;
    wire [15:0] elevenBit;
    wire [15:0] firstBit;
    
    
    //Sign Extend
    assign firstBit[0] = inA[0];
    assign firstBit[1] = inA[0];
    assign firstBit[2] = inA[0];
    assign firstBit[3] = inA[0];
    assign firstBit[4] = inA[0];
    assign firstBit[5] = inA[0];
    assign firstBit[6] = inA[0];
    assign firstBit[7] = inA[0];
    assign firstBit[8] = inA[0];
    assign firstBit[9] = inA[0];
    assign firstBit[10] = inA[0];
    assign firstBit[11] = inA[0];
    assign firstBit[12] = inA[0];
    assign firstBit[13] = inA[0];
    assign firstBit[14] = inA[0];
    assign firstBit[15] = inA[0];

    assign fiveBit[4:0] = inA[4:0];
    assign fiveBit[5] = inA[4];
    assign fiveBit[6] = inA[4];
    assign fiveBit[7] = inA[4];    
    assign fiveBit[8] = inA[4];    
    assign fiveBit[9] = inA[4];    
    assign fiveBit[10] = inA[4];
    assign fiveBit[11] = inA[4];
    assign fiveBit[12] = inA[4];
    assign fiveBit[13] = inA[4];
    assign fiveBit[14] = inA[4];
    assign fiveBit[15] = inA[4];

    assign eightBit[7:0] = inA[7:0];
    assign eightBit[8] = inA[7];
    assign eightBit[9] = inA[7];
    assign eightBit[10] = inA[7];
    assign eightBit[11] = inA[7];
    assign eightBit[12] = inA[7];
    assign eightBit[13] = inA[7];
    assign eightBit[14] = inA[7];
    assign eightBit[15] = inA[7];

    assign elevenBit[10:0] = inA[10:0];
    assign elevenBit[11] = inA[10];
    assign elevenBit[12] = inA[10];
    assign elevenBit[13] = inA[10];
    assign elevenBit[14] = inA[10];
    assign elevenBit[15] = inA[10];

    //pick which extension we are using
    multiplexer16bit_4to1 immediateSelection(
        .inA        (fiveBit), 
        .inB        (eightBit), 
        .inC        (elevenBit), 
        .inD        (firstBit), 
        .S          (ImmdLocation), 
        .Out        (Out)
    ); 

endmodule
