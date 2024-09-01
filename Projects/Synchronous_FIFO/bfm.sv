class fifo_bfm;

fifo_tx tx;

virtual fifo_intf vif;

function new();
	vif = top.pif;
endfunction

task run();
$display("bfm run task");
forever begin
	fifo_common::gen2bfm.get(tx);
//	tx.print("tx in bfm");
	drive(tx);
end
endtask

task drive(fifo_tx tx);
//	$display("bfm drive task");
	@(vif.bfm_cb);
	vif.bfm_cb.wr_en_i <= tx.wr_en;
	vif.bfm_cb.rd_en_i <= tx.rd_en;
	if(vif.bfm_cb.wr_en_i == 1) vif.bfm_cb.wdata_i <= tx.wdata;
	if(vif.bfm_cb.rd_en_i == 1) tx.rdata = vif.bfm_cb.rdata_o;
	//$display("checking if bfm is sending data properly");
	//$display("vif.wdata_i = %d",vif.wdata_i);	
	//$display("vif.rdata_o = %d",vif.rdata_o);	
	//$display("vif.rd_en_i = %d",vif.rd_en_i);
	//$display("----------------------");
//	@(posedge vif.clk_i);
//	vif.wr_en_i = 0;
//	vif.rd_en_i = 0;
//	vif.wdata_i = 0;
endtask

endclass
