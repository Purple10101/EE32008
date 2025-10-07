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
    input clk, rst,
    
    input [3:0] data_in, // all 4 data bits
    output reg [6:0] code_out
    );
    
    wire p1, p2, p3;
    
    //Parity bit computation
    assign p1 = data_in[3] ^ data_in[2] ^ data_in[0];
    assign p2 = data_in[3] ^ data_in[1] ^ data_in[0];
    assign p3 = data_in[2] ^ data_in[1] ^ data_in[0];
    
    always @(posedge clk) begin
        // needs rst logic
        // [d3 d2 d1 d0 p1 p2 p3]
        code_out <= {p1, p2, data_in[3], p3, data_in[2], data_in[1], data_in[0]};
    end 
    
endmodule
