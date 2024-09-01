class dff_tx;

rand bit din;
bit qout;

function void print(string name = "tx class");
	$display("printing %s",name);
	$display("din=%d",din);
	$display("qout=%d",qout);
endfunction	

endclass
