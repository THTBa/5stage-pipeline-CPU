`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 17:07:40
// Design Name: 
// Module Name: ctl2
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


module ctl2(
    input [31:26] op,
    output [18:16] ctl
    );
    assign #1 ctl[16] = op[31]&~op[30]&~op[29]&~op[28]&~op[27]&op[26];
    assign #1 ctl[17] = ~op[31]&~op[30]&~op[29]&~op[28]&~op[27]&op[26];
    assign #1 ctl[18] = ~op[31]&op[30]&~op[29]&~op[28]&~op[27]&~op[26];
endmodule
