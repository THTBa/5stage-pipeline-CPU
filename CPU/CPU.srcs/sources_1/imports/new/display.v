`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/30 10:54:13
// Design Name: 
// Module Name: display
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


module display(
    input clk, //频率信号输入
    input [31:0] cd,//要显示的数字信号输入(从低位到高位)
    output reg [7:0] Lc , //控制亮哪一个灯
    output reg [7:0] AtoP  //控制显示字型
    );
    
    integer count;
    integer loop;              
    reg [7:0] number [10:0];
    reg [7:0] Lcset [7:0];
    reg clk1000Hz;
    reg [7:0] led [7:0];
    
    initial
    begin
    count=0;
    loop=0;
    clk1000Hz=1;
    AtoP=0;
    number[0]=8'b00000011;
    number[1]=8'b10011111;
    number[2]=8'b00100101;
    number[3]=8'b00001101;
    number[4]=8'b10011001;
    number[5]=8'b01001001;
    number[6]=8'b01000001;
    number[7]=8'b00011111;
    number[8]=8'b00000001;
    number[9]=8'b00001001;
    number[10]=8'b11111111; //什么都不显示
    Lcset[0]=8'b11111110;
    Lcset[1]=8'b11111101;
    Lcset[2]=8'b11111011;
    Lcset[3]=8'b11110111;
    Lcset[4]=8'b11101111;
    Lcset[5]=8'b11011111;
    Lcset[6]=8'b10111111;
    Lcset[7]=8'b01111111;
    end
    
    
    always @ (posedge clk)
    begin
    if(count==0) clk1000Hz=~clk1000Hz;
    count=count+1;
    if(count==1) count=0;
   
    end //分频模块
    
    always @ (posedge clk1000Hz)
    begin 
    led[0]<=cd[3:0];
    led[1]<=cd[7:4];
    led[2]<=cd[11:8];
    led[3]<=cd[15:12];
    led[4]<=cd[19:16];
    led[5]<=cd[23:20];
    led[6]<=cd[27:24];
    led[7]<=cd[31:28];
    Lc<=Lcset[loop];
    AtoP<=number[led[loop]];
    loop=loop+1;
    if(loop==8) loop=0;
    end //循环显示每一个数码管及其数字
endmodule
