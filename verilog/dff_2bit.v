module dff_2bit(inA, clk, rst, Out);
    input [1:0] inA;
    input clk, rst;
    output [1:0] Out;
    
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

endmodule
