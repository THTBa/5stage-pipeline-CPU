`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/29 15:17:18
// Design Name: 
// Module Name: 7_trans
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

module seg7x8D(d0,d1,d2,d3,d4,d5,d6,d7,clk,data_outs,an);
input [3:0] d0,d1,d2,d3,d4,d5,d6,d7;
input clk;
output [6:0] data_outs;
output [7:0] an;

wire [3:0] afts48;
wire [2:0] aftclk8;

DivideForDe47 df0(clk,aftclk8);
CFde4x8 cf0(aftclk8,d0,d1,d2,d3,d4,d5,d6,d7,afts48);
decoder_38 d380(an,aftclk8);
decode4_7 d470(data_outs,afts48);

endmodule


//////////////////////////////////////////////////////////////////////////////////

module decode4_7(data_out,indec);
output[6:0] data_out;
input[3:0] indec;
reg [6:0] data_out ;

always @(indec) begin
case(indec)
4'b0000: data_out = 7'b1000000; // 0
4'b0001: data_out = 7'b1111001; // 1
4'b0010: data_out = 7'b0100100; // 2
4'b0011: data_out = 7'b0110000; // 3
4'b0100: data_out = 7'b0011001; // 4
4'b0101: data_out = 7'b0010010; // 5
4'b0110: data_out = 7'b0000010; // 6
4'b0111: data_out = 7'b1111000; // 7
4'b1000: data_out = 7'b0000000; // 8
4'b1001: data_out = 7'b0010000; // 9
4'b1010: data_out = 7'b0001000; // A
4'b1011: data_out = 7'b0000011; // Buy
4'b1100: data_out = 7'b0100111; // C
4'b1101: data_out = 7'b0100001; // D
4'b1110: data_out = 7'b0000110; // E
4'b1111: data_out = 7'b0001110; // F
default: data_out = 7'bx;
endcase
end

endmodule


//////////////////////////////////////////////////////////////////////////////////


module DivideForDe47(clkt,Adf3); 
input clkt;
output reg [2:0]Adf3; 
reg [17:0]cnt; 
reg clk_divide;

initial begin
	cnt = 0;
    Adf3<=3'b000;
end

always@(posedge clkt)
begin 
    cnt<=cnt+1'b1;
    clk_divide<=cnt[14];
end

always@(posedge clk_divide)
    Adf3<=Adf3+1'b1;

endmodule

////////////////////////////////////////////////////////////////////////////////

module decoder_38(ant,in);
output[7:0] ant;
input[2:0] in;
reg[7:0] ant;

always @(in) begin
case(in)
3'd0: ant=8'b11111110;
3'd1: ant=8'b11111101;
3'd2: ant=8'b11111011;
3'd3: ant=8'b11110111;
3'd4: ant=8'b11101111;
3'd5: ant=8'b11011111;
3'd6: ant=8'b10111111;
3'd7: ant=8'b01111111;
endcase 
end

endmodule

///////////////////////////////////////////////////////////////////

module CFde4x8(Adf3,cd0,cd1,cd2,cd3,cd4,cd5,cd6,cd7,Afsd4);
input [3:0] cd0,cd1,cd2,cd3,cd4,cd5,cd6,cd7;
input [2:0]Adf3;
output reg [3:0]Afsd4;

always @(Adf3) begin
case(Adf3)
3'd0: Afsd4=cd0;
3'd1: Afsd4=cd1;
3'd2: Afsd4=cd2;
3'd3: Afsd4=cd3;
3'd4: Afsd4=cd4;
3'd5: Afsd4=cd5;
3'd6: Afsd4=cd6;
3'd7: Afsd4=cd7;
endcase 
end

endmodule
