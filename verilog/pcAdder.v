module pcAdder(inA, Out, E);
    input [15:0] inA;
    output [15:0] Out;
    output E;

    carry_lookahead16 add2(
        .inA     (inA), 
        .inB     (16'h0002), 
        .Cin     (1'b0), 
        .Cout    (E), 
        .Sum     (Out)
    );
   
endmodule
