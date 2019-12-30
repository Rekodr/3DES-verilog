`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 10:03:49 PM
// Design Name: 
// Module Name: keys_gen_tb
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


module keys_gen_tb();
reg clk;
reg  [63:0] key;
wire [47:0] subkey1;
wire [47:0] subkey2;
wire [47:0] subkey3;
wire [47:0] subkey4;
wire [47:0] subkey5;
wire [47:0] subkey6;
wire [47:0] subkey7;
wire [47:0] subkey8;
wire [47:0] subkey9;
wire [47:0] subkey10;
wire [47:0] subkey11;
wire [47:0] subkey12;
wire [47:0] subkey13;
wire [47:0] subkey14;
wire [47:0] subkey15;
wire [47:0] subkey16;

keys_generator U1(
clk,
key,
1'b0,
subkey1,
subkey2,
subkey3,
subkey4,
subkey5,
subkey6,
subkey7,
subkey8,
subkey9,
subkey10,
subkey11,
subkey12,
subkey13,
subkey14,
subkey15,
subkey16
);

always #10 clk = ~clk; 

initial 
begin 
 clk = 0;
 key <= 64'b0;
 #20;
 key <= 64'hAABB09182736CCDD;
end

endmodule
