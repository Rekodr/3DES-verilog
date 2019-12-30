`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:36:08 PM
// Design Name: 
// Module Name: initial_permutation
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


module initial_permutation(clk, dataIn, dataOut);
parameter MAXBITS = 64;
input clk;
input [MAXBITS - 1 : 0] dataIn;
output reg [MAXBITS - 1 : 0] dataOut;

function [MAXBITS - 1 : 0] permutation;
    input [MAXBITS - 1 : 0] data;
    //reg [MAXBITS - 1: 0] perm_data;
    integer permutation_table[MAXBITS - 1 : 0];
    integer i;
    begin
        // permutation based on perm table -> see  https://academic.csuohio.edu/yuc/security/Chapter_06_Data_Encription_Standard.pdf
        permutation_table[0] = 57;
        permutation_table[1] = 49;
        permutation_table[2] = 41;
        permutation_table[3] = 33;
        permutation_table[4] = 25;
        permutation_table[5] = 17;
        permutation_table[6] = 9;
        permutation_table[7] = 1;
        permutation_table[8] = 59;
        permutation_table[9] = 51;
        permutation_table[10] = 43;
        permutation_table[11] = 35;
        permutation_table[12] = 27;
        permutation_table[13] = 19;
        permutation_table[14] = 11;
        permutation_table[15] = 3;
        permutation_table[16] = 61;
        permutation_table[17] = 53;
        permutation_table[18] = 45;
        permutation_table[19] = 37;
        permutation_table[20] = 29;
        permutation_table[21] = 21;
        permutation_table[22] = 13;
        permutation_table[23] = 5;
        permutation_table[24] = 63;
        permutation_table[25] = 55;
        permutation_table[26] = 47;
        permutation_table[27] = 39;
        permutation_table[28] = 31;
        permutation_table[29] = 23;
        permutation_table[30] = 15;
        permutation_table[31] = 7;
        permutation_table[32] = 56;
        permutation_table[33] = 48;
        permutation_table[34] = 40;
        permutation_table[35] = 32;
        permutation_table[36] = 24;
        permutation_table[37] = 16;
        permutation_table[38] = 8;
        permutation_table[39] = 0;
        permutation_table[40] = 58;
        permutation_table[41] = 50;
        permutation_table[42] = 42;
        permutation_table[43] = 34;
        permutation_table[44] = 26;
        permutation_table[45] = 18;
        permutation_table[46] = 10;
        permutation_table[47] = 2;
        permutation_table[48] = 60;
        permutation_table[49] = 52;
        permutation_table[50] = 44;
        permutation_table[51] = 36;
        permutation_table[52] = 28;
        permutation_table[53] = 20;
        permutation_table[54] = 12;
        permutation_table[55] = 4;
        permutation_table[56] = 62;
        permutation_table[57] = 54;
        permutation_table[58] = 46;
        permutation_table[59] = 38;
        permutation_table[60] = 30;
        permutation_table[61] = 22;
        permutation_table[62] = 14;
        permutation_table[63] = 6;
        
        // permutation based on perm table
        for(i=0; i < MAXBITS; i = i+1)
            permutation[i] = data[permutation_table[i]];
    end
endfunction 

always @ (clk, dataIn)
    dataOut = permutation(dataIn);
endmodule
