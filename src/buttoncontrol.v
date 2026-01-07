`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 10:33:34
// Design Name: 
// Module Name: buttoncontrol
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


module buttoncontrol(
    input rst,clk,button,
    output reg valid_vote
    );
    reg [30:0] counter;
    
    always@(posedge clk)
    begin
        if(rst)
            counter<=0;
        else
        begin
            if(button&counter<11)
                counter<=counter+1;
            else if(!button)
                counter<=0;
        end
    end
    
    always@(posedge clk)
    begin
        if(rst)
            valid_vote<=1'b0;
        else
        begin
            if(counter==10)
                valid_vote<=1'b1;
            else
                valid_vote<=1'b0;
        end
    end                  
endmodule

module votelogger(
    input rst,clk,mode,cand1_vote_valid,cand2_vote_valid,cand3_vote_valid,cand4_vote_valid,
    output reg [7:0] cand1_vote_recvd,cand2_vote_recvd,cand3_vote_recvd,cand4_vote_recvd);
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            cand1_vote_recvd<=0;
            cand2_vote_recvd<=0;
            cand3_vote_recvd<=0;
            cand4_vote_recvd<=0;            
        end
        else
        begin
            if(cand1_vote_valid & mode==0)
                cand1_vote_recvd<=cand1_vote_recvd+1;
            else if(cand2_vote_valid & mode==0)
                cand2_vote_recvd<=cand2_vote_recvd+1;
            else if(cand3_vote_recvd & mode==0)
                cand3_vote_recvd<=cand3_vote_recvd+1;
            else if(cand4_vote_recvd & mode==0)
                cand4_vote_recvd<=cand4_vote_recvd+1;
        end
    end
endmodule

module modecontrol(
    input rst,clk,mode,valid_vote_casted,
    input [7:0] candidate1_vote,candidate2_vote,candidate3_vote,candidate4_vote,
    input candidate1_button_press,candidate2_button_press,candidate3_button_press,candidate4_button_press,
    output reg [7:0]leds
    );
    reg [30:0]counter;
    
    always@(posedge clk)
    begin
        if(rst)
            counter<=0;
        else if(valid_vote_casted)
            counter<=counter+1;
        else if(counter !=0 & counter<10)
            counter<=counter+1;
        else
            counter<=0;
    end
    
    always@(posedge clk)
    begin
        if(rst)
            counter<=0;
        else
        begin
            if(mode==0 & counter>0)
                leds<=8'hFF;
            else if(mode==0)
                leds<=8'h00;
            else if(mode==1)
            begin
                if(candidate1_button_press)
                    leds<=candidate1_vote;
                else if(candidate2_button_press)
                    leds<=candidate2_vote;
                else if(candidate3_button_press)
                    leds<=candidate3_vote;
                else if(candidate4_button_press)
                    leds<=candidate4_vote;
            end
        end
    end
endmodule

module votingmachine(
    input rst,clk,mode,button1,button2,button3,button4,
    output [7:0]led
    );
    wire valid_vote_1,valid_vote_2,valid_vote_3,valid_vote_4;
    wire [7:0] cand1_vote_recvd,cand2_vote_recvd,cand3_vote_recvd,cand4_vote_recvd;
    wire anyvalidvote;
    
    assign anyvalidvote=valid_vote_1|valid_vote_2|valid_vote_3|valid_vote_4;
    
    buttoncontrol bc1(rst,clk,button1,valid_vote_1);
    buttoncontrol bc2(rst,clk,button2,valid_vote_2);
    buttoncontrol bc3(rst,clk,button3,valid_vote_3);
    buttoncontrol bc4(rst,clk,button4,valid_vote_4);
    
    votelogger vl(rst,clk,mode,valid_vote_1,valid_vote_2,valid_vote_3,valid_vote_4,cand1_vote_recvd,cand2_vote_recvd,cand3_vote_recvd,cand4_vote_recvd);
                    
    modecontrol mc(.rst(rst),.clk(clk),.mode(mode),.valid_vote_casted(anyvalidvote),
                    .candidate1_vote(cand1_vote_recvd),
                    .candidate2_vote(cand2_vote_recvd),
                    .candidate3_vote(cand3_vote_recvd),
                    .candidate4_vote(cand4_vote_recvd),
                    .candidate1_button_press(valid_vote_1),
                    .candidate2_button_press(valid_vote_2),
                    .candidate3_button_press(valid_vote_3),
                    .candidate4_button_press(valid_vote_4),
                    .leds(led));
endmodule