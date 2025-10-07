`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:41:46 AM
// Design Name: 
// Module Name: syndrome
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


module syndrome(
    // A hamming (7,4) enocder example
    input clk, rst,

    
    input [6:0] code_in, // all 7 transmit bits
    output reg [2:0] syndrome
    );
    
    always @(posedge clk) begin
        // needs rst logic
    
        //Parity bit computation
        syndrome[2] <= code_in[3] ^ code_in[2] ^ code_in[1] ^ code_in[0]; // row 1
        syndrome[1] <= code_in[5] ^ code_in[4] ^ code_in[1] ^ code_in[0]; // row 2
        syndrome[0] <= code_in[6] ^ code_in[4] ^ code_in[2] ^ code_in[0]; // row 3

    end
    
endmodule
