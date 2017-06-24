//Rotates left by amount Cnt
module rotate_left(In, Cnt, Out);
    input [15:0] In;
    input [3:0] Cnt;
    output [15:0] Out;

    wire [15:0]wireOut1;        
    wire [15:0]wireOut2;
    wire [15:0]wireOut3;
    wire [15:0]wireOut4;

    //Rotate Left 1
    rotate_left1 rotate1(.In(In), .Cnt(Cnt[0]), .Out(wireOut1));
    //Rotate Left 2
    rotate_left2 rotate2(.In(wireOut1), .Cnt(Cnt[1]), .Out(wireOut2));
    //Rotate Left 4
    rotate_left4 rotate4(.In(wireOut2), .Cnt(Cnt[2]), .Out(wireOut3));
    //Rotate Left 8
    rotate_left8 rotate8(.In(wireOut3), .Cnt(Cnt[3]), .Out(wireOut4));    
    
    assign Out[15:0] = wireOut4[15:0];
endmodule
