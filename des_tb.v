`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2019 10:12:32 PM
// Design Name: 
// Module Name: des_tb
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
module des_tb();
reg clk;
reg reset;
reg [63:0] key;
wire done1;
wire done2;
reg [63:0] encrypt;
reg [63:0] decrypt;
wire[63:0] encryptedData;
wire[63:0] decryptedData;

DES_Encrypt U(.clk(clk), .reset(reset), .dataIn(encrypt), .decrypt(1'b0), .dataOut(encryptedData), .key(key), .done(done1));
DES_Encrypt D(.clk(clk), .reset(reset), .dataIn(decrypt), .decrypt(1'b1), .dataOut(decryptedData), .key(key), .done(done2));

always #5 clk = ~clk;
initial 
begin
    clk=0;
    reset = 1;
    #20;
    reset = 0;
    key <= 64'hAABB09182736CCDD;
    //dataIn <= 64'h123456ABCD132536;
    encrypt <= 64'h123456ABCD132536;
    decrypt <= 64'hC0B7A8D05F3A829C;
end

endmodule
