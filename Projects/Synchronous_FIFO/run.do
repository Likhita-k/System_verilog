vlog list.svh
vsim -novopt -suppress 12110 top +testname=empty_case 
add wave -position insertpoint sim:/top/dut/*
run -all
