module FSM(input logic clk,reset,
           input logic a,
            output logic out1, out2);
logic state , nextstate;
// next state logic and register (sequential)
always_ff @(posedge clk , posedge reset)
  if (reset)  state <= 1'b1;
  else        state <= nextstate;
always_comb
case (state)
   0: if (a) nextstate = 1'b1;
      else nextstate = 1'b0;
   1: if (~a) nextstate = 1'b0;
      else nextstate = 1'b1;
endcase
always_comb
if (state == 0) {out1, out2} = {1'b1, 1'b0};
else {out1, out2} = {1'b0, 1'b1};
endmodule

