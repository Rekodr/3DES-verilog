`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 05:38:58 PM
// Design Name: 
// Module Name: des_func
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


module des_func(clk, dataIn, roundKey, dataOut);

function [47:0] expansion;
    input [31:0] in;
    integer expansion_table[47:0];
    integer i;
    begin
        expansion_table[0] = 31;
        expansion_table[1] = 0;
        expansion_table[2] = 1;
        expansion_table[3] = 2;
        expansion_table[4] = 3;
        expansion_table[5] = 4;
        expansion_table[6] = 3;
        expansion_table[7] = 4;
        expansion_table[8] = 5;
        expansion_table[9] = 6;
        expansion_table[10] = 7;
        expansion_table[11] = 8;
        expansion_table[12] = 7;
        expansion_table[13] = 8;
        expansion_table[14] = 9;
        expansion_table[15] = 10;
        expansion_table[16] = 11;
        expansion_table[17] = 12;
        expansion_table[18] = 11;
        expansion_table[19] = 12;
        expansion_table[20] = 13;
        expansion_table[21] = 14;
        expansion_table[22] = 15;
        expansion_table[23] = 16;
        expansion_table[24] = 15;
        expansion_table[25] = 16;
        expansion_table[26] = 17;
        expansion_table[27] = 18;
        expansion_table[28] = 19;
        expansion_table[29] = 20;
        expansion_table[30] = 19;
        expansion_table[31] = 20;
        expansion_table[32] = 21;
        expansion_table[33] = 22;
        expansion_table[34] = 23;
        expansion_table[35] = 24;
        expansion_table[36] = 23;
        expansion_table[37] = 24;
        expansion_table[38] = 25;
        expansion_table[39] = 26;
        expansion_table[40] = 27;
        expansion_table[41] = 28;
        expansion_table[42] = 27;
        expansion_table[43] = 28;
        expansion_table[44] = 29;
        expansion_table[45] = 30;
        expansion_table[46] = 31;
        expansion_table[47] = 0;
        
        for(i=0; i < 48; i=i+1)
            expansion[47-i] = in[31- expansion_table[i]];
    end
endfunction 

function [3:0] sBox1;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
 			sBoxTable[0][0] = 14;
			sBoxTable[0][1] = 4;
			sBoxTable[0][2] = 13;
			sBoxTable[0][3] = 1;
			sBoxTable[0][4] = 2;
			sBoxTable[0][5] = 15;
			sBoxTable[0][6] = 11;
			sBoxTable[0][7] = 8;
			sBoxTable[0][8] = 3;
			sBoxTable[0][9] = 10;
			sBoxTable[0][10] = 6;
			sBoxTable[0][11] = 12;
			sBoxTable[0][12] = 5;
			sBoxTable[0][13] = 9;
			sBoxTable[0][14] = 0;
			sBoxTable[0][15] = 7;
			sBoxTable[1][0] = 0;
			sBoxTable[1][1] = 15;
			sBoxTable[1][2] = 7;
			sBoxTable[1][3] = 4;
			sBoxTable[1][4] = 14;
			sBoxTable[1][5] = 2;
			sBoxTable[1][6] = 13;
			sBoxTable[1][7] = 1;
			sBoxTable[1][8] = 10;
			sBoxTable[1][9] = 6;
			sBoxTable[1][10] = 12;
			sBoxTable[1][11] = 11;
			sBoxTable[1][12] = 9;
			sBoxTable[1][13] = 5;
			sBoxTable[1][14] = 3;
			sBoxTable[1][15] = 8;
			sBoxTable[2][0] = 4;
			sBoxTable[2][1] = 1;
			sBoxTable[2][2] = 14;
			sBoxTable[2][3] = 8;
			sBoxTable[2][4] = 13;
			sBoxTable[2][5] = 6;
			sBoxTable[2][6] = 2;
			sBoxTable[2][7] = 11;
			sBoxTable[2][8] = 15;
			sBoxTable[2][9] = 12;
			sBoxTable[2][10] = 9;
			sBoxTable[2][11] = 7;
			sBoxTable[2][12] = 3;
			sBoxTable[2][13] = 10;
			sBoxTable[2][14] = 5;
			sBoxTable[2][15] = 0;
			sBoxTable[3][0] = 15;
			sBoxTable[3][1] = 12;
			sBoxTable[3][2] = 8;
			sBoxTable[3][3] = 2;
			sBoxTable[3][4] = 4;
			sBoxTable[3][5] = 9;
			sBoxTable[3][6] = 1;
			sBoxTable[3][7] = 7;
			sBoxTable[3][8] = 5;
			sBoxTable[3][9] = 11;
			sBoxTable[3][10] = 3;
			sBoxTable[3][11] = 14;
			sBoxTable[3][12] = 10;
			sBoxTable[3][13] = 0;
			sBoxTable[3][14] = 6;
			sBoxTable[3][15] = 13;   
            
            sBox1 = sBoxTable[row][col];
    end
endfunction

function [3:0] sBox2;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 15;
			sBoxTable[0][1] = 1;
			sBoxTable[0][2] = 8;
			sBoxTable[0][3] = 14;
			sBoxTable[0][4] = 6;
			sBoxTable[0][5] = 11;
			sBoxTable[0][6] = 3;
			sBoxTable[0][7] = 4;
			sBoxTable[0][8] = 9;
			sBoxTable[0][9] = 7;
			sBoxTable[0][10] = 2;
			sBoxTable[0][11] = 13;
			sBoxTable[0][12] = 12;
			sBoxTable[0][13] = 0;
			sBoxTable[0][14] = 5;
			sBoxTable[0][15] = 10;
			sBoxTable[1][0] = 3;
			sBoxTable[1][1] = 13;
			sBoxTable[1][2] = 4;
			sBoxTable[1][3] = 7;
			sBoxTable[1][4] = 15;
			sBoxTable[1][5] = 2;
			sBoxTable[1][6] = 8;
			sBoxTable[1][7] = 14;
			sBoxTable[1][8] = 12;
			sBoxTable[1][9] = 0;
			sBoxTable[1][10] = 1;
			sBoxTable[1][11] = 10;
			sBoxTable[1][12] = 6;
			sBoxTable[1][13] = 9;
			sBoxTable[1][14] = 11;
			sBoxTable[1][15] = 5;
			sBoxTable[2][0] = 0;
			sBoxTable[2][1] = 14;
			sBoxTable[2][2] = 7;
			sBoxTable[2][3] = 11;
			sBoxTable[2][4] = 10;
			sBoxTable[2][5] = 4;
			sBoxTable[2][6] = 13;
			sBoxTable[2][7] = 1;
			sBoxTable[2][8] = 5;
			sBoxTable[2][9] = 8;
			sBoxTable[2][10] = 12;
			sBoxTable[2][11] = 6;
			sBoxTable[2][12] = 9;
			sBoxTable[2][13] = 3;
			sBoxTable[2][14] = 2;
			sBoxTable[2][15] = 15;
			sBoxTable[3][0] = 13;
			sBoxTable[3][1] = 8;
			sBoxTable[3][2] = 10;
			sBoxTable[3][3] = 1;
			sBoxTable[3][4] = 3;
			sBoxTable[3][5] = 15;
			sBoxTable[3][6] = 4;
			sBoxTable[3][7] = 2;
			sBoxTable[3][8] = 11;
			sBoxTable[3][9] = 6;
			sBoxTable[3][10] = 7;
			sBoxTable[3][11] = 12;
			sBoxTable[3][12] = 0;
			sBoxTable[3][13] = 5;
			sBoxTable[3][14] = 14;
			sBoxTable[3][15] = 9;  
                
            sBox2 = sBoxTable[row][col];

    end
endfunction

function [3:0] sBox3;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 10;
			sBoxTable[0][1] = 0;
			sBoxTable[0][2] = 9;
			sBoxTable[0][3] = 14;
			sBoxTable[0][4] = 6;
			sBoxTable[0][5] = 3;
			sBoxTable[0][6] = 15;
			sBoxTable[0][7] = 5;
			sBoxTable[0][8] = 1;
			sBoxTable[0][9] = 13;
			sBoxTable[0][10] = 12;
			sBoxTable[0][11] = 7;
			sBoxTable[0][12] = 11;
			sBoxTable[0][13] = 4;
			sBoxTable[0][14] = 2;
			sBoxTable[0][15] = 8;
			sBoxTable[1][0] = 13;
			sBoxTable[1][1] = 7;
			sBoxTable[1][2] = 0;
			sBoxTable[1][3] = 9;
			sBoxTable[1][4] = 3;
			sBoxTable[1][5] = 4;
			sBoxTable[1][6] = 6;
			sBoxTable[1][7] = 10;
			sBoxTable[1][8] = 2;
			sBoxTable[1][9] = 8;
			sBoxTable[1][10] = 5;
			sBoxTable[1][11] = 14;
			sBoxTable[1][12] = 12;
			sBoxTable[1][13] = 11;
			sBoxTable[1][14] = 15;
			sBoxTable[1][15] = 1;
			sBoxTable[2][0] = 13;
			sBoxTable[2][1] = 6;
			sBoxTable[2][2] = 4;
			sBoxTable[2][3] = 9;
			sBoxTable[2][4] = 8;
			sBoxTable[2][5] = 15;
			sBoxTable[2][6] = 3;
			sBoxTable[2][7] = 0;
			sBoxTable[2][8] = 11;
			sBoxTable[2][9] = 1;
			sBoxTable[2][10] = 2;
			sBoxTable[2][11] = 12;
			sBoxTable[2][12] = 5;
			sBoxTable[2][13] = 10;
			sBoxTable[2][14] = 14;
			sBoxTable[2][15] = 7;
			sBoxTable[3][0] = 1;
			sBoxTable[3][1] = 10;
			sBoxTable[3][2] = 13;
			sBoxTable[3][3] = 0;
			sBoxTable[3][4] = 6;
			sBoxTable[3][5] = 9;
			sBoxTable[3][6] = 8;
			sBoxTable[3][7] = 7;
			sBoxTable[3][8] = 4;
			sBoxTable[3][9] = 15;
			sBoxTable[3][10] = 14;
			sBoxTable[3][11] = 3;
			sBoxTable[3][12] = 11;
			sBoxTable[3][13] = 5;
			sBoxTable[3][14] = 2;
			sBoxTable[3][15] = 12;
            
            sBox3 = sBoxTable[row][col];

    end
endfunction

function [3:0] sBox4;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 7;
			sBoxTable[0][1] = 13;
			sBoxTable[0][2] = 14;
			sBoxTable[0][3] = 3;
			sBoxTable[0][4] = 0;
			sBoxTable[0][5] = 6;
			sBoxTable[0][6] = 9;
			sBoxTable[0][7] = 10;
			sBoxTable[0][8] = 1;
			sBoxTable[0][9] = 2;
			sBoxTable[0][10] = 8;
			sBoxTable[0][11] = 5;
			sBoxTable[0][12] = 11;
			sBoxTable[0][13] = 12;
			sBoxTable[0][14] = 4;
			sBoxTable[0][15] = 15;
			sBoxTable[1][0] = 13;
			sBoxTable[1][1] = 8;
			sBoxTable[1][2] = 11;
			sBoxTable[1][3] = 5;
			sBoxTable[1][4] = 6;
			sBoxTable[1][5] = 15;
			sBoxTable[1][6] = 0;
			sBoxTable[1][7] = 3;
			sBoxTable[1][8] = 4;
			sBoxTable[1][9] = 7;
			sBoxTable[1][10] = 2;
			sBoxTable[1][11] = 12;
			sBoxTable[1][12] = 1;
			sBoxTable[1][13] = 10;
			sBoxTable[1][14] = 14;
			sBoxTable[1][15] = 9;
			sBoxTable[2][0] = 10;
			sBoxTable[2][1] = 6;
			sBoxTable[2][2] = 9;
			sBoxTable[2][3] = 0;
			sBoxTable[2][4] = 12;
			sBoxTable[2][5] = 11;
			sBoxTable[2][6] = 7;
			sBoxTable[2][7] = 13;
			sBoxTable[2][8] = 15;
			sBoxTable[2][9] = 1;
			sBoxTable[2][10] = 3;
			sBoxTable[2][11] = 14;
			sBoxTable[2][12] = 5;
			sBoxTable[2][13] = 2;
			sBoxTable[2][14] = 8;
			sBoxTable[2][15] = 4;
			sBoxTable[3][0] = 3;
			sBoxTable[3][1] = 15;
			sBoxTable[3][2] = 0;
			sBoxTable[3][3] = 6;
			sBoxTable[3][4] = 10;
			sBoxTable[3][5] = 1;
			sBoxTable[3][6] = 13;
			sBoxTable[3][7] = 8;
			sBoxTable[3][8] = 9;
			sBoxTable[3][9] = 4;
			sBoxTable[3][10] = 5;
			sBoxTable[3][11] = 11;
			sBoxTable[3][12] = 12;
			sBoxTable[3][13] = 7;
			sBoxTable[3][14] = 2;
			sBoxTable[3][15] = 14;
           
            sBox4 = sBoxTable[row][col];

    end
endfunction

function [3:0] sBox5;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 2;
			sBoxTable[0][1] = 12;
			sBoxTable[0][2] = 4;
			sBoxTable[0][3] = 1;
			sBoxTable[0][4] = 7;
			sBoxTable[0][5] = 10;
			sBoxTable[0][6] = 11;
			sBoxTable[0][7] = 6;
			sBoxTable[0][8] = 8;
			sBoxTable[0][9] = 5;
			sBoxTable[0][10] = 3;
			sBoxTable[0][11] = 15;
			sBoxTable[0][12] = 13;
			sBoxTable[0][13] = 0;
			sBoxTable[0][14] = 14;
			sBoxTable[0][15] = 9;
			sBoxTable[1][0] = 14;
			sBoxTable[1][1] = 11;
			sBoxTable[1][2] = 2;
			sBoxTable[1][3] = 12;
			sBoxTable[1][4] = 4;
			sBoxTable[1][5] = 7;
			sBoxTable[1][6] = 13;
			sBoxTable[1][7] = 1;
			sBoxTable[1][8] = 5;
			sBoxTable[1][9] = 0;
			sBoxTable[1][10] = 15;
			sBoxTable[1][11] = 10;
			sBoxTable[1][12] = 3;
			sBoxTable[1][13] = 9;
			sBoxTable[1][14] = 8;
			sBoxTable[1][15] = 6;
			sBoxTable[2][0] = 4;
			sBoxTable[2][1] = 2;
			sBoxTable[2][2] = 1;
			sBoxTable[2][3] = 11;
			sBoxTable[2][4] = 10;
			sBoxTable[2][5] = 13;
			sBoxTable[2][6] = 7;
			sBoxTable[2][7] = 8;
			sBoxTable[2][8] = 15;
			sBoxTable[2][9] = 9;
			sBoxTable[2][10] = 12;
			sBoxTable[2][11] = 5;
			sBoxTable[2][12] = 6;
			sBoxTable[2][13] = 3;
			sBoxTable[2][14] = 0;
			sBoxTable[2][15] = 14;
			sBoxTable[3][0] = 11;
			sBoxTable[3][1] = 8;
			sBoxTable[3][2] = 12;
			sBoxTable[3][3] = 7;
			sBoxTable[3][4] = 1;
			sBoxTable[3][5] = 14;
			sBoxTable[3][6] = 2;
			sBoxTable[3][7] = 13;
			sBoxTable[3][8] = 6;
			sBoxTable[3][9] = 15;
			sBoxTable[3][10] = 0;
			sBoxTable[3][11] = 9;
			sBoxTable[3][12] = 10;
			sBoxTable[3][13] = 4;
			sBoxTable[3][14] = 5;
			sBoxTable[3][15] = 3;
			
            sBox5 = sBoxTable[row][col];
    end
endfunction

function [3:0] sBox6;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 12;
			sBoxTable[0][1] = 1;
			sBoxTable[0][2] = 10;
			sBoxTable[0][3] = 15;
			sBoxTable[0][4] = 9;
			sBoxTable[0][5] = 2;
			sBoxTable[0][6] = 6;
			sBoxTable[0][7] = 8;
			sBoxTable[0][8] = 0;
			sBoxTable[0][9] = 13;
			sBoxTable[0][10] = 3;
			sBoxTable[0][11] = 4;
			sBoxTable[0][12] = 14;
			sBoxTable[0][13] = 7;
			sBoxTable[0][14] = 5;
			sBoxTable[0][15] = 11;
			sBoxTable[1][0] = 10;
			sBoxTable[1][1] = 15;
			sBoxTable[1][2] = 4;
			sBoxTable[1][3] = 2;
			sBoxTable[1][4] = 7;
			sBoxTable[1][5] = 12;
			sBoxTable[1][6] = 9;
			sBoxTable[1][7] = 5;
			sBoxTable[1][8] = 6;
			sBoxTable[1][9] = 1;
			sBoxTable[1][10] = 13;
			sBoxTable[1][11] = 14;
			sBoxTable[1][12] = 0;
			sBoxTable[1][13] = 11;
			sBoxTable[1][14] = 3;
			sBoxTable[1][15] = 8;
			sBoxTable[2][0] = 9;
			sBoxTable[2][1] = 14;
			sBoxTable[2][2] = 15;
			sBoxTable[2][3] = 5;
			sBoxTable[2][4] = 2;
			sBoxTable[2][5] = 8;
			sBoxTable[2][6] = 12;
			sBoxTable[2][7] = 3;
			sBoxTable[2][8] = 7;
			sBoxTable[2][9] = 0;
			sBoxTable[2][10] = 4;
			sBoxTable[2][11] = 10;
			sBoxTable[2][12] = 1;
			sBoxTable[2][13] = 13;
			sBoxTable[2][14] = 11;
			sBoxTable[2][15] = 6;
			sBoxTable[3][0] = 4;
			sBoxTable[3][1] = 3;
			sBoxTable[3][2] = 2;
			sBoxTable[3][3] = 12;
			sBoxTable[3][4] = 9;
			sBoxTable[3][5] = 5;
			sBoxTable[3][6] = 15;
			sBoxTable[3][7] = 10;
			sBoxTable[3][8] = 11;
			sBoxTable[3][9] = 14;
			sBoxTable[3][10] = 1;
			sBoxTable[3][11] = 7;
			sBoxTable[3][12] = 6;
			sBoxTable[3][13] = 0;
			sBoxTable[3][14] = 8;
			sBoxTable[3][15] = 13;
 
            sBox6 = sBoxTable[row][col];
    end
endfunction

function [3:0] sBox7;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 4;
			sBoxTable[0][1] = 11;
			sBoxTable[0][2] = 2;
			sBoxTable[0][3] = 14;
			sBoxTable[0][4] = 15;
			sBoxTable[0][5] = 0;
			sBoxTable[0][6] = 8;
			sBoxTable[0][7] = 13;
			sBoxTable[0][8] = 3;
			sBoxTable[0][9] = 12;
			sBoxTable[0][10] = 9;
			sBoxTable[0][11] = 7;
			sBoxTable[0][12] = 5;
			sBoxTable[0][13] = 10;
			sBoxTable[0][14] = 6;
			sBoxTable[0][15] = 1;
			sBoxTable[1][0] = 13;
			sBoxTable[1][1] = 0;
			sBoxTable[1][2] = 11;
			sBoxTable[1][3] = 7;
			sBoxTable[1][4] = 4;
			sBoxTable[1][5] = 9;
			sBoxTable[1][6] = 1;
			sBoxTable[1][7] = 10;
			sBoxTable[1][8] = 14;
			sBoxTable[1][9] = 3;
			sBoxTable[1][10] = 5;
			sBoxTable[1][11] = 12;
			sBoxTable[1][12] = 2;
			sBoxTable[1][13] = 15;
			sBoxTable[1][14] = 8;
			sBoxTable[1][15] = 6;
			sBoxTable[2][0] = 1;
			sBoxTable[2][1] = 4;
			sBoxTable[2][2] = 11;
			sBoxTable[2][3] = 13;
			sBoxTable[2][4] = 12;
			sBoxTable[2][5] = 3;
			sBoxTable[2][6] = 7;
			sBoxTable[2][7] = 14;
			sBoxTable[2][8] = 10;
			sBoxTable[2][9] = 15;
			sBoxTable[2][10] = 6;
			sBoxTable[2][11] = 8;
			sBoxTable[2][12] = 0;
			sBoxTable[2][13] = 5;
			sBoxTable[2][14] = 9;
			sBoxTable[2][15] = 2;
			sBoxTable[3][0] = 6;
			sBoxTable[3][1] = 11;
			sBoxTable[3][2] = 13;
			sBoxTable[3][3] = 8;
			sBoxTable[3][4] = 1;
			sBoxTable[3][5] = 4;
			sBoxTable[3][6] = 10;
			sBoxTable[3][7] = 7;
			sBoxTable[3][8] = 9;
			sBoxTable[3][9] = 5;
			sBoxTable[3][10] = 0;
			sBoxTable[3][11] = 15;
			sBoxTable[3][12] = 14;
			sBoxTable[3][13] = 2;
			sBoxTable[3][14] = 3;
			sBoxTable[3][15] = 12;
            
            sBox7 = sBoxTable[row][col];

    end
endfunction

function [3:0] sBox8;
    input [1:0] row;
    input  [3:0] col;
    reg [3:0] sBoxTable[3:0][15:0];
    begin
            sBoxTable[0][0] = 13;
			sBoxTable[0][1] = 2;
			sBoxTable[0][2] = 8;
			sBoxTable[0][3] = 4;
			sBoxTable[0][4] = 6;
			sBoxTable[0][5] = 15;
			sBoxTable[0][6] = 11;
			sBoxTable[0][7] = 1;
			sBoxTable[0][8] = 10;
			sBoxTable[0][9] = 9;
			sBoxTable[0][10] = 3;
			sBoxTable[0][11] = 14;
			sBoxTable[0][12] = 5;
			sBoxTable[0][13] = 0;
			sBoxTable[0][14] = 12;
			sBoxTable[0][15] = 7;
			sBoxTable[1][0] = 1;
			sBoxTable[1][1] = 15;
			sBoxTable[1][2] = 13;
			sBoxTable[1][3] = 8;
			sBoxTable[1][4] = 10;
			sBoxTable[1][5] = 3;
			sBoxTable[1][6] = 7;
			sBoxTable[1][7] = 4;
			sBoxTable[1][8] = 12;
			sBoxTable[1][9] = 5;
			sBoxTable[1][10] = 6;
			sBoxTable[1][11] = 11;
			sBoxTable[1][12] = 0;
			sBoxTable[1][13] = 14;
			sBoxTable[1][14] = 9;
			sBoxTable[1][15] = 2;
			sBoxTable[2][0] = 7;
			sBoxTable[2][1] = 11;
			sBoxTable[2][2] = 4;
			sBoxTable[2][3] = 1;
			sBoxTable[2][4] = 9;
			sBoxTable[2][5] = 12;
			sBoxTable[2][6] = 14;
			sBoxTable[2][7] = 2;
			sBoxTable[2][8] = 0;
			sBoxTable[2][9] = 6;
			sBoxTable[2][10] = 10;
			sBoxTable[2][11] = 13;
			sBoxTable[2][12] = 15;
			sBoxTable[2][13] = 3;
			sBoxTable[2][14] = 5;
			sBoxTable[2][15] = 8;
			sBoxTable[3][0] = 2;
			sBoxTable[3][1] = 1;
			sBoxTable[3][2] = 14;
			sBoxTable[3][3] = 7;
			sBoxTable[3][4] = 4;
			sBoxTable[3][5] = 10;
			sBoxTable[3][6] = 8;
			sBoxTable[3][7] = 13;
			sBoxTable[3][8] = 15;
			sBoxTable[3][9] = 12;
			sBoxTable[3][10] = 9;
			sBoxTable[3][11] = 0;
			sBoxTable[3][12] = 3;
			sBoxTable[3][13] = 5;
			sBoxTable[3][14] = 6;
			sBoxTable[3][15] = 11;
           
            sBox8 = sBoxTable[row][col];
    end
endfunction

function [31:0] permutation;
    input [31:0] in;
    integer permutatation_table[31:0];
    integer i;
    begin
        permutatation_table[0] = 15;
        permutatation_table[1] = 6;
        permutatation_table[2] = 19;
        permutatation_table[3] = 20;
        permutatation_table[4] = 28;
        permutatation_table[5] = 11;
        permutatation_table[6] = 27;
        permutatation_table[7] = 16;
        permutatation_table[8] = 0;
        permutatation_table[9] = 14;
        permutatation_table[10] = 22;
        permutatation_table[11] = 25;
        permutatation_table[12] = 4;
        permutatation_table[13] = 17;
        permutatation_table[14] = 30;
        permutatation_table[15] = 9;
        permutatation_table[16] = 1;
        permutatation_table[17] = 7;
        permutatation_table[18] = 23;
        permutatation_table[19] = 13;
        permutatation_table[20] = 31;
        permutatation_table[21] = 26;
        permutatation_table[22] = 2;
        permutatation_table[23] = 8;
        permutatation_table[24] = 18;
        permutatation_table[25] = 12;
        permutatation_table[26] = 29;
        permutatation_table[27] = 5;
        permutatation_table[28] = 21;
        permutatation_table[29] = 10;
        permutatation_table[30] = 3;
        permutatation_table[31] = 24;
        
        for(i=0; i < 32; i=i+1)
            permutation[31-i] = in[31- permutatation_table[i]];
    end
endfunction


input clk;
input [31:0] dataIn;
input [47:0] roundKey;
output [31:0] dataOut;
wire  [31:0] dataOut;
wire [31:0] S;
wire [3:0] S1;
wire [3:0] S2;
wire [3:0] S3;
wire [3:0] S4;
wire [3:0] S5;
wire [3:0] S6;
wire [3:0] S7;
wire [3:0] S8;
reg [47:0] expData;
reg [47:0] xorData;


always @(posedge clk)
begin
    expData = expansion(dataIn);
end

always @(posedge clk)
begin
    xorData <= roundKey ^ expData;    
end

//always @(posedge clk)
//begin    
//    S1 <= sBox1({ xorData[47], xorData[42] }, xorData[46:43]);
//    S2 <= sBox2({ xorData[41], xorData[36] }, xorData[40:37]);
//    S3 <= sBox3({ xorData[35], xorData[30] }, xorData[34:31]);
//    S4 <= sBox4({ xorData[29], xorData[24] }, xorData[28:25]);
//    S5 <= sBox5({ xorData[23], xorData[18] }, xorData[22:19]);    
//    S6 <= sBox6({ xorData[17], xorData[12] }, xorData[16:13]);
//    S7 <= sBox7({ xorData[11], xorData[6] }, xorData[10:7]);
//    S8 <= sBox8({ xorData[5], xorData[0] }, xorData[4:1]);
//end

//always @(posedge clk)
//begin    
//    dataOut <= permutation(S);
//end

assign S = { S1, S2, S3, S4, S5, S6, S7, S8 };
assign S1 = sBox1({ xorData[47], xorData[42] }, xorData[46:43]);
assign S2 = sBox2({ xorData[41], xorData[36] }, xorData[40:37]);
assign S3 = sBox3({ xorData[35], xorData[30] }, xorData[34:31]);
assign S4 = sBox4({ xorData[29], xorData[24] }, xorData[28:25]);
assign S5 = sBox5({ xorData[23], xorData[18] }, xorData[22:19]);    
assign S6 = sBox6({ xorData[17], xorData[12] }, xorData[16:13]);
assign S7 = sBox7({ xorData[11], xorData[6] }, xorData[10:7]);
assign S8 = sBox8({ xorData[5], xorData[0] }, xorData[4:1]);

assign dataOut = permutation(S);

endmodule


