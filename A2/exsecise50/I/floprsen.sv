module floprsen(input logic clk,
                input logic reset,
                input logic set,
                input logic [3:0] d,
                output logic [3:0] q);
always_ff @(posedge clk,posedge reset,posedge set)
if (reset) q <= 0;
else if (set) q <= 1;
else q <= d;


endmodule 