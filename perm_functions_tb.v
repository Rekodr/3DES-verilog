`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:23:08 PM
// Design Name: 
// Module Name: perm_functions_tb
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


module perm_functions_tb();
//`include "permutation_functions.v"
reg clk;
reg [63:0] data;
wire [63:0] perm_data;
wire [63:0] dt;
initial_permutation U1(.clk(clk), .dataIn(data), .dataOut(perm_data));
final_permutation U2(.clk(clk), .dataIn(perm_data), .dataOut(dt));

always #10 clk = ~clk;
initial 
begin
    clk = 0;
    data <= 64'h0;
    #10;
    data <= 64'h123456ABCD132536;    //0002_0000_0000_0001;
end
endmodule
