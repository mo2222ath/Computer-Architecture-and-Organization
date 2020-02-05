module twoflops(input logic clk,
input logic d0, d1,
output logic q0, q1);
always_ff @(posedge clk)
begin
q1 = d1;
q0 = d0;
end
endmodule