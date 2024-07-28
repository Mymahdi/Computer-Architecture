`timescale 1ns/1ns
module MUX_8bit( S1 , A , B , OP);

 input S1;
 input [7:0]A; 
 input [7:0]B; 
 output [7:0]OP;

   assign OP = S1 ? B : A;

endmodule

