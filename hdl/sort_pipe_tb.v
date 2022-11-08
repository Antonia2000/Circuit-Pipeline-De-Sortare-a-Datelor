//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Popovici Andreea-Maria
// Data        : 25/05/2021
//------------------------------------------------------------------------------
// Descriere   :  Generator de date al modulului sort_pipe
//------------------------------------------------------------------------------
module sort_pipe_tb #(
parameter DATA_WIDTH = 'd8
)(
input 					          clk,
input                             client_rdy,
output  reg 				      client_val,
output  reg [(8*DATA_WIDTH)-1 :0] client_data 
);
initial begin
client_val <= 1'b0; 
client_data <= 64'b0; 
repeat(4) @(posedge clk);
client_val <= 1'b1;
client_data <= {8'd4, 8'd2, 8'd3, 8'd5, 8'd1, 8'd6, 8'd8, 8'd7};
repeat(30)@(posedge clk);
client_val <= 1'b1;
client_data <= {8'd45, 8'd66, 8'd20, 8'd15, 8'd10, 8'd89, 8'd69, 8'd5};
repeat(30)@(posedge clk);
client_val <= 1'b1;
client_data <= {8'd200, 8'd345, 8'd542, 8'd190, 8'd287, 8'd567, 8'd321, 8'd900};
@(posedge clk);
end
endmodule