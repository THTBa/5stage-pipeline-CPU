`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/29 10:53:47
// Design Name: 
// Module Name: dclk
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


module dclk(
    input high,
    input con1,
    output reg low //分频后的输出脉冲信号
    );
    integer count=0;
 
    initial low=0;
    always @(posedge high)
        begin
        if(con1==1) begin
                 count=count+1;
                 //if(count==800000)
                 if(count==10)//用于仿真 
                            begin
                            count=0;
                            low=~low;
                            end
                 end
        end
endmodule
