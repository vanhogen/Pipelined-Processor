module carry_lookahead4(inA, inB, Cin, Cout, Sum);
    input [3:0] inA;
    input [3:0] inB;
    input Cin;
    output Cout;
    output [3:0] Sum;
    
    wire cout0, cout1, cout2;
    carry_lookahead1 addFirst(.inA(inA[0]), .inB(inB[0]), .Cin(Cin), .Cout(cout0), .Sum(Sum[0]));
    carry_lookahead1 addSecond(.inA(inA[1]), .inB(inB[1]), .Cin(cout0), .Cout(cout1), .Sum(Sum[1]));
    carry_lookahead1 addThird(.inA(inA[2]), .inB(inB[2]), .Cin(cout1), .Cout(cout2), .Sum(Sum[2]));
    carry_lookahead1 addFourth(.inA(inA[3]), .inB(inB[3]), .Cin(cout2), .Cout(Cout), .Sum(Sum[3]));
    
endmodule

