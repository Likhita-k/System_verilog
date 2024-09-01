class fifo_gen;

fifo_tx tx;

task run();
	$display("fifo generator class");
	case(fifo_common::testname)
		"full_case":begin
			for(int i=0;i<`DEPTH;i++)begin
				tx = new();
				assert(tx.randomize() with {tx.wr_en == 1;tx.rd_en==0;});
		//		tx.print("printing values in generator class for full case");
				if(i == `DEPTH-1)begin
					tx.wdata =0;
				//	tx.wr_en = 0;
				//	tx.rd_en = 0;
				end	
				fifo_common::gen2bfm.put(tx);
			end
		end

		"empty_case":begin
			for(int i=0;i<`DEPTH;i++)begin
				tx = new();
				assert(tx.randomize() with {tx.wr_en == 1;tx.rd_en==0;});
			//	tx.print("printing wdata values in generator class for empty case");
				if(i == `DEPTH-1)begin
					tx.wdata =0;
			//		tx.wr_en = 0;
			//		tx.rd_en = 0;
				end	

				fifo_common::gen2bfm.put(tx);
			end
			for(int i=0;i<`DEPTH;i++)begin
				tx = new();
				tx.wr_en=0;
				tx.rd_en=1;
			//	tx.print("printing rdata values in generator class for empty case");
				if(i == `DEPTH-1)begin
					tx.rdata =0;
			//		tx.wr_en = 0;
			//		tx.rd_en = 0;
				end	

				fifo_common::gen2bfm.put(tx);
			end
		end

		"full_error":begin
			for(int i=0;i<`DEPTH+1;i++)begin
				tx = new();
				assert(tx.randomize() with {tx.wr_en == 1;tx.rd_en==0;});
				tx.print("printing values in generator class for full case");
				if(i == `DEPTH-1)begin
					tx.wdata =0;
				//	tx.wr_en = 0;
				//	tx.rd_en = 0;
				end	

				fifo_common::gen2bfm.put(tx);
			end
		end

		"empty_error":begin
			for(int i=0;i<`DEPTH;i++)begin
				tx = new();
				assert(tx.randomize() with {tx.wr_en == 1;tx.rd_en==0;});
				tx.print("printing wdata values in generator class for empty case");
				if(i == `DEPTH-1)begin
					tx.wdata =0;
				//	tx.wr_en = 0;
				//	tx.rd_en = 0;
				end	

				fifo_common::gen2bfm.put(tx);
			end
			for(int i=0;i<`DEPTH+1;i++)begin
				tx = new();
				tx.wr_en=0;
				tx.rd_en=1;
				tx.print("printing rdata values in generator class for empty case");
				if(i == `DEPTH-1)begin
					tx.wdata =0;
				//	tx.wr_en = 0;
				//	tx.rd_en = 0;
				end	

				fifo_common::gen2bfm.put(tx);
			end
		end
	endcase


endtask
endclass
