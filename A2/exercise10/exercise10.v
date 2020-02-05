// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Sat Oct 26 11:27:25 2019"

module exercise10(
	b,
	c,
	a,
	Y
);


input wire	b;
input wire	c;
input wire	a;
output wire	Y;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_1 = 0;




mux41_0	b2v_inst1(
	.S0(b),
	.D2(SYNTHESIZED_WIRE_0),
	.S1(a),
	.D3(SYNTHESIZED_WIRE_1),
	.D0(SYNTHESIZED_WIRE_2),
	
	.D1(c),
	.Q(Y));

assign	SYNTHESIZED_WIRE_2 =  ~c;




endmodule

module mux41_0(S0,D2,S1,D3,D0,D1,Q);
/* synthesis black_box */

input S0;
input D2;
input S1;
input D3;
input D0;
input D1;
output Q;

endmodule
