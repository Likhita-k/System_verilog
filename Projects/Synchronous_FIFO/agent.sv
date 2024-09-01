class fifo_agent;

fifo_gen gen;
fifo_bfm bfm;
fifo_mon mon;
fifo_scb scb;
//fifo_cov cov;

function new();
	gen = new();
	bfm	= new();
	mon	= new();
	scb = new();
//	cov	= new();

endfunction 

task run();
	fork
		gen.run();
		bfm.run();
		mon.run();
		scb.run();
//		cov.run();
	join
endtask

endclass
