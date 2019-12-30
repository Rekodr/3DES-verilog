`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 04:39:54 PM
// Design Name: 
// Module Name: rounds
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


module rounds(clk, reset, dataIn, decrypt, dataOut, key, done);
input clk;
input reset;
input decrypt;
input [63:0] dataIn;
input [63:0] key;
output[63:0] dataOut;
output done;

reg done;
reg [2:0] ack;
reg clear;
reg [63:0] dataOut;
reg [7:0] counter;
wire [47:0] K[16:1];
reg [31:0] R0;
reg [31:0] L0;
wire [31:0] R[16:1];
wire [31:0] L[16:1];



keys_generator U1(
    clk,
    key,
    decrypt,
    K[1],
    K[2],
    K[3],
    K[4],
    K[5],
    K[6],
    K[7],
    K[8],
    K[9],
    K[10],
    K[11],
    K[12],
    K[13],
    K[14],
    K[15],
    K[16]
);

round R1(clk, L0, R0, K[1], 1'b1, L[1], R[1]);
round R2(clk, L[1], R[1], K[2], 1'b1, L[2], R[2]);
round R3(clk, L[2], R[2], K[3], 1'b1, L[3], R[3]);
round R4(clk, L[3], R[3], K[4], 1'b1, L[4], R[4]);
round R5(clk, L[4], R[4], K[5], 1'b1, L[5], R[5]);
round R6(clk, L[5], R[5], K[6], 1'b1, L[6], R[6]);
round R7(clk, L[6], R[6], K[7], 1'b1, L[7], R[7]);
round R8(clk, L[7], R[7], K[8], 1'b1, L[8], R[8]);
round R9(clk, L[8], R[8], K[9], 1'b1, L[9], R[9]);
round R10(clk, L[9], R[9], K[10], 1'b1, L[10], R[10]);
round R11(clk, L[10], R[10], K[11], 1'b1, L[11], R[11]);
round R12(clk, L[11], R[11], K[12], 1'b1, L[12], R[12]);
round R13(clk, L[12], R[12], K[13], 1'b1, L[13], R[13]);
round R14(clk, L[13], R[13], K[14], 1'b1, L[14], R[14]);
round R15(clk, L[14], R[14], K[15], 1'b1, L[15], R[15]);
round R16(clk, L[15], R[15], K[16], 1'b0, L[16], R[16]);

// split data in left and right block
wire [63:0] tmp1;
reg [63:0] tmp2;
reg [63:0] tmp3;
reg [63:0] tmp4;
reg [63:0] tmp5;
reg c;

assign tmp1 = { L[16], R[16] };

always @(posedge clk)
begin
    if(reset) begin
        done <= 1'b0;
        c <= 1'b0;
    end
    else begin 
        if(c == 1'b1)
            if(tmp5 == tmp1)
                done <= 1'b1;
        tmp2 <= tmp1;
        tmp3 <= tmp2;
        tmp4 <= tmp3;
        tmp5 <= tmp4;
        c <= 1'b1;
        { L0, R0 } <= dataIn;

    end

end

always @(posedge clk)
begin
        if(done) begin
            dataOut <= tmp4;
        end
        else begin
            dataOut <= 0;
        end
end

endmodule