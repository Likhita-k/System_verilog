class dff_gen;

dff_tx tx;

task run();
	for(int i =0;i<dff_common::num_tx;i++)begin
		tx = new();
		assert(tx.randomize());
		tx.print("gen tx");
		dff_common::gen2bfm.put(tx);
	end
endtask

endclass
