module Test_Assigment3Task1;

 logic [4:0] A,B;
 logic [4:0] Select;
 logic [7:0] Result;
 logic Carry;
 logic Ovarflow;
 logic Nigative;
 logic Less;
 logic Equal;
 logic Zero;

 int i;
 
 AluAssignment3Task1 test(
            A,B,                
            Select,
            Result,
            Carry,
				Ovarflow,
				Nigative,
				Less,
				Equal,
				Zero
     );
	  
	  

initial begin

A = 4'd10;
B = 4'd11;
Select = 4'd0;
#50;


Select = 4'd1;
#50;


Select = 4'd2;
#50;


Select = 4'd3;
#50;


Select = 4'd4;
#50;


Select = 4'd5;
#50;


Select = 4'd6;
#50;


Select = 4'd7;
#50;

Select = 4'b1000;
#50;


Select = 4'd9;
#50;

Select = 4'd10;
#50;


Select = 4'd11;
#50;


Select = 4'd12;
#50;

//for (i=0;i<=12;i=i+1)
//	begin
//	 Select += i;
//	 #50;
//	end

//      A = 4'd2;
//      B = 4'd2;

end

always@(*) begin
		
		 if(Carry==1)
			    Ovarflow = 1;
		 else
				 Ovarflow = 0; 
		 
		 if( (A+B) == 0)
				 Zero = 1;
		 else
				 Zero = 0;
		 
		 if(A==B)
				 Equal = 1;
		 else
				 Equal = 0;
		 
		 
		 if((A<B)==1)
				 Less = 1;
		 else
				 Less = 0;
		 
		 
		 if(A<0)
				 Nigative = 1;
		 else
				 Nigative = 0;
				
		end
	 
		
endmodule
