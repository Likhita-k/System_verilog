class fifo_mon;

fifo_tx tx;
virtual fifo_intf vif;

function new();
	vif = top.pif;
endfunction

/*
task run();
	$display("fifo monitor run task");
	while(1)begin
		tx = new();
		@(vif.mon_cb);
		wait(vif.mon_cb.wr_en_i || vif.mon_cb.rd_en_i);
		if(vif.mon_cb.wr_en_i)begin
			tx.wr_en = vif.mon_cb.wr_en_i;
//			@(vif.mon_cb);
			tx.wdata = vif.mon_cb.wdata_i;
			tx.full = vif.mon_cb.full_o;
			tx.error = vif.mon_cb.error_o;
			tx.empty = vif.mon_cb.empty_o;
		//	$display("wr_en=%d,wdata=%d",tx.wr_en,tx.wdata);
			tx.print("wr_en high in mon");
		end
		@(vif.mon_cb);
		if(vif.mon_cb.rd_en_i)begin
			tx.rd_en = vif.mon_cb.rd_en_i;
//			@(vif.mon_cb);
			tx.rdata = vif.mon_cb.rdata_o;
			tx.full = vif.mon_cb.full_o;
			tx.error = vif.mon_cb.error_o;
			tx.empty = vif.mon_cb.empty_o;
		//	$display("rd_en=%d,rdata=%d",tx.rd_en,tx.rdata);
			tx.print("rd_en high in mon");
			//tx.print("mon tx");
		end
		//send to mon2scb mailbox
		fifo_common::mon2scb.put(tx);
		//send to mon2cov mailbox
	end
endtask
endclass*/ 

task run();
	$display("fifo monitor run task");
	forever begin
		tx = new();
		@(vif.mon_cb);
		tx.wr_en = vif.mon_cb.wr_en_i;
		tx.rd_en = vif.mon_cb.rd_en_i;
		tx.wdata = vif.mon_cb.wdata_i;
		tx.full = vif.mon_cb.full_o;
		tx.rdata = vif.mon_cb.rdata_o;
		tx.empty = vif.mon_cb.empty_o;
		tx.error = vif.mon_cb.error_o;
	//	tx.print("mon tx");
		//send to mon2scb mailbox
		fifo_common::mon2scb.put(tx);
		//send to mon2cov mailbox
	end
endtask
endclass 
