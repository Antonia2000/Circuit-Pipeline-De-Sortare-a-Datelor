//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Popovici Andreea-Maria
// Data        : 25/05/2021
//------------------------------------------------------------------------------
// Descriere   :  Receptorul de date al modulului sort_pipe
//------------------------------------------------------------------------------


module receptor#(
parameter DATA_WIDTH = 'd8
) (
input 					  rst_n,
input 					  clk,

output  reg 			  sort_rdy,
input   			      sort_val,
input  [DATA_WIDTH-1 :0]  sort_data
);


always @(posedge clk or negedge rst_n)
	if(~rst_n)   sort_rdy <= 1'b0; else
			sort_rdy <= 1'b1; //mereu pregatit
endmodule
