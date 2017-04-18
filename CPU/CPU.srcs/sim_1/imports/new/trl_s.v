`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/05 15:55:26
// Design Name: 
// Module Name: trl_s
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


module trl_s(
    );
    reg e3;
    reg clr;
    reg timeup,J_num,load_use_num,all_num;
    wire [31:0] dl;//digital_light 
    wire [7:0] Lc;
    wire [6:0] AtoP;
    main dut(e3,clr,timeup,J_num,load_use_num,all_num,Lc,AtoP);
    initial 
    begin 
    J_num = 0;
    load_use_num = 0;
    all_num = 0;
    e3 = 0;
    clr = 0;
    timeup = 0;
    #5000 timeup = 1;
    #2500 timeup = 0;
    #2500 clr = 1;
    #20000 clr = 0;
    end
    always 
    begin
        #1 e3 = ~e3;
    end

endmodule
