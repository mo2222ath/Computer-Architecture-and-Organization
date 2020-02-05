module mux2(input logic [3:0] d0, d1,
input logic s,
output logic [3:0] y);
always_ff @(posedge s)
 if (s) y <= d1;
 else y <= d0;
endmodule