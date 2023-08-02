`include "interface_wrapper.sv"

class pd_driver extends ovm_driver #(pd_txn);

 `ovm_component_utils(pd_driver)

 virtual dut_interface dut_vi;


  function new(string name= "ovm_driver", ovm_component parent);
    super.new(name,parent);
  endfunction: new

 function void build;
  super.build();
   begin 
    ovm_object obj;
    if_wrapper if_wr;
    get_config_object("if_wrapper",obj,0);
    assert ($cast(if_wr,obj));
    dut_vi = if_wr.dut_vi;
   end
 endfunction 

 task run;
   dut_vi.reset=1;

   #5 dut_vi.reset=0;

  forever
   begin
    pd_txn txn;
     seq_item_port.get_next_item(txn);
    @(posedge dut_vi.clock); 
     dut_vi.delay=txn.delay;
     seq_item_port.item_done();

    end
endtask
endclass

