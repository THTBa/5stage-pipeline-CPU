`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 23:45:11
// Design Name: 
// Module Name: ac
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


module ac(
    input [6:1] funct,
    output [4:1] op,
    output _ctl12,
    output _ctl13,
    output _sft
    );
    assign #1 op[4] = funct[3]&funct[1]|funct[4];
    assign #1 op[3] = funct[3]&~funct[1]|funct[4]&funct[1]|funct[6]&~funct[4]&~funct[3];
    assign #1 op[2] = funct[2]&~funct[1]|funct[3]&~funct[1];
    assign #1 op[1] = ~funct[4]&~funct[3]&funct[1]|funct[3]&funct[2]|funct[4]&~funct[1]|funct[6]&~funct[2]&~funct[1];
    assign #1 _sft = ~funct[6]&~funct[5]&~funct[4]&~funct[3]&~funct[1]|~funct[6]&~funct[5]&~funct[4]&~funct[3]&funct[2];
    assign #1 _ctl12 = ~funct[6]&~funct[5]&funct[4]&~funct[3]&~funct[2]&~funct[1];
    assign #1 _ctl13 = ~funct[6]&~funct[5]&funct[4]&funct[3]&~funct[2]&~funct[1];
endmodule
