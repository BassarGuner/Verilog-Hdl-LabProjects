module lab3source(
    input clk,        
    input rst,        
    input btnD,       
    output reg [2:0] ledOut  
);

    
    parameter S1 = 2'b00;
    parameter S2 = 2'b01;
    parameter S3 = 2'b10;
    parameter S4 = 2'b11;

    reg [1:0] state, next_state;

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S1;  
        end else begin
            state <= next_state;  
        end
    end

    
    always @(*) begin
        case (state)
            S1: next_state = (btnD) ? S2 : S1;
            S2: next_state = (btnD) ? S3 : S2;
            S3: next_state = (btnD) ? S4 : S3;
            S4: next_state = (btnD) ? S1 : S4;
            default: next_state = S1;  
        endcase
    end

    
    always @(*) begin
        case (state)
            S1: ledOut = 3'b001;
            S2: ledOut = 3'b011;
            S3: ledOut = 3'b010;
            S4: ledOut = 3'b100;
            default: ledOut = 3'b000;
        endcase
    end

endmodule
