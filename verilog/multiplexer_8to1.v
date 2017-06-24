module multiplexer_8to1 (Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, S, Out);
	input Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7;
	input [2:0] S;
	output Out;
	wire x, y;


	multiplexer_4to1 mux1(
	.InA    (Reg0), 
	.InB    (Reg1),
	.InC    (Reg2),
	.InD    (Reg3),
	.S      (S[1:0]),
	.Out    (x)
	);
	
    multiplexer_4to1 mux2(
	.InA    (Reg4), 
	.InB    (Reg5),
	.InC    (Reg6),
	.InD    (Reg7),
	.S      (S[1:0]),
	.Out    (y)
	);	

	multiplexer_2to1 out(
	.inA(x), 
	.inB(y), 
	.S(S[2]), 
	.Out(Out)
	);
	
endmodule
