module extender(inA, ImmdLocation, Signed, Out);
    input [15:0] inA;
    input Signed;
    input [1:0] ImmdLocation;
    output [15:0] Out;

    wire [15:0] zeroExtend;
    wire [15:0] signExtend;
    wire [15:0] elevenBit;
    wire [15:0] wasteWire;
    
    zero_extender zero(
        .inA            (inA), 
        .ImmdLocation   (ImmdLocation), 
        .Out            (zeroExtend)
    );
    sign_extender sign(
        .inA            (inA), 
        .ImmdLocation   (ImmdLocation), 
        .Out            (signExtend)
    );

    multiplexer16bit_2to1 extensionSelect(
        .inA        (zeroExtend), 
        .inB        (signExtend), 
        .S          (Signed), 
        .Out        (Out)
    );


endmodule
