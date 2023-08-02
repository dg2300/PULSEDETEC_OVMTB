`include "ovm_macros.svh"
`include "pd_interface.sv"
`include "pd_pkg.sv"
`include "interface_wrapper.sv"

module testbench ;
import ovm_pkg::*;
// import ovm_container_pkg::*;
import pd_pkg::*;


dut_interface intf1();
pulse_detector dut_here(.clk(intf1.clock),
  .reset(intf1.reset),
  .sig_in(intf1.sig_in),
  .delay(intf1.delay),
  .sig_out(intf1.sig_out));

 
initial begin
  // ovm_container #(virtual dut_interface)::set_value_in_global_config("dut_vif" ,intf1);
 //
  if_wrapper if_wr = new("if_wr",intf1);
  set_config_object("*","if_wrapper",if_wr,0);
 run_test("pd_test");
end

initial begin
 intf1.clock=1;
 intf1.reset=1;
end

initial begin 
 forever #1ns intf1.clock =~intf1.clock;
end

  always @(posedge intf1.clock) #5ns intf1.sig_in<= 1;
  always @(posedge intf1.clock) intf1.sig_in<= 0;

initial begin
 $dumpfile("pd_dump.vcd");
$dumpvars(0, pulse_detector);
end
endmodule:testbench
