`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/18 10:40:03
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input rf_we,
    input [ADDR_WID-1:0] rf_addr,
    input [31:0] rf_din,
    input [ADDR_WID-1:0] rf_r1,
    input [ADDR_WID-1:0] rf_r2,
    output [31:0] rf_s0,
    output [31:0] rf_s1,
    output [31:0] rf_t0,
    output [31:0] rf_ra,
    output [31:0] rfd1,
    output [31:0] rfd2
    );
    
    parameter DATA_WID=32;
    parameter ADDR_WID=5;

    reg [DATA_WID-1:0] rf_content[2**ADDR_WID-1:0];
    
    //initial rf_content[DATA_WID-1:0][0] = 0;

    always@(negedge clk)
    begin
        if(rf_we&&rf_addr)
        begin
            rf_content[rf_addr]<=rf_din;            
        end
    end
        
    assign rfd1=rf_r1?rf_content[rf_r1]:0;
    assign rfd2=rf_r2?rf_content[rf_r2]:0;
    assign rf_s0=rf_content[2];
    assign rf_s1=rf_content[4];
    assign rf_t0=rf_content[8];
    assign rf_ra=rf_content[31];

endmodule
