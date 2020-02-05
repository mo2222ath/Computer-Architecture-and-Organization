module divideby3FSM(input logic clk,
                    input logic reset,
                    output logic out);
logic [1:0] state, nextstate;
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
// State Register
always_ff @(posedge clk, posedge reset)
if (reset) state <= S0;
else state <= nextstate;
// Next State Logic
always_comb
case (state)
S0: nextstate = S1;
S1: nextstate = S2;
S2: nextstate = S0;
default: nextstate=S0;
endcase
// Output Logic
assign out = (state == S2);
endmodule