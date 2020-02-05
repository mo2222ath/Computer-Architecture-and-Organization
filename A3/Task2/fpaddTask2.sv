module fpaddTask2(input logic [31:0] a,b,
				output logic [31:0] s);
				
	logic [7:0] exponent_a, exponent_b , exp_pre,exponents,shift_amount,exponentSub;
	logic a_less_b;
	logic [23:0] mantisa_a,mantisa_b,shifted_mantisa;
	logic [22:0] fraction,fractionSub;
	logic A_sign,B_sign,Sign;
	assign {A_sign,exponent_a,mantisa_a} = {a[31],a[30:23],1'b1,a[22:0]};
	assign {B_sign,exponent_b,mantisa_b} = {b[31],b[30:23],1'b1,b[22:0]};
	
	

	exponent_compare exponent_compare1(exponent_a, exponent_b, a_less_b, exp_pre, shift_amount);
	shift_mantisa shift_mantisa1(a_less_b, mantisa_a, mantisa_b, shift_amount, shifted_mantisa);
	
	add_Sub_mantisa add_Sub_mantisa1(a_less_b,a,b,mantisa_a,
		mantisa_b,shifted_mantisa, exp_pre,exponent_a, exponent_b,fraction,
		fractionSub,exponents,exponentSub,Sign);	

	always@(*)begin

	if(A_sign == 0 & B_sign == 0)
			 s = {1'b0,exponents,fraction};
	else if(A_sign == 1 & B_sign == 1)
			 s = {1'b1,exponents,fraction};
	else if( (A_sign == 1 & B_sign == 0) | (A_sign == 0 & B_sign == 1) )begin
			if(a_less_b)
				 s = {B_sign,exponentSub,fractionSub};
			else
				 s = {A_sign,exponentSub,fractionSub};
	end
	else
		 s = {1'b0,exponents,fraction};

	end

endmodule




module exponent_compare(input logic[7:0] exponent_a, exponent_b,
				output logic a_less_b,
				output logic[7:0] exponents, shift_amount);
	
	logic[7:0] a_minus_b, b_minus_a;
	assign a_minus_b = exponent_a - exponent_b;
	assign b_minus_a = exponent_b - exponent_a;
	assign a_less_b = a_minus_b[7];
	
	always_comb
		if (a_less_b) begin
			exponents = exponent_b;
			shift_amount = b_minus_a;
		end
		else begin
			exponents = exponent_a;
			shift_amount = a_minus_b;
		end
endmodule



module shift_mantisa(input logic a_less_b,
					input logic [23:0] mantisa_a, mantisa_b,
					input logic [7:0] shift_amount,
					output logic [23:0] shifted_mantisa);

	logic [23:0] shiftedvalue;
	assign shiftedvalue = a_less_b ? (mantisa_a >> shift_amount): (mantisa_b >> shift_amount);

	always_comb
		if (shift_amount[7] | shift_amount[6] | shift_amount[5] | (shift_amount[4] & shift_amount[3]))
			shifted_mantisa = 24'b0;
		else
			shifted_mantisa = shiftedvalue;
endmodule

	



module add_Sub_mantisa(input logic a_less_b,
                input logic [31:0] a,b,
					 input logic [23:0] mantisa_a,mantisa_b,shifted_mantisa,
                input logic [7:0] exp_pre,exponent_a, exponent_b,
                output logic [22:0] fraction,fractionSub,
                output logic [7:0] exponents,exponentSub,
					 output logic Sign);
					 
logic[24:0] add_result;
logic[24:0] sub_result;
logic[23:0] add_value;



	always@(*) begin	
	
	   //Adding to Zero
		if(a[30:23] == 0 & a[22:0] == 0 )begin
				 fraction = b[22:0];
				 exponents = b[30:23];
				 Sign = b[31];
		end
		else if(b[30:23] == 0 & b[22:0] == 0 )begin
			 fraction = a[22:0];
			 exponents = a[30:23];
			 Sign = a[31];
		end
		//If addition result is Zero in Three cases:
		// First Case  : 0 + 0
		else if(a[30:23] == 0 & a[22:0] == 0 & b[30:23] == 0 & b[22:0] == 0) begin
				 fraction = 23'b0;
				 exponents = 8'b0;
				 Sign = 1'b0;
		end  
		//Second Case :  a + (-a)
		else if( (a[30:23] ==  b[30:23]) & (a[22:0] == b[22:0]) & (a[31] != b[31]) ) begin
				 fraction = 23'b0;
				 exponents = 8'b0;
				 Sign = 1'b0;
		end  
		
		//Adding to Infinity 
		else if(a[30:23] == 255 & a[22:0] == 0)begin
					//Third Case :  infinity + (-infinity)
				 if( b[30:23] == 8'd255 &  b[22:0] == 23'b0 & a[31] != b[31]) begin
					 fraction = 23'b0;
					 exponents = 8'b0;
					 Sign = 1'b0;
					end
				else begin
					 fraction = 23'd0;
					 exponents = 8'd255;
					 Sign = a[31];
				 end
		end
		else if(b[30:23] == 255 & b[22:0] == 0)begin
				 if( a[30:23] == 8'd255 &  a[22:0] == 23'b0 & a[31] != b[31]) begin
					 fraction = 23'b0;
					 exponents = 8'b0;
					 Sign = 1'b0;
					end
				else begin
					 fraction = 23'd0;
					 exponents = 8'd255;
					 Sign = a[31];
				 end
			end
		//Adding to NaN	
		else if(a[30:23] == 8'd255 & a[22:0] != 23'b0 )begin 
				 fraction = a[22:0];
				 exponents = a[30:23];
				 Sign = a[31];
		end
		else if(b[30:23] == 8'd255 & b[22:0] != 23'b0 )begin 
		       fraction = b[22:0];
				 exponents = b[30:23];
				 Sign = b[31];
		end
		
		else begin
			 add_value = a_less_b ? mantisa_b : mantisa_a;
			 add_result = shifted_mantisa + add_value;
			 sub_result = shifted_mantisa - add_value;
			 fraction = add_result[24]?add_result[23:1]:add_result[22:0];
			 fractionSub = sub_result[24]?sub_result[23:1]:sub_result[22:0];
			 exponents = add_result[24]?(exp_pre + 1):exp_pre;
			 exponentSub = sub_result[24]?(exp_pre + 1):exp_pre;
		end	
		 
	end	
	
endmodule

