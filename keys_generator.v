`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 04:52:13 PM
// Design Name: 
// Module Name: keys_generator
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


module keys_generator(
clk,
key,
decrypt,
subkey1,
subkey2,
subkey3,
subkey4,
subkey5,
subkey6,
subkey7,
subkey8,
subkey9,
subkey10,
subkey11,
subkey12,
subkey13,
subkey14,
subkey15,
subkey16
);
input clk;
input [63:0] key;
input decrypt;
output [47:0] subkey1;
output [47:0] subkey2;
output [47:0] subkey3;
output [47:0] subkey4;
output [47:0] subkey5;
output [47:0] subkey6;
output [47:0] subkey7;
output [47:0] subkey8;
output [47:0] subkey9;
output [47:0] subkey10;
output [47:0] subkey11;
output [47:0] subkey12;
output [47:0] subkey13;
output [47:0] subkey14;
output [47:0] subkey15;
output [47:0] subkey16;

reg [47:0] subkey1;
reg [47:0] subkey2;
reg [47:0] subkey3;
reg [47:0] subkey4;
reg [47:0] subkey5;
reg [47:0] subkey6;
reg [47:0] subkey7;
reg [47:0] subkey8;
reg [47:0] subkey9;
reg [47:0] subkey10;
reg [47:0] subkey11;
reg [47:0] subkey12;
reg [47:0] subkey13;
reg [47:0] subkey14;
reg [47:0] subkey15;
reg [47:0] subkey16;

function [55:0] parity_drop;
    input [63:0] keyIn;
    integer permutation_table[55: 0];
    integer i;
    
    begin
        permutation_table[0] = 56;
        permutation_table[1] = 48;
        permutation_table[2] = 40;
        permutation_table[3] = 32;
        permutation_table[4] = 24;
        permutation_table[5] = 16;
        permutation_table[6] = 8;
        permutation_table[7] = 0;
        permutation_table[8] = 57;
        permutation_table[9] = 49;
        permutation_table[10] = 41;
        permutation_table[11] = 33;
        permutation_table[12] = 25;
        permutation_table[13] = 17;
        permutation_table[14] = 9;
        permutation_table[15] = 1;
        permutation_table[16] = 58;
        permutation_table[17] = 50;
        permutation_table[18] = 42;
        permutation_table[19] = 34;
        permutation_table[20] = 26;
        permutation_table[21] = 18;
        permutation_table[22] = 10;
        permutation_table[23] = 2;
        permutation_table[24] = 59;
        permutation_table[25] = 51;
        permutation_table[26] = 43;
        permutation_table[27] = 35;
        permutation_table[28] = 62;
        permutation_table[29] = 54;
        permutation_table[30] = 46;
        permutation_table[31] = 38;
        permutation_table[32] = 30;
        permutation_table[33] = 22;
        permutation_table[34] = 14;
        permutation_table[35] = 6;
        permutation_table[36] = 61;
        permutation_table[37] = 53;
        permutation_table[38] = 45;
        permutation_table[39] = 37;
        permutation_table[40] = 29;
        permutation_table[41] = 21;
        permutation_table[42] = 13;
        permutation_table[43] = 5;
        permutation_table[44] = 60;
        permutation_table[45] = 52;
        permutation_table[46] = 44;
        permutation_table[47] = 36;
        permutation_table[48] = 28;
        permutation_table[49] = 20;
        permutation_table[50] = 12;
        permutation_table[51] = 4;
        permutation_table[52] = 27;
        permutation_table[53] = 19;
        permutation_table[54] = 11;
        permutation_table[55] = 3;
        
        for(i=0; i < 56; i = i+1)
            parity_drop[55-i] = keyIn[63 - permutation_table[i]];
    end
endfunction

function [55:0] shift;
    input [55:0] last_key;
    input integer round;
    integer shift_table[16:1];
    begin
      // shift table. see: https://academic.csuohio.edu/yuc/security/Chapter_06_Data_Encription_Standard.pdf
      // for round 1, 2, 9 and 16 shifting in 1 bit. Note this is a circular shift
      shift_table[1] = 1;
      shift_table[2] = 1;
      shift_table[3] = 2;
      shift_table[4] = 2;
      shift_table[5] = 2;
      shift_table[6] = 2;
      shift_table[7] = 2;
      shift_table[8] = 2;
      shift_table[9] = 1;
      shift_table[10] = 2;
      shift_table[11] = 2;
      shift_table[12] = 2;
      shift_table[13] = 2;
      shift_table[14] = 2;
      shift_table[15] = 2;
      shift_table[16] = 1;
      
      if(shift_table[round] == 'd1) // 
          shift = { last_key[54:28], last_key[55], last_key[26:0], last_key[27] };
      else
        shift = { last_key[53:28], last_key[55:54],  last_key[25:0], last_key[27:26] };
    end
endfunction

function [47:0] compression_dBox;
    input [55:0] dt_in;
    integer compression_table[47:0];
    integer i;
    begin
            compression_table[0] = 13;
            compression_table[1] = 16;
            compression_table[2] = 10;
            compression_table[3] = 23;
            compression_table[4] = 0;
            compression_table[5] = 4;
            compression_table[6] = 2;
            compression_table[7] = 27;
            compression_table[8] = 14;
            compression_table[9] = 5;
            compression_table[10] = 20;
            compression_table[11] = 9;
            compression_table[12] = 22;
            compression_table[13] = 18;
            compression_table[14] = 11;
            compression_table[15] = 3;
            compression_table[16] = 25;
            compression_table[17] = 7;
            compression_table[18] = 15;
            compression_table[19] = 6;
            compression_table[20] = 26;
            compression_table[21] = 19;
            compression_table[22] = 12;
            compression_table[23] = 1;
            compression_table[24] = 40;
            compression_table[25] = 51;
            compression_table[26] = 30;
            compression_table[27] = 36;
            compression_table[28] = 46;
            compression_table[29] = 54;
            compression_table[30] = 29;
            compression_table[31] = 39;
            compression_table[32] = 50;
            compression_table[33] = 44;
            compression_table[34] = 32;
            compression_table[35] = 47;
            compression_table[36] = 43;
            compression_table[37] = 48;
            compression_table[38] = 38;
            compression_table[39] = 55;
            compression_table[40] = 33;
            compression_table[41] = 52;
            compression_table[42] = 45;
            compression_table[43] = 41;
            compression_table[44] = 49;
            compression_table[45] = 35;
            compression_table[46] = 28;
            compression_table[47] = 31;
        
        for(i=0; i< 48; i=i+1)
            compression_dBox[47 - i] = dt_in[55 - compression_table[i]];
    end
endfunction

reg [55:0] drop_parity_key;
reg [55:0] tmp[16:0];
reg [47:0] K[15:0];
integer i;
always @(posedge clk)
begin
    tmp[0] <= parity_drop(key);
    for(i=1; i < 17; i=i+1)
    begin
        tmp[i] <= shift(tmp[i-1], i);
        K[i-1] <= compression_dBox( tmp[i] );
    end
    
     if(decrypt == 1'b0) begin
         subkey1 <= K[0];
         subkey2 <= K[1];
         subkey3 <= K[2];
         subkey4 <= K[3];
         subkey5 <= K[4];
         subkey6 <= K[5];
         subkey7 <= K[6];
         subkey8 <= K[7];
         subkey9 <= K[8];
         subkey10 <= K[9];
         subkey11 <= K[10];
         subkey12 <= K[11];
         subkey13 <= K[12];
         subkey14 <= K[13];
         subkey15 <= K[14];
         subkey16 <= K[15];
     end
     else if(decrypt == 1'b1) begin
         subkey16 <= K[0];
         subkey15 <= K[1];
         subkey14 <= K[2];
         subkey13 <= K[3];
         subkey12 <= K[4];
         subkey11 <= K[5];
         subkey10 <= K[6];
         subkey9 <= K[7];
         subkey8 <= K[8];
         subkey7 <= K[9];
         subkey6 <= K[10];
         subkey5 <= K[11];
         subkey4 <= K[12];
         subkey3 <= K[13];
         subkey2 <= K[14];
         subkey1 <= K[15];
     end
end
endmodule
