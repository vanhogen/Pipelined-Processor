module reverse(inA, Out);
    input [15:0] inA;
    output [15:0] Out;
    wire [15:0] reverse;

    assign reverse[0] = inA[15];
    assign reverse[1] = inA[14];
    assign reverse[2] = inA[13];
    assign reverse[3] = inA[12];
    assign reverse[4] = inA[11];
    assign reverse[5] = inA[10];
    assign reverse[6] = inA[9];
    assign reverse[7] = inA[8];
    assign reverse[8] = inA[7];
    assign reverse[9] = inA[6];
    assign reverse[10] = inA[5];
    assign reverse[11] = inA[4];
    assign reverse[12] = inA[3];
    assign reverse[13] = inA[2];
    assign reverse[14] = inA[1];
    assign reverse[15] = inA[0];

    assign Out = reverse;
/*
    assign Out[0] = inA[15];
    assign Out[1] = inA[14];
    assign Out[2] = inA[13];
    assign Out[3] = inA[12];
    assign Out[4] = inA[11];
    assign Out[5] = inA[10];
    assign Out[6] = inA[9];
    assign Out[7] = inA[8];
    assign Out[8] = inA[7];
    assign Out[9] = inA[6];
    assign Out[10] = inA[5];
    assign Out[11] = inA[4];
    assign Out[12] = inA[3];
    assign Out[13] = inA[2];
    assign Out[14] = inA[1];
    assign Out[15] = inA[0];
*/
endmodule
