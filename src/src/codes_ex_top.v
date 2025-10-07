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
        input clk, rst,

        input [3:0] data_in, // all 4 data bits
        output [6:0] code_out,
        output [2:0] syndrome,
        output [3:0] data_out
    );
    
    wire [6:0] transmitted_code;
    
    encoder u_encoder (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .code_out(transmitted_code)
    );
    
    fault_injection u_fault_injection (
        .clk(clk),
        .rst(rst),
        .code_in(transmitted_code),
        .code_out(code_out)
    );
    
    decode u_decode (
        .clk(clk),
        .rst(rst),
        .code_in(code_out),
        .syndrome(syndrome),
        .data_out(data_out)
    );
    
endmodule
