module seq_hw (clk, reset, I1, I2, I3, O);
 input clk, reset;
 input [7:0] I1, I2, I3;
 output reg [15:0] O;

 reg [15:0] adder1_input1, adder1_input2, adder1_output;
 reg [15:0] adder2_input1, adder2_input2, adder2_output;
 reg [15:0] adder3_input1, adder3_input2, adder3_output;
 reg [15:0] adder4_output, adder5_output;

 reg [15:0] register;
 reg [1:0] counter;

 always @ (posedge clk or posedge reset)
 begin
 if (reset)
 register <= 0;
 else if (counter == 3)
 register <= 0;
 else
 register <= adder5_output;
 end

 always @ (posedge clk or posedge reset)
 begin
 if (reset)
 counter <= 0;
 else
 counter <= counter + 1;
 end

 always @ *
 begin
 case (counter)
 0:
 begin
 adder1_input1 = 0;
 adder1_input2 = 0;
 adder2_input1 = 0;
 adder2_input2 = 0;
 adder3_input1 = 0;
 adder3_input2 = 0;
 end

 1:
 begin
 adder1_input1 = I1 << 2;
 adder1_input2 = I2 << 2;
 adder2_input1 = I2 << 1;
 adder2_input2 = I3 << 2;
 adder3_input1 = I3 << 1;
 adder3_input2 = I3;
 end
 2:
 begin
 adder1_input1 = I1 << 3;
 adder1_input2 = I1;
 adder2_input1 = I2 << 2;
 adder2_input2 = I3 << 1;
 adder3_input1 = register;
 adder3_input2 = 0;
 end
 3:
 begin
 adder1_input1 = I1 << 3;
 adder1_input2 = I1 << 1;
 adder2_input1 = I2 << 3;
 adder2_input2 = I3 << 2;
 adder3_input1 = register;
 adder3_input2 = 0;
 end
 endcase
 end

 always @ *
 begin
 adder1_output = adder1_input1 + adder1_input2;
 adder2_output = adder2_input1 + adder2_input2;
 adder3_output = adder3_input1 + adder3_input2;

 adder4_output = adder1_output + adder2_output;
 adder5_output = adder3_output + adder4_output;

 if (counter == 3)
 O = adder5_output;
 else
 O = 0;
 end
endmodule