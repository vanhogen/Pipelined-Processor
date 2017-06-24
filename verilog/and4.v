module and4(InA, InB, InC, InD, Out);

    input InA, InB, InC, InD;
    output Out;
    
    wire w0, w1;
    
    and2 and0(
    .inA    (InA), 
    .inB    (InB),
    .Out    (w0)
    );
    
    and2 and1(
    .inA    (InC),
    .inB    (InD),
    .Out    (w1)
    );
    
    and2 and2(
    .inA    (w0),
    .inB    (w1),
    .Out    (Out)
    );
    
endmodule
