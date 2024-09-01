class dff_common;
static int num_tx = 10;
static mailbox#(dff_tx) gen2bfm = new(num_tx);
static mailbox#(dff_tx) mon2cov = new(num_tx);
static mailbox#(dff_tx) mon2scb = new(num_tx);

endclass
