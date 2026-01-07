`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 15:19:35
// Design Name: 
// Module Name: tb_voting
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


module tb_voting();
    reg rst,clk,mode,button1,button2,button3,button4;
    wire [7:0] led;
    votingmachine uut(.rst(rst),
                      .clk(clk),
                      .mode(mode),
                      .button1(button1),
                      .button2(button2),
                      .button3(button3),
                      .button4(button4),
                      .led(led));
    initial
    begin
    clk=0;
    forever #5 clk=~clk;
    end
    initial
    begin
    rst=1;mode=0;button1=0;button2=0;button3=0;button4=0; #100;
    
    #100 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=1;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=1;button2=0;button3=0;button4=0;
    #200 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;

    #5 rst=0;mode=0;button1=0;button2=1;button3=0;button4=0;
    #200 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    
    #5 rst=0;mode=0;button1=0;button2=1;button3=1;button4=0;
    #200 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;

    #5 rst=0;mode=1;button1=0;button2=1;button3=0;button4=0;
    #200 rst=0;mode=1;button1=0;button2=0;button3=1;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    
    #5 rst=0;mode=0;button1=0;button2=0;button3=1;button4=0;
    #200 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #10 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;
    #5 rst=0;mode=0;button1=0;button2=0;button3=0;button4=0;

    $finish;
    end
    initial
    begin
    $dumpvars;
    $dumpfile("dump.vcd");
    end
    
endmodule
