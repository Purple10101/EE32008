`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:50:12 AM
// Design Name: 
// Module Name: encoder_sim
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


module tb_codes_ex_top;

    // Testbench signals
    reg  [3:0] data_in;
    wire [6:0] code_out;
    wire [2:0] syndrome;

    // Instantiate the DUT (Device Under Test)
    codes_ex_top dut (
        .data_in(data_in),
        .code_out(code_out),
        .syndrome(syndrome)
    );

    integer i;

    initial begin
        // Loop through all 16 possible input combinations
        for (i = 0; i < 16; i = i + 1) begin
            data_in = i[3:0];
            #10;
        end
    end

endmodule
