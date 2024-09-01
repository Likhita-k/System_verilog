class fifo_tx;

rand bit [`WIDTH-1:0]wdata;
rand bit wr_en,rd_en;
	 bit [`WIDTH-1:0]rdata;
	 bit full,empty,error;

virtual function void print(string name ="fifo_tx");
	$display("printing values of %s",name);
	$display("wdata=%h",wdata);
	$display("wr_en=%d,rd_en=%d",wr_en,rd_en);
	$display("rdata=%h",rdata);
	$display("full=%d,empty=%d,error=%d",full,empty,error);
	$display("---------------------------------------------");
endfunction
endclass
