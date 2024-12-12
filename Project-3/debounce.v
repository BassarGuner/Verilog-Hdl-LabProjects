module debounce(in,clk,out,rst);
input in,clk,rst;
output reg out;

parameter CNTSIZE = 23;

reg infirstNext, infirst;
reg state, stateNext;
reg [CNTSIZE:0] cnt, cntNext;

always@(posedge clk) begin
	if (rst) begin
		state   <= 0;
		cnt     <= 0;
		infirst <= 0;
	end else begin
		cnt     <= cntNext;
		state   <= stateNext;
		infirst <= infirstNext;
	end
end

always@(*)begin
	cntNext = cnt;
	stateNext = state;
	infirstNext = infirst;
	case(state)
		0: begin
				if(in)begin
					stateNext = 1;
					infirstNext = in;
					cntNext = cnt + 1;
				end
			end
		1: begin
			if(cnt == 0)
				stateNext = 0;
			else
				cntNext = cnt + 1;
		end
	endcase
end

always@(*)begin
	if(cnt == 1)
		out = infirst;
	else
		out = 0;
end

endmodule
