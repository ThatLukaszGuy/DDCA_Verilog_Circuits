`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:17:27 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input left,
    input right,
    output [5:0] lights
);

    wire div_clk;
    wire [4:0] current_state;

    // Clock Divider
    clk_div div (
        .clk(clk),
        .rst(rst),
        .clk_en(div_clk)
    );

    // FSM Core (outputs 5-bit state for PWM decoder)
    TurnSignal_FSM fsm_core (
        .clk(div_clk),
        .reset(rst),
        .left(left),
        .right(right),
        .state(current_state)
    );

    // Duty cycles from decoder
    wire [7:0] left1_duty, left2_duty, left3_duty;
    wire [7:0] right1_duty, right2_duty, right3_duty;

    // PWM Decoder: maps FSM state to duty cycles
    PWM_Decoder decoder (
        .state(current_state),
        .left1_duty(left1_duty),
        .left2_duty(left2_duty),
        .left3_duty(left3_duty),
        .right1_duty(right1_duty),
        .right2_duty(right2_duty),
        .right3_duty(right3_duty)
    );

    // Instantiate 6 PWM modules, one for each light
    pwm p0(.clk(clk), .rst(rst), .duty(left1_duty),  .pwm_out(lights[5])); // Left1
    pwm p1(.clk(clk), .rst(rst), .duty(left2_duty),  .pwm_out(lights[4])); // Left2
    pwm p2(.clk(clk), .rst(rst), .duty(left3_duty),  .pwm_out(lights[3])); // Left3
    pwm p3(.clk(clk), .rst(rst), .duty(right1_duty), .pwm_out(lights[2])); // Right1
    pwm p4(.clk(clk), .rst(rst), .duty(right2_duty), .pwm_out(lights[1])); // Right2
    pwm p5(.clk(clk), .rst(rst), .duty(right3_duty), .pwm_out(lights[0])); // Right3

endmodule