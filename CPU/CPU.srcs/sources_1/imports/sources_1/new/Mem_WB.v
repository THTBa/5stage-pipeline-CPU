`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 10:49:20
// Design Name: 
// Module Name: Mem_WB
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


module Mem_WB(
    input [31:0] Instruction,
    input [31:0] Sig,
    input [1:0] byte_sel,
    input [31:0] RD,
    input [31:0] PC,
    input [31:0] ALU_result,
    input clk,
    input WE,
    input clr,
    output [31:0] Instruction_out,
    output [31:0] Sig_out,
    output [1:0] byte_sel_out,
    output [31:0] RD_out,
    output [31:0] PC_out,
    output [31:0] ALU_result_out
    );
    register_nbits #(2) btsel(clk,1'b1,WE,byte_sel,byte_sel_out);
    register_nbits #(32) instruction(clk,1'b1,WE,Instruction,Instruction_out),
                         sig(clk,1'b1,WE,Sig,Sig_out),
                         rd(clk,1'b1,WE,RD,RD_out),
                         pc(clk,1'b1,WE,PC,PC_out),
                         alu(clk,1'b1,WE,ALU_result,ALU_result_out);
endmodule
