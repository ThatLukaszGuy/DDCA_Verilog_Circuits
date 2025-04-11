`timescale 1ns / 1ps

module Testbench;

    // Declare testbench signals (inputs to the FSM)
    reg clk;
    reg rst;
    reg left;
    reg right;
    
    // Output from the FSM
    wire [5:0] lights;

    // Instantiate the FSM (Unit Under Test)
    FSM uut (
        .clk(clk),
        .rst(rst),
        .left(left),
        .right(right),
        .lights(lights)
    );

    // Clock generation: a simple 10 ns period clock (i.e., 100 MHz simulation clock)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test stimulus: apply reset, then toggle left and right signals
    initial begin
        // Initialize inputs
        rst   = 1;  // Assert reset
        left  = 0;
        right = 0;
        
        // Hold reset for a few clock cycles
        #20;
        rst = 0;    // Deassert reset
        #20;
        
        // Test sequence 1: Activate 'left' signal
        left = 1;  right = 0;
        #100;
        left = 0;  // Stop left input
        #50;
        
        // Test sequence 2: Activate 'right' signal
        right = 1; left = 0;
        #100;
        right = 0;
        #50;
        
        // Test sequence 3: Both signals 1 (FSM should remain in S0 if no further input)
        left = 1; right = 1;
        #100;  // Extend simulation so you can observe state transitions
        left = 0; right = 0;
        
        #50;
        
        // Test sequence 4: Activate 'left' signal, then reset before the animation finished
        left = 1;  right = 0;
        #75;
        left = 0;  // Stop left input
        rst = 1;
        #50;
        rst = 0;
        
        // Test sequence 5: Activate 'right' signal, then reset before the animation finished
        left = 0;  right = 1;
        #75;
        right = 0;  // Stop right input
        rst = 1;
        #50;
        rst = 0;
        
        $finish;  // End simulation
    end

endmodule