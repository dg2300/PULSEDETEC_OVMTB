class pd_scoreboard extends ovm_scoreboard ;

   `ovm_component_utils(pd_scoreboard)

   pd_txn trans_collected ;

      ovm_analysis_export#(pd_txn) item_collected_export;
      tlm_analysis_fifo#(pd_txn) pd_txn_fifo;
   
      function new (string name, ovm_component parent);
      super.new(name, parent);
      trans_collected = new();
   endfunction : new

     
   virtual function void report();
         ovm_report_info(get_type_name(), $psprintf("Reporting scoreboard information...\n%s", this.sprint()), OVM_LOW);
   endfunction : report

   function void build();
      item_collected_export = new("item_collected_export", this);
      pd_txn_fifo =new("pd_txn_fifo",this);
   endfunction

   virtual function void connect();
       super.connect();
                  item_collected_export.connect(pd_txn_fifo.analysis_export);
       endfunction

   virtual task run();
   forever begin
      pd_txn_fifo.get(trans_collected);
if(trans_collected.sig_in)ovm_report_info (get_type_name(), $psprintf("HIT DATA CORRECT Got = %b Expected = 1 at a delay of %d at simul time %0t \n",trans_collected.sig_out,trans_collected.delay,$time) , OVM_LOW);

      
      ovm_report_info(get_type_name(), $psprintf("Reporting compare...\n%s", this.sprint()), OVM_LOW);
             if(trans_collected.sig_out == 1)
            ovm_report_info (get_type_name(), $psprintf("HIT DATA CORRECT Got = %b Expected = 1 at simulation time %0t \n",trans_collected.sig_out,$time) , OVM_LOW);
         else 
            ovm_report_error (get_type_name(), $psprintf("HIT DATA WRONG Got = %b Expected = 1 at simulation time %0t \n",trans_collected.sig_out,$time), OVM_LOW );

         end
    endtask 
endclass
