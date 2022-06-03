//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : <Neagu Lucian-Alexandru>
// Data        : <4/4/2022>
//---------------------------------------------------------------------------------------
// Descriere   : <Conter Gray Test>
//---------------------------------------------------------------------------------------

module cntr_gray_test;
localparam WIDTH = 4;
wire        		clk;
wire        		rst_n;
wire        		cen;
wire [WIDTH-1:0]  	decode_out;
wire [WIDTH-1:0] 	count;

ck_rst_tb #(.CK_SEMIPERIOD ('d10))
 i_ck_rst_tb(
.clk    (clk  ),
.rst_n  (rst_n)
);
generator_semnal #(.CK_SEMIPERIOD ('d10))
 i_generator_semnal (
.clk     (clk  ),
.rst_n   (rst_n),
.cen     (cen  )
);
cntr_gray i_cntr_gray(
.clk            (clk),
.decode_out     (decode_out),
.cen            (cen),
.count			(count),
.rst_n          (rst_n)
);
    
endmodule