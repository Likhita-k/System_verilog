module sync_fifo(clk_i,rst_i,wdata_i,rdata_o,wr_en_i,rd_en_i,full_o,empty_o,error_o);

parameter WIDTH =4;
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);

input clk_i,rst_i;
input [WIDTH-1:0] wdata_i;
input wr_en_i,rd_en_i;
output reg [WIDTH-1:0] rdata_o;
output reg full_o,empty_o,error_o;

reg [ADDR_WIDTH-1:0] wr_ptr,rd_ptr;
reg wr_toggle,rd_toggle;
reg [WIDTH-1:0] mem [DEPTH-1:0];
integer i;

always@(posedge clk_i) begin
	if(rst_i == 1) begin
		rdata_o = 0;
		full_o = 0;
		empty_o = 0;
		error_o = 0;
		wr_ptr = 0;
		rd_ptr = 0;
		wr_toggle = 0;
		rd_toggle = 0;
		for(i=0;i<DEPTH;i=i+1) begin
			mem[i] = 0;
		end	
	end
	else begin
	//write
		if(wr_en_i == 1) begin
			if(full_o == 0) begin
				error_o = 0; 
				mem[wr_ptr] = wdata_i;
				if(wr_ptr == DEPTH-1) begin
					wr_ptr = 0;
					wr_toggle = ~wr_toggle;
				end
				else begin
					wr_ptr = wr_ptr+1;
				end
			end	
			else begin
				error_o =1;
			end	
	
		end	
	end
	//read
		if(rd_en_i == 1) begin
			if(empty_o == 0) begin
				error_o = 0; 
				rdata_o = mem[rd_ptr];
				if(rd_ptr == DEPTH-1) begin
					rd_ptr = 0;
					rd_toggle = ~rd_toggle;
				end
				else begin
					rd_ptr = rd_ptr+1;
				end
			end
			else begin
				error_o =1;
			end	

		end	
end

always@(*) begin
	empty_o = 0;
	full_o = 0;
	if(wr_ptr == rd_ptr && wr_toggle != rd_toggle) begin
		full_o =1;
	end	
	if(wr_ptr == rd_ptr && wr_toggle == rd_toggle) begin
		empty_o = 1;
	end
end
endmodule 
	
