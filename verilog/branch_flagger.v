module branch_flagger(inA, N, Z);

    input [15:0] inA;
    output N;
    output Z;

    assign N = inA[15];

    reg ZAss;

    always @ (*) begin
        case(inA)
            15'h0000:begin
               ZAss = 1;
            end
            default:begin
                ZAss = 0;
            end
        endcase
    end 
    
    assign Z = ZAss;

endmodule
