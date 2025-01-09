`timescale 1ns / 1ps


module top_module(clk,dataIn,rst,anode,sevenSeg);
    input clk,rst;
    input [15:0]dataIn;
    output reg [3:0]anode;
    output [7:0]sevenSeg;
    reg [15:0]counter;
    reg [3:0]selection;
    
    always@(posedge clk or posedge rst)
        begin
            if(rst) counter <= 16'b0;
            else counter <= counter + 1;
        end
    
    always @*
        begin 
            case(counter[15:14]) 
                2'b00:begin
                        anode = 4'b1110;
                        selection = dataIn[3:0];
                      end
                2'b01: begin 
                        anode = 4'b1101;
                        selection = dataIn[7:4];
                       end
                2'b10: begin 
                        anode = 4'b1011;
                        selection = dataIn[11:8];
                       end
                2'b11: begin 
                        anode = 4'b0111;
                        selection = dataIn[15:12];
                       end
            endcase
        end
        
        SevenSegOneDig s1 (.in(selection), .sevenSeg(sevenSeg));
endmodule
