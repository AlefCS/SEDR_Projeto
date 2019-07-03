// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module reproducao (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        seed_i,
        seed_o,
        seed_o_ap_vld,
        populacao_x_V_address0,
        populacao_x_V_ce0,
        populacao_x_V_we0,
        populacao_x_V_d0,
        populacao_x_V_q0,
        populacao_x_V_address1,
        populacao_x_V_ce1,
        populacao_x_V_q1,
        populacao_y_V_address0,
        populacao_y_V_ce0,
        populacao_y_V_we0,
        populacao_y_V_d0,
        populacao_y_V_q0,
        populacao_y_V_address1,
        populacao_y_V_ce1,
        populacao_y_V_q1,
        populacao_desempenho_address0,
        populacao_desempenho_ce0,
        populacao_desempenho_we0,
        populacao_desempenho_d0,
        populacao_desempenho_q0,
        populacao_desempenho_address1,
        populacao_desempenho_ce1,
        populacao_desempenho_q1
);

parameter    ap_ST_fsm_state1 = 50'd1;
parameter    ap_ST_fsm_state2 = 50'd2;
parameter    ap_ST_fsm_state3 = 50'd4;
parameter    ap_ST_fsm_state4 = 50'd8;
parameter    ap_ST_fsm_state5 = 50'd16;
parameter    ap_ST_fsm_state6 = 50'd32;
parameter    ap_ST_fsm_state7 = 50'd64;
parameter    ap_ST_fsm_state8 = 50'd128;
parameter    ap_ST_fsm_state9 = 50'd256;
parameter    ap_ST_fsm_state10 = 50'd512;
parameter    ap_ST_fsm_state11 = 50'd1024;
parameter    ap_ST_fsm_state12 = 50'd2048;
parameter    ap_ST_fsm_state13 = 50'd4096;
parameter    ap_ST_fsm_state14 = 50'd8192;
parameter    ap_ST_fsm_state15 = 50'd16384;
parameter    ap_ST_fsm_state16 = 50'd32768;
parameter    ap_ST_fsm_state17 = 50'd65536;
parameter    ap_ST_fsm_state18 = 50'd131072;
parameter    ap_ST_fsm_state19 = 50'd262144;
parameter    ap_ST_fsm_state20 = 50'd524288;
parameter    ap_ST_fsm_state21 = 50'd1048576;
parameter    ap_ST_fsm_state22 = 50'd2097152;
parameter    ap_ST_fsm_state23 = 50'd4194304;
parameter    ap_ST_fsm_state24 = 50'd8388608;
parameter    ap_ST_fsm_state25 = 50'd16777216;
parameter    ap_ST_fsm_state26 = 50'd33554432;
parameter    ap_ST_fsm_state27 = 50'd67108864;
parameter    ap_ST_fsm_state28 = 50'd134217728;
parameter    ap_ST_fsm_state29 = 50'd268435456;
parameter    ap_ST_fsm_state30 = 50'd536870912;
parameter    ap_ST_fsm_state31 = 50'd1073741824;
parameter    ap_ST_fsm_state32 = 50'd2147483648;
parameter    ap_ST_fsm_state33 = 50'd4294967296;
parameter    ap_ST_fsm_state34 = 50'd8589934592;
parameter    ap_ST_fsm_state35 = 50'd17179869184;
parameter    ap_ST_fsm_state36 = 50'd34359738368;
parameter    ap_ST_fsm_state37 = 50'd68719476736;
parameter    ap_ST_fsm_state38 = 50'd137438953472;
parameter    ap_ST_fsm_state39 = 50'd274877906944;
parameter    ap_ST_fsm_state40 = 50'd549755813888;
parameter    ap_ST_fsm_state41 = 50'd1099511627776;
parameter    ap_ST_fsm_state42 = 50'd2199023255552;
parameter    ap_ST_fsm_state43 = 50'd4398046511104;
parameter    ap_ST_fsm_state44 = 50'd8796093022208;
parameter    ap_ST_fsm_state45 = 50'd17592186044416;
parameter    ap_ST_fsm_state46 = 50'd35184372088832;
parameter    ap_ST_fsm_state47 = 50'd70368744177664;
parameter    ap_ST_fsm_state48 = 50'd140737488355328;
parameter    ap_ST_fsm_state49 = 50'd281474976710656;
parameter    ap_ST_fsm_state50 = 50'd562949953421312;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] seed_i;
output  [31:0] seed_o;
output   seed_o_ap_vld;
output  [7:0] populacao_x_V_address0;
output   populacao_x_V_ce0;
output   populacao_x_V_we0;
output  [27:0] populacao_x_V_d0;
input  [27:0] populacao_x_V_q0;
output  [7:0] populacao_x_V_address1;
output   populacao_x_V_ce1;
input  [27:0] populacao_x_V_q1;
output  [7:0] populacao_y_V_address0;
output   populacao_y_V_ce0;
output   populacao_y_V_we0;
output  [27:0] populacao_y_V_d0;
input  [27:0] populacao_y_V_q0;
output  [7:0] populacao_y_V_address1;
output   populacao_y_V_ce1;
input  [27:0] populacao_y_V_q1;
output  [7:0] populacao_desempenho_address0;
output   populacao_desempenho_ce0;
output   populacao_desempenho_we0;
output  [27:0] populacao_desempenho_d0;
input  [27:0] populacao_desempenho_q0;
output  [7:0] populacao_desempenho_address1;
output   populacao_desempenho_ce1;
input  [27:0] populacao_desempenho_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] seed_o;
reg seed_o_ap_vld;
reg[7:0] populacao_x_V_address0;
reg populacao_x_V_ce0;
reg populacao_x_V_we0;
reg populacao_x_V_ce1;
reg[7:0] populacao_y_V_address0;
reg populacao_y_V_ce0;
reg populacao_y_V_we0;
reg populacao_y_V_ce1;
reg[7:0] populacao_desempenho_address0;
reg populacao_desempenho_ce0;
reg populacao_desempenho_we0;
reg populacao_desempenho_ce1;

(* fsm_encoding = "none" *) reg   [49:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond1_fu_387_p2;
wire    ap_CS_fsm_state17;
wire   [0:0] tmp_9_fu_494_p2;
wire    ap_CS_fsm_state32;
wire   [0:0] tmp_1_fu_504_p2;
wire   [5:0] i_2_fu_393_p2;
reg   [5:0] i_2_reg_598;
wire  signed [7:0] parent1_1_fu_449_p3;
reg  signed [7:0] parent1_1_reg_608;
wire    ap_CS_fsm_state16;
wire  signed [8:0] parent1_1_cast_fu_457_p1;
reg  signed [8:0] parent1_1_cast_reg_614;
wire   [7:0] parent2_2_fu_477_p3;
wire   [7:0] tmp_18_fu_500_p1;
wire    ap_CS_fsm_state31;
wire   [7:0] tmp_19_fu_522_p1;
wire    ap_CS_fsm_state46;
reg   [27:0] new1_x_V_reg_670;
wire    ap_CS_fsm_state47;
reg   [27:0] new1_y_V_reg_675;
reg   [27:0] new2_x_V_reg_681;
wire   [7:0] j_1_fu_570_p2;
wire    ap_CS_fsm_state48;
wire   [7:0] i_1_fu_582_p2;
reg   [7:0] i_1_reg_694;
wire    ap_CS_fsm_state49;
wire   [63:0] tmp_8_fu_588_p1;
reg   [63:0] tmp_8_reg_699;
wire   [0:0] exitcond_fu_576_p2;
reg   [7:0] new_Populacao_x_V_address0;
reg    new_Populacao_x_V_ce0;
reg    new_Populacao_x_V_we0;
reg   [27:0] new_Populacao_x_V_d0;
wire   [27:0] new_Populacao_x_V_q0;
reg   [7:0] new_Populacao_x_V_address1;
reg    new_Populacao_x_V_ce1;
reg    new_Populacao_x_V_we1;
reg   [27:0] new_Populacao_x_V_d1;
reg   [7:0] new_Populacao_y_V_address0;
reg    new_Populacao_y_V_ce0;
reg    new_Populacao_y_V_we0;
reg   [27:0] new_Populacao_y_V_d0;
wire   [27:0] new_Populacao_y_V_q0;
reg   [7:0] new_Populacao_y_V_address1;
reg    new_Populacao_y_V_ce1;
reg    new_Populacao_y_V_we1;
reg   [27:0] new_Populacao_y_V_d1;
reg   [7:0] new_Populacao_desemp_address0;
reg    new_Populacao_desemp_ce0;
reg    new_Populacao_desemp_we0;
wire   [27:0] new_Populacao_desemp_q0;
wire   [7:0] new_Populacao_desemp_address1;
reg    new_Populacao_desemp_ce1;
reg    new_Populacao_desemp_we1;
reg   [7:0] j_reg_278;
reg   [5:0] i_reg_290;
reg  signed [7:0] parent_reg_301;
reg  signed [7:0] parent2_1_reg_311;
reg   [7:0] i1_reg_321;
wire    ap_CS_fsm_state50;
wire  signed [63:0] tmp_4_fu_509_p1;
wire  signed [63:0] tmp_6_fu_515_p1;
wire   [63:0] tmp_10_fu_526_p1;
wire   [63:0] tmp_12_fu_539_p1;
wire   [63:0] tmp_14_fu_552_p1;
wire   [63:0] tmp_16_fu_564_p1;
wire   [31:0] grp_fu_358_p2;
wire   [31:0] tmp_2_fu_375_p2;
wire   [31:0] tmp_5_fu_421_p2;
wire   [10:0] grp_fu_336_p4;
wire   [10:0] grp_fu_352_p0;
wire   [7:0] grp_fu_352_p1;
wire   [10:0] rhs_V_i1_fu_399_p4;
wire   [10:0] grp_fu_415_p0;
wire   [7:0] grp_fu_415_p1;
wire   [7:0] grp_fu_352_p2;
wire   [7:0] tmp_fu_433_p1;
wire   [0:0] abscond_fu_443_p2;
wire   [7:0] neg_fu_437_p2;
wire   [7:0] grp_fu_415_p2;
wire   [7:0] tmp_17_fu_461_p1;
wire   [0:0] abscond1_fu_471_p2;
wire   [7:0] neg1_fu_465_p2;
wire  signed [8:0] parent_cast_fu_485_p1;
wire   [8:0] tmp_7_fu_489_p2;
wire   [7:0] tmp_11_fu_533_p2;
wire   [7:0] tmp_13_fu_546_p2;
wire   [7:0] tmp_15_fu_558_p2;
reg    grp_fu_352_ap_start;
wire    grp_fu_352_ap_done;
reg    grp_fu_415_ap_start;
wire    grp_fu_415_ap_done;
reg   [49:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 50'd1;
end

reproducao_new_PoeOg #(
    .DataWidth( 28 ),
    .AddressRange( 200 ),
    .AddressWidth( 8 ))
new_Populacao_x_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(new_Populacao_x_V_address0),
    .ce0(new_Populacao_x_V_ce0),
    .we0(new_Populacao_x_V_we0),
    .d0(new_Populacao_x_V_d0),
    .q0(new_Populacao_x_V_q0),
    .address1(new_Populacao_x_V_address1),
    .ce1(new_Populacao_x_V_ce1),
    .we1(new_Populacao_x_V_we1),
    .d1(new_Populacao_x_V_d1)
);

reproducao_new_PoeOg #(
    .DataWidth( 28 ),
    .AddressRange( 200 ),
    .AddressWidth( 8 ))
new_Populacao_y_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(new_Populacao_y_V_address0),
    .ce0(new_Populacao_y_V_ce0),
    .we0(new_Populacao_y_V_we0),
    .d0(new_Populacao_y_V_d0),
    .q0(new_Populacao_y_V_q0),
    .address1(new_Populacao_y_V_address1),
    .ce1(new_Populacao_y_V_ce1),
    .we1(new_Populacao_y_V_we1),
    .d1(new_Populacao_y_V_d1)
);

reproducao_new_PoeOg #(
    .DataWidth( 28 ),
    .AddressRange( 200 ),
    .AddressWidth( 8 ))
new_Populacao_desemp_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(new_Populacao_desemp_address0),
    .ce0(new_Populacao_desemp_ce0),
    .we0(new_Populacao_desemp_we0),
    .d0(populacao_desempenho_q0),
    .q0(new_Populacao_desemp_q0),
    .address1(new_Populacao_desemp_address1),
    .ce1(new_Populacao_desemp_ce1),
    .we1(new_Populacao_desemp_we1),
    .d1(populacao_desempenho_q1)
);

ga_top_srem_11ns_hbi #(
    .ID( 1 ),
    .NUM_STAGE( 15 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 8 ))
ga_top_srem_11ns_hbi_U19(
    .clk(ap_clk),
    .reset(ap_rst),
    .start(grp_fu_352_ap_start),
    .done(grp_fu_352_ap_done),
    .din0(grp_fu_352_p0),
    .din1(grp_fu_352_p1),
    .ce(1'b1),
    .dout(grp_fu_352_p2)
);

ga_top_srem_11ns_hbi #(
    .ID( 1 ),
    .NUM_STAGE( 15 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 8 ))
ga_top_srem_11ns_hbi_U20(
    .clk(ap_clk),
    .reset(ap_rst),
    .start(grp_fu_415_ap_start),
    .done(grp_fu_415_ap_done),
    .din0(grp_fu_415_p0),
    .din1(grp_fu_415_p1),
    .ce(1'b1),
    .dout(grp_fu_415_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd1))) begin
        i1_reg_321 <= 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state50)) begin
        i1_reg_321 <= i_1_reg_694;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        i_reg_290 <= i_2_reg_598;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_290 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        j_reg_278 <= j_1_fu_570_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_reg_278 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state17) & (tmp_9_fu_494_p2 == 1'd0))) begin
        parent2_1_reg_311 <= parent_reg_301;
    end else if ((1'b1 == ap_CS_fsm_state46)) begin
        parent2_1_reg_311 <= tmp_19_fu_522_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state31)) begin
        parent_reg_301 <= tmp_18_fu_500_p1;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        parent_reg_301 <= parent2_2_fu_477_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state49)) begin
        i_1_reg_694 <= i_1_fu_582_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_2_reg_598 <= i_2_fu_393_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        new1_x_V_reg_670 <= populacao_x_V_q0;
        new1_y_V_reg_675 <= populacao_y_V_q0;
        new2_x_V_reg_681 <= populacao_x_V_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        parent1_1_cast_reg_614 <= parent1_1_cast_fu_457_p1;
        parent1_1_reg_608 <= parent1_1_fu_449_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state49) & (exitcond_fu_576_p2 == 1'd0))) begin
        tmp_8_reg_699[7 : 0] <= tmp_8_fu_588_p1[7 : 0];
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state49) & (exitcond_fu_576_p2 == 1'd1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state49) & (exitcond_fu_576_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state32) & (tmp_1_fu_504_p2 == 1'd1)) | ((1'b1 == ap_CS_fsm_state17) & (tmp_9_fu_494_p2 == 1'd1)) | ((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd0)))) begin
        grp_fu_352_ap_start = 1'b1;
    end else begin
        grp_fu_352_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd0))) begin
        grp_fu_415_ap_start = 1'b1;
    end else begin
        grp_fu_415_ap_start = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state49)) begin
        new_Populacao_desemp_address0 = tmp_8_fu_588_p1;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_desemp_address0 = tmp_10_fu_526_p1;
    end else begin
        new_Populacao_desemp_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state49) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_desemp_ce0 = 1'b1;
    end else begin
        new_Populacao_desemp_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_desemp_ce1 = 1'b1;
    end else begin
        new_Populacao_desemp_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_desemp_we0 = 1'b1;
    end else begin
        new_Populacao_desemp_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_desemp_we1 = 1'b1;
    end else begin
        new_Populacao_desemp_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state49)) begin
        new_Populacao_x_V_address0 = tmp_8_fu_588_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_x_V_address0 = tmp_14_fu_552_p1;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_x_V_address0 = tmp_10_fu_526_p1;
    end else begin
        new_Populacao_x_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_x_V_address1 = tmp_16_fu_564_p1;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_x_V_address1 = tmp_12_fu_539_p1;
    end else begin
        new_Populacao_x_V_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state49) | (1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_x_V_ce0 = 1'b1;
    end else begin
        new_Populacao_x_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_x_V_ce1 = 1'b1;
    end else begin
        new_Populacao_x_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_x_V_d0 = new1_x_V_reg_670;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_x_V_d0 = populacao_x_V_q0;
    end else begin
        new_Populacao_x_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_x_V_d1 = new2_x_V_reg_681;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_x_V_d1 = populacao_x_V_q1;
    end else begin
        new_Populacao_x_V_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_x_V_we0 = 1'b1;
    end else begin
        new_Populacao_x_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_x_V_we1 = 1'b1;
    end else begin
        new_Populacao_x_V_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state49)) begin
        new_Populacao_y_V_address0 = tmp_8_fu_588_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_y_V_address0 = tmp_14_fu_552_p1;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_y_V_address0 = tmp_10_fu_526_p1;
    end else begin
        new_Populacao_y_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_y_V_address1 = tmp_16_fu_564_p1;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_y_V_address1 = tmp_12_fu_539_p1;
    end else begin
        new_Populacao_y_V_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state49) | (1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_y_V_ce0 = 1'b1;
    end else begin
        new_Populacao_y_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_y_V_ce1 = 1'b1;
    end else begin
        new_Populacao_y_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_y_V_d0 = new1_y_V_reg_675;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_y_V_d0 = populacao_y_V_q1;
    end else begin
        new_Populacao_y_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        new_Populacao_y_V_d1 = new1_y_V_reg_675;
    end else if ((1'b1 == ap_CS_fsm_state47)) begin
        new_Populacao_y_V_d1 = populacao_y_V_q0;
    end else begin
        new_Populacao_y_V_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_y_V_we0 = 1'b1;
    end else begin
        new_Populacao_y_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state47))) begin
        new_Populacao_y_V_we1 = 1'b1;
    end else begin
        new_Populacao_y_V_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_desempenho_address0 = tmp_8_reg_699;
    end else if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_desempenho_address0 = tmp_4_fu_509_p1;
    end else begin
        populacao_desempenho_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state32))) begin
        populacao_desempenho_ce0 = 1'b1;
    end else begin
        populacao_desempenho_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_desempenho_ce1 = 1'b1;
    end else begin
        populacao_desempenho_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_desempenho_we0 = 1'b1;
    end else begin
        populacao_desempenho_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_x_V_address0 = tmp_8_reg_699;
    end else if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_x_V_address0 = tmp_4_fu_509_p1;
    end else begin
        populacao_x_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state32))) begin
        populacao_x_V_ce0 = 1'b1;
    end else begin
        populacao_x_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_x_V_ce1 = 1'b1;
    end else begin
        populacao_x_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_x_V_we0 = 1'b1;
    end else begin
        populacao_x_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_y_V_address0 = tmp_8_reg_699;
    end else if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_y_V_address0 = tmp_6_fu_515_p1;
    end else begin
        populacao_y_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state32))) begin
        populacao_y_V_ce0 = 1'b1;
    end else begin
        populacao_y_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        populacao_y_V_ce1 = 1'b1;
    end else begin
        populacao_y_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state50)) begin
        populacao_y_V_we0 = 1'b1;
    end else begin
        populacao_y_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd0))) begin
        seed_o = tmp_5_fu_421_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        seed_o = tmp_2_fu_375_p2;
    end else if ((((1'b1 == ap_CS_fsm_state32) & (tmp_1_fu_504_p2 == 1'd1)) | ((1'b1 == ap_CS_fsm_state17) & (tmp_9_fu_494_p2 == 1'd1)))) begin
        seed_o = grp_fu_358_p2;
    end else begin
        seed_o = seed_i;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state32) & (tmp_1_fu_504_p2 == 1'd1)) | ((1'b1 == ap_CS_fsm_state17) & (tmp_9_fu_494_p2 == 1'd1)) | ((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd0)))) begin
        seed_o_ap_vld = 1'b1;
    end else begin
        seed_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_387_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state49;
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
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            if (((1'b1 == ap_CS_fsm_state17) & (tmp_9_fu_494_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state32;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state32 : begin
            if (((1'b1 == ap_CS_fsm_state32) & (tmp_1_fu_504_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state47;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state33;
            end
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state49 : begin
            if (((1'b1 == ap_CS_fsm_state49) & (exitcond_fu_576_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state50;
            end
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign abscond1_fu_471_p2 = (($signed(tmp_17_fu_461_p1) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign abscond_fu_443_p2 = (($signed(tmp_fu_433_p1) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state31 = ap_CS_fsm[32'd30];

assign ap_CS_fsm_state32 = ap_CS_fsm[32'd31];

assign ap_CS_fsm_state46 = ap_CS_fsm[32'd45];

assign ap_CS_fsm_state47 = ap_CS_fsm[32'd46];

assign ap_CS_fsm_state48 = ap_CS_fsm[32'd47];

assign ap_CS_fsm_state49 = ap_CS_fsm[32'd48];

assign ap_CS_fsm_state50 = ap_CS_fsm[32'd49];

assign exitcond1_fu_387_p2 = ((i_reg_290 == 6'd50) ? 1'b1 : 1'b0);

assign exitcond_fu_576_p2 = ((i1_reg_321 == 8'd200) ? 1'b1 : 1'b0);

assign grp_fu_336_p4 = {{seed_i[11:1]}};

assign grp_fu_352_p0 = (11'd980 - grp_fu_336_p4);

assign grp_fu_352_p1 = 11'd100;

assign grp_fu_358_p2 = (32'd5000000 + seed_i);

assign grp_fu_415_p0 = (11'd980 - rhs_V_i1_fu_399_p4);

assign grp_fu_415_p1 = 11'd100;

assign i_1_fu_582_p2 = (i1_reg_321 + 8'd1);

assign i_2_fu_393_p2 = (i_reg_290 + 6'd1);

assign j_1_fu_570_p2 = (j_reg_278 + 8'd4);

assign neg1_fu_465_p2 = (8'd0 - tmp_17_fu_461_p1);

assign neg_fu_437_p2 = (8'd0 - tmp_fu_433_p1);

assign new_Populacao_desemp_address1 = tmp_12_fu_539_p1;

assign parent1_1_cast_fu_457_p1 = parent1_1_fu_449_p3;

assign parent1_1_fu_449_p3 = ((abscond_fu_443_p2[0:0] === 1'b1) ? tmp_fu_433_p1 : neg_fu_437_p2);

assign parent2_2_fu_477_p3 = ((abscond1_fu_471_p2[0:0] === 1'b1) ? tmp_17_fu_461_p1 : neg1_fu_465_p2);

assign parent_cast_fu_485_p1 = parent_reg_301;

assign populacao_desempenho_address1 = tmp_6_fu_515_p1;

assign populacao_desempenho_d0 = new_Populacao_desemp_q0;

assign populacao_x_V_address1 = tmp_6_fu_515_p1;

assign populacao_x_V_d0 = new_Populacao_x_V_q0;

assign populacao_y_V_address1 = tmp_4_fu_509_p1;

assign populacao_y_V_d0 = new_Populacao_y_V_q0;

assign rhs_V_i1_fu_399_p4 = {{grp_fu_358_p2[11:1]}};

assign tmp_10_fu_526_p1 = j_reg_278;

assign tmp_11_fu_533_p2 = (j_reg_278 | 8'd1);

assign tmp_12_fu_539_p1 = tmp_11_fu_533_p2;

assign tmp_13_fu_546_p2 = (j_reg_278 | 8'd2);

assign tmp_14_fu_552_p1 = tmp_13_fu_546_p2;

assign tmp_15_fu_558_p2 = (j_reg_278 | 8'd3);

assign tmp_16_fu_564_p1 = tmp_15_fu_558_p2;

assign tmp_17_fu_461_p1 = grp_fu_415_p2[7:0];

assign tmp_18_fu_500_p1 = grp_fu_352_p2[7:0];

assign tmp_19_fu_522_p1 = grp_fu_352_p2[7:0];

assign tmp_1_fu_504_p2 = ((parent1_1_reg_608 == parent2_1_reg_311) ? 1'b1 : 1'b0);

assign tmp_2_fu_375_p2 = (seed_i + 32'd5000000);

assign tmp_4_fu_509_p1 = parent1_1_reg_608;

assign tmp_5_fu_421_p2 = (32'd10000000 + seed_i);

assign tmp_6_fu_515_p1 = parent2_1_reg_311;

assign tmp_7_fu_489_p2 = ($signed(parent1_1_cast_reg_614) - $signed(parent_cast_fu_485_p1));

assign tmp_8_fu_588_p1 = i1_reg_321;

assign tmp_9_fu_494_p2 = (($signed(tmp_7_fu_489_p2) > $signed(9'd25)) ? 1'b1 : 1'b0);

assign tmp_fu_433_p1 = grp_fu_352_p2[7:0];

always @ (posedge ap_clk) begin
    tmp_8_reg_699[63:8] <= 56'b00000000000000000000000000000000000000000000000000000000;
end

endmodule //reproducao
