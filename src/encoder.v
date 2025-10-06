`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:34:57 AM
// Design Name: 
// Module Name: encoder
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


module encoder(
    // A hamming (7,4) enocder example
    input [3:0] data_in, // all 4 data bits
    output [6:0] code_out
    );
    
    wire p1, p2, p3;
    
    //Parity bit computation
    assign p1 = data_in[3] ^ data_in[2] ^ data_in[0]; // row 1 parity bits
    assign p2 = data_in[3] ^ data_in[1] ^ data_in[0]; // row 2 parity bits
    assign p3 = data_in[2] ^ data_in[1] ^ data_in[0]; // row 3 parity bits
    
    assign code_out = {data_in, p1, p2, p3};
    
endmodule
