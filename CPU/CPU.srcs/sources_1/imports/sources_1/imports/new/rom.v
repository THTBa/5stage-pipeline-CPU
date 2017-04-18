`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/18 10:40:03
// Design Name: 
// Module Name: rom
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


module rom(
    input [ADDR_WID-1:0] rom_addr,
    output [DATA_WID-1:0] rom_data
    );
    parameter DATA_WID=32;
    parameter ADDR_WID=10;
    
    reg [DATA_WID-1:0] rom_content[2**ADDR_WID-1:0];
    
    initial $readmemh("benchmark.hex",rom_content);
    
    assign rom_data=rom_content[rom_addr];
    
endmodule
