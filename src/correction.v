`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 02:13:50 PM
// Design Name: 
// Module Name: correction
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


module correction(
    // A hamming (7,4) enocder example
    input clk, rst,

    
    input  [6:0] code_in, // all 7 transmit bits
    input  [2:0] syndrome_in,
    output [3:0] data_out
    );
    
    // Correct the error
    reg [6:0] corrected;
    always @(*) begin
        corrected = code_in;
        if (syndrome_in != 3'b000)
            corrected[7 - syndrome_in] = ~corrected[7 - syndrome_in]; // Flip the bit at error position
    end
    
    assign data_out = {corrected[4], corrected[2], corrected[1], corrected[0]}; // D1 D2 D3 D4
    
endmodule
