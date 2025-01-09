`timescale 1ns / 1ps

module calc_top(clk,rst,validIn, dataOut, dataIn);
    input clk, rst, validIn;
    input [15:0] dataIn;
    output [15:0] dataOut;
    wire out;
    debounce d1 (.clk(clk), .rst(rst), .in(validIn), .out(out));
    calc c1 (.clk(clk), .rst(rst), .validIn(out), .dataIn(dataIn), .dataOut(dataOut));       
endmodule
