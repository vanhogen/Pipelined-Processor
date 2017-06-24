module dff_3bit(inA, clk, rst, Out);
    input [2:0] inA;
    input clk, rst;
    output [2:0] Out;
    
    //output         q;
    //input          d;
    dff bit0(
        .q      (Out[0]), 
        .d      (inA[0]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit1(
        .q      (Out[1]), 
        .d      (inA[1]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit2(
        .q      (Out[2]), 
        .d      (inA[2]), 
        .clk    (clk), 
        .rst    (rst)
    );

endmodule
