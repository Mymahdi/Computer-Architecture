`timescale 1ns/1ns
module MUX_5bit( S0 , A , B , OP);

 input S0;
 input [4:0]A; 
 input [4:0]B; 
 output [4:0]OP;

   assign OP = S0 ? B : A;

endmodule

