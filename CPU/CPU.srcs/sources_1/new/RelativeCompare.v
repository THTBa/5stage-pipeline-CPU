`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 10:22:51
// Design Name: 
// Module Name: RelativeCompare
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


module RelativeCompare(
    input [4:0] R_Rs,
    input [4:0] R_Rt,
    input [4:0] W_Rt,
    input [4:0] W_Rd,
    input zero,
    input RRs_en,
    input RRt_en,
    input WRt_en,
    input WRd_en,
    output [3:0] RC
    );
    wire [3:0] rc,comp;
    assign #1 comp[0] = (R_Rs == W_Rt)?1'b1:1'b0;
    assign #1 comp[1] = (R_Rs == W_Rd)?1'b1:1'b0;
    assign #1 comp[2] = (R_Rt == W_Rt)?1'b1:1'b0;
    assign #1 comp[3] = (R_Rt == W_Rd)?1'b1:1'b0;
    assign #1 rc[0] = comp[0]&(RRs_en&WRt_en);
    assign #1 rc[1] = comp[1]&(RRs_en&WRd_en);
    assign #1 rc[2] = comp[2]&(RRt_en&WRt_en);
    assign #1 rc[3] = comp[3]&(RRt_en&WRd_en);
    assign #1 RC = zero?4'b0000:rc;
endmodule
