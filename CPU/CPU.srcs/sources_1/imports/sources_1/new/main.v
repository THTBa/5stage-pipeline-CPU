`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/21 09:12:16
// Design Name: 
// Module Name: main
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


module main(
    input e3,
    input clr,
    input timeup,
    input J_num,load_use_num,all_num,
    output [7:0] Lc,
    output [6:0] AtoP//digital_light
    );
    wire clk;
    wire [31:0] instruct_if,instruct_id,instruct_ex,instruct_mem,instruct_wb;
    wire [31:0] pc_final,nextpc_if,nextpc_id,nextpc_wb,Din,pc_if,x1,x2,y1,y2,y3,y4,y5,dl,s1,l1,l2;
    wire [11:2] pc_id;
    wire [15:0] IM; 
    wire BGEZ,PC_changed,syscall_id,_ctl12,_ctl13,_ctl_sft,ctl18_id,ctl12_wb,ctl12_ex,brunch,Din_To_Rs,Din_To_Rt,Din_To_MD,ctl_sft,ALU_result_To_Rt,ALU_result_To_Rs,_clk;
    wire [31:26] op_id,op_ex;
    wire [25:21] rs_id;
    wire [20:16] rt_id,rt_wb;
    wire [15:11] rd_id,rd_wb;
    wire [31:0] shmat;
    wire [10:6] shmat_id,shmat_ex;
    wire [15:0] im_id;
    wire [25:0] i26_id,i26_ex;
    wire [5:0] funct_id;
    wire [20:1]_ctl, ctl;
    wire [4:1] ALUop_i;
    wire [4:1] ALUop_o,ALUop_o_ex;
    wire [31:0] rf_s0;
    wire [31:0] rf_s1;
    wire [31:0] rf_s2;
    wire [31:0] rf_ra;
    wire [31:0] rfd1;
    wire [31:0] rfd2;
    wire [31:0] Sig_id,Sig_ex,Sig_mem,Sig_wb, Ext_id,r1_ex ,r2_ex,r2_mem,Ext_ex,nextpc_ex;
    wire [31:0] ALU_X,ALU_Y;
    wire stop,r_stop,equal,equal2,PC_changed_ex,PC_changed_mem,din_to_rs;
    wire [4:0] RW;
    wire [31:28]high;
    wire [31:0]ALU_result_ex,ALU_result_mem,ALU_result_wb,nextpc_mem,PC_mem,PCj,LD,RD_wb,MD,D1,D2,p1,p2,p3,p4,p5;
    wire [1:0]byte_sel;
    wire [3:0]ID_EX_RE,EX_Mem_RE,EX_WB_RE,Mem_WB_RE;
    reg  [31:0]hword,SYS_NUM,brunch_NUM,load_use_NUM,J_NUM,ins_NUM ;
    reg  [3:0]half_byte;
//PC_changed_ex PCj PC_changed_mem ALU_result_mem nextpc_mem instruct_mem PC_mem Sig_mem
//din_to_rs ALU_result_mem shamt ID_EX_RE[3:0]   MD[31:0]

    dclk            d1(e3,1'b1,_clk);
    seg7x8D         dis(dl[3:0],dl[7:4],dl[11:8],dl[15:12],dl[19:16],dl[23:20],dl[27:24],dl[31:28],e3,AtoP,Lc);
    and             a1(stop,ctl[13],equal2);
    or              o1(clk,_clk,r_stop,timeup);
    //clk,load_use,WE,RW[4:0],Din,PC_changed high[31:28]
    register_nbits #(32)
                    pc_count(~clk,~clr,~load_use,pc_final,pc_if),
                    digital_reg(clk,~clr,ctl[13]&~equal2,rf_s1,s1);
    register_nbits #(1)
                    sp(_clk,~clr,~r_stop,stop,r_stop),
                    PC_c(PC_changed_mem,~(PC_changed&~clk),1'b1,1'b1,PC_changed);

    NPC             npc(im_id,BGEZ,pc_if,high[31:28],nextpc_if[31:0]);
    
    rom             rm1(pc_if[11:2],instruct_if[31:0]);
    
    IF_ID           if_id(instruct_if,pc_if[11:2],nextpc_if,clk,1'b1,PC_changed|clr,instruct_id,pc_id,nextpc_id);
    
    IR              ir1(instruct_id,op_id,rs_id,rt_id,rd_id,shmat_id,im_id,i26_id,funct_id,syscall_id);
    
    Control         control(op_id,_ctl[18:1],ALUop_i);
    
    ALUctl          aluctl(funct_id,ALUop_i,ALUop_o,_ctl12,_ctl13,_ctl_sft);
    
    //ctl 17 18 19 20   

    regfile         rfile(clk,WE,RW,Din,rs_id,rt_id,rf_s0,rf_s1,rf_s2,rf_ra,rfd1,rfd2);

    ID_EX           id_ex(Sig_id,rfd1,rfd2,Ext_id,instruct_id,nextpc_id,Sig_ex,r1_ex,r2_ex,Ext_ex,instruct_ex,nextpc_ex,clk,~load_use,~load_use,PC_changed|clr);
    //ALU_result_ex equal
    alu             alu1(ALU_X,ALU_Y,ALUop_o_ex,ALU_result_ex,,equal,);
    //op_ex,shmat_ex,i26_ex
    IR              ir2(instruct_ex,op_ex,     ,     ,     ,shmat_ex,     ,i26_ex,        ,          );        
    //PC_changed_ex PCj PC_changed_mem PC_result_mem nextpc_mem instruct_mem PC_mem Sig_mem
    EX_Mem          ex_mem(PC_changed_ex,Sig_ex,ALU_result_ex,y2,nextpc_ex,instruct_ex,PCj,clk,1'b1,clr,PC_changed_mem,Sig_mem,ALU_result_mem,r2_mem,nextpc_mem,instruct_mem,PC_mem);         
    //LD[31:0]
    ram             ram(clk,ctl[5],ALU_result_mem[11:2],MD,LD);
    //instruct_wb byte_sel[1:0] nextpc_wb RD_wb
    Mem_WB          mem_wb(instruct_mem,Sig_mem,ALU_result_mem[1:0],LD,nextpc_mem,ALU_result_mem,clk,1'b1,clr,instruct_wb,Sig_wb,byte_sel,RD_wb,nextpc_wb,ALU_result_wb);

    Relative_Check1 rc11(instruct_id,instruct_ex,instruct_mem,instruct_wb,ID_EX_RE,,),
                    rc12(instruct_ex,instruct_mem,instruct_wb,  ,EX_Mem_RE,EX_WB_RE,);
    Re2             rc21(instruct_mem,instruct_wb,,,Mem_WB_RE,,);

    //din_to_rs ALU_result_mem shamt ID_EX_RE[3:0]   MD[31:0]
    assign #1 shmat[4:0] = shmat_ex[10:6];
    assign #1 shmat[31:5] = 0;
    assign #1 isl = op_ex[31]&~op_ex[30]&~op_ex[29]&~op_ex[28]&op_ex[26];
    assign #1 load_use = isl&(ID_EX_RE[0]|ID_EX_RE[1]|ID_EX_RE[2]|ID_EX_RE[3]);
    assign #1 x1 = Din_To_Rs?Din:r1_ex;
    assign #1 x2 = ALU_result_To_Rs?ALU_result_mem:x1;
    assign #1 y1 = Din_To_Rt?Din:r2_ex;
    assign #1 y2 = ALU_result_To_Rt?ALU_result_mem:y1;
    assign #1 y3 = ctl[6]?Ext_ex:y2;
    assign #1 y4 = ctl_sft?shmat:y3;
    assign #1 y5 = ctl[15]?'h00000010:y4;
    assign #1 ALU_Y = ctl[17]?'h00000000:y5;
    assign #1 ALU_X = (ctl[15]|ctl_sft)?(y3):(x2);
    assign #1 BGEZ = ctl[17]&(equal|~ALU_result_ex[0]);
    assign #1 MD = (Din_To_MD)?Din:r2_mem;
    //D1[31:0] D2[31:0]
    assign #1 D1 = ctl[16]?hword:RD_wb;
    assign #1 D2 = ctl[3]?D1:ALU_result_wb;
    assign #1 Din = ctl[14]?nextpc_wb:D2;
    //rt_wb[20:16],rd_wb[15:11]
    assign #1 rt_wb = instruct_wb[20:16];
    assign #1 rd_wb = instruct_wb[15:11];
    //ctl18_id
    assign #1 RW = ctl[11]?5'b11111:((ctl[9]|ctl18_id)?rt_wb:rd_wb);
    assign #1 Ext_id[15:0] = im_id;
    assign #1 Ext_id[31:16] = Ext_id[15]?16'hffff:16'h0000;
    //ctl18_id ctl12_wb
    assign #1 WE = ctl18_id|(ctl[8]&~ctl12_wb);
    //brunch
    assign #1 brunch = ctl[1]&(ctl[10]?~equal:equal);
    //p1 p2 p3 p4 p5
    assign #1 p1 = nextpc_ex +(Ext_ex<<'d2);
    assign #1 p2 = brunch?p1:nextpc_ex;
    assign #1 p3[1:0] = 0;
    assign #1 p3[27:2] = i26_ex;
    assign #1 p3[31:28] = high;
    assign #1 p4 = ctl[2]?p3:p2;
    //ctl12_ex
    assign #1 PCj = ctl12_ex?r1_ex:p4;
    assign #1 PC_changed_ex = brunch|ctl[2]|ctl12_ex|ctl20_ex;
    assign #1 pc_final =  PC_changed_mem?PC_mem:nextpc_if;
    //equal2
    assign #1 equal2 = (rf_s0 == 8'h0000000a)?1:0;

    assign #1 Sig_id[0] = _ctl[1];
    assign #1 Sig_id[1] = _ctl[2];
    assign #1 Sig_id[2] = _ctl[3];
    assign #1 Sig_id[3] = _ctl[4];
    assign #1 Sig_id[4] = _ctl[5];
    assign #1 Sig_id[5] = _ctl[6];
    assign #1 Sig_id[6] = _ctl[8];
    assign #1 Sig_id[7] = _ctl[9];
    assign #1 Sig_id[8] = _ctl[10];
    assign #1 Sig_id[9] = _ctl[11];
    assign #1 Sig_id[10] = ALUop_o[1];
    assign #1 Sig_id[11] = ALUop_o[2];
    assign #1 Sig_id[12] = ALUop_o[3];
    assign #1 Sig_id[13] = ALUop_o[4];
    assign #1 Sig_id[14] = _ctl[14];
    assign #1 Sig_id[15] = _ctl[15];
    assign #1 Sig_id[16] = _ctl[16];
    
    //code that should be rewrite
    assign #1 Sig_id[17] = _ctl[17];
    assign #1 Sig_id[18] = 0;
    assign #1 Sig_id[19] = 0;
    assign #1 Sig_id[20] = 0;
    assign #1 Din_To_Rs = EX_WB_RE[0]|EX_WB_RE[1];
    assign #1 Din_To_Rt = EX_WB_RE[2]|EX_WB_RE[3];
    assign #1 Din_To_MD = Mem_WB_RE[0]|Mem_WB_RE[1]|Mem_WB_RE[2]|Mem_WB_RE[3];
    assign #1 ALU_result_To_Rs = ~load_use&(EX_Mem_RE[0]|EX_Mem_RE[1]);
    assign #1 ALU_result_To_Rt = ~load_use&(EX_Mem_RE[2]|EX_Mem_RE[3]);



    assign #1 ctl18_id = ctl[18]; 
    assign #1 Sig_id[21] = _ctl12;
    assign #1 Sig_id[22] = syscall_id;
    assign #1 Sig_id[23] = _ctl_sft;
    assign #1 ctl_sft = Sig_ex[23];
    //
     //to 23
    //
    //
    
    assign #1 ctl12_id = Sig_id[21];
    assign #1 ctl18_id = Sig_id[18];
    assign #1 ctl[19] = Sig_id[19];
    assign #1 ctl20_id = Sig_id[20];
    
    //
    assign #1 ctl[1] = Sig_ex[0];
    assign #1 ctl[2] = Sig_ex[1];
    assign #1 ctl[6] = Sig_ex[5];
    assign #1 ctl[10] = Sig_ex[8];
    assign #1 ALUop_o_ex[1] = Sig_ex[10];
    assign #1 ALUop_o_ex[2] = Sig_ex[11];
    assign #1 ALUop_o_ex[3] = Sig_ex[12];
    assign #1 ALUop_o_ex[4] = Sig_ex[13];
    assign #1 ctl[15] = Sig_ex[15];
    assign #1 ctl[17] = Sig_ex[17];   
    assign #1 ctl20_ex = Sig_ex[20];
    assign #1 ctl12_ex = Sig_ex[21]; 
    
    assign #1 ctl[4] = Sig_mem[3];
    assign #1 ctl[5] = Sig_mem[4];
    
    assign #1 ctl[3] = Sig_wb[2];
    assign #1 ctl[8] = Sig_wb[6];
    assign #1 ctl[9] = Sig_wb[7];
    assign #1 ctl[11] = Sig_wb[9];
    assign #1 ctl[14] = Sig_wb[14];
    assign #1 ctl[16] = Sig_wb[16];
    assign #1 ctl18_wb = Sig_wb[18];
    assign #1 ctl12_wb = Sig_wb[21];
    assign #1 ctl[13] = Sig_wb[22];
    assign #1 l1 = J_num?J_NUM:s1;
    assign #1 l2 = load_use_num?load_use_NUM:l1;
    assign #1 dl = all_num?ins_NUM:l2;
    //half_byte[3:0] h_word[31:0]
    always@(RD_wb or byte_sel)begin
        case (byte_sel)
            2'b11:half_byte = RD_wb[7:0];
            2'b10:half_byte = RD_wb[15:8];
            2'b01:half_byte = RD_wb[23:16];
            2'b00:half_byte = RD_wb[31:24];
        endcase    
        hword[3:0] = half_byte;
        hword[31:4] = 0;
    end 
    initial
    begin
        SYS_NUM = 0;
        brunch_NUM = 0;
        load_use_NUM = 0;
        J_NUM = 0;
        ins_NUM = 0;
    end
    always@(posedge ctl[13] or posedge clr)begin
        if(clr)
            SYS_NUM <= 0;
        else SYS_NUM <= SYS_NUM + 1;
    end
    always@(posedge ctl[2] or posedge clr)begin
        if(clr)
            brunch_NUM <= 0;
        else brunch_NUM <= brunch_NUM + 1;
    end
    always@(posedge load_use or posedge clr)begin
        if(clr)
            load_use_NUM <= 0;
        else load_use_NUM <= load_use_NUM + 1;
    end 
    always@(posedge PC_changed_mem or posedge clr)begin
        if(clr)
            J_NUM <= 0;
        else J_NUM <= J_NUM + 1;
    end
    always@(posedge clk or posedge clr)begin
        if(clr)
            ins_NUM <= 0;
        else ins_NUM <= ins_NUM + 1;
    end               
endmodule
