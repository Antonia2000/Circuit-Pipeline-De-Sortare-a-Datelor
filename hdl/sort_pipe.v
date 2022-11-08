
module sort_pipe #(
parameter DATA_WIDTH='d8
)(
input 				          clk,
input 				          rst_n,

input 					      client_val,
input [(8*DATA_WIDTH)-1:0]    client_data,
output reg                    client_rdy,

input 				          sort_rdy,
output reg                    sort_val,
output reg [8*DATA_WIDTH-1:0]   sort_data
);
reg [DATA_WIDTH-1 : 0] D0;
reg [DATA_WIDTH-1 : 0] D1;
reg [DATA_WIDTH-1 : 0] D2;
reg [DATA_WIDTH-1 : 0] D3;
reg [DATA_WIDTH-1 : 0] D4;
reg [DATA_WIDTH-1 : 0] D5;
reg [DATA_WIDTH-1 : 0] D6;
reg [DATA_WIDTH-1 : 0] D7;

reg [DATA_WIDTH-1:0] P0_C0_MAX;
reg [DATA_WIDTH-1:0] P0_C0_MIN;
reg [DATA_WIDTH-1:0] P0_C1_MIN;
reg [DATA_WIDTH-1:0] P0_C1_MAX;
reg [DATA_WIDTH-1:0] P0_C2_MAX;
reg [DATA_WIDTH-1:0] P0_C2_MIN;
reg [DATA_WIDTH-1:0] P0_C3_MIN;
reg [DATA_WIDTH-1:0] P0_C3_MAX;
reg [DATA_WIDTH-1:0] P1_C0_MAX;
reg [DATA_WIDTH-1:0] P1_C0_MIN;
reg [DATA_WIDTH-1:0] P1_C1_MIN;
reg [DATA_WIDTH-1:0] P1_C1_MAX;
reg [DATA_WIDTH-1:0] P1_C2_MAX;
reg [DATA_WIDTH-1:0] P1_C2_MIN;
reg [DATA_WIDTH-1:0] P1_C3_MIN;
reg [DATA_WIDTH-1:0] P1_C3_MAX;
reg [DATA_WIDTH-1:0] P2_C0_MIN;
reg [DATA_WIDTH-1:0] P2_C0_MAX;
reg [DATA_WIDTH-1:0] P2_C1_MIN;
reg [DATA_WIDTH-1:0] P2_C1_MAX;
reg [DATA_WIDTH-1:0] P3_C0_MIN;
reg [DATA_WIDTH-1:0] P3_C0_MAX;
reg [DATA_WIDTH-1:0] P3_C1_MIN;
reg [DATA_WIDTH-1:0] P3_C1_MAX;
reg [DATA_WIDTH-1:0] P3_C2_MIN;
reg [DATA_WIDTH-1:0] P3_C2_MAX;
reg [DATA_WIDTH-1:0] P3_C3_MIN;
reg [DATA_WIDTH-1:0] P3_C3_MAX;
reg [DATA_WIDTH-1:0] P4_C0_MIN;
reg [DATA_WIDTH-1:0] P4_C0_MAX;
reg [DATA_WIDTH-1:0] P4_C1_MAX;
reg [DATA_WIDTH-1:0] P4_C1_MIN;
reg [DATA_WIDTH-1:0] P4_C2_MIN;
reg [DATA_WIDTH-1:0] P4_C2_MAX;
reg [DATA_WIDTH-1:0] P4_C3_MAX;
reg [DATA_WIDTH-1:0] P4_C3_MIN;
reg [DATA_WIDTH-1:0] P5_C0_MIN;
reg [DATA_WIDTH-1:0] P5_C0_MAX;
reg [DATA_WIDTH-1:0] P5_C1_MAX;
reg [DATA_WIDTH-1:0] P5_C1_MIN;
reg [DATA_WIDTH-1:0] P5_C2_MIN;
reg [DATA_WIDTH-1:0] P5_C2_MAX;
reg [DATA_WIDTH-1:0] P5_C3_MAX;
reg [DATA_WIDTH-1:0] P5_C3_MIN;

always @(posedge clk or negedge rst_n) begin
if(~rst_n) D0 <= 'b0;
else if(sort_rdy) D0 <= client_data[DATA_WIDTH-1 : 0];
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) D1 <= 'b0;
else if(sort_rdy) D1 <=client_data[(2*DATA_WIDTH)-1 : DATA_WIDTH]; 
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) D2 <= 'b0;
else if(sort_rdy) D2 <=client_data[(3*DATA_WIDTH)-1 :(2*DATA_WIDTH)];
end 
always @(posedge clk or negedge rst_n) begin
if(~rst_n) D3 <= 'b0;
else if(sort_rdy) D3 <=client_data[(4*DATA_WIDTH)-1 :(3*DATA_WIDTH)];
end 

always @(posedge clk or negedge rst_n) begin
if(~rst_n) D4 <= 'b0;
else if(sort_rdy) D4 <=client_data[(5*DATA_WIDTH)-1 :(4*DATA_WIDTH)];
end 

always @(posedge clk or negedge rst_n) begin
if(~rst_n) D5 <= 'b0;
else if(sort_rdy) D5 <=client_data[(6*DATA_WIDTH)-1 :(5*DATA_WIDTH)];
end 

always @(posedge clk or negedge rst_n) begin
if(~rst_n) D6 <= 'b0;
else if(sort_rdy) D6 <=client_data[(7*DATA_WIDTH)-1 :(6*DATA_WIDTH)];
end 

always @(posedge clk or negedge rst_n) begin
if(~rst_n) D7 <= 'b0;
else if(sort_rdy) D7 <=client_data[(8*DATA_WIDTH)-1 :(7*DATA_WIDTH)]; 
end 


always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C0_MIN <= 'b0;
	else if (D0 < D1) begin
		P0_C0_MIN <= D0;
	end
	else P0_C0_MIN <= D1;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C0_MAX <= 'b0;
	else if (D0 > D1) begin
		P0_C0_MAX <= D0;
	end
	else P0_C0_MAX <= D1;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C1_MIN <= 'b0;
	else if (D2 < D3) begin
		P0_C1_MIN <= D2;
	end
	else P0_C1_MIN <= D3;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C1_MAX <= 'b0;
	else if (D2 > D3) begin
		P0_C1_MAX <= D2;
	end
	else P0_C1_MAX <= D3;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C2_MIN <= 'b0;
	else if (D4 < D5) begin
		P0_C2_MIN <= D4;
	end
	else P0_C2_MIN <= D5;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C2_MAX <= 'b0;
	else if (D4 > D5) begin
		P0_C2_MAX <= D4;
	end
	else P0_C2_MAX <= D5;
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C3_MIN <= 'b0;
	else if (D6 < D7) begin
		P0_C3_MIN <= D6;
	end
	else P0_C3_MIN <= D7;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) P0_C3_MAX <= 'b0;
	else if (D6 > D7) begin
		P0_C3_MAX <= D6;
	end
	else P0_C3_MAX <= D7;
end

always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C0_MIN <= 'b0;
	else if (P0_C0_MIN < P0_C1_MIN) begin
		P1_C0_MIN <=P0_C0_MIN;
	end
	else P1_C0_MIN <= P0_C1_MIN;
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C0_MAX <= 'b0;
	else if (P0_C0_MIN >P0_C1_MIN) begin
		P1_C0_MAX <=P0_C0_MIN;
	end
	else P1_C0_MAX <= P0_C1_MIN;
end


always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C1_MIN <= 'b0;
	else if (P0_C0_MAX < P0_C1_MAX) begin
		P1_C1_MIN <=P0_C0_MAX;
	end
	else P1_C1_MIN <= P0_C1_MAX;
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C1_MAX <= 'b0;
	else if (P0_C0_MAX >P0_C1_MAX) begin
		P1_C1_MAX <=P0_C0_MAX;
	end
	else P1_C1_MAX <= P0_C1_MAX;
end


always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C2_MIN <= 'b0;
	else if (P0_C2_MIN < P0_C3_MIN) begin
		P1_C2_MIN <=P0_C2_MIN;
	end
	else P1_C2_MIN <= P0_C3_MIN;
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C2_MAX <= 'b0;
	else if (P0_C2_MIN >P0_C3_MIN) begin
		P1_C2_MAX <=P0_C2_MIN;
end
	else P1_C2_MAX <= P0_C3_MIN;
end


always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C3_MIN <= 'b0;
	else if (P0_C2_MAX < P0_C3_MAX) begin
		P1_C3_MIN <=P0_C2_MAX;
	end
	else P1_C3_MIN <= P0_C3_MAX;
end
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P1_C3_MAX <= 'b0;
	else if (P0_C2_MAX >P0_C3_MAX) begin
		P1_C3_MAX <=P0_C2_MAX;
	end
	else P1_C3_MAX <= P0_C3_MAX;
end

always @(posedge clk or negedge rst_n) begin
if(~rst_n) P2_C0_MIN <= 'b0;
else if(P1_C0_MAX<P1_C1_MIN)begin
       P2_C0_MIN<=P1_C0_MAX;
end
	 else P2_C0_MIN<=P1_C1_MIN;
	end
always @(posedge clk or negedge rst_n) begin  
if(~rst_n) P2_C0_MAX <= 'b0;
else if(P1_C0_MAX>P1_C1_MIN) begin
     P2_C0_MAX<=P1_C0_MAX;
	 end
	 else P2_C0_MAX<=P1_C1_MIN;
	 end
	 
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P2_C1_MIN <= 'b0;
else if(P1_C2_MAX<P1_C3_MIN)begin
     P2_C1_MIN<=P1_C2_MAX;
	 end
	 else P2_C1_MIN<=P1_C3_MIN;
	 end
always @(posedge clk or negedge rst_n) begin  
if(~rst_n) P2_C1_MAX <= 'b0;
else if(P1_C2_MAX>P1_C3_MIN)begin
     P2_C1_MAX<=P1_C2_MAX;
	 end
	 else P2_C1_MAX<=P1_C3_MIN;
	 end
//=======================//
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P3_C0_MIN <= 'b0;
else if(P1_C0_MIN<P1_C2_MIN)begin
     P3_C0_MIN<=P1_C0_MIN;
	 end
	 else P3_C0_MIN<=P1_C2_MIN;
end

always @(posedge clk or negedge rst_n) begin
if(~rst_n) P3_C2_MIN <= 'b0;
else if(P1_C0_MIN<P1_C2_MIN)begin
     P3_C2_MIN<=P1_C2_MIN;
	 end
	 else P3_C2_MIN<=P1_C0_MIN;
end
//=================// p3 c0&2 min
//================// 
always @(posedge clk or negedge rst_n) begin
if(~rst_n) P3_C0_MAX <= 'b0;
else if(P2_C0_MIN<P2_C1_MIN)begin
     P3_C0_MAX<=P2_C0_MIN;
	 end
	 else P3_C0_MAX<=P2_C1_MIN;
	 end

always @(posedge clk or negedge rst_n) begin
if(~rst_n) P3_C2_MAX <= 'b0;
else if(P2_C0_MIN<P2_C1_MIN)begin
     P3_C2_MAX<=P2_C1_MIN;
	 end
	 else P3_C2_MAX<=P2_C0_MIN;
 end
 //=================// p3 c0&2 max
//================// 
 always @(posedge clk or negedge rst_n) begin
 if(~rst_n)P3_C1_MIN<='b0;
 else if(P2_C0_MAX<P2_C1_MAX)begin
  P3_C1_MIN<=P2_C0_MAX;
  end
  else P3_C1_MIN<=P2_C1_MAX;
  end
  
   always @(posedge clk or negedge rst_n) begin
 if(~rst_n)P3_C3_MIN<='b0;
 else if(P2_C0_MAX<P2_C1_MAX)begin
  P3_C3_MIN<=P2_C1_MAX;
  end
  else P3_C3_MIN<=P2_C0_MAX;
  end
   //=================// p3 c1&3 min
//================// 
  always @(posedge clk or negedge rst_n) begin
 if(~rst_n)P3_C1_MAX<='b0;
 else if(P1_C1_MAX<P1_C3_MAX)begin
  P3_C1_MAX<=P1_C1_MAX;
  end
  else P3_C1_MAX<=P1_C3_MAX;
  end
  
   always @(posedge clk or negedge rst_n) begin
 if(~rst_n)P3_C3_MAX<='b0;
 else if(P1_C1_MAX<P1_C3_MAX)begin
  P3_C3_MAX<=P1_C3_MAX;
  end
  else P3_C3_MAX<=P1_C1_MAX;
  end
//=================// p3 c1&3 max
//================// 
always @(posedge clk or negedge rst_n) begin
  if(~rst_n)P4_C1_MIN<='b0;
  else if(P3_C1_MIN>P3_C2_MIN)begin
  P4_C1_MIN<=P3_C2_MIN;
  end
  else P4_C1_MIN <=P3_C1_MIN;
  end

always @(posedge clk or negedge rst_n) begin
  if(~rst_n)P4_C2_MIN<='b0;
  else if(P3_C1_MIN>P3_C2_MIN)begin
  P4_C2_MIN<=P3_C1_MIN;
  end
  else P4_C2_MIN <=P3_C2_MIN;
  end 
//=================// p4 c1&2 min
//================// 
always @(posedge clk or negedge rst_n) begin
   if(~rst_n) P4_C1_MAX<='b0;
   else if(P3_C1_MAX<P3_C2_MAX)begin
   P4_C1_MAX<=P3_C1_MAX;
   end
   else  P4_C1_MAX<=P3_C2_MAX;
   end
    
always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P4_C2_MAX<='b0;
   else if(P3_C1_MAX<P3_C2_MAX)begin
   P4_C2_MAX<=P3_C2_MAX;
   end
   else P4_C2_MAX<=P3_C1_MAX;
   end
 //=================// p4 c1&2  max
//================//   
always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C0_MAX<='b0;
   else if(P3_C0_MAX>P4_C1_MIN)begin
   P5_C0_MAX<=P4_C1_MIN;
   end
   else P5_C0_MAX<=P3_C0_MAX;
   end
always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C1_MIN<='b0;
   else if(P3_C0_MAX>P4_C1_MIN)begin
   P5_C1_MIN<=P3_C0_MAX;
   end
   else  P5_C1_MIN<=P4_C1_MIN;
end

//=================// p5 c0 max p5 c1 min
//================//   
always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C1_MAX<='b0;
   else if(P4_C1_MAX>P4_C2_MIN)begin
   P5_C1_MAX<=P4_C2_MIN;
   end
   else  P5_C1_MAX<=P4_C1_MAX;
end

always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C2_MIN<='b0;
   else if(P4_C1_MAX>P4_C2_MIN)begin
   P5_C2_MIN<=P4_C1_MAX;
   end
   else P5_C2_MIN<=P4_C2_MIN;
   end
//=================// p5 c1 max p5 c2 min
//================// 

always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C2_MAX<='b0;
   else if(P4_C2_MAX>P3_C3_MIN)begin
   	P5_C2_MAX<=P3_C3_MIN;
   end
   else  P5_C2_MAX<=P4_C2_MAX;
end

always @(posedge clk or negedge rst_n) begin
   if(~rst_n)P5_C3_MIN<='b0;
   else if(P4_C2_MAX>P3_C3_MIN)begin
   P5_C3_MIN<=P4_C2_MAX;
   end
   else P5_C3_MIN<=P3_C3_MIN;
   end
//=================// p5 c2 max p5 c3 min
//================// 
 always @(posedge clk or negedge rst_n) begin
	 if(~rst_n)sort_data<=64'b0;
	 else
     sort_data={P3_C0_MIN,P5_C0_MAX,P5_C1_MIN,P5_C1_MAX,P5_C2_MIN,P5_C2_MAX,P5_C3_MIN,P3_C3_MAX};
	 end
   endmodule