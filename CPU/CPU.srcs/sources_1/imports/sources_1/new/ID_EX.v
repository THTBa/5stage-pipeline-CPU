`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 10:05:32
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input [31:0] Sig,
    input [31:0] R1,
    input [31:0] R2,
    input [31:0] Ext,
    input [31:0] Instruction,
    input [31:0] PC,
    output [31:0] Sig_out,
    output [31:0] R1_out,
    output [31:0] R2_out,
    output [31:0] Ext_out,
    output [31:0] Instruction_out,
    output [31:0] PC_out,
    input clk,
    input WE,
    input Load_use,
    input J
    );
    register_nbits #(1) d_flip3(clk,~Load_use,1'b1,~Load_use,Q3);
    
    or                  o1(bubble,Q3,J);
    
    register_nbits #(32) sig(clk,~bubble,WE,Sig,Sig_out),
                         r1(clk,~bubble,WE,R1,R1_out),
                         r2(clk,~bubble,WE,R2,R2_out),
                         ext(clk,~bubble,WE,Ext,Ext_out),
                         instruction(clk,~bubble,WE,Instruction,Instruction_out),
                         pc(clk,~bubble,WE,PC,PC_out);
endmodule
