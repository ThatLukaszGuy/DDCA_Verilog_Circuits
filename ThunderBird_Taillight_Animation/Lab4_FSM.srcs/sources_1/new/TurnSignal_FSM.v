`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:11:12 PM
// Design Name: 
// Module Name: TurnSignal_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TurnSignal_FSM (
    input  wire clk,
    input  wire reset,
    input  wire left,
    input  wire right,
    output reg [4:0] state    // output current state encoding to drive the PWM decoder
);
    // State encoding (using 5 bits to cover all states)
    localparam IDLE         = 5'd0,
               LEFT1_LOW    = 5'd1,   // Left LED1 at 33% brightness
               LEFT1_MED    = 5'd2,   // Left LED1 at 66%
               LEFT1_HIGH   = 5'd3,   // Left LED1 at 100%
               LEFT2_LOW    = 5'd4,   // Left LED2 at 33% (LED1 remains at 100%)
               LEFT2_MED    = 5'd5,   // Left LED2 at 66% (LED1 at 100%)
               LEFT2_HIGH   = 5'd6,   // Left LED2 at 100% (LED1 at 100%)
               LEFT3_LOW    = 5'd7,   // Left LED3 at 33% (LED1,LED2 at 100%)
               LEFT3_MED    = 5'd8,   // Left LED3 at 66% (LED1,LED2 at 100%)
               LEFT3_HIGH   = 5'd9,   // Left LED3 at 100% (LED1,LED2 at 100%)
               RIGHT1_LOW   = 5'd10,  // Right LED1 at 33% brightness
               RIGHT1_MED   = 5'd11,  // Right LED1 at 66%
               RIGHT1_HIGH  = 5'd12,  // Right LED1 at 100%
               RIGHT2_LOW   = 5'd13,  // Right LED2 at 33% (LED1 remains at 100%)
               RIGHT2_MED   = 5'd14,  // Right LED2 at 66% (LED1 at 100%)
               RIGHT2_HIGH  = 5'd15,  // Right LED2 at 100% (LED1 at 100%)
               RIGHT3_LOW   = 5'd16,  // Right LED3 at 33% (LED1,LED2 at 100%)
               RIGHT3_MED   = 5'd17,  // Right LED3 at 66% (LED1,LED2 at 100%)
               RIGHT3_HIGH  = 5'd18;  // Right LED3 at 100% (LED1,LED2 at 100%)

    reg [4:0] next_state;

    // Next-state logic (combinational)
    always @ (*) begin
        case (state)
            IDLE: begin
                if (left & ~right)
                    next_state = LEFT1_LOW;     // start left turn sequence
                else if (right & ~left)
                    next_state = RIGHT1_LOW;    // start right turn sequence
                else
                    next_state = IDLE;          // remain idle if no input
            end

            // Sequence of left-turn states (smoothly increase brightness of LEDs 1->3)
            LEFT1_LOW:   next_state = LEFT1_MED;
            LEFT1_MED:   next_state = LEFT1_HIGH;
            LEFT1_HIGH:  next_state = LEFT2_LOW;   // after LED1 fully on, start LED2
            LEFT2_LOW:   next_state = LEFT2_MED;
            LEFT2_MED:   next_state = LEFT2_HIGH;
            LEFT2_HIGH:  next_state = LEFT3_LOW;   // after LED2 fully on, start LED3
            LEFT3_LOW:   next_state = LEFT3_MED;
            LEFT3_MED:   next_state = LEFT3_HIGH;
            LEFT3_HIGH: begin
                if (left)
                    next_state = LEFT1_LOW;    // loop back to start if left is still held
                else
                    next_state = IDLE;         // go to off (idle) if left released
            end

            // Sequence of right-turn states (smoothly increase brightness of LEDs 1->3)
            RIGHT1_LOW:  next_state = RIGHT1_MED;
            RIGHT1_MED:  next_state = RIGHT1_HIGH;
            RIGHT1_HIGH: next_state = RIGHT2_LOW;
            RIGHT2_LOW:  next_state = RIGHT2_MED;
            RIGHT2_MED:  next_state = RIGHT2_HIGH;
            RIGHT2_HIGH: next_state = RIGHT3_LOW;
            RIGHT3_LOW:  next_state = RIGHT3_MED;
            RIGHT3_MED:  next_state = RIGHT3_HIGH;
            RIGHT3_HIGH: begin
                if (right)
                    next_state = RIGHT1_LOW;   // loop back if right is still held
                else
                    next_state = IDLE;         // go idle (all off) if right released
            end

            default: next_state = IDLE;
        endcase
    end

    // State register update on clock (sequential logic)
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end
endmodule

