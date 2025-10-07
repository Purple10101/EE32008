`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 01:14:12 PM
// Design Name: 
// Module Name: decode
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


module decode(
        input clk, rst,
        input [6:0] code_in, // all 7 transmit bits
        output reg [2:0] syndrome,
        output reg [3:0] data_out
    );
    
    wire [2:0] i_syndrome;
    wire [3:0] i_data_out;
    
    syndrome u_syndrome_cal(
        .clk(clk),
        .rst(rst),
        .code_in(code_in),
        .syndrome(i_syndrome)
    );
    
    correction u_correction(
        .clk(clk),
        .rst(rst),
        .code_in(code_in),
        .syndrome_in(i_syndrome),
        .data_out(i_data_out)
    );
    
    always @(posedge clk) begin
        syndrome <= i_syndrome;
        data_out <= i_data_out;
    end
endmodule
