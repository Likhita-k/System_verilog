module top;

reg clk_i,rst_i;

fifo_intf pif(.clk_i(clk_i),.rst_i(rst_i));

sync_fifo dut(.clk_i(pif.clk_i),.rst_i(pif.rst_i),.wr_en_i(pif.wr_en_i),.rd_en_i(pif.rd_en_i),.wdata_i(pif.wdata_i),.rdata_o(pif.rdata_o),.empty_o(pif.empty_o),.full_o(pif.full_o),.error_o(pif.error_o));

fifo_env env;
event e1;
//assertion instantiation

initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	rst_i = 1;
	pif.wr_en_i = 0;
	pif.rd_en_i = 0;
	pif.wdata_i = 0;
	repeat(2)@(posedge clk_i);
	$value$plusargs ("testname=%s",fifo_common::testname);
	rst_i = 0;
	->e1;
end

initial begin
	wait(e1.triggered);
	env = new();
	env.run();
end

initial begin
	#1000;
	$finish();
end	
endmodule
