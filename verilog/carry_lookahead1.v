module carry_lookahead1(inA, inB, Cin, Cout, Sum);
    input inA, inB, Cin;
    output Cout, Sum;
    
    wire p, g, pandc, waste;
    and2 andg(.inA(inA), .inB(inB), .Out(g));
    or2 orp(.inA(inA), .inB(inB), .Out(p));
    and2 andpc(.inA(p), .inB(Cin), .Out(pandc));
    or2 gorpc(.inA(g), .inB(pandc), .Out(Cout));
    
    adder_1bit add(.A(inA), .B(inB), .Cin(Cin), .S(Sum), .Cout(waste));
    
endmodule
