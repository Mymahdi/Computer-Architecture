`timescale 1ns/1ns
module Register( PI , clk , Reg_ld , PO );
  input [7:0] PI ; 
  input  clk , Reg_ld ;
  output reg [7:0] PO ;

always@(posedge clk) begin
   
     PO  <= (Reg_ld) ? PI : PO ; 

    end
endmodule

