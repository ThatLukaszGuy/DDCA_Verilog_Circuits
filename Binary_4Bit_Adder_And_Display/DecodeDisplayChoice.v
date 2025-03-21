`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 11:16:57 AM
// Design Name: 
// Module Name: DecodeDisplayChoice
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


module DecodeDisplayChoice(input [1:0] display_choice, output reg [3:0] d);

always @(*) begin
    case(display_choice)
        2'b00: d = 4'b1110; // off - off - off - on
        2'b01: d = 4'b1101; // off - off - on - off
        2'b10: d = 4'b1011; // off - on - off - off
        2'b11: d = 4'b0111; // on - off - off - off
        default: d = 4'b1110; // off - off - off - on
    endcase
end 

endmodule
