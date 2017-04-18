`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/18 10:40:03
// Design Name: 
// Module Name: register_nbits
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


module register_nbits #(
parameter NUM_BITS=32)
(
    input clk,
    input reg_rst,
    input reg_we,
    input [NUM_BITS-1:0] reg_d,
    output reg [NUM_BITS-1:0]  reg_q
    );    
	initial reg_q=0;//only for simulation
    always@(posedge clk or negedge reg_rst)
    begin
        if(!reg_rst)
            reg_q<=0;
        else if(reg_we)
        begin
            reg_q<=reg_d;            
        end
    end
endmodule
