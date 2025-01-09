`timescale 1ns/1ps
module seq_hw_tb;
 reg clk, reset;
 reg [7:0] I1, I2, I3;
 wire [15:0] O;

 seq_hw seq_hw_1 (clk, reset, I1, I2, I3, O);

 always #5 clk = ~clk;

 initial
 begin
 reset = 1; clk = 0;
 I1 = 0; I2 = 0; I3 = 0;
 #2;
 reset = 0;
 I1 = 255; I2 = 255; I3 = 255; // O = 13770
 #40;
 I1 = 10; I2 = 20; I3 = 30; // O = 980
 #40;
 I1 = 72; I2 = 134; I3 = 201; // O = 6681
 #40 $stop;
 end
endmodule