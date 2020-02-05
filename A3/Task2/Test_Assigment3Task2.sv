module Test_Assigment3Task2;

 logic [31:0] a,b;
 logic [31:0] s;
 
 
 fpaddTask2 test(
            a,b,                
            s
     );
	  
    initial begin
	 
	  // Adding normal floating Numbers
      a = 32'h0x3FC00000; 
      b = 32'h0x40500000;
		
		#100;
		
      //Adding to Zero
		a = 32'd5; 
		b = 32'd0;
		
		#100;

		//Adding to NAN
		a = 32'b1111111100000000000010110000000;
		b = 32'd20;
		
		#100;
		
		//Adding to Infinity
	   a = 32'b1111111100000000000000000000000; 
		b = 32'd20;	
		
		#100;
		
		//When the Result of Addition id Zero
		//First Case : 0 + 0
		a = 32'b0; 
		b = 32'b0;
		
		#100;
		
		//Second Case : a + (-a)
		a = 32'b01000000000000000000000000000000;
		b = 32'b11000000000000000000000000000000;

		#100;
		
		//Third Case : Infinity + (-Infinity)
		a = 32'b11111111100000000000000000000000;
		b = 32'b01111111100000000000000000000000;
		#100;
		
		// adding with Nigative numbers
		
		// posative + Nigative
		a = 32'b01000000000010000000000000000000;
		b = 32'b11000000000000001100000000000000;
		#100;
		
		// Nigative + posative
		a = 32'b11000000000010000000000000000000;
		b = 32'b01000000000000001100000000000000;
		#100;
		
		// Nigative + Nigative
		a = 32'b11000000000010000000000000000000;
		b = 32'b11000000000000001100000000000000;
		#100;
		
		
		end
		
		
		

		
endmodule
