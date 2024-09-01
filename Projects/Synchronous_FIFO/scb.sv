class fifo_scb;

fifo_tx tx;
fifo_tx comp;
fifo_tx data[$];
//bit [`WIDTH-1:0] mem[*];
//bit wr_ptr, rd_ptr;

task run();
	$display("scoreboard run task");
	forever begin
		tx = new();
		fifo_common::mon2scb.get(tx);
	//	if(tx.wr_en || tx.rd_en)begin
	//		$display("wr_en=%d rd_en=%d wdata=%d rdata=%d empty=%d full=%d",tx.wr_en,tx.rd_en,tx.wdata,tx.rdata,tx.empty,tx.full);
			//if(tx.wr_en && (!tx.full))begin
			if(tx.wr_en)begin
				data.push_back(tx);
			end	
		//	foreach(data[i])$display("data=%p",data[i]);
			if(tx.rd_en)begin
				if(data.size()>0)begin
					comp = data.pop_front();
				//	$display("comp=%d",comp);
					if(comp.wdata == tx.rdata)begin
						$display("comp.wdata = %d, tx.rdata=%d",comp.wdata,tx.rdata);
						fifo_common::match_count++;
						$display("comparison passed");
					end
					else begin
						$display("comp.wdata = %d, tx.rdata=%d",comp.wdata,tx.rdata);
						fifo_common::mismatch_count++;
						$display("comparison failed");
					end
				end
			end		
	//	end	
	end
endtask


endclass

