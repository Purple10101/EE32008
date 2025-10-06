`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:44:22 AM
// Design Name: 
// Module Name: codes_ex_top
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


module codes_ex_top(
        input [3:0] data_in, // all 4 data bits
        output [6:0] code_out,
        output [2:0] syndrome
    );
    
    encoder u_encoder (
        .data_in(data_in),
        .code_out(code_out)
    );
    
    syndrome u_syndrome (
        .code_in(code_out),
        .syndrome(syndrome)
    );
    
endmodule
