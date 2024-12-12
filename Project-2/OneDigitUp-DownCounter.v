module oneDigitUpDownCounter(
    input wire clk,           // Clock input
    input wire rst,           // Reset input
    input wire upDown,        // Control input for counting direction (1 = up, 0 = down)
    output reg [7:0] sevenSegment, // Seven segment display output
    output reg [3:0] anode    // Anode to select which 7-segment display is active
);

    reg [3:0] count;          // 4-bit counter (to store values between 0-9)
    reg [31:0] clk_div;       // Clock divider for slower display updates
    
    // Seven-segment decoder
    always @(*) begin
        case(count)
            4'd0: sevenSegment = 8'b00000011; // Display 0
            4'd1: sevenSegment = 8'b10011111; // Display 1
            4'd2: sevenSegment = 8'b00100101; // Display 2
            4'd3: sevenSegment = 8'b00001101; // Display 3
            4'd4: sevenSegment = 8'b10011001; // Display 4
            4'd5: sevenSegment = 8'b01001001; // Display 5
            4'd6: sevenSegment = 8'b01000001; // Display 6
            4'd7: sevenSegment = 8'b00011111; // Display 7
            4'd8: sevenSegment = 8'b00000001; // Display 8
            4'd9: sevenSegment = 8'b00001001; // Display 9
            default: sevenSegment = 8'b11111111; // Blank display
        endcase
    end
    
    // Clock divider for slow counting
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_div <= 0;
            count <= 4'd0;
        end else begin
            clk_div <= clk_div + 1;
            if (clk_div == 32'd50000000) begin  // Adjust for slower clock rate (50MHz FPGA)
                clk_div <= 0;
                if (upDown) begin
                    if (count == 4'd9) begin
                        count <= 4'd0; // Wrap around to 0
                    end else begin
                        count <= count + 1; // Increment
                    end
                end else begin
                    if (count == 4'd0) begin
                        count <= 4'd9; // Wrap around to 9
                    end else begin
                        count <= count - 1; // Decrement
                    end
                end
            end
        end
    end
    
    // Activate only one 7-segment display
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            anode <= 4'b0111; // Activate only one display
        end
    end

endmodule
