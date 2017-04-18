`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 09:19:44
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input [31:0] Instruction,
    input [11:2] PC,
    input [31:0]_PCp4,
    input clk,
    input WE,
    input clr,
    output [31:0] Instruction_out,
    output [11:2] PC_out,
    output [31:0] _PCp4_out
    );
    register_nbits #(32) Instrct(clk,~clr,WE,Instruction,Instruction_out),
                         Pp4(clk,~clr,WE,_PCp4,_PCp4_out);
    register_nbits #(10) P(clk,~clr,WE,PC,PC_out);                     
endmodule
