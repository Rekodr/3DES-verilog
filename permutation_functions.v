`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:14:24 PM
// Design Name: 
// Module Name: permutation_functions
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

function [63:0] initial_permutation;
    input [63:0] data;
    reg [63:0] perm_data;
    integer permutation_table[63:0];
    integer i;
    begin
        // permutation based on perm table -> see  https://academic.csuohio.edu/yuc/security/Chapter_06_Data_Encription_Standard.pdf
        permutation_table[0] = 58;
        permutation_table[1] = 50;
        permutation_table[2] = 42;
        permutation_table[3] = 34;
        permutation_table[4] = 26;
        permutation_table[5] = 18;
        permutation_table[6] = 10;
        permutation_table[7] = 02;
        permutation_table[8] = 60;
        permutation_table[9] = 52;
        permutation_table[10] = 44;
        permutation_table[11] = 36;
        permutation_table[12] = 28;
        permutation_table[13] = 20;
        permutation_table[14] = 12;
        permutation_table[15] = 04;
        permutation_table[16] = 62;
        permutation_table[17] = 54;
        permutation_table[18] = 46;
        permutation_table[19] = 38;
        permutation_table[20] = 30;
        permutation_table[21] = 22;
        permutation_table[22] = 14;
        permutation_table[23] = 06;
        permutation_table[24] = 64;
        permutation_table[25] = 56;
        permutation_table[26] = 48;
        permutation_table[27] = 40;
        permutation_table[28] = 32;
        permutation_table[29] = 24;
        permutation_table[30] = 16;
        permutation_table[31] = 08;
        permutation_table[32] = 57;
        permutation_table[33] = 49;
        permutation_table[34] = 41;
        permutation_table[35] = 33;
        permutation_table[36] = 25;
        permutation_table[37] = 17;
        permutation_table[38] = 09;
        permutation_table[39] = 01;
        permutation_table[40] = 59;
        permutation_table[41] = 51;
        permutation_table[42] = 43;
        permutation_table[43] = 35;
        permutation_table[44] = 27;
        permutation_table[45] = 19;
        permutation_table[46] = 11;
        permutation_table[47] = 03;
        permutation_table[48] = 61;
        permutation_table[49] = 53;
        permutation_table[50] = 45;
        permutation_table[51] = 37;
        permutation_table[52] = 29;
        permutation_table[53] = 21;
        permutation_table[54] = 13;
        permutation_table[55] = 05;
        permutation_table[56] = 63;
        permutation_table[57] = 55;
        permutation_table[58] = 47;
        permutation_table[59] = 39;
        permutation_table[60] = 31;
        permutation_table[61] = 23;
        permutation_table[62] = 15;
        permutation_table[63] = 07;
        
        // permutation based on perm table
        for(i=0; i < 64; i=i+1) perm_data[i] = data[permutation_table[i]];
        
        initial_permutation = perm_data;
    end
endfunction 

function [63:0] final_permutation;
    input [63:0] data;
    reg [63:0] perm_data;
    integer permutation_table[63:0];
    integer i;

    begin
          // permutation based on perm table -> see  https://academic.csuohio.edu/yuc/security/Chapter_06_Data_Encription_Standard.pdf
        permutation_table[0] = 40;
        permutation_table[1] = 08;
        permutation_table[2] = 48;
        permutation_table[3] = 16;
        permutation_table[4] = 56;
        permutation_table[5] = 24;
        permutation_table[6] = 64;
        permutation_table[7] = 32;
        permutation_table[8] = 39;
        permutation_table[9] = 07;
        permutation_table[10] = 47;
        permutation_table[11] = 15;
        permutation_table[12] = 55;
        permutation_table[13] = 23;
        permutation_table[14] = 63;
        permutation_table[15] = 31;
        permutation_table[16] = 38;
        permutation_table[17] = 06;
        permutation_table[18] = 46;
        permutation_table[19] = 14;
        permutation_table[20] = 54;
        permutation_table[21] = 22;
        permutation_table[22] = 62;
        permutation_table[23] = 30;
        permutation_table[24] = 37;
        permutation_table[25] = 05;
        permutation_table[26] = 45;
        permutation_table[27] = 13;
        permutation_table[28] = 53;
        permutation_table[29] = 21;
        permutation_table[30] = 61;
        permutation_table[31] = 29;
        permutation_table[32] = 36;
        permutation_table[33] = 04;
        permutation_table[34] = 44;
        permutation_table[35] = 12;
        permutation_table[36] = 52;
        permutation_table[37] = 20;
        permutation_table[38] = 60;
        permutation_table[39] = 28;
        permutation_table[40] = 35;
        permutation_table[41] = 03;
        permutation_table[42] = 43;
        permutation_table[43] = 11;
        permutation_table[44] = 51;
        permutation_table[45] = 19;
        permutation_table[46] = 59;
        permutation_table[47] = 27;
        permutation_table[48] = 34;
        permutation_table[49] = 02;
        permutation_table[50] = 42;
        permutation_table[51] = 10;
        permutation_table[52] = 50;
        permutation_table[53] = 18;
        permutation_table[54] = 58;
        permutation_table[55] = 26;
        permutation_table[56] = 33;
        permutation_table[57] = 01;
        permutation_table[58] = 41;
        permutation_table[59] = 09;
        permutation_table[60] = 49;
        permutation_table[61] = 17;
        permutation_table[62] = 57;
        permutation_table[63] = 25;
      
         // permutation based on perm table
        for(i=0; i < 64; i=i+1) perm_data[i] = data[permutation_table[i]];
        
        final_permutation = perm_data;
    end    
endfunction