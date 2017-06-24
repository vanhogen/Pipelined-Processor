module multiplexer_4to1 (InA, InB, InC, InD, S, Out);
	input InA, InB, InC, InD;
	input [1:0] S;
	output Out;
	wire x;
	wire y;

	multiplexer_2to1 muxAB(.inA(InA), .inB(InB), .S(S[0]), .Out(x));
	multiplexer_2to1 muxCD(.inA(InC), .inB(InD), .S(S[0]), .Out(y));
	multiplexer_2to1 out(.inA(x), .inB(y), .S(S[1]), .Out(Out));

	
/*
	assign A = multiplexer_2to1(InA, InB, S[0]);
	assign B = multiplexer_2to1(InC, InD, S[0]);
	assign Out = multiplexer_2to1(A, B, S[1]);
*/	
endmodule
