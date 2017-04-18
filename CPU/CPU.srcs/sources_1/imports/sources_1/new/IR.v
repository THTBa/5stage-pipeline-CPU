`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 11:03:40
// Design Name: 
// Module Name: IR
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


module IR(
    input [31:0] Instruction,
    output [31:26] Op,
    output [25:21] Rs,
    output [20:16] Rt,
    output [15:11] Rd,
    output [10:6] Shmat,
    output [15:0] IM,
    output [25:0] I26,
    output [5:0] funct,
    output reg syscall
    );
    assign #1 Op[31:26] = Instruction[31:26];
    assign #1 Rs[25:21] = Instruction[25:21];
    assign #1 Rt[20:16] = Instruction[20:16];
    assign #1 Rd[15:11] = Instruction[15:11];
    assign #1 Shmat[10:6] = Instruction[10:6];
    assign #1 IM[15:0] = Instruction[15:0];
    assign #1 I26[25:0] = Instruction[25:0];
    assign #1 funct[5:0] = Instruction[5:0];
    
    always @(Instruction) begin
        if(Instruction == 32'h0000000c)
            syscall = 1;
        else syscall = 0;
    end        
endmodule
