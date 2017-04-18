`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/18 10:40:03
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] x,
    input [31:0] y,
    input [3:0] s,
    output reg[31:0] alu_res,
    output reg gtz,
    output equal,
    output reg halt
    );
//    reg [31:0]alu_res;
//    reg gtz,halt;
    parameter SLL=4'b0000,SRA=4'b0001,SRL=4'b0010,MUL=4'b0011;
    parameter DIV=4'b0100,ADD=4'b0101,SUB=4'b0110,AND=4'b0111;
    parameter OR=4'b1000,XOR=4'b1001,NOR=4'b1010,SLT=4'b1011;
    parameter ULT=4'b1100,SRAV=4'b1101,BTZ=4'b1110,SYSC=4'b1111;
    always@*
    begin
        gtz=0;//default value,avoiding latch
        halt=0;
        alu_res=0;
        case(s)
            SLL:
            alu_res=x<<(y[4:0]);
            SRA:
            alu_res=$signed(x)>>>(y[4:0]);
            SRL:
            alu_res=x>>(y[4:0]);
            ADD:
            alu_res=x+y;
            SUB:
            alu_res=x-y;
            AND:
            alu_res=x&y;
            OR:
            alu_res=x|y;
            XOR:
            alu_res=x^y;
            NOR:
            alu_res=~(x|y);
            SLT:
            if($signed(x)<$signed(y))//this is a systemic function,please use without suspect
            alu_res=1;
            else
            alu_res=0;
            ULT://not programming yet
            if(x<y)
            alu_res=1;
            else
            alu_res=0;
            SRAV:
            alu_res=y>>>(x[4:0]);
            BTZ:
            if(x>0)
            gtz=1;
            SYSC:
            if(x==10)
            halt=1;
            else
            alu_res=y;
            SRAV:
            alu_res=y>>>(x[4:0]);
            MUL://not programming yet
            alu_res=0;
            DIV://not programming yet
            alu_res=0;
        endcase
    end
    
    assign equal=(x==y)?1'd1:1'd0;
    
endmodule
