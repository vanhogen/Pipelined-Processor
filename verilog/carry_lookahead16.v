module carry_lookahead16(inA, inB, Cin, Cout, Sum);
    input [15:0] inA;
    input [15:0] inB;
    input Cin;
    output Cout;
    output [15:0] Sum;
    
    wire carry0, carry1, carry2;
    
    carry_lookahead4 addFirst(.inA(inA[3:0]), .inB(inB[3:0]), .Cin(Cin), .Cout(carry0), .Sum(Sum[3:0]));
    carry_lookahead4 addSecond(.inA(inA[7:4]), .inB(inB[7:4]), .Cin(carry0), .Cout(carry1), .Sum(Sum[7:4]));
    carry_lookahead4 addThird(.inA(inA[11:8]), .inB(inB[11:8]), .Cin(carry1), .Cout(carry2), .Sum(Sum[11:8]));
    carry_lookahead4 addFourth(.inA(inA[15:12]), .inB(inB[15:12]), .Cin(carry2), .Cout(Cout), .Sum(Sum[15:12]));
    
endmodule
