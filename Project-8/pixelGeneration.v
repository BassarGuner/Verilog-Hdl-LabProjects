`timescale 1ns / 1ps

module pixelGeneration(
    input clk, 
    input rst, 
    input switch, 
    input [9:0] pixel_x, 
    input [9:0] pixel_y, 
    input video_on, 
    input [3:0] push, 
    output reg [2:0] rgb
);

    // Registers for square position
    reg [9:0] square_x_start = 320;
    reg [9:0] square_y_start = 220;
    reg [9:0] square_x_end = 360;
    reg [9:0] square_y_end = 260;
    
    // Speed control
    reg [23:0] speed_counter;
    wire speed_tick;

    // Slow or fast speed based on switch
    wire [23:0] speed_limit = switch ? 24'd4000000 : 24'd8000000;

    // Generate speed tick
    always @(posedge clk or posedge rst) begin
        if (rst)
            speed_counter <= 0;
        else if (speed_counter >= speed_limit)
            speed_counter <= 0;
        else
            speed_counter <= speed_counter + 1;
    end
    assign speed_tick = (speed_counter == 0);

    // Update square position
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset to default position
            square_x_start <= 320;
            square_y_start <= 220;
            square_x_end <= 360;
            square_y_end <= 260;
        end else if (speed_tick) begin
            // Movement logic
            if (push[0] && square_y_start > 0) begin // Up button
                square_y_start <= square_y_start + 1;
                square_y_end <= square_y_end + 1;
            end
            if (push[3] && square_y_end < 479) begin // Down button
                square_y_start <= square_y_start - 1;
                square_y_end <= square_y_end - 1;
            end
            if (push[2] && square_x_start > 0) begin // Left button
                square_x_start <= square_x_start - 1;
                square_x_end <= square_x_end - 1;
            end
            if (push[1] && square_x_end < 639) begin // Right button
                square_x_start <= square_x_start + 1;
                square_x_end <= square_x_end + 1;
            end
        end
    end

    // Check if current pixel is inside square
    wire square_on = (pixel_x >= square_x_start && pixel_x < square_x_end) &&
                     (pixel_y >= square_y_start && pixel_y < square_y_end);

    // Pixel color
    always @(*) begin
        rgb = 3'b000; // Default color
        if (video_on) begin
            if (square_on)
                rgb = 3'b010; // Green for the square
            else
                rgb = 3'b001; // Blue for background
        end
    end

endmodule
