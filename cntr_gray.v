//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : <Neagu Lucian-Alexandru>
// Data        : <4/4/2022>
//---------------------------------------------------------------------------------------
// Descriere   : <Gray Code Counter>
//---------------------------------------------------------------------------------------

module cntr_gray #(parameter WIDTH = 4)(		// latimea registrului
input                     	clk,
input                     	rst_n,
input                     	cen,
output reg   [WIDTH-1:0]    binary,			// cod natural
output wire  [WIDTH-1:0]    count,          //  cod Gray
output wire  [WIDTH-1:0]    decode_out      

);

 always @(posedge clk or negedge rst_n) begin
        if(~rst_n)              begin binary <= 'd0; end                //resetarea valorii numaratoarei cand reset-ul este activ
        else if(cen == 1)       begin binary <= binary + 'd1; end 		//incrementarea valorii numaratoarei cand resetul este inactiv
                                    
  end

	assign count = {binary[WIDTH-1], binary[WIDTH-1:1] ^ binary[WIDTH-2:0]};
    assign decode_out[3]  = count[3];                     //LSB
    assign decode_out[2]  = count[3] ^ count[2];   		  // decodare byte 3
    assign decode_out[1]  = decode_out[2] ^ count[1];     // decodare byte 2
    assign decode_out[0]  = decode_out[1] ^ count[0];     // decodare byte 1

endmodule 
/*
module gray_counter(clk, rst, out);						
 input clk, rst;                                        
 output reg [3:0] out;                                  
                                                        `ifdef FOR_LOOP
 reg q0, q1, q2;                                        	for (int i=0;i<WIDTH-1;i=i++) begin
 reg [3:0] count;                                       	count[i] <=q[i+1]^q[i];
                                                        		decode_out <=  1 << q ;
 always @ (posedge clk)                                 	end
 begin                                                  	count[WIDTH-1]<=q[WIDTH-1];
  if (rst)                                              `else
   count = 4'b0;                                        	count<={q[WIDTH-1],q[WIDTH-1:1]^q[WIDTH-2:0]};
   out = 4'b0;                                          `endif
  else
   count = count + 1'b1;
   q2 = count[3] ^ count[2];
   q1 = count[2] ^ count[1];
   q0 = count[1] ^ count[0];
   out = {count[3], q2, q1, q0};
 end
endmodule
*/


	
	
	

