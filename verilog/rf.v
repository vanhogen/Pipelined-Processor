/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;

   // your code
    wire [15:0] w0, w1, w2, w3, w4, w5, w6, w7;
    wire [7:0] decodeWire;
    wire [7:0] loadWire;
   
   //send in and of write bit and decodewire bits it will only write to the decoded chosen wire

   
    decoder d0(
    .Addr   (writeregsel),
    .We     (write),
    .Out    (decodeWire)
    );
    
    and2 we0(
    .inA    (write),
    .inB    (decodeWire[0]),
    .Out    (loadWire[0])
    );
  
    and2 we1(
    .inA    (write),
    .inB    (decodeWire[1]),
    .Out    (loadWire[1])
    );
    
    and2 we2(
    .inA    (write),
    .inB    (decodeWire[2]),
    .Out    (loadWire[2])
    );
    
    and2 we3(
    .inA    (write),
    .inB    (decodeWire[3]),
    .Out    (loadWire[3])
    );
    
    and2 we4(
    .inA    (write),
    .inB    (decodeWire[4]),
    .Out    (loadWire[4])
    );
    
    and2 we5(
    .inA    (write),
    .inB    (decodeWire[5]),
    .Out    (loadWire[5])
    );
    
    and2 we6(
    .inA    (write),
    .inB    (decodeWire[6]),
    .Out    (loadWire[6])
    );
    
    and2 we7(
    .inA    (write),
    .inB    (decodeWire[7]),
    .Out    (loadWire[7])
    );
    
    
    register_16 reg0(
    .writeData      (writedata), 
    .We             (loadWire[0]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w0)
    );
    
    register_16 reg1(
    .writeData      (writedata), 
    .We             (loadWire[1]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w1)
    );

    register_16 reg2(
    .writeData      (writedata), 
    .We             (loadWire[2]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w2)
    );

    register_16 reg3(
    .writeData      (writedata), 
    .We             (loadWire[3]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w3)
    );

    register_16 reg4(
    .writeData      (writedata), 
    .We             (loadWire[4]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w4)
    );

    register_16 reg5(
    .writeData      (writedata), 
    .We             (loadWire[5]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w5)
    );
    
    register_16 reg6(
    .writeData      (writedata), 
    .We             (loadWire[6]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w6)
    );
   
    register_16 reg7(
    .writeData      (writedata), 
    .We             (loadWire[7]), 
    .clk            (clk), 
    .rst            (rst), 
    .readData       (w7)
    );

    multiplexer_8to1bitwise mux1(
    .w0      (w0),
    .w1      (w1),
    .w2      (w2),
    .w3      (w3),
    .w4      (w4),
    .w5      (w5),
    .w6      (w6),
    .w7      (w7),
    .S       (read1regsel),
    .Out     (read1data)
    );
   
    multiplexer_8to1bitwise mux2(
    .w0      (w0),
    .w1      (w1),
    .w2      (w2),
    .w3      (w3),
    .w4      (w4),
    .w5      (w5),
    .w6      (w6),
    .w7      (w7),
    .S       (read2regsel),
    .Out     (read2data)
    );
    
endmodule
// DUMMY LINE FOR REV CONTROL :1:
