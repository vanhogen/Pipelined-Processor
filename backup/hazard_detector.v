module hazard_detector(instruction, rd, rdIDEX, rdEXMEM, rdMEMWB, clk, rst, Stall);
    
    input [15:0] instruction;
    input [2:0] rd, rdIDEX, rdEXMEM, rdMEMWB;
    input clk, rst;

    output Stall;

    reg StallReg;

    wire rs;
    wire rsrt;
    wire [2:0] rdStall;

    //dff on rdMEMWB to stall for an additional cycle
    dff_3bit StallCycle(
        .inA    (rdMEMWB), 
        .clk    (clk), 
        .rst    (rst),
        .Out    (rdStall)
    );


    //run check on Jformat...RFormat...etc, use case statement to choose which
    //output gets placed into stall.
    hazard_addr_check_1source singleSource(
        .rs         (instruction[10:8]),
        .rd         (rd),
        .rdIDEX     (rdIDEX),
        .rdEXMEM    (rdEXMEM),
        .rdMEMWB    (rdMEMWB),
        .rdStall    (rdStall),
        .Out        (rs)
    );

    hazard_addr_check_2source twoSources(
        .rs         (instruction[10:8]),
        .rt         (instruction[7:5]),
        .rd         (rd),
        .rdIDEX     (rdIDEX),
        .rdEXMEM    (rdEXMEM),
        .rdMEMWB    (rdMEMWB),
        .rdStall    (rdStall),
        .Out        (rsrt)
    );


    always @ (*) begin
        case (instruction [15:11])
            5'b00001:begin //noop
                StallReg = 1'b0;
            end
            5'b00000:begin //halt
                StallReg = 1'b0;
            end
            5'b01000:begin //addi
                StallReg = rs;
            end
            5'b01001:begin //subi
                StallReg = rs;
            end
            5'b01010:begin //xori
                StallReg = rs;
            end
            5'b01011:begin //andni
                StallReg = rs;
            end
            5'b10100:begin //roli
                StallReg = rs;
            end
            5'b10101:begin //slli
                StallReg = rs;
            end
            5'b10110:begin //rori
                StallReg = rs;
            end
            5'b10111:begin //srli
                StallReg = rs;
            end
            5'b10000:begin //st
                StallReg = rsrt;
            end
            5'b10001:begin //ld
                StallReg = rs;
            end
            5'b10011:begin //stu
                StallReg = rsrt;
            end
            5'b11001:begin //btr
                StallReg = rs;
            end
            5'b11011:begin //add, sub, xor, andn
                StallReg = rsrt;
            end
            5'b11010:begin //rol, sll, ror, srl
                StallReg = rsrt;
            end
            5'b11100:begin //seq
                StallReg = rsrt;
            end
            5'b11101:begin //slt
                StallReg = rsrt;
            end                        
            5'b11110:begin //sle
                StallReg = rsrt;
            end       
            5'b11111:begin //sco
                StallReg = rsrt;
            end
            5'b01100:begin //beqz
                StallReg = 1'b0;
            end            
            5'b01101:begin //bnez
                StallReg = 1'b0;
            end                  
            5'b01110:begin //bltz
                StallReg = 1'b0;
            end
            5'b01111:begin //bgez
                StallReg = 1'b0;
            end
            5'b11000:begin //lbi
                StallReg = 1'b0;
            end
            5'b10010:begin //slbi
                StallReg = rs;
            end
            5'b00100:begin //j
                StallReg = 1'b0;
            end                        
            5'b00101:begin //jr
                StallReg = 1'b0;
            end
            5'b00110:begin //jal
                StallReg = 1'b0;
            end            
            5'b00111:begin //jalr
                StallReg = 1'b0;
            end
        endcase
    end

    assign Stall = StallReg;

endmodule
