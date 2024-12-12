module knightRider(clk, rst, dataOut);

input clk, rst;
output reg [15:0] dataOut;

reg [25:0] counter, counterNext;
reg [15:0] dataOutNext;
reg  flag, flagNext;

parameter COUNT = 26'h1FFFFFF;

// registers
always @(posedge clk) begin
if(rst) begin
counter <= 0;
dataOut <= 16'b1000_0000_0000_0000;
flag    <= 0;
end else begin
counter <= counterNext;
dataOut <= dataOutNext;
flag    <= flagNext;
end
end

always @(*) begin
    dataOutNext = dataOut;
    counterNext = counter;
    flagNext = flag;
    if(counter == COUNT -1) begin
        if(flag) begin
            dataOutNext=dataOut*2;
        end else begin
            dataOutNext = dataOut/2;
        end
        if(dataOut == 16'b0000_0000_0000_0010) begin
            flagNext = 1;
        end else if ( dataOut == 16'b0100_0000_0000_0000) begin
            flagNext = 0;
        end
        counterNext = 0;
    end else begin
        counterNext = counter +1;
    end
end

endmodule