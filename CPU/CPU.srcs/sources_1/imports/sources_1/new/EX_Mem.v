`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 10:29:21
// Design Name: 
// Module Name: EX_Mem
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


module EX_Mem(
    input PC_changed_EX,
    input [31:0] Sig,
    input [31:0] ALU_result,
    input [31:0] R2,
    input [31:0] PCp4_Current,
    input [31:0] Instruction,
    input [31:0] PC,
    input clk,
    input WE,
    input clr,
    output PC_changed_Mem,
    output [31:0] Sig_out,
    output [31:0] ALU_result_out,
    output [31:0] R2_out,
    output [31:0] PCp4_C_out,
    output [31:0] Instruction_out,
    output [31:0] PC_out
    );
    register_nbits #(1) 
                        pc_changed(clk,~clr,WE,PC_changed_EX,PC_changed_Mem);
    register_nbits #(32) 
                         sig(clk,~clr,WE,Sig,Sig_out),
                         alu_result(clk,~clr,WE,ALU_result,ALU_result_out),
                         r2(clk,~clr,WE,R2,R2_out),
                         pcp4_Current(clk,~clr,WE,PCp4_Current,PCp4_C_out),
                         instruct(clk,~clr,WE,Instruction,Instruction_out),
                         _PC(clk,~clr,WE,PC,PC_out);
endmodule
