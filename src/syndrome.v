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
    input [6:0] code_in, // all 7 transmit bits
    output [2:0] syndrome
    );
    
    //Parity bit computation
    assign syndrome[2] = code_in[0] ^ code_in[1] ^ code_in[3]; // row 1 parity bits
    assign syndrome[1] = code_in[0] ^ code_in[2] ^ code_in[3]; // row 2 parity bits
    assign syndrome[0] = code_in[1] ^ code_in[2] ^ code_in[3]; // row 3 parity bits
    
endmodule
