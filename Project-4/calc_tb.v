`timescale 1ns / 1ps
module calc_tb;
    // Inputs
    reg clk;
    reg rst;
    reg validIn;
    reg [15:0] dataIn;

    // Outputs
    wire [15:0] dataOut;

    // Instantiate the Unit Under Test (UUT)
    calc uut(.clk(clk), .rst(rst), .validIn(validIn), .dataIn(dataIn), .dataOut(dataOut));

    initial begin
       clk = 0;
       forever #5 clk = ~clk;
    end

    initial begin
       rst = 0;
       validIn = 0;
       dataIn = 0;
       rst = 1;
       #10;
       rst = 0;

       // Test Square Op.
       // Enter operand
       dataIn = 5;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operator
       dataIn = 2;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Check output
       if (dataOut === 25)
         $display("Square Op.: OK! ");
       else
         $display("Square Op.: Wrong! ");

       // Test Multiply Op.
       // Enter operand
       dataIn = 4;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operator
       dataIn = 0;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operand
       dataIn = 6;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Check output
       if (dataOut === 24)
         $display("Multiply Op.: OK! ");
       else
         $display("Multiply Op.: Wrong! ");
         
       // Test Addition Op.
       // Enter operand
       dataIn = 4;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operator
       dataIn = 1;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operand
       dataIn = 3;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Check output
       if (dataOut === 7)
         $display("Addition Op.: OK! ");
       else
         $display("Addition Op.: Wrong! ");
         
       // Test Incrementation Op.
       // Enter operand
       dataIn = 5;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Enter operator
       dataIn = 3;
       validIn = 1;
       #10;
       validIn = 0;
       #10;
       // Check output
       if (dataOut === 6)
         $display("Incrementation Op.: OK! ");
       else
         $display("Incrementation Op.: Wrong! ");
       $finish;
    end

endmodule
