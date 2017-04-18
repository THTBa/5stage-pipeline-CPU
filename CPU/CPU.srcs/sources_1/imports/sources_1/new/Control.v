`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 16:41:37
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Op,
    output [18:1] ctl,
    output [4:1] ALUop
    );
    
    ctl1 c1(Op,ctl[15:1]);
    ctl2 c2(Op,ctl[18:16]);
    opctl aluop(Op,ALUop);
endmodule
