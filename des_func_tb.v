`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2019 11:25:24 AM
// Design Name: 
// Module Name: des_func_tb
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


module des_func_tb();
reg clk;
reg [31:0] dataIn;
reg [47:0] roundKey;
wire [31:0] dataOut;

des_func U1(clk, dataIn, roundKey, dataOut);

always #5 clk = ~clk;

initial 
begin
    clk = 0;
end


initial
begin 
    roundKey =  48'b000110_110000_001011_101111_111111_000111_000001_110010;
    dataIn = 32'b1111_0000_1010_1010_1111_0000_1010_1010;
end
endmodule
