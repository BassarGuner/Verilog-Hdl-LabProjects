`timescale 1ns / 1ps

module matrixtest;

    reg[7:0] I1, I2, I3;
    wire[15:0] O, O1, O2, O3;
    
    matrix m1(.I1(I1), .I2(I2), .I3(I3), .O(O)); 
    
    initial begin
        I1 = 1;
        I2 = 2;
        I3 = 3;
        #5;
        $display("O1 = %b, O2 = %b, O3 = %b, O = %b,", O1, O2, O3, O);
    end
endmodule
