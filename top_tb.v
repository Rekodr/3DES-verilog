`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 07:24:58 PM
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

reg clk;
reg reset;
reg start;
wire [0:7] data_addr;
wire [0:7] key_addr;
wire [63:0] dataOut;
wire [2:0] done;
wire we;
wire [1:0]stage;

reg [63:0] memKey;
reg [63:0] memData;

main U1(
.clk(clk), 
.reset(reset), 
.start(start),
.done(done),
.key_addr(key_addr),
.key(memKey),
.data_addr(data_addr),
.dataIn(memData),
.dataOut(dataOut),
.encryp_data_addr(8'h40),
.we(we),
.des_stage(stage));

//blk_mem_gen_0 data_mem (
//  .clka(clk),    // input wire clka
//  .wea(we),      // input wire [0 : 0] wea
//  .addra(data_addr),  // input wire [7 : 0] addra
//  .dina(dataOut),    // input wire [63 : 0] dina
//  .douta(memData)  // output wire [63 : 0] douta
//);

//key_bram key_mem (
//  .clka(clk),    // input wire clka
//  .wea(1'b0),      // input wire [0 : 0] wea
//  .addra(data_addr),  // input wire [7 : 0] addra
//  .douta(memKey)  // output wire [63 : 0] douta
//);


always #5 clk = ~clk;


always @(negedge we)
begin
        #10;
        reset = 0;
        #10;
        reset = 1;
end

initial
begin
    clk = 0;
    reset = 0;
    memData <= 64'h123456ABCD132536;
    memKey <= 64'hAABB09182736CCDD;
    #20;
    reset  = 1;
    start = 1;
end

endmodule
