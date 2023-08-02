import ovm_pkg::*;

class if_wrapper extends ovm_object;
 
 virtual dut_interface dut_vi;

  function new (string name, virtual dut_interface arg);

  super.new(name);
  dut_vi=arg;
endfunction

endclass
