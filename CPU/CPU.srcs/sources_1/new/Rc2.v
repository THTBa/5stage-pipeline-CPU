`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 13:15:08
// Design Name: 
// Module Name: Rc2
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


module Rc2(
    input [31:0] I_R,
    input [31:0] I_W,
    output [3:0] R
    );
    rcomp   	rrg1(I_R[31:26],RRs,RRt,,),
    			rrg2(I_W[31:26],,,WRt,WRd);
    RelativeCompare
    			rc(I_R[25:21],I_R[20:16],I_W[20:16],I_W[15:11],zero,RRs,RRt,WRt,WRd,R);
    assign #1 zero = ((I_R == 0)?1:0)|((I_R == 'hc)?1:0)|((I_W == 0)?1:0)|((I_W == 'hc)?1:0);
endmodule
