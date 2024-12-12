`timescale 1ns / 1ps

module lab3mainmodule(
input rst,
input clk,
input btn,
output [2:0] ledOut);
wire btnD;
    debounce d1 (.in(btn),.clk(clk),.rst(rst),.out(btnD));
    lab3source d2(.rst(rst),.clk(clk),.btnD(btnD),.ledOut(ledOut));
 





endmodule
