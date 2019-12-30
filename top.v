`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:12 11/29/2009 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(clk, reset, start, length, stop, key_addr, key_out, data_addr, encrypt_data_addr, data_in, data_out, we);
input clk, reset;
input [0:1]start;
input [0:8]length;
input [0:8] encrypt_data_addr;

input  [0:31] data_out; //output ?
input [0:31] key_out; //input

output [0:7] key_addr;
output [0:8] data_addr;
output [0:2] stop;
output [0:31] data_in;
output we;   

wire [0:7]key_addr, en_key_addr;
wire [0:31]key_out, data_in,en_data_in, data_out;
wire [0:8]en_data_addr, data_addr;
wire [0:2]en_stop;
wire we,en_we;

assign stop = en_stop;
assign key_addr = en_key_addr;
assign we = en_we;
assign data_addr = en_data_addr;
assign data_in = (en_we) ? en_data_in : 32'h0;

/* *************** ENCRYPTION ************************ */
encrypt E1(
    .clk(clk), 
    .reset(reset), 
    .start(start), 
    .stop(en_stop),
    .key_addr(en_key_addr), 
    .key_in(key_out),
    .data_addr(en_data_addr),
    .data_in(data_out), 
    .encrypt_data(en_data_in),
    .we(en_we),
    .encrypt_data_addr(encrypt_data_addr)
);

endmodule
