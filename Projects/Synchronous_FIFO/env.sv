class dff_env;

dff_agent agent;

function new();
	agent = new();
endfunction

task run();
	$display("env run task");
	agent.run();
endtask
endclass
