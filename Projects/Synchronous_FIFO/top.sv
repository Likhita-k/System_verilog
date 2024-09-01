module top;

reg clk_i,rst_i;
event e;

dff_env env;

dff_intf pif(.clk_i(clk_i),.rst_i(rst_i));

sync_reset dut (.d_i(pif.d_i),.clk_i(pif.clk_i),.rst_i(pif.rst_i),.q_o(pif.q_o));

initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin
	wait(e.triggered);
	env = new();
	env.run();
end

initial begin 
	rst_i = 1;
	repeat(2)@(posedge clk_i);
	rst_i = 0;
	-> e;
end

initial begin
	#1000;
	$finish;
end

endmodule 
