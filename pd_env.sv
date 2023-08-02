`include "pd_monitor.sv"
`include "pd_scoreboard.sv"

class pd_env extends ovm_env;

pd_monitor pd_mon ;
pd_scoreboard pd_scb ;

 `ovm_component_utils(pd_env);

 pd_agent agent_h;
 
 function new(string name ="pd_env",ovm_component parent);
 super.new(name,parent);
endfunction

 function void build;
  super.build();
   ovm_report_info(get_full_name(),"START of build ", OVM_LOW);
  agent_h = pd_agent::type_id::create("agent_h",this);
  pd_mon =  pd_monitor::type_id::create("pd_mon",this);
  pd_scb   = pd_scoreboard::type_id::create("pd_scb",this);
   ovm_report_info(get_full_name(),"END of build", OVM_LOW);
 endfunction

  function void connect();
       super.connect();
          ovm_report_info(get_full_name(),"START of connect phase ", OVM_LOW);
          pd_mon.item_collected_port.connect(pd_scb.item_collected_export);
         ovm_report_info(get_full_name(),"END of connect", OVM_LOW);
    endfunction

 task run;
    #100 ovm_top.stop_request();
  endtask: run

 endclass
