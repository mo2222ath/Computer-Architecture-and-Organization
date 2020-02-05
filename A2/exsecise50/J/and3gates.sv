module and3gates(input logic a, b, c,
            output logic y);
logic tmp;
always_comb
begin
tmp = a & b;
y = tmp & c;
end
endmodule 