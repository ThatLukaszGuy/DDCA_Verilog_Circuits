module PWM_Decoder (
    input  wire [4:0] state,         // current state from FSM
    output reg  [7:0] left1_duty,    // PWM duty for left LED1
    output reg  [7:0] left2_duty,    // PWM duty for left LED2
    output reg  [7:0] left3_duty,    // PWM duty for left LED3
    output reg  [7:0] right1_duty,   // PWM duty for right LED1
    output reg  [7:0] right2_duty,   // PWM duty for right LED2
    output reg  [7:0] right3_duty    // PWM duty for right LED3
);
    // Define brightness levels (8-bit PWM values)
    localparam [7:0] OFF  = 8'd0;
    localparam [7:0] LOW  = 8'd50;   // ~33% duty
    localparam [7:0] MED  = 8'd150;  // ~66% duty
    localparam [7:0] HIGH = 8'd255;  // 100% duty

    // (Re)define state codes to match the FSM (for clarity and self-containment)
    localparam IDLE         = 5'd0,
               LEFT1_LOW    = 5'd1,
               LEFT1_MED    = 5'd2,
               LEFT1_HIGH   = 5'd3,
               LEFT2_LOW    = 5'd4,
               LEFT2_MED    = 5'd5,
               LEFT2_HIGH   = 5'd6,
               LEFT3_LOW    = 5'd7,
               LEFT3_MED    = 5'd8,
               LEFT3_HIGH   = 5'd9,
               RIGHT1_LOW   = 5'd10,
               RIGHT1_MED   = 5'd11,
               RIGHT1_HIGH  = 5'd12,
               RIGHT2_LOW   = 5'd13,
               RIGHT2_MED   = 5'd14,
               RIGHT2_HIGH  = 5'd15,
               RIGHT3_LOW   = 5'd16,
               RIGHT3_MED   = 5'd17,
               RIGHT3_HIGH  = 5'd18;

    // Combinational logic to assign duty cycles based on current state
    always @(*) begin
        // Default all lights to OFF
        left1_duty  = OFF;
        left2_duty  = OFF;
        left3_duty  = OFF;
        right1_duty = OFF;
        right2_duty = OFF;
        right3_duty = OFF;

        case (state)
            // IDLE: all duties remain OFF (lights off)
            IDLE: begin
                // all LEDs already set to OFF
            end

            // Left-turn states: assign brightness to left LEDs
            LEFT1_LOW: begin
                left1_duty = LOW;
            end
            LEFT1_MED: begin
                left1_duty = MED;
            end
            LEFT1_HIGH: begin
                left1_duty = HIGH;
            end
            LEFT2_LOW: begin
                left1_duty = HIGH;   // LED1 stays on at full brightness
                left2_duty = LOW;    // start lighting LED2 at low brightness
            end
            LEFT2_MED: begin
                left1_duty = HIGH;
                left2_duty = MED;
            end
            LEFT2_HIGH: begin
                left1_duty = HIGH;
                left2_duty = HIGH;
            end
            LEFT3_LOW: begin
                left1_duty = HIGH;
                left2_duty = HIGH;
                left3_duty = LOW;    // start lighting LED3 at low brightness
            end
            LEFT3_MED: begin
                left1_duty = HIGH;
                left2_duty = HIGH;
                left3_duty = MED;
            end
            LEFT3_HIGH: begin
                left1_duty = HIGH;
                left2_duty = HIGH;
                left3_duty = HIGH;   // all left LEDs fully bright
            end

            // Right-turn states: assign brightness to right LEDs
            RIGHT1_LOW: begin
                right1_duty = LOW;
            end
            RIGHT1_MED: begin
                right1_duty = MED;
            end
            RIGHT1_HIGH: begin
                right1_duty = HIGH;
            end
            RIGHT2_LOW: begin
                right1_duty = HIGH;  // LED1 stays at full brightness
                right2_duty = LOW;   // LED2 starts at low brightness
            end
            RIGHT2_MED: begin
                right1_duty = HIGH;
                right2_duty = MED;
            end
            RIGHT2_HIGH: begin
                right1_duty = HIGH;
                right2_duty = HIGH;
            end
            RIGHT3_LOW: begin
                right1_duty = HIGH;
                right2_duty = HIGH;
                right3_duty = LOW;   // LED3 starts at low brightness
            end
            RIGHT3_MED: begin
                right1_duty = HIGH;
                right2_duty = HIGH;
                right3_duty = MED;
            end
            RIGHT3_HIGH: begin
                right1_duty = HIGH;
                right2_duty = HIGH;
                right3_duty = HIGH;  // all right LEDs fully bright
            end

            default: begin
                // In case of undefined state, turn everything off
                left1_duty  <= OFF;
                left2_duty  <= OFF;
                left3_duty  <= OFF;
                right1_duty <= OFF;
                right2_duty <= OFF;
                right3_duty <= OFF;
            end
        endcase
    end
endmodule
