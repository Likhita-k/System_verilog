class dff_agent;

dff_gen gen;
dff_bfm bfm;
//dff_mon mon;
//dff_cov cov;

function new();
	gen = new();
	bfm = new();
//	mon = new();
//	cov = new();
endfunction

task run();
	$display("agent run task");
	gen.run();
	bfm.run();
//	mon.run();
//	cov.run();
endtask
endclass


