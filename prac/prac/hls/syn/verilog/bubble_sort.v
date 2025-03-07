// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="bubble_sort_bubble_sort,hls_ip_2024_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010-clg225-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.196000,HLS_SYN_LAT=495,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=154,HLS_SYN_LUT=275,HLS_VERSION=2024_1}" *)

module bubble_sort (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        M_address0,
        M_ce0,
        M_we0,
        M_d0,
        M_q0,
        M_address1,
        M_ce1,
        M_we1,
        M_d1,
        errorFlag
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] M_address0;
output   M_ce0;
output   M_we0;
output  [31:0] M_d0;
input  [31:0] M_q0;
output  [4:0] M_address1;
output   M_ce1;
output   M_we1;
output  [31:0] M_d1;
input  [31:0] errorFlag;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[4:0] M_address0;
reg M_ce0;
reg M_we0;
reg M_ce1;
reg M_we1;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] i_1_reg_136;
wire    ap_CS_fsm_state2;
reg   [31:0] A_reg_149;
wire    ap_CS_fsm_state3;
reg   [4:0] indvars_iv_load_reg_154;
wire    ap_CS_fsm_state4;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_done;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_idle;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_ready;
wire   [4:0] grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address0;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce0;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we0;
wire   [31:0] grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d0;
wire   [4:0] grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address1;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce1;
wire    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we1;
wire   [31:0] grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d1;
reg    grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln21_fu_97_p1;
wire   [0:0] icmp_ln21_fu_85_p2;
reg   [4:0] indvars_iv_fu_42;
wire   [4:0] add_ln21_fu_111_p2;
reg   [4:0] i_fu_46;
wire   [4:0] add_ln30_fu_91_p2;
reg    M_ce0_local;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg = 1'b0;
#0 indvars_iv_fu_42 = 5'd0;
#0 i_fu_46 = 5'd0;
end

bubble_sort_bubble_sort_Pipeline_VITIS_LOOP_30_2 grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start),
    .ap_done(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_done),
    .ap_idle(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_idle),
    .ap_ready(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_ready),
    .zext_ln21_1(indvars_iv_load_reg_154),
    .A(A_reg_149),
    .M_address0(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address0),
    .M_ce0(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce0),
    .M_we0(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we0),
    .M_d0(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d0),
    .M_q0(M_q0),
    .M_address1(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address1),
    .M_ce1(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce1),
    .M_we1(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we1),
    .M_d1(grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d1),
    .zext_ln21(i_1_reg_136)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg <= 1'b1;
        end else if ((grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_ready == 1'b1)) begin
            grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_46 <= 5'd0;
    end else if (((icmp_ln21_fu_85_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_46 <= add_ln30_fu_91_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        indvars_iv_fu_42 <= 5'd1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        indvars_iv_fu_42 <= add_ln21_fu_111_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        A_reg_149 <= M_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_136 <= i_fu_46;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        indvars_iv_load_reg_154 <= indvars_iv_fu_42;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        M_address0 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address0;
    end else begin
        M_address0 = zext_ln21_fu_97_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        M_ce0 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce0;
    end else begin
        M_ce0 = M_ce0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        M_ce0_local = 1'b1;
    end else begin
        M_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        M_ce1 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_ce1;
    end else begin
        M_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        M_we0 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we0;
    end else begin
        M_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        M_we1 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_we1;
    end else begin
        M_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln21_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln21_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln21_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign M_address1 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_address1;

assign M_d0 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d0;

assign M_d1 = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_M_d1;

assign add_ln21_fu_111_p2 = (indvars_iv_fu_42 + 5'd1);

assign add_ln30_fu_91_p2 = (i_fu_46 + 5'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start = grp_bubble_sort_Pipeline_VITIS_LOOP_30_2_fu_63_ap_start_reg;

assign icmp_ln21_fu_85_p2 = ((i_fu_46 == 5'd19) ? 1'b1 : 1'b0);

assign zext_ln21_fu_97_p1 = i_fu_46;

endmodule //bubble_sort
