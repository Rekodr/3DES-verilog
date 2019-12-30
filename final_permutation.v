`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:44:33 PM
// Design Name: 
// Module Name: final_permutation
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


module final_permutation(clk, dataIn, dataOut);
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
        permutation_table[0] = 39;
        permutation_table[1] = 7;
        permutation_table[2] = 47;
        permutation_table[3] = 15;
        permutation_table[4] = 55;
        permutation_table[5] = 23;
        permutation_table[6] = 63;
        permutation_table[7] = 31;
        permutation_table[8] = 38;
        permutation_table[9] = 6;
        permutation_table[10] = 46;
        permutation_table[11] = 14;
        permutation_table[12] = 54;
        permutation_table[13] = 22;
        permutation_table[14] = 62;
        permutation_table[15] = 30;
        permutation_table[16] = 37;
        permutation_table[17] = 5;
        permutation_table[18] = 45;
        permutation_table[19] = 13;
        permutation_table[20] = 53;
        permutation_table[21] = 21;
        permutation_table[22] = 61;
        permutation_table[23] = 29;
        permutation_table[24] = 36;
        permutation_table[25] = 4;
        permutation_table[26] = 44;
        permutation_table[27] = 12;
        permutation_table[28] = 52;
        permutation_table[29] = 20;
        permutation_table[30] = 60;
        permutation_table[31] = 28;
        permutation_table[32] = 35;
        permutation_table[33] = 3;
        permutation_table[34] = 43;
        permutation_table[35] = 11;
        permutation_table[36] = 51;
        permutation_table[37] = 19;
        permutation_table[38] = 59;
        permutation_table[39] = 27;
        permutation_table[40] = 34;
        permutation_table[41] = 2;
        permutation_table[42] = 42;
        permutation_table[43] = 10;
        permutation_table[44] = 50;
        permutation_table[45] = 18;
        permutation_table[46] = 58;
        permutation_table[47] = 26;
        permutation_table[48] = 33;
        permutation_table[49] = 1;
        permutation_table[50] = 41;
        permutation_table[51] = 9;
        permutation_table[52] = 49;
        permutation_table[53] = 17;
        permutation_table[54] = 57;
        permutation_table[55] = 25;
        permutation_table[56] = 32;
        permutation_table[57] = 0;
        permutation_table[58] = 40;
        permutation_table[59] = 8;
        permutation_table[60] = 48;
        permutation_table[61] = 16;
        permutation_table[62] = 56;
        permutation_table[63] = 24;
        
        // permutation based on perm table
        for(i=0; i < MAXBITS; i = i+1)
            permutation[i] = data[permutation_table[i]];
    end
endfunction 

always @ (clk, dataIn)
    dataOut <= permutation(dataIn);
endmodule
