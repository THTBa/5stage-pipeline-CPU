`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 13:14:04
// Design Name: 
// Module Name: Re2
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


module Re2(
    input [31:0] I_R,
    input [31:0] I_W1,
    input [31:0] I_W2,
    input [31:0] I_W3,
    output [3:0] R1,
    output [3:0] R2,
    output [3:0] R3
    );
    Rc2             rc21(I_R,I_W1,R1),
    				rc22(I_R,I_W2,R2),
    				rc23(I_R,I_W3,R3);
endmodule
