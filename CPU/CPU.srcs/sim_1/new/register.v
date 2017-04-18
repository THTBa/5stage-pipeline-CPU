`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 15:55:57
// Design Name: 
// Module Name: register
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


module register_s(
    );
    reg clk;
    reg reg_rst;
    reg reg_we;
    reg [31:0] reg_d;
    wire [31:0]  reg_q_r;
   
    register_nbits dut(clk,reg_rst,reg_we,reg_d,reg_q_r);
    initial 
    begin
    clk = 0;
    reg_rst = 1;
    reg_we = 1; 
    end
    always 
    begin
        #3 clk = ~clk;
    end
    initial 
    begin
        #1 reg_d = 8'h00001234;
        #3 reg_rst = 0;
        #3 reg_rst = 1;
    end 
endmodule
