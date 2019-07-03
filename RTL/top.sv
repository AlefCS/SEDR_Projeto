`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Federal University of Ceará 
// Engineer: Alef Carneiro de Sousa
//           Luca Israel de Moura Cruz
// 
// Create Date: 02.07.2019 19:29:01
// Design Name: 
// Module Name: top
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


module top(
    input CLK_i,
    input EN_i,
    output FINISHED_o,
    output [27:0] X_o,
    output [27:0] Y_o,
    output [27:0] Z_o
);

    // For 100 MHz clock, 50 clocks per bit gives 2MHz baud rate
    // parameter UART_CLKS_PER_BIT = 50;

    // reg TX_DV_r = 0;
    // reg [7:0] TX_BYTE_r = 7'b0;
    reg [4:0] clock_counter = 0;
    
    // wire TX_DONE_w;
    // wire [7:0] RX_BYTE_r;
    /*
    always @ (posedge CLK_i) begin
        clock_counter = clock_counter + 1;
        
        if (clock_counter == 20) begin
            EN = 1;
        end
    end
    */
    always @ (posedge FINISHED_o) begin
        clock_counter = 0;
    end
    
    ga_top GA_INST (
        .ap_clk                    (CLK_i),
        .ap_rst                         (),
        .ap_start                     (EN_i),
        .ap_done                        (),
        .ap_idle                        (),
        .ap_ready                       (),
        .start                        (EN_i),
        .result_finished_flag (FINISHED_o),
        .result_best_x_V             (X_o),
        .result_best_y_V             (Y_o),
        .result_best_desempen        (Z_o)
    );
    
    // Instantiate UART_TX
    /*uart_tx #(UART_CLKS_PER_BIT) UART_TX_INST (
        .i_Clock         (CLK_i),
        .i_Tx_DV       (TX_DV_r),
        .i_Tx_Byte   (TX_BYTE_r),
        .o_Tx_Active          (),
        .o_Tx_Serial (UART_TX_o),
        .o_Tx_Done   (TX_DONE_w)
    );
    
    // Instantiate UART_RX
    uart_rx #(UART_CLKS_PER_BIT) UART_RX_INST (
        .i_Clock         (CLK_i),
        .i_Rx_Serial (UART_RX_i),
        .o_Rx_DV              (),
        .o_Rx_Byte   (RX_BYTE_r)
    );*/
endmodule

module fake_ga (
    input CLK_i,
    input EN_i,
    output FINISHED_o,
    output [27:0] X_o,
    output [27:0] Y_o,
    output [27:0] Z_o
);

    assign X_o = 28'h0010000;//{{11{1'b0}}, {1'b1}, {16{1'b0}}};
    assign Y_o = 28'h0038000;//{{10{1'b0}}, {1'b1}, {2{1'b1}}, {15{1'b0}}};
    assign Z_o = 28'h007C000;//{{9{1'b0}}, {2{1'b1}}, {3{1'b1}}, {14{1'b0}}};
    
    reg [4:0] counter_clk = 0;
    reg flag = 0;
    
    assign FINISHED_o = flag;
    
    always @ (posedge CLK_i) begin
        if (EN_i) begin
            counter_clk = counter_clk + 1;
            
            if (counter_clk == 20) begin
                flag = 1;
            end
        end else begin
            counter_clk = 0;
        end
    end
    
    always @ (posedge EN_i) begin
        flag <= 0;
        counter_clk <= 0;
    end

endmodule