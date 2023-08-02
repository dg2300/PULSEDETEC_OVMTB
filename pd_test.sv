class pd_test extends ovm_test;
  `ovm_component_utils(pd_test);

  pd_env env_h;

 function new(string name ="pd_env", ovm_component parent);
    super.new(name, parent);
  endfunction: new
  
  function void build;
    super.build();
    env_h = pd_env::type_id::create("env_h",this);
  endfunction: build
  
  task run;
   pd_sequence seq;
    seq =pd_sequence::type_id::create("seq");
    seq.start(env_h.agent_h.seq_h);
  endtask: run
  
endclass