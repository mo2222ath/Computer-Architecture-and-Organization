module exercise18
(input logic a,b,c,d,
output logic y);

assign y = ( a & b ) | ( a & ~ d ) | ( b & d ) ;

endmodule