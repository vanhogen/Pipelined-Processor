module multiplexer_2to1 (inA, inB, S, Out);
	input inA, inB, S;
    output Out;
	wire notS;
	wire nandBS;
	wire nandAnotS;

	not1 notSFunc(.in1(S), .out(notS));
	nand2 nandBSFunc(.in1(S), .in2(inB), .out(nandBS));
	nand2 nandAnotSFunc(.in1(notS), .in2(inA), .out(nandAnotS));
	nand2 out(.in1(nandBS), .in2(nandAnotS), .out(Out)); 

/*
        always @* begin
       $display("\nMuxing Variables:    inA = %b    inB = %b    S = %b    Out = %b    notS = %b    nandBS = %b    nandAnotS = %b\n",inA, inB, S, Out, notS, nandBS, nandAnotS); 
       end
*/

endmodule
