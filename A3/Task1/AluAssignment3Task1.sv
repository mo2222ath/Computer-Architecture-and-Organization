module AluAssignment3Task1(
           input [4:0] A,B,                
           input [4:0] select,
           output [7:0] Out, 
           output Carry,
			  output Ovarflow,
			  output Nigative,
			  output Less,
			  output Equal,
			  output Zero			  
    );
	 
    logic [7:0] Result;
    logic [7:0] tmp;
    assign Out = Result;
    assign tmp = A + B ;
    assign Carry = tmp[7];
	 
	 
	 parameter f1 = 4'b0000;
	 parameter f2 = 4'b0001;
	 parameter f3 = 4'b0010;
	 parameter f4 = 4'b0011;
	 parameter f5 = 4'b0100;
	 parameter f6 = 4'b0101;
	 parameter f7 = 4'b0110;
	 parameter f8 = 4'b0111;
	 parameter f9 = 5'b01000;
	 parameter f10 = 4'b1001;
	 parameter f11 = 4'b1010;
	 parameter f12 = 4'b1011;
	 
	 
    always @(*)
    begin
        case(select)
			f1:
				Result = A + B ; 
			f2:
				Result = A - B ;
         f3:
				Result = A * B;
         f4: 
				Result = A / B;
         f5: 
				Result = A & B;
         f6: 
				Result = A | B;
         f7: 
				Result = A ^ B;
         f8: 
				Result = ~A;
         f9:  
				Result = A<<1;  // 1010<<1 -- 0100
         f10: 
				Result = A>>1; // 1010>>1 -- 0101
         f11:
				Result = A>>>1; // 1010>> -- 1101
         f12:
				Result = {A[2:0],A[3]};
				
          default: Result = 0 ;
        endcase
    end
	 
	 

endmodule