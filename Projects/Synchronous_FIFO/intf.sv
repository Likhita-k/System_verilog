interface fifo_intf(input logic clk_i,rst_i);

logic wr_en_i,rd_en_i;
logic [`WIDTH-1:0]wdata_i;
logic full_o,error_o,empty_o;
logic [`WIDTH-1:0]rdata_o;

clocking bfm_cb@(posedge clk_i);
default input #1 output #0;
	output wr_en_i;
	output rd_en_i;
	output wdata_i;
	input full_o;
	input error_o;
	input empty_o;
	input rdata_o;

endclocking

clocking mon_cb@(posedge clk_i);
default input #0;
	input wr_en_i;
	input rd_en_i;
	input wdata_i;
	input full_o;
	input error_o;
	input empty_o;
	input rdata_o;

endclocking

modport bfm_mp(clocking bfm_cb);

modport mon_mp(clocking mon_cb);

endinterface 
