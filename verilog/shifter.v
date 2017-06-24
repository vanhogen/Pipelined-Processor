module shifter (In, Cnt, Op, Out);
   
    input [15:0] In;
    input [3:0] Cnt;
    input [1:0] Op;
    output [15:0] Out;  
    
    reg [15:0] OutC;
    wire [15:0] rotateLeftReg;
    wire [15:0] shiftLeftReg;
    wire [15:0] shiftRightArithmeticReg;
    wire [15:0] shiftRightLogicalReg;
    
    rotate_left rotateLeft(.In(In[15:0]), .Cnt(Cnt[3:0]), .Out(rotateLeftReg));
    shift_left shiftLeft(.In(In[15:0]), .Cnt(Cnt[3:0]), .Out(shiftLeftReg));
    shift_right_arithmetic shiftRightArithmetic(.In(In[15:0]), .Cnt(Cnt[3:0]), .Out(shiftRightArithmeticReg[15:0]));
    shift_right_logical shiftRightLogical(.In(In[15:0]), .Cnt(Cnt[3:0]), .Out(shiftRightLogicalReg[15:0]));
    
    
    
    always @ (*) begin
        case(Op)
            2'b00: begin
                OutC = rotateLeftReg;
            end
            2'b01: begin
                OutC = shiftLeftReg;
            end
            2'b10: begin
                OutC = shiftRightArithmeticReg;
            end
            2'b11: begin
                OutC = shiftRightLogicalReg;
            end
			default: begin
	    		OutC = In;
			end
        endcase
    end

    
    assign Out[15:0] = OutC[15:0];

   
endmodule

