`timescale 1ns/1ns 
module Bubble_Sort_TB(); 

 reg clk=0,rst=0,start=0; 
 wire done; 

 Bubble_Sort  UUT(clk,rst,start,done); 
  
 always #1 clk=~clk;

 initial begin 
  start = 0; 
  #4 start = 1; 
  #6 start = 0; 
  #15000 $stop; 
 end 

endmodule

