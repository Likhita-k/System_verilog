//ACTIVE LOW RESET
module sync_reset(d_i,clk_i,rst_i,q_o);

input d_i,clk_i,rst_i;
output reg q_o;


always@(posedge clk_i) begin 
	if(rst_i == 1) begin
		q_o = 0;
	end
	else begin 
		q_o = d_i;
	end
end
endmodule

