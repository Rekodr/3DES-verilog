`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 02:18:58 PM
// Design Name: 
// Module Name: top
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

module main(clk, reset, start, decrypt, done, key_addr, key, data_addr, dataIn, dataOut, encryp_data_addr, we, des_stage);
input clk;
input reset;
input start;
input decrypt;
input [7:0] key;
input [8:0] encryp_data_addr;
input [63:0] dataIn;

output [8:0] data_addr;
output [7:0] key_addr;
output reg [2:0] done;
output [63:0] dataOut;
output [1:0] des_stage;
output we;

reg [8:0] data_addr;
reg [7:0] key_addr;
wire [63:0] key;
reg [63:0] dataOut;


parameter init = 3'b0;
parameter fetch = 3'b001;
parameter encrypt = 3'b010;
parameter incr = 3'b011;
parameter store = 3'b100;
parameter standby = 3'b101;
parameter graveYard = 3'b111;


reg [63:0] message1;
reg [63:0] message2;
reg [63:0] message3;
wire [63:0] O1;
wire [63:0] O2;
wire [63:0] O3;
reg we;
reg [2:0] curr_state, next_state;
//reg [2:0] s;


reg [7:0] data_offset;
reg [1:0] key_offset;
reg loadMem;
reg [2:0] decrState;
reg [1:0] des_stage;

reg lock1;
reg lock2;
reg lock3;
wire done1;
wire done2;
wire done3;

always @(posedge clk)
begin
    if(!reset)
        curr_state <= init;
    else
        curr_state <= next_state;
end


always @(posedge clk)
begin
    if(!reset) begin
        data_offset <= 8'b0;
        key_offset <= 2'b0;
        data_addr <= 8'b0;
        data_addr <= 8'b0;
        des_stage <= 0;
        lock1 <= 1'b1;
        lock2 <= 1'b1;
        lock3 <= 1'b1;       
    end 
    else begin
        case(curr_state)
            init: begin
                lock1 <= 1'b1;
                lock2 <= 1'b1;
                lock3 <= 1'b1;  
                we <= 0;   
                decrState <= 3'b010;                    
                data_addr <= 8'b0;
                des_stage <= 2'b0;  
                key_addr <=   8'b0; 
                if(decrypt)
                  decrState <= 3'b101;                    
                if(start == 1'b1) begin
                    des_stage <= 2'b01;
                    next_state <= fetch;    
                end
            end
            
            fetch: begin
                we <= 0;      
                if(des_stage == 1)
                    message1 <= dataIn;
                if(des_stage == 2)    
                    message2 <= O1;
                if(des_stage == 3)
                    message3 <= O2;
                next_state <= encrypt;
            end
            
            encrypt: begin
                we <= 0;   
                lock1 = 1'b1;
                lock2 = 1'b1;
                lock3 = 1'b1;
                case(des_stage)
                    2'b01: begin
                        lock1 = 1'b0;
                        lock2 = 1'b1;
                        lock3 = 1'b1;
                        key_addr <= 0;                                                                           
                        if(done1) begin
                            key_addr <= 1;                                                                                                  
                            next_state <= incr;
                        end
                        else begin
                            next_state <= encrypt;
                        end                        
                    end
                    2'b10: begin 
                        lock1 = 1'b0;
                        lock2 = 1'b0;
                        lock3 = 1'b1;
                        key_addr <= 1;                                                                           
                        if(done2) begin
                            key_addr <= 2;                                                   
                            next_state <= incr;
                        end
                        else begin
                            next_state <= encrypt;
                        end                        
                    end
                    2'b11: begin 
                        lock1 = 1'b0;
                        lock2 = 1'b0;
                        lock3 = 1'b0;
                        if(done3) begin
                            next_state <= incr;
                        end
                        else begin
                            next_state <= encrypt;
                        end                        
                    end
                    default: begin
                        lock1 = 1'b1;
                        lock2 = 1'b1;
                        lock3 = 1'b1;
                    end
                endcase
                              
            end
            
            incr: begin
                we <= 0;   
                if(des_stage >= 3) begin
                    data_addr <= encryp_data_addr;
                    dataOut <= O3;
                    next_state <= store;
                end
                else begin
                    next_state <= graveYard;
                end
            end
            
            graveYard: begin
                we <= 0;   
                des_stage <= 2'b00; 
//                key_addr <= 0;                                                                                                    
                case(done)
                    3'b001: begin
                       des_stage <= 2'b10;
                    end
                    3'b011: begin
                       des_stage <= 2'b11;                    
                    end
                    3'b111: begin
                       des_stage <= 2'b11;                    
                    end
                    default: begin
                       des_stage <= 2'b10;                    
                    end 
                 endcase    
                next_state <= fetch;
            end
            
            store: begin
                we <= 1;
                next_state <= standby;
            end
            
            standby: begin
                we <= 0;
                next_state <= standby;
            end
            default: begin
                next_state <= init;
            end
        endcase
    end
end

always @(posedge clk)
begin
    done <= { done3, done2, done1 };
    if(!reset) 
        done <= 3'b0;                                                   
    else if(curr_state == init)
        done <= 3'b0;
     
end
//assign done = { done3, done2, done1 };
DES_Encrypt E1(.clk(clk), .reset(lock1), .dataIn(message1), .decrypt(decrState[0]), .dataOut(O1), .key(key), .done(done1));
DES_Encrypt E2(.clk(clk), .reset(lock2), .dataIn(message2), .decrypt(decrState[1]), .dataOut(O2), .key(key), .done(done2));
DES_Encrypt E3(.clk(clk), .reset(lock3), .dataIn(message3), .decrypt(decrState[2]), .dataOut(O3), .key(key), .done(done3));


endmodule