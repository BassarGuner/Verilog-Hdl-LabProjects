module progLEDDriver(
	clk,
	rst,
	switch,
	enter,
	start,
	outPattern
);
input clk, rst;
input [15:0] switch;
input enter, start;
output [15:0] outPattern;

wire enterDB, wrEn;
wire [3:0] addrWr,  addrRd;
wire [15:0] dataWr, dataRd;


debounce debounce_1 (.in(enter), .clk(clk), .out(enterDB), .rst(rst));

progLogic progLogic_1(.clk(clk), .rst(rst), .switch(switch), .enter(enterDB), .addrWr(addrWr), .dataWr(dataWr), .wrEn(wrEn));

mem1R1W mem1R1W_1(.clk(clk), .addrRd(addrRd), .dataRd(dataRd), .addrWr(addrWr), .dataWr(dataWr), .wrEn(wrEn));

LEDDriver LEDDriver_1(.clk(clk), .rst(rst), .start(start), .addrRd(addrRd), .dataRd(dataRd), .outPattern(outPattern));

endmodule
