// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module calcula_Desempenho (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        populacao_x_V_address0,
        populacao_x_V_ce0,
        populacao_x_V_q0,
        populacao_y_V_address0,
        populacao_y_V_ce0,
        populacao_y_V_q0,
        populacao_desempenho_address0,
        populacao_desempenho_ce0,
        populacao_desempenho_we0,
        populacao_desempenho_d0
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] populacao_x_V_address0;
output   populacao_x_V_ce0;
input  [27:0] populacao_x_V_q0;
output  [7:0] populacao_y_V_address0;
output   populacao_y_V_ce0;
input  [27:0] populacao_y_V_q0;
output  [7:0] populacao_desempenho_address0;
output   populacao_desempenho_ce0;
output   populacao_desempenho_we0;
output  [27:0] populacao_desempenho_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg populacao_x_V_ce0;
reg populacao_y_V_ce0;
reg populacao_desempenho_ce0;
reg populacao_desempenho_we0;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] i_6_fu_85_p2;
reg   [7:0] i_6_reg_195;
wire    ap_CS_fsm_state2;
wire   [63:0] tmp_fu_91_p1;
reg   [63:0] tmp_reg_200;
wire   [0:0] exitcond_fu_79_p2;
reg  signed [27:0] p_Val2_18_reg_215;
wire    ap_CS_fsm_state3;
reg  signed [27:0] p_Val2_16_reg_221;
wire   [55:0] p_Val2_s_fu_100_p2;
reg   [55:0] p_Val2_s_reg_227;
wire    ap_CS_fsm_state4;
wire   [55:0] p_Val2_19_fu_109_p2;
reg   [55:0] p_Val2_19_reg_232;
wire   [55:0] r_V_fu_131_p2;
reg   [55:0] r_V_reg_237;
wire    ap_CS_fsm_state5;
wire   [55:0] r_V_1_fu_153_p2;
reg   [55:0] r_V_1_reg_242;
wire  signed [78:0] tmp_3_fu_159_p1;
wire    ap_CS_fsm_state6;
wire  signed [78:0] tmp_5_fu_162_p1;
wire   [78:0] grp_fu_165_p2;
reg   [78:0] tmp_72_i_cast_reg_259;
wire    ap_CS_fsm_state7;
wire   [78:0] grp_fu_171_p2;
reg   [78:0] tmp_73_i_cast_reg_264;
reg   [7:0] i_reg_68;
wire    ap_CS_fsm_state8;
wire  signed [27:0] p_Val2_s_fu_100_p0;
wire  signed [55:0] OP1_V_fu_97_p1;
wire  signed [27:0] p_Val2_s_fu_100_p1;
wire  signed [27:0] p_Val2_19_fu_109_p0;
wire  signed [55:0] OP1_V_1_fu_106_p1;
wire  signed [27:0] p_Val2_19_fu_109_p1;
wire   [44:0] tmp_66_i_fu_115_p3;
wire  signed [55:0] tmp_66_i_cast_fu_122_p1;
wire   [55:0] p_Val2_17_fu_126_p2;
wire   [44:0] tmp_69_i_fu_137_p3;
wire  signed [55:0] tmp_69_i_cast_fu_144_p1;
wire   [55:0] p_Val2_20_fu_148_p2;
wire  signed [55:0] grp_fu_165_p0;
wire  signed [55:0] grp_fu_165_p1;
wire  signed [55:0] grp_fu_171_p0;
wire  signed [55:0] grp_fu_171_p1;
wire   [78:0] p_Val2_21_fu_177_p2;
reg   [7:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
end

ga_top_mul_56s_56bkb #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 56 ),
    .din1_WIDTH( 56 ),
    .dout_WIDTH( 79 ))
ga_top_mul_56s_56bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_165_p0),
    .din1(grp_fu_165_p1),
    .ce(1'b1),
    .dout(grp_fu_165_p2)
);

ga_top_mul_56s_56bkb #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 56 ),
    .din1_WIDTH( 56 ),
    .dout_WIDTH( 79 ))
ga_top_mul_56s_56bkb_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_171_p0),
    .din1(grp_fu_171_p1),
    .ce(1'b1),
    .dout(grp_fu_171_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        i_reg_68 <= i_6_reg_195;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_68 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_6_reg_195 <= i_6_fu_85_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        p_Val2_16_reg_221 <= populacao_y_V_q0;
        p_Val2_18_reg_215 <= populacao_x_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_Val2_19_reg_232 <= p_Val2_19_fu_109_p2;
        p_Val2_s_reg_227 <= p_Val2_s_fu_100_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        r_V_1_reg_242 <= r_V_1_fu_153_p2;
        r_V_reg_237 <= r_V_fu_131_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        tmp_72_i_cast_reg_259 <= grp_fu_165_p2;
        tmp_73_i_cast_reg_264 <= grp_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_79_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_200[7 : 0] <= tmp_fu_91_p1[7 : 0];
    end
end

always @ (*) begin
    if ((((exitcond_fu_79_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((exitcond_fu_79_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        populacao_desempenho_ce0 = 1'b1;
    end else begin
        populacao_desempenho_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        populacao_desempenho_we0 = 1'b1;
    end else begin
        populacao_desempenho_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        populacao_x_V_ce0 = 1'b1;
    end else begin
        populacao_x_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        populacao_y_V_ce0 = 1'b1;
    end else begin
        populacao_y_V_ce0 = 1'b0;
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
            if (((exitcond_fu_79_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OP1_V_1_fu_106_p1 = p_Val2_16_reg_221;

assign OP1_V_fu_97_p1 = p_Val2_18_reg_215;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign exitcond_fu_79_p2 = ((i_reg_68 == 8'd200) ? 1'b1 : 1'b0);

assign grp_fu_165_p0 = tmp_3_fu_159_p1;

assign grp_fu_165_p1 = tmp_3_fu_159_p1;

assign grp_fu_171_p0 = tmp_5_fu_162_p1;

assign grp_fu_171_p1 = tmp_5_fu_162_p1;

assign i_6_fu_85_p2 = (i_reg_68 + 8'd1);

assign p_Val2_17_fu_126_p2 = ($signed(p_Val2_s_reg_227) + $signed(tmp_66_i_cast_fu_122_p1));

assign p_Val2_19_fu_109_p0 = OP1_V_1_fu_106_p1;

assign p_Val2_19_fu_109_p1 = OP1_V_1_fu_106_p1;

assign p_Val2_19_fu_109_p2 = ($signed(p_Val2_19_fu_109_p0) * $signed(p_Val2_19_fu_109_p1));

assign p_Val2_20_fu_148_p2 = ($signed(p_Val2_19_reg_232) + $signed(tmp_69_i_cast_fu_144_p1));

assign p_Val2_21_fu_177_p2 = (tmp_72_i_cast_reg_259 + tmp_73_i_cast_reg_264);

assign p_Val2_s_fu_100_p0 = OP1_V_fu_97_p1;

assign p_Val2_s_fu_100_p1 = OP1_V_fu_97_p1;

assign p_Val2_s_fu_100_p2 = ($signed(p_Val2_s_fu_100_p0) * $signed(p_Val2_s_fu_100_p1));

assign populacao_desempenho_address0 = tmp_reg_200;

assign populacao_desempenho_d0 = {{p_Val2_21_fu_177_p2[78:51]}};

assign populacao_x_V_address0 = tmp_fu_91_p1;

assign populacao_y_V_address0 = tmp_fu_91_p1;

assign r_V_1_fu_153_p2 = ($signed(p_Val2_20_fu_148_p2) + $signed(56'd72057473778843648));

assign r_V_fu_131_p2 = ($signed(p_Val2_17_fu_126_p2) + $signed(56'd72057405059366912));

assign tmp_3_fu_159_p1 = $signed(r_V_reg_237);

assign tmp_5_fu_162_p1 = $signed(r_V_1_reg_242);

assign tmp_66_i_cast_fu_122_p1 = $signed(tmp_66_i_fu_115_p3);

assign tmp_66_i_fu_115_p3 = {{p_Val2_16_reg_221}, {17'd0}};

assign tmp_69_i_cast_fu_144_p1 = $signed(tmp_69_i_fu_137_p3);

assign tmp_69_i_fu_137_p3 = {{p_Val2_18_reg_215}, {17'd0}};

assign tmp_fu_91_p1 = i_reg_68;

always @ (posedge ap_clk) begin
    tmp_reg_200[63:8] <= 56'b00000000000000000000000000000000000000000000000000000000;
end

endmodule //calcula_Desempenho
