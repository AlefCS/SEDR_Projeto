`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2019 21:24:23
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg clk_i;
    wire en;
    wire finished_o;
    wire [27:0] x_o;
    wire [27:0] y_o;
    wire [27:0] z_o;
    
    reg middle_en = 0;
    assign en = middle_en;
    
    initial begin
        #100
        middle_en = 1;
        @ (posedge finished_o);
        $display("X (int, real[hex]): %d,%H\n", x_o[27:17], x_o[16:0]);
        $display("Y (int, real[hex]): %d,%H\n", y_o[27:17], y_o[16:0]);
        $display("Z (int, real[hex]): %d,%H\n", z_o[27:17], z_o[16:0]);
        @ (posedge finished_o);
        #100
        $finish;
    end
    
    /** Clock configuration **/
    // Set clk_i initial value
    initial begin
        clk_i = 0;
    end
    // Toggle clk_i after 5 time-steps
    always begin
        #5
        clk_i = ~clk_i;
    end

    top DUT (
        .CLK_i           (clk_i),
        .EN_i               (en),
        .FINISHED_o (finished_o),
        .X_o               (x_o),
        .Y_o               (y_o),
        .Z_o               (z_o)
    );

endmodule