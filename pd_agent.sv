lass pd_agent extends ovm_agent;
  `ovm_component_utils(pd_agent)

  pd_sequencer seq_h;
  pd_driver driv_h;

 function new(string name="pd_agent", ovm_component parent);
    super.new(name,parent);
  endfunction: new

 function void build;
  super.build();
  seq_h = pd_sequencer::type_id::create("seq_h",this);
  driv_h = pd_driver::type_id::create("driv_h",this);
 endfunction 

  function void connect;
    driv_h.seq_item_port.connect(seq_h.seq_item_export);
  endfunction: connect
  
endclass
