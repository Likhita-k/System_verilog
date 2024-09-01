module sync_fifo(clk_i,rst_i,wr_en_i,rd_en_i,wdata_i,rdata_o,empty_o,full_o,error_o);
parameter WIDTH =4;
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);

input clk_i,rst_i,wr_en_i,rd_en_i;
input [WIDTH-1:0]wdata_i;
output reg full_o,error_o,empty_o;
output reg [WIDTH-1:0]rdata_o;

reg[ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
reg wr_toggle_flag, rd_toggle_flag;

integer i;

reg [WIDTH-1:0] mem [DEPTH-1:0];

always@(posedge clk_i) begin
if(rst_i==1) begin
	wr_ptr=0;
	rd_ptr=0;
	rdata_o=0;
	wr_toggle_flag=0;
	rd_toggle_flag=0;
	full_o=0;
	empty_o=0;
	error_o=0;

	for(i=0;i<15;i=i+1) begin
		mem[i]=0;
	end
end

else begin
	error_o=0;
	if(wr_en_i==1) begin
		if(full_o==1) begin
			error_o=1;
			$display("error FIFO is full we cant write");
		end
		else begin
			mem[wr_ptr]=wdata_i;//writing to fifo
			if(wr_ptr==DEPTH) begin//check if reached last location
				wr_toggle_flag=~wr_toggle_flag;//if las location reached then toggle
				wr_ptr=0;//after toggling going back to beginning location
			end
			else begin
				wr_ptr=wr_ptr+1;
			end
		end
	end

	if(rd_en_i==1) begin
		if(empty_o==1) begin
			error_o=1;
			$display("error FIFO is empty we cant read");
		end
		else begin
			rdata_o=mem[rd_ptr];
			if(rd_ptr==DEPTH) begin
				rd_toggle_flag=~rd_toggle_flag;
				rd_ptr=0;
			end
			else begin
				rd_ptr=rd_ptr+1;
			end
		end
	end
end
end

always@(wr_ptr or rd_ptr) begin
	full_o=0;
	empty_o=0;
	if(wr_ptr == rd_ptr && wr_toggle_flag == rd_toggle_flag )begin
		empty_o = 1;
		full_o= 0;
	end
	if(wr_ptr == rd_ptr && wr_toggle_flag != rd_toggle_flag )begin
		empty_o = 0;
		full_o  = 1;
	end
end
endmodule
