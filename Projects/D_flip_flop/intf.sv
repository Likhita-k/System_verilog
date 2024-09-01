interface dff_intf(input logic clk_i,rst_i);

logic d_i;
logic q_o;

/*clocking bfm_cb@(posedge clk_i);
	default input #1 output #0;
	output #1 d_i;
	input #0 q_o;
endclocking

clocking mon_cb@(posedge clk_i);
	default input #1 output #0;
	input #1 d_i;
	input #0 q_o;
endclocking
*/
endinterface
