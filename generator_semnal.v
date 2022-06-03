//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : <Neagu Lucian-Alexandru>
// Data        : <4/4/2022>
//---------------------------------------------------------------------------------------
// Descriere   : <Generator Semnal>
//---------------------------------------------------------------------------------------

module generator_semnal 
#(parameter CK_SEMIPERIOD = 'd10,
parameter WIDTH = 3)
(
    input                clk,
    input                rst_n,
    output reg           cen
    
);
initial
begin

    cen <=1'b0;
    @(posedge clk);
    repeat(4) @(posedge clk);
    cen <= 1'b1;
    repeat(10) @(posedge clk);
    $stop;

end
endmodule
