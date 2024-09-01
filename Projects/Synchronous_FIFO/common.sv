class fifo_common;

static string testname;
static int num_tx = `DEPTH;
static mailbox#(fifo_tx) gen2bfm = new();
static mailbox#(fifo_tx) mon2cov = new();
static mailbox#(fifo_tx) mon2scb = new();
static int match_count;
static int mismatch_count;
endclass
