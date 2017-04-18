`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/18 10:40:03
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,
    input ram_str,
    input [ADDR_WID-1:0] ram_addr,
    input [DATA_WID-1:0] ram_din,
    output [DATA_WID-1:0] ram_dout
    );
    parameter DATA_WID=32;
    parameter ADDR_WID=10;
    
    reg [DATA_WID-1:0] ram_content[2**ADDR_WID-1:0];
        
    always@(posedge clk)
    begin
        if(ram_str)
        begin
            ram_content[ram_addr]<=ram_din;            
        end
    end
        
    assign ram_dout=ram_content[ram_addr];
    
endmodule
