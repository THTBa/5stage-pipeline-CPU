`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 22:52:03
// Design Name: 
// Module Name: opctl
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


module opctl(
    input [31:26] op,
    output [4:1] op_alu
    );
    assign #1 op_alu[4] = ~op[31]&~op[29]&~op[28]&~op[27]|~op[29]&~op[28]&~op[27]&~op[26]|op[29]&op[27]&~op[26]|op[29]&op[28]&~op[27]&op[26]|op[30]&~op[29]&~op[28]&~op[27]|~op[31]&op[30]&op[29]&op[28]|op[31]&~op[30]&op[29]&op[28]|op[31]&op[29]&op[28]&op[27];
    assign #1 op_alu[3] = ~op[28]&~op[27]|~op[31]&~op[30]&op[29]&~op[27]&~op[26]|op[29]&~op[28]&op[26]|op[30]&op[29]&~op[28]|op[31]&~op[30]&~op[28]&op[26]|op[31]&op[29]&~op[28];
    assign #1 op_alu[2] = ~op[31]&~op[29]&~op[28]&~op[27]|~op[29]&~op[28]&~op[27]&~op[26]|~op[31]&~op[30]&op[29]&~op[28]&op[27]&~op[26]|~op[31]&~op[30]&op[29]&op[28]&~op[27]&~op[26]|op[30]&~op[29]&~op[28]&~op[27]	;
    assign #1 op_alu[1] = ~op[28]&~op[27]|~op[31]&~op[30]&op[29]&~op[26]|~op[31]&op[29]&~op[27]&~op[26]|op[29]&~op[28]&op[26]|op[30]&op[29]&op[26]|op[31]&~op[30]&~op[28]&op[26]|op[31]&op[29]&op[26];
endmodule
