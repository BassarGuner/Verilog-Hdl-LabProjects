module LEDDriver (
    input clk,
    input rst,
    input start,
    input [15:0] dataRd,         
    output reg [3:0] addrRd,     
    output reg [15:0] outPattern 
);

    reg [3:0] addrreadcounter;          
    reg flag;                 
    reg [31:0] clkDivider;      
    reg slowClk;                 
    parameter MAX_COUNT = 12_000_000; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clkDivider <= 32'b0;
            slowClk <= 1'b0;
        end else if (clkDivider == MAX_COUNT - 1) begin
            clkDivider <= 32'b0;
            slowClk <= ~slowClk; 
        end else begin
            clkDivider <= clkDivider + 1;
        end
    end

    always @(posedge slowClk or posedge rst) begin
        if (rst) begin
            addrreadcounter <= 0;
            addrRd <= 0;
            outPattern <= 0; 
            flag <= 0;
        end else if (start) begin
            flag <= 1;      
        end else if (flag) begin
            outPattern <= dataRd; 
            addrRd <= addrreadcounter;
            addrreadcounter <= addrreadcounter + 1;           
        end
    end
endmodule
