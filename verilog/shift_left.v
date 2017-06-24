//Shift left by amount Cnt
module shift_left(In, Cnt, Out);
    input [15:0] In;
    input [3:0] Cnt;
    output [15:0] Out;
    
    wire [15:0]wireOut1;        
    wire [15:0]wireOut2;
    wire [15:0]wireOut3;
    wire [15:0]wireOut4;

    //Shift Left 1
    shift_left1 shift1(.In(In), .Cnt(Cnt[0]), .Out(wireOut1));
    //Shift Left 2
    shift_left2 shift2(.In(wireOut1), .Cnt(Cnt[1]), .Out(wireOut2));
    //Shift Left 4
    shift_left4 shift4(.In(wireOut2), .Cnt(Cnt[2]), .Out(wireOut3));
    //Shift Left 8
    shift_left8 shift8(.In(wireOut3), .Cnt(Cnt[3]), .Out(wireOut4));    
    
    assign Out[15:0] = wireOut4[15:0];
endmodule
