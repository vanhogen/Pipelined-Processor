module multiplexer_8to1bitwise(w0, w1, w2, w3, w4, w5, w6, w7, S, Out);

    input [15:0] w0, w1, w2, w3, w4, w5, w6, w7;
    input [2:0] S;
    output [15:0] Out;
   
    multiplexer_8to1 mux1bit0(
    .Reg0    (w0 [0]),
    .Reg1    (w1 [0]),
    .Reg2    (w2 [0]),
    .Reg3    (w3 [0]),
    .Reg4    (w4 [0]),
    .Reg5    (w5 [0]),
    .Reg6    (w6 [0]),
    .Reg7    (w7 [0]),
    .S       (S),
    .Out     (Out[0])
    );
   
    multiplexer_8to1 mux1bit1(
    .Reg0    (w0 [1]),
    .Reg1    (w1 [1]),
    .Reg2    (w2 [1]),
    .Reg3    (w3 [1]),
    .Reg4    (w4 [1]),
    .Reg5    (w5 [1]),
    .Reg6    (w6 [1]),
    .Reg7    (w7 [1]),
    .S       (S),
    .Out     (Out[1])
    );
   
    multiplexer_8to1 mux1bit2(
    .Reg0    (w0 [2]),
    .Reg1    (w1 [2]),
    .Reg2    (w2 [2]),
    .Reg3    (w3 [2]),
    .Reg4    (w4 [2]),
    .Reg5    (w5 [2]),
    .Reg6    (w6 [2]),
    .Reg7    (w7 [2]),
    .S       (S),
    .Out     (Out[2])
    );
   
    multiplexer_8to1 mux1bit3(
    .Reg0    (w0 [3]),
    .Reg1    (w1 [3]),
    .Reg2    (w2 [3]),
    .Reg3    (w3 [3]),
    .Reg4    (w4 [3]),
    .Reg5    (w5 [3]),
    .Reg6    (w6 [3]),
    .Reg7    (w7 [3]),
    .S       (S),
    .Out     (Out[3])
    );
   
    multiplexer_8to1 mux1bit4(
    .Reg0    (w0 [4]),
    .Reg1    (w1 [4]),
    .Reg2    (w2 [4]),
    .Reg3    (w3 [4]),
    .Reg4    (w4 [4]),
    .Reg5    (w5 [4]),
    .Reg6    (w6 [4]),
    .Reg7    (w7 [4]),
    .S       (S),
    .Out     (Out[4])
    );
   
    multiplexer_8to1 mux1bit5(
    .Reg0    (w0 [5]),
    .Reg1    (w1 [5]),
    .Reg2    (w2 [5]),
    .Reg3    (w3 [5]),
    .Reg4    (w4 [5]),
    .Reg5    (w5 [5]),
    .Reg6    (w6 [5]),
    .Reg7    (w7 [5]),
    .S       (S),
    .Out     (Out[5])
    );
    
    multiplexer_8to1 mux1bit6(
    .Reg0    (w0 [6]),
    .Reg1    (w1 [6]),
    .Reg2    (w2 [6]),
    .Reg3    (w3 [6]),
    .Reg4    (w4 [6]),
    .Reg5    (w5 [6]),
    .Reg6    (w6 [6]),
    .Reg7    (w7 [6]),
    .S       (S),
    .Out     (Out[6])
    );
   
    multiplexer_8to1 mux1bit7(
    .Reg0    (w0 [7]),
    .Reg1    (w1 [7]),
    .Reg2    (w2 [7]),
    .Reg3    (w3 [7]),
    .Reg4    (w4 [7]),
    .Reg5    (w5 [7]),
    .Reg6    (w6 [7]),
    .Reg7    (w7 [7]),
    .S       (S),
    .Out     (Out[7])
    );
    
    multiplexer_8to1 mux1bit8(
    .Reg0    (w0 [8]),
    .Reg1    (w1 [8]),
    .Reg2    (w2 [8]),
    .Reg3    (w3 [8]),
    .Reg4    (w4 [8]),
    .Reg5    (w5 [8]),
    .Reg6    (w6 [8]),
    .Reg7    (w7 [8]),
    .S       (S),
    .Out     (Out[8])
    );
    
    multiplexer_8to1 mux1bit9(
    .Reg0    (w0 [9]),
    .Reg1    (w1 [9]),
    .Reg2    (w2 [9]),
    .Reg3    (w3 [9]),
    .Reg4    (w4 [9]),
    .Reg5    (w5 [9]),
    .Reg6    (w6 [9]),
    .Reg7    (w7 [9]),
    .S       (S),
    .Out     (Out[9])
    );
    
    multiplexer_8to1 mux1bit10(
    .Reg0    (w0 [10]),
    .Reg1    (w1 [10]),
    .Reg2    (w2 [10]),
    .Reg3    (w3 [10]),
    .Reg4    (w4 [10]),
    .Reg5    (w5 [10]),
    .Reg6    (w6 [10]),
    .Reg7    (w7 [10]),
    .S       (S),
    .Out     (Out[10])
    );
    
    multiplexer_8to1 mux1bit11(
    .Reg0    (w0 [11]),
    .Reg1    (w1 [11]),
    .Reg2    (w2 [11]),
    .Reg3    (w3 [11]),
    .Reg4    (w4 [11]),
    .Reg5    (w5 [11]),
    .Reg6    (w6 [11]),
    .Reg7    (w7 [11]),
    .S       (S),
    .Out     (Out[11])
    );
    
    multiplexer_8to1 mux1bit12(
    .Reg0    (w0 [12]),
    .Reg1    (w1 [12]),
    .Reg2    (w2 [12]),
    .Reg3    (w3 [12]),
    .Reg4    (w4 [12]),
    .Reg5    (w5 [12]),
    .Reg6    (w6 [12]),
    .Reg7    (w7 [12]),
    .S       (S),
    .Out     (Out[12])
    );
    
    multiplexer_8to1 mux1bit13(
    .Reg0    (w0 [13]),
    .Reg1    (w1 [13]),
    .Reg2    (w2 [13]),
    .Reg3    (w3 [13]),
    .Reg4    (w4 [13]),
    .Reg5    (w5 [13]),
    .Reg6    (w6 [13]),
    .Reg7    (w7 [13]),
    .S       (S),
    .Out     (Out[13])
    );
    
    multiplexer_8to1 mux1bit14(
    .Reg0    (w0 [14]),
    .Reg1    (w1 [14]),
    .Reg2    (w2 [14]),
    .Reg3    (w3 [14]),
    .Reg4    (w4 [14]),
    .Reg5    (w5 [14]),
    .Reg6    (w6 [14]),
    .Reg7    (w7 [14]),
    .S       (S),
    .Out     (Out[14])
    );
    
    multiplexer_8to1 mux1bit15(
    .Reg0    (w0 [15]),
    .Reg1    (w1 [15]),
    .Reg2    (w2 [15]),
    .Reg3    (w3 [15]),
    .Reg4    (w4 [15]),
    .Reg5    (w5 [15]),
    .Reg6    (w6 [15]),
    .Reg7    (w7 [15]),
    .S       (S),
    .Out     (Out[15])
    );
   
endmodule
