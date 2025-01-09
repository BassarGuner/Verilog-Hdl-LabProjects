`timescale 1ns / 1ps

module matrix(I1, I2, I3, O);

input [7:0] I1, I2, I3;
output reg [15:0] O;
reg [15:0] O1, O2, O3;

always@*
    begin
    O1 = (I1 << 3) + (I1 << 1) + (I2 << 3) + (I3 << 2);
    O2 = (I1 << 3) + I1 + (I2 << 2) + (I3 << 1);
    O3 = (I1 << 2) + (I2 <<2 ) + (I2 << 1) + (I3 << 2) + (I3 << 1) + I3;
    O = O1 + O2 + O3; 
    end 
endmodule
