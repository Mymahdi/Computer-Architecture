`timescale 1ns/1ns
module Comparator (A ,B , lt , gt);

input [7:0] A;
input [7:0] B;  
output lt;
output gt;

assign lt = (A > B) ? 1'b1 : 1'b0;
assign gt = (A > B) ? 1'b0 : 1'b1;

endmodule

// assign lt = A > B ? B : A;
// assign gt = A > B ? A : B;

