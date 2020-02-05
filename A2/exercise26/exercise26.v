module exercise26(
	S,
	R,
	E,
	Q,
	Qcomp
);


input wire	S;
input wire	R;
input wire	E;
output wire	Q;
output wire	Qcomp;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;

assign	Q = SYNTHESIZED_WIRE_3;
assign	Qcomp = SYNTHESIZED_WIRE_0;



assign	SYNTHESIZED_WIRE_1 = S & E;

assign	SYNTHESIZED_WIRE_2 = E & R;

assign	SYNTHESIZED_WIRE_3 = ~(SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1);

assign	SYNTHESIZED_WIRE_0 = ~(SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3);


endmodule
