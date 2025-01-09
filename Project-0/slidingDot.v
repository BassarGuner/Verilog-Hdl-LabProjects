module slidingDot(clk, rst, dataOut);

input clk, rst;
output reg [15:0] dataOut;

reg [25:0] counter, counterNext;
reg [15:0] dataOutNext;

parameter COUNT = 26'h3FFFFFF;


always @(posedge clk) 
begin
        if(rst) begin
		counter <= 0;
		dataOut <= 16'b10000000_00000000;
	end
	else begin
		counter <= counterNext;
		dataOut <= dataOutNext;
	end
end

always @(*) 
begin
	if(counter == COUNT -1) begin
		dataOutNext = dataOut / 2;
		counterNext = 0;
	end
	else begin
		dataOutNext = dataOut;
		counterNext = counter + 1;
	end
end

endmodule
