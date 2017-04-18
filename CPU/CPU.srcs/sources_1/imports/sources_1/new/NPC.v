`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 09:27:38
// Design Name: 
// Module Name: NPC
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


module NPC(
    input [15:0] IM,
    input BGEZ,
    input [31:0] PC,
    output [3:0] high4,
    output [31:0] PC_out
    );
    wire [31:0] IM_Ext;
    wire [31:0] IM_left;
    wire [3:0] plus;
    
    assign #1 IM_Ext[15:0] = IM;
    assign #1 IM_left = IM_Ext<<2;
    assign #1 PC_out = PC+plus;
    assign #1 high4 = PC_out[31:28];
    assign #1 plus = BGEZ?IM_left:4;

endmodule
