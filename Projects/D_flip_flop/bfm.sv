class dff_bfm;

dff_tx tx;

virtual dff_intf vif;

function new();
	vif = top.pif;
endfunction

task run();
	$display("bfm run task");
	forever begin 
		dff_common::gen2bfm.get(tx);
		tx.print("bfm tx");
		drive(tx);
	end
endtask

task drive(dff_tx tx);
	/*@(vif.bfm_cb);
	vif.bfm_cb.d_i <= tx.din;
	tx.qout = vif.bfm_cb.q_o;
	$display("d_i=%d",vif.bfm_cb.d_i);
	$display("qout=%d",tx.qout);
//	vif.bfm_cb.d_i <= 0;
	*/
	@(posedge vif.clk_i);
	vif.d_i <= tx.din;
	tx.qout = vif.q_o;
	$display("qout=%d",tx.qout);
	@(posedge vif.clk_i)
	vif.d_i <=0;
endtask
endclass
