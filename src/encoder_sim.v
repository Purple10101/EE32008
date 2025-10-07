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
    reg clk, rst;
    
    reg  [3:0] data_in;
    wire [3:0] data_out;
    wire [6:0] code_out;
    wire [2:0] syndrome;

    // Instantiate the DUT (Device Under Test)
    codes_ex_top dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .code_out(code_out),
        .syndrome(syndrome),
        .data_out(data_out)
    );

    integer i;

    initial begin
        clk = 0;
        rst = 0;
        forever #10 clk = ~clk;  // 10ns period => 100 MHz clock
    end
    
    initial begin
        // Loop through all 16 possible input combinations
        for (i = 0; i < 16; i = i + 1) begin
            data_in = i[3:0];
            #200;
            rst = 1;
            #50;
            rst = 0;
        end
    end

endmodule
