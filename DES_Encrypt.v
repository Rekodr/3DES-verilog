`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 12:17:05 PM
// Design Name: 
// Module Name: DES_Encrypt
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
module DES_Encrypt(clk, reset, dataIn, decrypt, dataOut, key, done);
input clk;
input reset;
input decrypt;
input [63:0] dataIn;
input [63:0] key;
output[63:0] dataOut;
output done;
reg counter;
wire doneRnd;
wire [63:0] IP;
wire [63:0] ROUNDS_OUT;
initial_permutation U1(.clk(clk), .dataIn(dataIn), .dataOut(IP));
rounds R(.clk(clk), .reset(reset), .dataIn(IP), .decrypt(decrypt), .dataOut(ROUNDS_OUT), .key(key), .done(doneRnd));
final_permutation U2(.clk(clk), .dataIn(ROUNDS_OUT), .dataOut(dataOut));
assign done = doneRnd;
endmodule