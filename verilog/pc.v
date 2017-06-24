module pc(inA, clk, rst, Out);
    input [15:0] inA;
    input clk, rst;
    output [15:0] Out;
    
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
    dff bit3(
        .q      (Out[3]), 
        .d      (inA[3]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit4(
        .q      (Out[4]), 
        .d      (inA[4]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit5(
        .q      (Out[5]), 
        .d      (inA[5]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit6(
        .q      (Out[6]), 
        .d      (inA[6]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit7(
        .q      (Out[7]), 
        .d      (inA[7]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit8(
        .q      (Out[8]), 
        .d      (inA[8]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit9(
        .q      (Out[9]), 
        .d      (inA[9]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit10(
        .q      (Out[10]), 
        .d      (inA[10]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit11(
        .q      (Out[11]), 
        .d      (inA[11]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit12(
        .q      (Out[12]), 
        .d      (inA[12]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit13(
        .q      (Out[13]), 
        .d      (inA[13]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit14(
        .q      (Out[14]), 
        .d      (inA[14]), 
        .clk    (clk), 
        .rst    (rst)
    );
    dff bit15(
        .q      (Out[15]), 
        .d      (inA[15]), 
        .clk    (clk), 
        .rst    (rst)
    );

endmodule
