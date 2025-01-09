`timescale 1ns / 1ps

module progLogic (
    input clk,
    input rst,
    input [15:0] switch, 
    input enter,         

    output reg [15:0] dataWr, 
    output reg [3:0] addrWr,  
    output reg wrEn           
);

    reg [3:0] addrwritecounter; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addrwritecounter <= 0;  
            dataWr <= 0;    
            addrWr <= 0;     
            wrEn <= 0;       
        end else if (enter) begin
            dataWr <= switch;   
            addrWr <= addrwritecounter; 
            wrEn <= 1;      
            addrwritecounter <= addrwritecounter + 1;      
        end
    end

endmodule
