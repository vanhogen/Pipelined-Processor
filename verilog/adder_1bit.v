module adder_1bit(A, B, Cin, S, Cout);
	input A, B, Cin;
	output S, Cout;
    
    wire xorAB;
    wire nandCinAB;
    wire nandAB;

    xor2 xorABFunc(.in1(A), .in2(B), .out(xorAB));
    xor2 xorCinXorABFunc(.in1(xorAB), .in2(Cin), .out(S));
    nand2 nandCinABFunc(.in1(Cin), .in2(xorAB), .out(nandCinAB));
    nand2 nandABFunc(.in1(A), .in2(B), .out(nandAB));
    nand2 out(.in1(nandCinAB), .in2(nandAB), .out(Cout));
    

endmodule
