`define WIDTH 4
`define DEPTH 16
`define ADDR_WIDTH $clog2(DEPTH)

`include "sync_fifo_try.v"
//`include " .sv"
`include "tx.sv"
`include "common.sv"
`include "scb.sv"
`include "mon.sv"
`include "bfm.sv"
`include "gen.sv"
`include "agent.sv"
`include "env.sv"
`include "intf.sv"
`include "top.sv"
