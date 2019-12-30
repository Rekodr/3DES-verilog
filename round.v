`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 05:26:20 PM
// Design Name: 
// Module Name: round
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


module round(clk, L, R, roundKey, swap, Ln, Rn);
input clk;
input swap;
input [47:0] roundKey;
input [31:0] L;
input [31:0] R;

output [31:0] Ln;
output [31:0] Rn;

wire [31:0] mixer;
wire [31:0] funcOut;


des_func f(.clk(clk), .dataIn(R), .roundKey(roundKey), .dataOut(funcOut));

assign mixer = L ^ funcOut;
assign Ln = (swap) ? R : mixer;
assign Rn = (swap) ? mixer : R;

endmodule
