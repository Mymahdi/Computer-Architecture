`timescale 1ns/1ns
module Counter_6bit( PI , clk , C_inc , C_ld , C_clr, PO ,CO);
   
   input [5:0] PI ;
   input clk , C_inc , C_ld , C_clr;
   output reg [5:0] PO ;
   output CO;

 always@(posedge clk) begin
    
  if(C_clr) PO <= 6'b0;
    
    else begin
      
      if(C_ld) PO <= PI ;
        
      else if(C_inc)
            PO <= (PO + 1'b1);      
    end
  end
  
  assign CO = (~PO[4]&~PO[3]&~PO[2]&~PO[1]&~PO[0] &&  {PO[5]}) ? 1'b1:1'b0;

endmodule

