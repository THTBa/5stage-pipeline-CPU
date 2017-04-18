`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 23:35:24
// Design Name: 
// Module Name: ALUctl
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


module ALUctl(
    input [5:0] funct,
    input [4:1] ALUOp_i,
    output [4:1] ALUOp_o,
    output ctl12,
    output ctl13,
    output ctl_sft
    );
    wire [4:1] _ALUOp_o;
    ac ac1(funct,_ALUOp_o[4:1],_ctl12,_ctl13,_sft);
    and isr(_ctl,ALUOp_i[4],ALUOp_i[3],ALUOp_i[2],ALUOp_i[1]);
    and c13(ctl13,_ctl,_ctl13),
        c12(ctl12,_ctl,_ctl12),
        csft(ctl_sft,_ctl,_sft);
        
    assign #1 ALUOp_o = _ctl?_ALUOp_o:ALUOp_i;

        
endmodule
