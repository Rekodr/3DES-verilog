`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2019 06:04:30 PM
// Design Name: 
// Module Name: rounds_tb
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


module rounds_tb();
reg clk;
reg reset;
reg [63:0] encrypt;
reg [63:0] decrypt;
reg [63:0] key;
wire[63:0] encryptedData;
wire[63:0] decryptedData;

wire done1;
wire done2;
rounds U1(.clk(clk), .reset(reset), .dataIn(encrypt), .decrypt(1'b0), .dataOut(encryptedData), .key(key), .done(done1));
rounds U2(.clk(clk), .reset(reset), .dataIn(decrypt), .decrypt(1'b1), .dataOut(decryptedData), .key(key), .done(done2));

always #5 clk = ~clk;

initial 
begin
    clk=0;
    reset = 1;
    #20;
    reset = 0;
    #10;
    key <= 64'hAABB09182736CCDD;
    encrypt <= 64'h14A7D67818CA18AD;
    decrypt <= 64'h19BA9212CF26B472;
end

endmodule
