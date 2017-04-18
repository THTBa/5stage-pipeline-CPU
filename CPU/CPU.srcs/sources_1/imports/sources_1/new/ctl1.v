`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 16:49:11
// Design Name: 
// Module Name: ctl1
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


module ctl1(
    input [31:26] op,
    output [15:1] ctl
    );
    assign #1 ctl[1] = ~op[29]&op[28];
    assign #1 ctl[2] = ~op[31]&~op[30]&~op[29]&~op[28]&op[27];
    assign #1 ctl[3] = op[31]&~op[29];
    assign #1 ctl[4] = op[31]&~op[29];
    assign #1 ctl[5] = op[31]&op[29];
    assign #1 ctl[6] = op[31]|op[29];
    assign #1 ctl[8] = ~op[30]&~op[28]&~op[27]&~op[26]|~op[30]&~op[29]&~op[28]&op[27]&op[26]|~op[31]&op[29]|op[30]&~op[28]&~op[27]&op[26]|op[31]&~op[29]|op[31]&~op[28]&~op[27];
    assign #1 ctl[9] = ~op[31]&op[29]|op[31]&~op[29];
    assign #1 ctl[10] = ~op[29]&op[28]&~op[27]&op[26]|op[30]&~op[29]&~op[27]&op[26];
    assign #1 ctl[11] = ~op[31]&~op[29]&op[27]&op[26]|~op[31]&~op[28]&op[27]&op[26]|~op[31]&op[30]&op[27]&op[26];
    assign #1 ctl[14] = ~op[31]&~op[30]&~op[29]&~op[28]&op[27]&op[26];
    assign #1 ctl[15] = ~op[31]&~op[30]&op[29]&op[28]&op[27]&op[26];
endmodule
