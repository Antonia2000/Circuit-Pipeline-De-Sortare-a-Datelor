//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Popovici Andreea-Maria
// Data        : 25/05/2021
//------------------------------------------------------------------------------
// Descriere   :  Mediu de testare a modulului 
//------------------------------------------------------------------------------

module sort_pipe_test;

parameter DATA_WIDTH = 'd8;

wire 					 clk;
wire 					 rst_n;
wire [8*DATA_WIDTH-1 :0] client_data; 
wire 					 client_rdy;
wire 					 client_val;
wire [DATA_WIDTH-1 :0]	 sort_data; 
wire 					 sort_rdy;
wire 					 sort_val;



ck_rst_tb i_ck_rst_tb(
.clk (clk),
.rst_n (rst_n)
);

sort_pipe sort_pipe_DUT(
.clk (clk),
.rst_n (rst_n),
.client_val (client_val),
.client_data (client_data),
.client_rdy (client_rdy),
.sort_rdy (sort_rdy),
.sort_val (sort_val),
.sort_data (sort_data)
);

receptor i_receptor(
.clk (clk),
.rst_n (rst_n),
.sort_rdy (sort_rdy),
.sort_val (sort_val),
.sort_data (sort_data)
);

sort_pipe_tb i_sort_pipe_tb(
.clk (clk),
.client_val (client_val),
.client_data (client_data),
.client_rdy (client_rdy)
);

endmodule
