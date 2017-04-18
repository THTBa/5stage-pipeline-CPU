`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 13:17:25
// Design Name: 
// Module Name: rcomp
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


module rcomp(
    input [6:1] Op,
    output Rs,
    output Rt,
    output Rt_W,
    output Rd_W
    );
    assign #1 Rs = ~Op[6]&~Op[5]&~Op[2]|~Op[6]&~Op[5]&Op[4]&~Op[1];
    assign #1 Rt = ~Op[6]&~Op[5]&~Op[4]&~Op[2]&~Op[1]|~Op[6]&~Op[5]&~Op[4]&Op[3]&~Op[2]|Op[6]&~Op[5]&Op[4]&~Op[3]&Op[2]&Op[1];
    assign #1 Rt_W = ~Op[6]&~Op[5]&Op[4]&~Op[1]|~Op[6]&~Op[5]&Op[4]&~Op[2]|~Op[6]&~Op[5]&Op[4]&Op[3]|Op[6]&~Op[5]&~Op[4]&~Op[3]&Op[1];
    assign #1 Rd_W = ~Op[6]&~Op[5]&~Op[4]&~Op[3]&~Op[2]&~Op[1];
endmodule
