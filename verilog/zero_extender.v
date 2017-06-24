module zero_extender(inA, ImmdLocation, Out);
    input [15:0] inA;
    input [1:0] ImmdLocation;
    output [15:0] Out;

    wire [15:0] fiveBit;
    wire [15:0] eightBit;
    wire [15:0] elevenBit;
    wire [15:0] oneBit;
    
    
    //Zero Extend
    assign oneBit[0] = inA[0];
    assign oneBit[15:1] = 15'b000000000000000;    

    assign fiveBit[4:0] = inA[4:0];
    assign fiveBit[15:5] = 11'b00000000000;

    assign eightBit[7:0] = inA[7:0];
    assign eightBit[15:8] = 8'b00000000;

    assign elevenBit[10:0] = inA[10:0];
    assign elevenBit[15:11] = 5'b00000;

    //pick which extension we are using
    multiplexer16bit_4to1 immediateSelection(
        .inA        (fiveBit), 
        .inB        (eightBit), 
        .inC        (elevenBit), 
        .inD        (oneBit), 
        .S          (ImmdLocation), 
        .Out        (Out)
    ); 

endmodule
