class fifo_env;

fifo_agent agent;

function new();
	agent = new();
endfunction

task run();
	agent.run();	
endtask

endclass
