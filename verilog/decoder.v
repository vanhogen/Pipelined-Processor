module decoder (Addr, We, Out);
    input [2:0] Addr;
    input We;
    output [7:0] Out;
     
    wire notA0, notA1, notA2;
    
    not1 not0(
    .in1   (Addr[0]),
    .out    (notA0)
    );
    
    not1 not1(
    .in1   (Addr[1]), 
    .out    (notA1)
    );
    
    not1 not2(
    .in1   (Addr[2]), 
    .out    (notA2)
    );
    
    and4 Out0(
    .InA    (notA2),
    .InB    (notA1),
    .InC    (notA0),
    .InD    (We),
    .Out    (Out[0])
    );
    
    and4 Out1(
    .InA    (notA2),
    .InB    (notA1),
    .InC    (Addr[0]),
    .InD    (We),
    .Out    (Out[1])
    );
    
    and4 Out2(
    .InA    (notA2),
    .InB    (Addr[1]),
    .InC    (notA0),
    .InD    (We),
    .Out    (Out[2])
    );
    
    and4 Out3(
    .InA    (notA2),
    .InB    (Addr[1]),
    .InC    (Addr[0]),
    .InD    (We),
    .Out    (Out[3])
    );
    
    and4 Out4(
    .InA    (Addr[2]),
    .InB    (notA1),
    .InC    (notA0),
    .InD    (We),
    .Out    (Out[4])
    );
    
    and4 Out5(
    .InA    (Addr[2]),
    .InB    (notA1),
    .InC    (Addr[0]),
    .InD    (We),
    .Out    (Out[5])
    );
    
    and4 Out6(
    .InA    (Addr[2]),
    .InB    (Addr[1]),
    .InC    (notA0),
    .InD    (We),
    .Out    (Out[6])
    );
    
    and4 Out7(
    .InA    (Addr[2]),
    .InB    (Addr[1]),
    .InC    (Addr[0]),
    .InD    (We),
    .Out    (Out[7])
    );
    
endmodule
