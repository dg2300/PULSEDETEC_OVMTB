class pd_sequencer extends ovm_sequencer #(pd_txn);

  `ovm_component_utils(pd_sequencer);

  function new(string name="pd_sequencer", ovm_component parent);
  super.new(name,parent);
 endfunction

endclass