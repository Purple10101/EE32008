`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 11:30:04 AM
// Design Name: 
// Module Name: fault_injection
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


module fault_injection #(
    parameter real P_E = 0.1
)(
        // This module is designed to sim a comms channel which will have some P(e)
        input clk,
        input rst,
        
        input  [6:0] code_in,
        output reg [6:0] code_out
    );
    
    integer threshold, bitpos, i;
    reg error_inj = 0;

    
    always @(posedge clk) begin
        if (rst) begin
            code_out <= code_in; 
        end else begin
            threshold = $rtoi(P_E * 100000.0);
            if (($urandom_range(0, 100000) < threshold) && (error_inj == 0)) begin
                // flip a random bit once
                bitpos = $urandom_range(0, 6);
                code_out[bitpos] <= ~code_out[bitpos]; // flip based on previous value
                error_inj <= 1;
            end else begin
                code_out <= code_in; 
            end
        end
        
    end
    
endmodule
